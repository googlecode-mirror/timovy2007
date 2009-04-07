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
	var $uses = array('User', 'Specialization', 'Project', 'Academic', 'ProjectType', 'Graduate', 'Role', 'UsersRole', 'StudyType');
		
	function index()
	{
		$this->pageTitle = __('IMPORT_INDEX_TITLE', true);
		// len zobrazovacia stranka
	}	
	
	function db()
	{
	  $start = time();
		// Skontrolujeme ci sa da pripojit k databaze Yonban
		// NOTE: Spravne to funguje iba ak je vypnuty debug mod.
		$db = ConnectionManager::getDataSource('aisview');
    
    if(!$db->isConnected()) {
      $this->My->setError('Pripojenie k databáze aisview neúspešné.');
      $this->redirect('/import');
    }

	  $this->pageTitle = __('IMPORT_DB_TITLE', true);
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
		// update specializacii
		$specializations = $this->Importdb->specializations();
		if ($specializations === false) {
			$this->My->setError('Chyba: Nepodarilo sa zistit zoznam studijnych odborov z AIS!');
			$this->redirect('/import');
			exit();
		}
		
		foreach($specializations as $s) {
			$_s = explode('-', $s);			
  		// test if exist study_type
  		$test = $this->StudyType->findByAcronym($_s[0]);		
  		if($test==false) {
  			$this->My->setError('Chyba: Nenasiel sa typ studia '.$_s[0].'. Upravte tabulku study_types!');
  			$this->redirect('/import');
  			$this->User->commit();
  			exit();      
      }
      $test2 = $this->Specialization->find('first', array('conditions'=>array('Specialization.acronym'=>$s)));
      if(!$test2) {      
        $this->Specialization->create();
        // todo  dlhe anglicke a slovenske nazvy lef join nad aisom     
        $this->Specialization->save(array('name_en'=>$s, 'name_sk'=>$s, 'acronym'=>$s, 'study_type_id'=>$test['StudyType']['id']));
      }      			
		}
		$this->User->commit();

		// update studii 
    $this->Graduate->unbindModel(array('belongsTo' => array('User','Specialization')));
    $max_id = $this->Graduate->find('all', array('fields' => array('MAX(ais_studia_id) as max_id')));
    $max_id = current($max_id); $max_id = current($max_id); $max_id = $max_id['max_id'];
    if(empty($max_id)) $max_id = 0;    
                                                
		$studies = $this->Importdb->studies($max_id);
		if ($studies == false) {
			$this->My->setError('Chyba: Nepodarilo sa zistit zoznam pouzivatelov z AIS!');
			$this->redirect('/import');
			exit();
		}

		foreach ($studies as $s)
		{
		  $this->User->begin();
			// test if exist user with personan number
			$user = $this->User->find('first', array('conditions'=>array('User.personal_number'=>$s['personal_number'])));			
			if ($user==false) {
				// INSERT
/* // create usernme/password				
				setlocale(LC_ALL, 'sk_SK.utf-8');				
				$username = iconv('utf-8', 'us-ascii//TRANSLIT', strtolower($s['meno']));
        $username .= ".".iconv('utf-8', 'us-ascii//TRANSLIT', strtolower($s['priezvisko']));
        $i = '';
        $iter = 0;         
        while($this->User->find('all', array('conditions'=>array('User.username'=>$username.$i)))) {
          $iter++;
          $i = $iter;
        }
*/                
				$this->User->create();				
				if(!$this->User->save(array('personal_number'=>$s['personal_number'], 'username'=>$s['personal_number'], 'password'=>$s['personal_number'], 'title_before'=>$s['tituly_pred'], 'title_after'=>$s['tituly_za'], 'first_name'=>$s['meno'], 'last_name'=>$s['priezvisko']))) {
					$IMPORT_ERRORS[] = array('USER_CREATION', $s);
					continue;
				}
				// todo users_roles insert
				$this->UsersRole->create();
				if(!$this->UsersRole->save(array('user_id'=>$this->User->id, 'role_id'=>3))) {
					$IMPORT_ERRORS[] = array('USER_CREATION', $s);
					continue;
				}
				
				$IMPORT_SUCCESS[] = $user;
			} else {
        // UPDATE
				if(!$this->User->save(array('id'=>$user['User']['id'], 'title_before'=>$s['tituly_pred'], 'title_after'=>$s['tituly_za'], 'first_name'=>$s['meno'], 'last_name'=>$s['priezvisko']))) {
					$IMPORT_ERRORS[] = array('USER_UPDATE', $s);
					continue;
				}
      }
      
      $this->User->commit();
          
      // graduates
      $specializations = array();
      $_specializations = $this->Specialization->find('all');
      foreach($_specializations as $z) {
        $specializations[$z['Specialization']['acronym']] = $z['Specialization']['id'];
      }
      
      $this->Graduate->create();
      if(!$this->Graduate->save(array('user_id'=>$this->User->id, 'specialization_id'=>$specializations[$s['program']], 'finish_date'=>$s['koniec_studia'], 'ais_studia_id'=>$s['ais_studia_id']))) {
					$IMPORT_ERRORS[] = array('GRADUATE_CREATE', $s);
					continue;
      }
            
		}
		
		// todo projects
		//$projects = $this->Importdb->projects($id_max);
		

		$this->set('errors', $IMPORT_ERRORS);
		$this->set('delay', (strval(time() - $start)));

//var_dump(strval(time() - $start));
/*		
		echo "Success:<br />";
		print_r($IMPORT_SUCCESS);
*/	
		$this->User->commit();
	}
		
}
?>