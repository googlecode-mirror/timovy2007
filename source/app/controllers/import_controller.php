<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class ImportController extends AppController 
{
	var $required_clearances = array('IMPORT');
	var $components = array('Importdb');
	var $helpers = array("Form");
	var $uses = array('User', 'Specialization', 'Project', 'Academic', 'ProjectType', 'Graduate', 'Role', 'UsersRole');
		
	function index()
	{
		//
		// len zobrazovacia stranka
	}	
	
	function db()
	{
	  set_time_limit(60*60*6);
	  /*
		$this->My->setError('Chýba presná štruktúra dát zo systému YonBan.');
		$this->redirect('/import');
		exit();
		*/
		// 
		// initialize
		// get the ID for graduate_role_id, and academic_role_id
		$graduate_role_id = $this->Role->field('id', array('name'=>'graduate'));
		$academic_role_id = $this->Role->field('id', array('name'=>'academic'));
		if ($graduate_role_id === false or $academic_role_id === false) {
			throw new Exception('Can\'t find academic and graduate roles');
		}	
		
		
		
		//
		// errors
		$IMPORT_ERRORS 	= array();
		$IMPORT_SUCCESS = array();
		
		//
		// import prebieha cez POST, aby nedoslo k refreshu stranky
		if (!isset($_POST['value_test_db'])) {
			$this->redirect('/import');
			exit();
		}
	
		
		//
		// import - begin transaction
		// ----------------------------------
		$this->User->begin();
		
		//
		// update typ studia
		$studies = $this->Importdb->studies();
		if ($studies === false) {
			$this->My->setError('Chyba: Nepodarilo sa zistit zoznam studijnych odborov zo systemu yonban!');
			$this->redirect('/import');
			exit();
		}
		foreach ($studies as $s) {
			
			$this->Specialization->create();
			$this->Specialization->id = $s['id'];
			if (!$this->Specialization->hasAny(array('id'=>$s['id']))) {
				$this->Specialization->save($s);
			}
		}	

		//
		// zoznam pouzivatelov
		$users = $this->Importdb->users();
		if ($users == false) {
			$this->My->setError('Chyba: Nepodarilo sa zistit zoznam pouzivatelov zo systemu yonban!');
			$this->User->rollback();
			$this->redirect('/import');
			exit();
		}
		
		//
		// pre kazdeho pouzivatela
		foreach ($users as $user)
		{
			//
			// over ci uz existuje -> ak hej, tak ho updatni
			$pocet = $this->User->hasAny(array('User.personal_number'=>$user['personal_number']));
			if ($pocet ==  0) {
				
				//
				// INSERT 
				$this->User->create();
				if (!$this->User->save($user)) {
					$IMPORT_ERRORS[] = array('USER_CREATION', $user);
					continue;
				}				
				$IMPORT_SUCCESS[] = $user;
			}
		}
			
		
		//
		// updatni projekty pouzivatela
		foreach ($users as $user)
		{
			//
			// zisti si projekty pouzivatela
			$projects = $this->Importdb->projects($user['personal_number']);
			
			//
			// ak vlastni co i len 1 projekt, tak mu prirat prava pre graduate
			// todo 
					
			//
			// pre kazdy projekt
			foreach ($projects as $project) {
			
				//
				// zisti ci academic a master academic
				$user_id = null;
				$academic_id = null;
				$master_academic_id = null;
				
				//
				// user_id
				if (false === ($usr = $this->User->find(array('User.personal_number'=>$user['personal_number']), array('User.id')))) {
					$IMPORT_ERRORS[] = 'Nepodarilo sa najst pouzivatela s osobnym cislom: '.$user['personal_number'];
					continue;
				}
				$user_id = $usr['User']['id'];
								
				//
				// academic_id
				if ($project['academic'] != '') {
					
					if (false === ($usr = $this->User->find(array('User.personal_number'=>$project['academic']), array('User.id')))) {
						$IMPORT_ERRORS[] = 'Nepodarilo sa najst veduceho projektu s osobnym cislom: '.$project['academic'];
						exit('wtf2');
						continue;
					}
					$academic_id = $usr['User']['id'];
				}
				
				//
				// academic_id
				if ($project['master_academic'] != '') {
					
					if (false === ($usr = $this->User->find(array('User.personal_number'=>$project['master_academic']), array('User.id')))) {
						$IMPORT_ERRORS[] = 'Nepodarilo sa najst pedagogickeho veduceho projektu s osobnym cislom: '.$project['master_academic'];
						continue;
					}
					$master_academic_id = $usr['User']['id'];
				}
				
				//
				// skontroluj ci existuje takyto typ projektu
				if (!$this->ProjectType->hasAny(array('id'=>$project['type']))) {
					exit('wtf3');
					$IMPORT_ERRORS[] = 'Neexistuje importovany typ projektu: "'.$project['type'].'"';
					continue;
				}

				
				if (!$this->Project->hasAny(array('Project.project_type_id'=>$project['type'], 'Project.graduate_id'=>$user_id))) {
					
					// 
					// prirad pouzivatelov medzi graduate & academic
					$this->Graduate->id = $user_id;
					if (!$this->Graduate->exists()) {
						$this->Graduate->save(array('id'=>$user_id, 'specialization_id'=>$project['specialization']));
						
						// prirad rolu 'graduate' pre pouzivate ak ju nevlastni
						$this->UsersRole->create();
						$data = array('user_id'=>$user_id, 'role_id'=>$graduate_role_id);
						if (!$this->UsersRole->hasAny($data)) {
							$this->UsersRole->save($data);
						}
					}

					//
					// prirad ak je veduci projektu a prirad mu rolu academic
					$this->Academic->id = $academic_id;			
					if ($academic_id and !$this->Academic->exists()) {
						$this->Academic->save(array('id'=>$academic_id));
						
						// prirad rolu 'academic' pre pouzivate ak ju nevlastni
						$data = array('user_id'=>$academic_id, 'role_id'=>$academic_role_id);
						$this->UsersRole->create();
						if (!$this->UsersRole->hasAny($data)) {
							$this->UsersRole->save($data);
						}
					}
					
					//
					// prirad ak je dipl. veduci projektu a prirad mu rolu academic
					$this->Academic->id = $master_academic_id;			
					if ($master_academic_id and !$this->Academic->exists()) {
						$this->Academic->save(array('id'=>$master_academic_id));
						
						// prirad rolu 'academic' pre pouzivate ak ju nevlastni
						$this->UsersRole->create();
						$data = array('user_id'=>$master_academic_id, 'role_id'=>$academic_role_id);
						if (!$this->UsersRole->hasAny($data)) {
							$this->UsersRole->save($data);
						}
					}
					
					//
					// vytvor data
					$data = array(
						'project_type_id'		=> $project['type'],
						'academic_id'			=> $academic_id,
						'master_academic_id'	=> $master_academic_id,
						'graduate_id'			=> $user_id,
						'study_year'			=> $project['study_year'],
						'name'					=> $project['name'],
						'name_en'				=> $project['name_en'],
						'description'			=> $project['description'],
						'description_en'		=> $project['description_en'],
						'specialization_id'		=> $project['specialization']
					);
					
					// anglicky chybajuci
					if ($data['name_en'] == '') {
						$data['name_en'] = $data['name'];
					}
					
					$this->Project->create();
					if (!$this->Project->save($data)) {
						$IMPORT_ERRORS[] = array('PROJECT_SAVE', $data);
					}
				}
			}
		}
		
		
		
		
		echo "Erors:<br />";
		print_r($IMPORT_ERRORS);
		echo "Success:<br />";
		print_r($IMPORT_SUCCESS);
		
		//
		// THE END
		
		$this->User->commit();
	}
	
	function soap()
	{
		$this->My->setError('Importovanie cez SOAP rozhranie nie je ešte možné.');
		$this->redirect('/import');
		exit();
		
		//
		// import prebieha cez POST, aby nedoslo k refreshu stranky
		if (!isset($_POST['value_test_soap'])) {
			$this->redirect('/import');
			exit();
		}
		
		// 
		// samotny import cez soap ... TODO
	}
}
?>