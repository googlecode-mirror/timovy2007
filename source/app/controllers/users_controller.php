<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class UsersController extends AppController 
{
	var $uses = array('User', 'UsersRole', 'Clearance', 'UsersClearance', 'Role');
	var $helpers = array('ajax', 'Html', 'Form');
	var $components = array('Login');
	var $required_clearances = array('MANAGE_USERS');

	/**
	 * Zobrazi zoznam uzivatelov
	 */
	function index()
	{
	  $this->pageTitle = __('USERS_INDEX_TITLE', true);
		$this->set('name', '');
		$this->paginate['User']['limit'] = 20;
		$this->set('users', $this->paginate('User', array()));
	}
	
   	// Overi ci ma pouzivatel potrebne prava  
	private function check_permission()
	{
		if (!$this->Login->check('MANAGE_USERS')) {
			$this->My->setError(__('PERMISSION_DENIED', true));	
			$this->redirect('/login', null, true);
		}
	}
	
	function search()
	{
		$this->pageTitle = __('USERS_SEARCH_TITLE', true);
		// objekt pre escapovanie
		// 
		uses('sanitize');
		$sanit = new Sanitize();
		
		// 
		// nastav condition na zaklade zaslaneho hladania
		// 
		$condition = array(
			'"User"."username" LIKE \'%'. $sanit->paranoid(@$_POST['name']) .'%\' OR '.
			'"User"."first_name" LIKE \'%'. $sanit->paranoid(@$_POST['name']) .'%\' OR '.
			'"User"."middle_name" LIKE \'%'. $sanit->paranoid(@$_POST['name']) .'%\' OR '.
			'"User"."last_name" LIKE \'%'. $sanit->paranoid(@$_POST['name']) .'%\''
		);
		
		//
		// find	& paginate it
		$this->set('name', $sanit->paranoid(@$_POST['name']));
		$this->paginate['User']['limit'] = 20;
		$this->set('users', $this->paginate('User', $condition));
		$this->render('index');
	}
	
  function add()
  {
	  $this->pageTitle = __('USERS_ADD_TITLE', true);
		$this->check_permission();
    if (!empty($this->data))
    {
      if ($this->User->find(array('username' => $this->data['User']['username']))) {
        $this->My->setError(__("USER_ADD_FAILED_USER_EXISTS", true));
        return;
      }
      
      $this->data['User']['title']= $this->data['User']['title'];
      $this->data['User']['first_name']= $this->data['User']['first_name'];
      $this->data['User']['middle_name']= $this->data['User']['middle_name'];
      $this->data['User']['last_name']= $this->data['User']['last_name'];
      $this->data['User']['username']= $this->data['User']['username'];
      $this->data['User']['email']= $this->data['User']['email'];
      $this->data['User']['password']= md5($this->data['User']['password']);
      
      if ($this->User->save($this->data))
      {
	        $this->My->setInfo(__("USER_ADDED_SUCCESSFULLY", true), true);
	        $this->redirect('/users/index', null, true);    				
      }
      else
      {
	        $this->My->setError(__("USER_ADD_FAILED_FIELDS_ARE_NOT_CORRECT", true));
      }
    }
	}
	
	function delete($id)
	{
	      	$this->pageTitle = __('USER_DELETE_TITLE', true);
    		$this->check_permission();
    	    $this->User->del($id);
    		$this->My->setInfo(__("USER_ITEM_REMOVED", true));
    		$this->redirect('/users');
	}
	/**
	 * Zobrazi stranku s udajmi o pouzivatelovi, kde sa daju editovat
	 *
	 * @param int $user_id
	 */
	function edit($user_id)
	{
	  $this->pageTitle = __('USERS_EDIT_TITLE', true); 
		$this->User->id = $user_id;
		
		// 
		// nacitaj udaje, ak je zly uzivatel presmeruj na zoznam
		if (!($data = $this->User->read())) {
			$this->My->setError('Neexistujuci pouzivatel s id: '.$user_id);
			$this->redirect('/users');
			exit();
		}
		
		//
		// najde vsetky clearances
		$clearances = $this->Clearance->findAll();
		
		// 
		// zisti opravnenia pouzivatela
		$user_custom_clearances = $this->User->custom_clearances($user_id);
		
		// 
		// pre kazdu clearance zisti ci ju ma momentalny pouzivatel povolenu/zakazanu/default
		foreach ($clearances as $k=>$c) {
			$access = 'default';
			if (in_array($c['Clearance']['key'], array_keys($user_custom_clearances))) {
				$access =  $user_custom_clearances[$c['Clearance']['key']]['access'];
			}
			$clearances[$k]['Clearance']['access'] = $access;	
		}
		
		// 
		// zisti vsetky pouzivatelske role
		$roles = $this->Role->findAll();
		
		
		// 
		// odstran tie role, ktore uz pouzivatel vlastni
		$uroles = array();
		$troles = array();
		foreach ($data['Role'] as $r) {
			$uroles[] = $r['id'];
		}
		foreach ($roles as $r) {
			if (!in_array($r['Role']['id'], $uroles)) {
				$troles[] = $r['Role'];
			}
		}
		$roles = $troles;
		
		// 
		// uloz pre template
		$this->set('clearances', $clearances);
		$this->set('user', $data);
		$this->set('roles', $roles);
		$this->set('lang', $this->Session->read('Config.language'));
	}
	
	/**
	 * Upravi speciale zavislosti
	 * @param POST status[]
	 */
	function edit_special()
	{
		$this->pageTitle = __('USERS_EDITSPECIAL_TITLE', true);
		// over spravnost zaslanych udajov
		if (!is_array($_POST['status']) or empty($_POST['status'])) {
			$this->My->setError('Neboli poslane spravne udaje !');
			$this->redirect('/users');		
			exit();
		}
		
		// 
		// over existenciu pouzivatela
		$this->User->id = $_POST['user_id'];
		if (!($user = $this->User->read())) {
			$this->My->setError('Neexistujúci používateľ');
			$this->redirect('/users');
			exit();
		}
		
		// 
		// odstran vsetky specialne prava
		$this->UsersClearance->query("DELETE FROM users_clearances WHERE user_id=".(int)$user['User']['id']);
		
		// 
		// prirad zaslane pristupve prava
		foreach ($_POST['status'] as $k=>$v) {
			if ($v == 'allow' OR $v == 'deny') {
				$data = array
				(
					'user_id' => $user['User']['id'],
					'clearance_id' => $k,
					'access' => $v
				);
				$this->UsersClearance->create();
				$this->UsersClearance->save($data);
			}
		}
		$this->redirect('/users/edit/'.$user['User']['id']);
	}
	
	/**
	 * Prida rolu pouzivatelovi
	 *
	 * @param int $user_id
	 * @param POST role_id
	 */
	function add_role($user_id)
	{
		$this->pageTitle = __('USERS_ADDROLE_TITLE', true);
		// over existenciu pouzivatela
		$this->User->id = $user_id;
		if (!($user = $this->User->read())) {
			$this->My->setError('Neexistujúci používateľ');
			$this->redirect('/users');
			exit();
		}
		
		// 
		// ci existuje rola
		if (!$this->Role->hasAny(array('id'=>(int)$_POST['role_id']))) {
			$this->My->setError("Neexistujuca rola!");
			$this->redirect('/users');
			exit();
		}
		
		// 
		// prirad tuto rolu
		$data = array
		(
			'user_id' => $user_id,
			'role_id' => (int)$_POST['role_id']
		);
		if (!$this->UsersRole->save($data)) {
			$this->My->setError("Chyba pri pridavani do databazy !");
		} else {
			$this->My->setInfo("Rola bola úspešne pridaná!");
		}
		$this->redirect('/users/edit/'.$user_id);
	}
	
	
	/**
	 * Akcia, odstrani zadanu rolu uzivatelovi
	 *
	 * @param int $user_id
	 */
	function removerole($user_id, $role_id)
	{
		$this->pageTitle = __('USERS_REMOVEROLE_TITLE', true);
		// nacitaj inf. o pouzivatelovi
		$this->User->id = $user_id;
		
		//
		// neexistujuci pouzivatel
		if (!($data = $this->User->read())) {
			$this->My->setError('Neexistujuci pouzivatel!');
			$this->redirect('/users');
			exit();
		}
		
		//
		// zisti ID vsetkych roli
		$roleids = array();
		foreach ($data['Role'] as $d) {
			$roleids[] = $d['id'];
		}
		
		//
		// over ci uzivatel ma takuto rolu priradenu
		if (!in_array($role_id, $roleids)) {
			$this->My->setError('Pouzivatel zadanu rolu nevlastni !');
			$this->redirect('/users');
			exit();
		}
		
		//
		// odstran tuto rolu
		$this->UsersRole->query("DELETE FROM users_roles WHERE user_id='".(int)$user_id."' AND role_id='".(int)$role_id."'");
		$this->My->setInfo("Pouzivatelska rola bola uspesne odobrata!");
		$this->redirect('/users/edit/'.$user_id);
	}
	
	
	public function password($user_id)
	{
		$this->pageTitle = __('USERS_PASSWORD_TITLE', true);
		// over ci pouzivatel existuje
		$this->User->id = $user_id;
		if (!($user = $this->User->read())) {
			$this->My->setError('Neexistujúci používateľ');
			$this->redirect('/users', null, true);
		}
		
		// 
		// ak bolo zaslané heslo tak ho zmen
		if (isset($_POST['password'])) {
			if ($this->User->saveField('password', md5($_POST['password']))) {
				$this->My->setInfo('Heslo pre používateľa s prihlasovacím menom "'.$user['User']['username'].'" bolo úspešne zmenené');
				$this->redirect('/users', null, true);
			} else {
				$this->My->setInfo('Nepodarilo sa zmeniť heslo');
			}
		}
			
		$this->set('user', $user);
	}
	
	
}
?>