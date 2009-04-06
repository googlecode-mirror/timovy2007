<?php
class MailsController extends AppController 
{
   var $name = 'Mails';
   var $uses = array('Mail', 'User', 'UserMail', 'MailGroup', 'MailAddressGroup', 'MailAddressUser', 'MailGroupUser');
   var $helpers = array('Form', 'Ajax', 'Time', 'MyTime');
   var $components = array('Login', 'Email');
      
   /**
    * Hlavne zobrazenie - zobrazi zoznam mailov
    */
	public function index()
	{
	  $this->pageTitle = __('MAILS_INDEX_TITLE', true);
		if (!$this->Login->isLogged()) {
			$this->redirect('/login', null, true);
		}
		
		//
		// vykonaj akciu perform
		if (isset($_POST['mail']) and is_array($_POST['mail'])) 
		{
			// 
			// pre kazdy oznaceny mail over, ci je jeho vlastnik momentalny pouzivatel
			$check_success = true;
			foreach ($_POST['mail'] as $user_mail_id) {
				
				//
				// najdi pouzivatela tohto mailu a over platnost
				$user_id = $this->UserMail->field('user_id', array('UserMail.id'=>(int)$user_mail_id));
				if ($user_id === false or $user_id != $this->Login->user_id()) {
					$check_success = false;
					break;
				}			
			}
			
			//
			// overovanie prebehlo upspesne
			if ($check_success) {
				
				$new_state = false;
				//
				// vyber zelany stav na zaklade requestu
				if ($_POST['action'] == 'READED') {
					$new_state = 'READED';			
				} 
				else if ($_POST['action'] == 'DELETED') {
					$new_state = 'DELETED';
				}
				
				//
				// zmen vsetky maily zaslane v poli $_POST['mail']
				$this->UserMail->begin();
				$check_success = true;
				foreach ($_POST['mail'] as $user_mail_id) {
					
					//
					// uprav ich
					$this->UserMail->id = $user_mail_id;
					if (!$this->UserMail->saveField('user_mail_state_id', $new_state)) {
						$check_success = false;
						break;
					}
					
					//
					// over ci tento mail netreba vymazat
					if (!$mail_id = $this->UserMail->field('mail_id', array('UserMail.id'=>(int)$user_mail_id))) {
						$check_success = false;
						break;
					}
										
					//
					// zisti kolko existuje naviazani ....
					$not_deleted_count = $this->UserMail->findCount(array('UserMail.mail_id'=>$mail_id, 'UserMail.user_mail_state_id'=>'<> DELETED'));
					if ($not_deleted_count === false) {
						$check_success = false;
						break;
					}
					
					//
					// ak su uz vsetky ako deleted, tak tento mail vymazem
					if ($not_deleted_count == 0) {
						//
						// vymaz jednotlive asociacie na tento mail a az nakoniec samotny mail
						$this->UserMail->query('DELETE FROM user_mails WHERE mail_id='.(int)$mail_id);
						$this->MailAddressUser->query('DELETE FROM mail_address_users WHERE mail_id='.(int)$mail_id);
						$this->MailAddressGroup->query('DELETE FROM mail_address_groups WHERE mail_id='.(int)$mail_id);
						$this->Mail->delete($mail_id);
					}
					
				}
				if ($check_success) {
					$this->UserMail->commit();
				} else {
					$this->My->setError(__('MAIL_PERFORM_SAVE_ERROR', true));
					$this->UserMail->rollback();
				}
				
			//
			// overovanie zlyhalo
			} else {
				$this->My->setError(__('MAIL_PERFORM_NONEXISTING_MAIL', true));
			}
		}
		
		
		//
		// zobrazuj len nove a precitane maily
		$condition = array(
			'"UserMail"."user_mail_state_id"!=\'DELETED\' AND "UserMail"."user_id"='.(int)$this->Login->user_id()
		);
		
		//
		// nacita zoznam mailov
		$this->paginate['UserMail']['limit'] = $this->Login->default_mail_listing();
		$this->paginate['UserMail']['order'] = 'date_send DESC';
		$mails = $this->paginate('UserMail', $condition);
		foreach ($mails as $k=>$v) {
			
			$this->User->recursive = -1;
			$this->User->id = $v['Mail']['user_id'];
			$user = $this->User->read();
			$mails[$k]['Sender'] = $user['User'];
			$this->User->recursive = 1;
		}		
		$this->set('mails', $mails);
	}
	

	/**
	 * Zobrazi formular pre vytvorenie novej spravy
	 *
	 * vstupy:
	 * @param address string POST
	 * @param subject string POST
	 * @param body string POST
	 */
	public function compose($user_mail_id = null)
	{
		$this->pageTitle = __('MAILS_COMPOSE_TITLE', true);
		// over ci ma k tomu pravi
		if (!$this->Login->check('MAIL_WRITE')) {
			$this->My->setError(__('PERMISSION_DENIED', true));
			$this->redirect('/mails/index', null, true);
		}
		
		
		uses('sanitize');
		$sanit = new Sanitize();
		
		// 
		// default prazdne hodnoty
		$address 	= '';
		$body 		= '';
		$subject	= '';
		
		// 
		// je mozne zadat adresata
		if (isset($_GET['user_id'])) {
			
			//
			// nacitaj info o pouzivatelovi
			$this->User->id = (int)$_GET['user_id'];
			if (!($user = $this->User->read())) {
				$this->My->setError(__('MAIL_COMPOSE_NON_EXISTING_USER', true));
			} else {
				$address = $user['User']['username'].'<'.$user['User']['title_before'].' '.$user['User']['first_name'].' '.$user['User']['middle_name'].' '.$user['User']['last_name'].'>';
			}
		}
		
		//
		// ak to ma byt reakcia na iny mail
		if ($user_mail_id != null) {
			
			//
			// nacitaj mail
			$this->UserMail->id = $user_mail_id;
			if ($user_mail = $this->UserMail->read()) {
				
				//
				// over ci to je moj mail
				if ($user_mail['User']['id'] == $this->Login->user_id()) {
				
					// 
					$this->User->id = $user_mail['Mail']['user_id'];
					if (!($user = $this->User->read())) {
    				$this->My->setError(__('MAIL_COMPOSE_NON_EXISTING_USER', true));
    			} else {
    				$address = $user['User']['username'].'<'.$user['User']['title_before'].' '.$user['User']['first_name'].' '.$user['User']['middle_name'].' '.$user['User']['last_name'].'>';
    			} 
					// zapis udaje
					//$address = $user_mail['User']['username'].'<'.$user_mail['User']['title'].' '.$user_mail['User']['first_name'].' '.$user_mail['User']['middle_name'].' '.$user_mail['User']['last_name'].'>';
					$subject = 'Re: '. $user_mail['Mail']['subject'];
					$body_array = explode("\n", $user_mail['Mail']['body']);
					foreach ($body_array as $row) {
						$body .= '> '.$row."\n";
					}
				}
			}
		}
				
		$this->set('subject', isset($_POST['subject']) 	? $sanit->html($_POST['subject'], true) : $sanit->html($subject));
		$this->set('body'	, isset($_POST['body'])		? htmlspecialchars($_POST['body']) 		: htmlspecialchars($body));
		$this->set('address', isset($_POST['address'])	? htmlspecialchars($_POST['address'])	: htmlspecialchars($address));
		
		if (isset($_POST['address']))
		{
			//
			// validate address field
			if (!isset($_POST['address'])) {
				$this->My->setError(__('MAIL_COMPOSE_BAD_ADDRESS', true));
				return;
			}
			
			//
			// rozdelim to na jednotlive adresy
			$u_addresses = array();
			$g_addresses = array();
			$address = $_POST['address'];
			$address = explode(',', $address);
			foreach ($address as $addr) {
				//
				$addr = trim($addr, " \n\r");
				//
				// group musi mat na konci <group> alebo <skupina>
				if (strpos($addr, '<group>') or strpos($addr, '<skupina>')) {
					// trim
					$addr = trim(strip_tags($addr));
					if (false === ($group_id = $this->MailGroup->field('id', array('MailGroup.name'=>$addr, 'user_id'=>$this->Login->user_id() )))) {
						$this->My->setError(__('MAIL_COMPOSE_BAD_ADDRESS', true));
						return;
					}
					$g_addresses[] = $group_id;
				//
				// inak sa jedna o pouzivatela	
				} else {
					//
					$addr = trim(strip_tags($addr), " \n");
					//
					// over ci takyto pouzivatel existuje
					if (false === ($user_id = $this->User->field('id', array('User.username'=>$addr)))) {
						$this->My->setError(__('MAIL_COMPOSE_BAD_ADDRESS', true));
						return;
					}
					$u_addresses[] = $user_id;
				}
			}
			
			// 
			// validate empty subject & body 
			if (!isset($_POST['subject']) OR empty($_POST['subject'])) {
				$this->My->setError(__('MAIL_COMPOSE_EMPTY_SUBJECT', true));
				return;
			}
			if (!isset($_POST['body']) OR empty($_POST['body'])) {
				$this->My->setError(__('MAIL_COMPOSE_EMPTY_BODY', true));
				return;
			}
			
			//
			// begin transaction
			$this->Mail->begin();			
			//
			// send -> save "body" of mail
			$mail_data = array(
				'user_id' 	=> $this->Login->user_id(),
				'subject'	=> $_POST['subject'],
				'body'		=> $_POST['body'],
				'date_send'	=> 'NOW()'
			);
			if (!$this->Mail->save($mail_data)) {
				$this->My->setError(__('MAIL_COMPOSE_SAVE_ERROR', true));
				return;
			}
			$mail_id = $this->Mail->getInsertID();
			
			// 
			// address association for users
			$u_addresses = array_unique($u_addresses);
			foreach ($u_addresses as $user_id) {
				$data = array(
					'user_id' => $user_id,
					'mail_id' => $mail_id
				);
				if (!$this->MailAddressUser->save($data)) {
					$this->My->setError(__('MAIL_COMPOSE_SAVE_USRADDR_ERROR', true));
					$this->Mail->rollback();
					return;
				}
			}
					
			// 
			// address association for groups	
			$g_addresses = array_unique($g_addresses);
			foreach ($g_addresses as $mail_group_id) {
				$data = array(
					'mail_group_id' => $mail_group_id,
					'mail_id' => $mail_id
				);
				if (!$this->MailAddressGroup->save($data)) {
					$this->My->setError(__('MAIL_COMPOSE_SAVE_GRPADDR_ERROR', true));
					$this->Mail->rollback();
					return;
				}
			}	
			
			// 
			// find all users
			$all_users = $u_addresses;
			foreach ($g_addresses as $mail_group_id) {
				$users = $this->MailGroupUser->findAll(array('MailGroupUser.mail_group_id'=>$mail_group_id), array('user_id'));
				foreach ($users as $user) {
					$all_users[] = $user['MailGroupUser']['user_id'];
				}
			}
			$all_users = array_unique($all_users);
			
			//
			// save associtaion for this users
			foreach ($all_users as $user_id) {
				$data = array(
					'user_id' => $user_id,
					'mail_id' => $mail_id,
					'user_mail_state_id' => 'NEW'
				);
				
				//
				// inicializujem novy model na zapis a zapisem udaje.
				$this->UserMail->create();
				if (!$this->UserMail->save($data)) {
					$this->My->setError(__('MAIL_COMPOSE_SAVE_USRASSOC_ERROR', true));
					$this->Mail->rollback();
					return;
				}
				
				//
				// ak ma pouzivatel nastavene preposielanie mailu, tak mu preposle mail
				$forward_mail = $this->User->field('forward_mail', array('id'=>$user_id));
				if ($forward_mail != '') {
					$this->Email->to = $forward_mail;
					$this->Email->subject = $mail_data['subject'];
					$this->Email->replyTo = ADMINISTRATION_EMAIL_ADDRESS;
					$this->Email->from = ADMINISTRATION_EMAIL_ADDRESS;
					$this->Email->layout = 'forward_mail';
					$this->Email->template = 'default';
					$this->Email->charset = 'UTF-8';
					$this->Email->send($mail_data['body']);
					
				}
			}
			
			//
			// commit
			$this->My->setInfo(__('MAIL_COMPOSE_SAVE_SUCCESSFULL', true));
			$this->Mail->commit();
			$this->redirect('/mails');
		}
	}
	
	
	/**
	 * Zobrazi a upravi pouzivatelske nastavenia
	 *
	 */
	public function settings()
	{
	  $this->pageTitle = __('MAILS_SETTINGS_TITLE', true);
		if (!$this->Login->isLogged()) {
			$this->redirect('/login', null, true);
		}
		
		//
		// ak bol zaslany formular
		if (!empty($this->data['User'])) {

			//
			// uprav pouzivatela
			$this->User->id = $this->Login->user_id();
			
			//
			// value
			$value = $this->data['User']['forward_mail'] == '' ? null : $this->data['User']['forward_mail'];
			$data = array(
				'forward_mail' => $value,
				'mail_listing' => (int)$this->data['User']['mail_listing']
			);
			
			//
			// validacia na zaklade modulu
			if ($this->User->save($data)) {
				
				//
				// refresh login udaje 
				$this->Login->refresh();
				
				//
				// uspech, presmeruj znovu na stranku (zbav sa POST)
				$this->My->setInfo(__("MAIL_SETTINGS_EDIT_SUCCESS", true));
				$this->redirect('/mails/settings');
				exit();
				
			} else {
				
				//
				// neuspech, zobraz chybovu hlasku
				$this->My->setError(__("MAIL_SETTINGS_EDIT_ERROR", true));
			}
		}
		
		// 
		// zobraz ....
		$this->data['User']['forward_mail'] = $this->Login->forward_mail();
		$this->data['User']['mail_listing'] = $this->Login->default_mail_listing();
	}
	
	/**
	 * Vráti zoznam používateľov na základe zadaného vyhľadávacieho retazca
	 * 
	 * @param POST username
	 */
	public function ajax_search_users()
	{	  
		if (!isset($_POST['username'])) {
			$this->My->setError('MISSING SEARCH PARAM: "username"');
			$this->redirect('/mails');
		}
		
		//
		// objekt pre escapovanie
		// 
		uses('sanitize');
		$sanit = new Sanitize();
		
		// 
		// nastav condition na zaklade zaslaneho hladania
		// 
		$condition = array(
			'"User"."username" ILIKE \'%'. $sanit->escape(@$_POST['username']) .'%\' OR '.
			'"User"."first_name" ILIKE \'%'. $sanit->escape(@$_POST['username']) .'%\' OR '.
			'"User"."middle_name" ILIKE \'%'. $sanit->escape(@$_POST['username']) .'%\' OR '.
			'"User"."last_name" ILIKE \'%'. $sanit->escape(@$_POST['username']) .'%\''
		);
		
		//
		// find	& paginate it
		$this->set('users', $this->User->findAll($condition));
		$this->layout = 'ajax';
	}
	
	/**
	 * Vrati zoznam skupin
	 */
	public function ajax_search_groups()
	{
	  $groups = $this->MailGroup->findAllByUser_id($this->Login->user_id());
		$this->set('groups', $groups);
		$this->layout = 'ajax';
	}
	
	/**
	 * Zobrazi konkretny mail
	 *
	 * @param int $mail_id - ID mailu z tabulky user_mails
	 */
	public function read($mail_id)
	{
	  $this->pageTitle = __('MAILS_READ_TITLE', true);
		if (!$this->Login->isLogged()) {
			$this->redirect('/login', null, true);
		}
		
		
		//
		// nacitaj udaje o sprave a over ci patri mom. prihlasenemu pouzivatelovi
		$this->UserMail->id = (int)$mail_id;
		$message = $this->UserMail->read();
		if ($message === false or $message['UserMail']['user_id'] != $this->Login->user_id()) {
			$this->My->setError(__('MAIL_READ_NOT_FOUND', true));
			$this->redirect('/mails');
			exit();
		}
		
		// nacitaj info o zasielatelovi
		$this->User->recursive = -1;
		$this->User->id = $message['Mail']['user_id'];
		$sender = $this->User->read();
		$message['Sender'] = $sender['User'];
		$this->User->recursive = 1;
		
		$this->set('message', $message);
		
		// 
		// oznac tuto spravu uz za precitanu
		$this->UserMail->saveField('user_mail_state_id', 'READED');		
		
		//
		// nacitaj udaje o tom, ze komu bola sprava zaslana, najskor pouzivatelov, potom skupiny
		$to_address = array();
		
		$this->MailAddressUser->unbindModel(array('belongsTo'=>array('Mail')));
		$address_users = $this->MailAddressUser->findAll(array('MailAddressUser.mail_id'=>$message['Mail']['id']));
		foreach ($address_users as $u) {
			$to_address[] = $u['User']['username'].' "<em>'.$u['User']['title_before'].' '.$u['User']['first_name'].' '.$u['User']['middle_name'].' '.$u['User']['last_name'].'</em>"';
		}
				
		$this->MailAddressGroup->unbindModel(array('belongsTo'=>array('Mail')));
		$address_groups = $this->MailAddressGroup->findAll(array('MailAddressGroup.mail_id'=>$message['Mail']['id']));
		foreach ($address_groups as $g) {
			$to_address[] = $g['MailGroup']['name'].' "<em>'.__('MAIL_READ_GROUP', true).'</em>"';
		}
		$this->set('to_address', implode(', ', $to_address));
	}
}
?>