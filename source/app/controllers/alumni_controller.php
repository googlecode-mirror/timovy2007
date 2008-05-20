<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class AlumniController extends AppController 
{
	// TODO vymaz UserOnline
	var $uses = array('User', 'Graduate', 'StudyType', 'Specialization', 'UsersOnline', 'Project', 'UserProfession', 'Profession', 'Level', 'Language', 'UserLanguage');
	var $components = array('Login', 'Email');
	var $auth = 'toto je nove';
	var $helpers = array('form','fpdf');
	// var $required_clearances = array('SUPER_ADMIN');
	
	public function index()
	{
	  $this->pageTitle = __('ALUMNI_INDEX_TITLE', true); 
		$conditions = array();
		
		//
		// vyhladavanie
		if (isset($_POST['name'])) {
			
			//
			// osetrenie
			uses('sanitize');
			$sanit = new Sanitize();
			
			//
			// podmienka pre vystup
			$conditions = array
			(
				'or' => array
				(
					'User.username'		=> 'ILIKE %'.$sanit->escape($_POST['name']).'%', 
					'User.first_name'	=> 'ILIKE %'.$sanit->escape($_POST['name']).'%',
					'User.middle_name'	=> 'ILIKE %'.$sanit->escape($_POST['name']).'%',
					'User.last_name'	=> 'ILIKE %'.$sanit->escape($_POST['name']).'%'
				)
			);
			
			//
			// ak bol zadany aj odbor, tak ho zakomponuj do podmienky
			if (@$_POST['specialization_id'] != '') {
				$conditions = array
				(
					'and' => array
					(
						'Graduate.specialization_id' => $_POST['specialization_id'],
						$conditions
					)
				);
			}
			$_SESSION['search_cond'] = $conditions;
			$_SESSION['search_name'] = $sanit->html($_POST['name']);
			$_SESSION['search_specialization_id'] = $_POST['specialization_id'];
			
		} else if (isset($_SESSION['search_cond'])) {
			
			//
			// ak listujem medzi strankami
			$conditions = $_SESSION['search_cond'];			
		}
		
		
		$this->paginate['Graduate']['limit'] = 30;
		$this->paginate['Graduate']['order'] = 'User.username';
		$graduates = $this->paginate('Graduate', $conditions);
		
		//
		// dopln do vystupu pri studentovy typ studia (zo specialization_id)
		foreach ($graduates as $k=>$v) {
			
			//
			// nemusi to byt vyplnene ! 
			if ($v['Specialization']['study_type_id'] != '') {
				
				//
				// nacitaj
				$this->StudyType->recursion = -1;
				$this->StudyType->id = $v['Specialization']['study_type_id'];
				$s_temp = $this->StudyType->read();
				$graduates[$k]['StudyType'] = $s_temp['StudyType'];
				
			}
		}
		$this->set('graduates', $graduates);
		
		
		//
		// najdi vsetky typy podla priority
		$this->set('study_types', $this->StudyType->findAll(null, null, array('StudyType.priority')));
		$this->set('lang', $this->Session->read('Config.language'));
		$this->set('total_graduate_count', $this->Graduate->findCount());
	}
	
	
	/**
	 * Zobrazi profil absolventa
	 *
	 * @param unknown_type $username
	 */
	public function profile($username)
	{
		$this->pageTitle = __('ALUMNI_PROFILE_TITLE', true); 
		// existuje niekto taky ?
		if (!$user = $this->User->findByUsername($username)) {
			$this->My->setError(__('ALUMNI_NONEXISTING_USER', true));
			$this->redirect('/alumni', null, true);
		}
		$this->set('user', $user);
		
		// 
		// specializacia - ak sa jedna o graduate
		if (isset($user['Graduate']['specialization_id'])) {
			$this->set('specialization', $this->Specialization->field('name_'.$this->Session->read('Config.language'), array('Specialization.id'=>$user['Graduate']['specialization_id'])));
		}
		
		// 
		// najdi informacie o projektoch ak je to absolvent
		$projects = array();
		if (isset($user['Graduate']['id'])) {
			$projects = $this->Project->findAll(array('Project.graduate_id'=>$user['Graduate']['id']));
		}
		foreach ($projects as $k=>$v) {
			if (isset($v['Academic']['id'])) {
				$this->User->recursion = -1;
				$this->User->id = $v['Academic']['id'];
				$academic = $this->User->read();
				$projects[$k]['Academic'] = array_merge($v['Academic'], $academic['User']);
			}
		}
		
		$this->set('projects', $projects);
	}
	
	/**
	 * Upravi vlastny profil
	 *
	 */
	public function myprofile()
	{
		$this->pageTitle = __('ALUMNI_MYPROFILE_TITLE', true);
		// musi byt prihlaseny
		if (!$this->Login->isLogged()) {
			$this->My->setError('You need to be logged');
			$this->redirect('/', null, true);
		}
		
		//
		// nacitam informacie
		$this->User->id = $this->Login->user_id();
		if (!($user = $this->User->read())) {
			$this->My->setError('Can\'t read user informations');
			$this->redirect('/', null, true);
		}
		
		
		//
		// updatni informacie
		if ($this->data) {
  
      // htmlspecialchars pre this->data		
  		if(is_array($this->data)) {
        foreach($this->data as $key=>$value) {
          if(is_array($this->data[$key])) {
            foreach($value as $key2=>$value2) {
              if(!is_array($this->data[$key][$key2])) $this->data[$key][$key2]= htmlspecialchars($this->data[$key][$key2]);      
            }
          }
          else {
              $this->data[$key]= htmlspecialchars($this->data[$key]);
          }                
        }
      }

      // htmlspecialchars pre _POST		
  		if(is_array($_POST)) {
        foreach($_POST as $key=>$value) {
          if(is_array($_POST[$key])) {
            foreach($value as $key2=>$value2) {
              if(!is_array($_POST[$key][$key2])) $_POST[$key][$key2]= htmlspecialchars($_POST[$key][$key2]);      
            }
          }
          else {
             $_POST[$key]= htmlspecialchars($_POST[$key]);
          }      
        }
      }		
		
			// publish_email
			$this->data['User']['publish_email'] = isset($_POST['publish_email']) ? 1 : 0;
			if ($this->User->save($this->data, true, array('email', 'address', 'phone', 'icq', 'occupation', 'publish_email'))) {
				
				// spracuj profesie
				$updProfessions = array(); // vsetky updatnute profesie
				if(!isset($_POST['profession_id'])) $_POST['proffesion_id'] = array();
				foreach ($_POST['profession_id'] as $key=>$profession_id) {
					if (isset($_POST['user_profession_id'][$key])) {

						// updatne user_profesiu
						$user_profession_id = (int) $_POST['user_profession_id'][$key];
						$updProfessions[] = $user_profession_id;
						if (!$this->UserProfession->hasAny(array('id' => $user_profession_id))) {
							throw new Exception('Non existing profession with id: '. $user_profession_id);
						}
						$this->UserProfession->id = $user_profession_id;
						if (!$this->UserProfession->save(array(
							'profession_id' 	=> $_POST['profession_id'][$key],
							'year_from' 		=> $_POST['year_from'][$key],
							'year_to' 			=> $_POST['year_to'][$key],
							'description_sk' 	=> $_POST['description_sk'][$key],
							'description_en' 	=> $_POST['description_en'][$key] 
						))) {
							throw new Exception('Update failed !');
						};
					} else {
						// uloz novu profesiu
						$this->UserProfession->create();
						if (!$this->UserProfession->save(array(
							'user_id'			=> $this->User->id,
							'profession_id' 	=> $_POST['profession_id'][$key],
							'year_from' 		=> $_POST['year_from'][$key],
							'year_to' 			=> $_POST['year_to'][$key],
							'description_sk' 	=> $_POST['description_sk'][$key],
							'description_en' 	=> $_POST['description_en'][$key] 
						))) {
							throw new Exception('Save new failed !');
						};
					}
				}
			
				// vymaz odstranene profesie
				foreach ($user['UserProfession'] as $user_profession) {
					if (!in_array($user_profession['id'], $updProfessions)) {
						$this->UserProfession->del($user_profession['id']);
					}
				}
				
				//spracuj jazyky
				$updLanguages = array(); // vsetky updatnute profesie
				if(!isset($_POST['language_id'])) $_POST['language_id'] = array();
				foreach ($_POST['language_id'] as $key=>$language_id) {
					if (isset($_POST['user_language_id'][$key])) {

						// updatne user_language
						$user_language_id = (int) $_POST['user_language_id'][$key];
						$updLanguages[] = $user_language_id;
						if (!$this->UserLanguage->hasAny(array('id' => $user_language_id))) {
							throw new Exception('Non existing language with id: '. $user_language_id);
						}
						$this->UserLanguage->id = $user_language_id;
						if (!$this->UserLanguage->save(array(
							'language_id' 	=> $_POST['language_id'][$key],
							'language_id' 	=> $_POST['language_id'][$key],
							'level_id' 		=> $_POST['level_id'][$key] 
						))) {
							throw new Exception('Update failed !');
						};
					} else {
						// uloz novu profesiu
						$this->UserLanguage->create();
						if (!$this->UserLanguage->save(array(
							'user_id'			=> $this->User->id,
							'language_id' 	=> $_POST['language_id'][$key],
							'level_id' 		=> $_POST['level_id'][$key] 
						))) {
							throw new Exception('Save new failed !');
						};
					}
				}
				
				// vymaz odstranene profesie
				foreach ($user['UserLanguage'] as $user_language) {
					if (!in_array($user_language['id'], $updLanguages)) {
						$this->UserLanguage->del($user_language['id']);
					}
				}				
				
				$this->My->setInfo(__('Your profile has been changed.', true));	
				$this->redirect('/alumni/myprofile', null, true);
			} else {
				$this->My->setError(__('There was a error saving profile data.', true));
			}
		}
		
    $this->Level->displayField = $this->Language->displayField = $this->Profession->displayField = 'name_'. $this->Session->read('Config.language');
		$this->set('professions', $this->Profession->find("list"));
		$this->set('languages', $this->Language->find("list"));
		$this->set('levels', $this->Level->find("list"));
		$this->set('user_professions', $this->UserProfession->findAll(array('UserProfession.user_id'=> $this->User->id)));
		$this->set('user_languages', $this->UserLanguage->findAll(array('UserLanguage.user_id'=> $this->User->id)));
		$this->set('user', $user);
		$this->set('lang', $this->Session->read('Config.language'));
		$this->data = $user;
	}
	
	
	/**
	 * Upravi vlastny profil
	 *
	 */
	public function myimage()
	{
		$this->pageTitle = __('ALUMNI_MYIMAGE_TITLE', true);
		// musi byt prihlaseny
		if (!$this->Login->isLogged()) {
			$this->My->setError('You need to be logged');
			$this->redirect('/', null, true);
		}
		
		//
		// nacitam informacie
		$this->User->id = $this->Login->user_id();
		if (!($user = $this->User->read())) {
			$this->My->setError('Can\'t read user informations');
			$this->redirect('/', null, true);
		}
		
		//
		// upload image
		if (isset($_POST['delete_image'])) {
			if (unlink('img/persons/'.$user['User']['username'].'.png')) {
				$this->My->setInfo(__('ALUMNI_MYIMAGE_UNLINK_SUCCESSFULL', true));
			} else {
				$this->My->setError(__('ALUMNI_MYIMAGE_UNLINK_FAILED', true));
			}
		}
		else if (isset($_FILES['userimage'])) {
			
			// 
			// over ci sa ho podarilo uploadnut
			if (is_uploaded_file($_FILES['userimage']['tmp_name'])) {
				
				//
				// over ci to je obrazok
				if ($size = getimagesize($_FILES['userimage']['tmp_name'])) {
					
					//
					// velkost cieloveho obrazku (default povodny)
					$size_x = $size[0];
					$size_y = $size[1];
					
					switch ($size[2])
					{
						case 1:
							$old_image = imagecreatefromgif($_FILES['userimage']['tmp_name']);
							break;
						case 2:
							$old_image = imagecreatefromjpeg($_FILES['userimage']['tmp_name']);
							break;
						case 3:
							$old_image = imagecreatefrompng($_FILES['userimage']['tmp_name']);
							break;
						default:
							$old_image = -1;
					}
					if ($old_image) {
						
						//
						// prearataj rozmery
						$pomer = $size[1] / $size[0];
						if ($pomer > 1.2) {
							// presahuje vyska
							$zmensenie = $size[1] / 120;
						} else {
							// presahuje sirka alebo pomer je rovnaky
							$zmensenie = $size[0] / 100;
						}
						
						//
						// ak je obrazok vacsi ako cieleny
						if ($zmensenie > 1) {
							$size_x = floor($size_x / $zmensenie);
							$size_y = floor($size_y / $zmensenie);					
						}
						
						//
						// vytvor cielovy obrazok
						$new_image = imagecreatetruecolor($size_x, $size_y);
						
						// 
						// prekopiruj obrazok a zmensi ho 
						imagecopyresampled($new_image, $old_image, 0, 0, 0, 0, $size_x, $size_y, $size[0], $size[1]);
						if (imagepng($new_image, 'img/persons/'.$user['User']['username'].'.png')) {
							$this->My->setInfo(__('ALUMNI_MYPROFIL_SUCCESS_UPLOADING', true));
						} else {
							$this->My->setError(__('ALUMNI_MYPROFIL_ERROR_UPLOADING_IMAGEPNG', true));
						}
						
					} else if ($old_image == -1) {
						$this->My->setError(__('ALUMNI_MYPROFIL_ERROR_UPLOADING_UNSUPPORTEDTYPE', true));
					} else {
						$this->My->setError(__('ALUMNI_MYPROFIL_ERROR_UPLOADING_IMAGECREATE', treu));
					}
				} else {
					$this->My->setError(__('ALUMNI_MYPROFIL_ERROR_UPLOADING_GETIMAGESIZE', true));	
				}
			} else {
				//
				// nepodarilo sa uploadnut - pravedopobne velkost
				$this->My->setError(__('ALUMNI_MYPROFIL_ERROR_UPLOADING', true));
			}
		}
		$this->set('user', $user);
	}
	
	
	
	
	/**
	 * Zmena hesla
	 *
	 */
	public function password()
	{
		$this->pageTitle = __('ALUMNI_PASSWORD_TITLE', true);
		// musi byt prihlaseny
		if (!$this->Login->isLogged()) {
			$this->My->setError('You need to be logged');
			$this->redirect('/', null, true);
		}
		
		//
		// nacitam informacie
		$this->User->id = $this->Login->user_id();
		if (!($user = $this->User->read())) {
			$this->My->setError('Can\'t read user informations');
			$this->redirect('/', null, true);
		}
		
		//
		// zmen heslo
		if (isset($_POST['password_old'])) {
			//
			// over stare heslo
			if ($user['User']['password'] == md5($_POST['password_old'])) {
				//
				// over ci su hesla rovnake
				if ($_POST['password_1'] == $_POST['password_2']) {
					// 
					// skontroluj ci pozostavaju len z cislic a pismien
					if (preg_match('/^[\d\w\_\.\-]{4,255}$/i', $_POST['password_1'])) {
						//
						// zmen heslo
						$this->User->id = $user['User']['id'];
						if ($this->User->saveField('password', md5($_POST['password_1']))) {
							//
							// uspech
							$this->My->setInfo(__('ALUMNI_SUCCESS_PASSORD_CHANGED', true));
						} else {
							$this->My->setError(__('ALUMNI_ERROR_SAVE_FAILED', true));
						}
					} else {
						$this->My->setError(__('ALUMNI_ERROR_BAD_NEW_PASSWORD', true));	
					}
				} else {
					$this->My->setError(__('ALUMNI_ERROR_DIFF_PASSWORDS', true));
				}
			} else {
				$this->My->setError(__('ALUMNI_ERROR_BAD_OLD_PASSWORD', true));
			}
		}
		
		//
		// zobraz
		$this->set('user', $user);
	}
	
	/*
	 * Vygeneruje vlastne CV do PDF-ka
	 */	 
	
	function curriculum() {
		
		$this->pageTitle = __('ALUMNI_CURRICULUM_TITLE', true);  
		// musi byt prihlaseny
		if (!$this->Login->isLogged()) {
			$this->My->setError('You need to be logged');
			$this->redirect('/', null, true);
		}		
		
		// nacitam informacie
		$this->User->id = $this->Login->user_id();
		if (!($user = $this->User->find(array('User.id'=>$this->User->id), null, null, 2))) {
			$this->My->setError('Can\'t read user informations');
			$this->redirect('/', null, true);
		}

    //this will use the pdf.thtml layout	
    $this->layout = 'pdf'; 
    $this->set('user',$user);
    $this->set('lang', $this->Session->read('Config.language'));
    $this->render(); 
	}
}
?>