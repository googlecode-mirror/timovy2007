<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class UsersController extends AppController 
{
	var $uses = array('User', 'UsersRole', 'Clearance', 'UsersClearance', 'Role');
	var $helpers = array('ajax');
	var $components = array('Login');
	var $required_clearances = array('MANAGE_USERS');
	
	/**
	 * Zobrazi zoznam uzivatelov
	 */
	function index()
	{
		$this->set('name', '');
		$this->paginate['User']['limit'] = 20;
		$this->set('users', $this->paginate('User', array()));
	}
	
	
	function search()
	{
		//
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
	
	/**
	 * Zobrazi stranku s udajmi o pouzivatelovi, kde sa daju editovat
	 *
	 * @param int $user_id
	 */
	function edit($user_id)
	{
		$this->User->id = $user_id;
		
		// 
		// nacitaj udaje, ak je zly uzivatel presmeruj na zoznam
		if (!($data = $this->User->read())) {
			$this->My->setError('Neexistujuci pouzivatel s id: '.$user_id.' wtf');
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
	}
	
	/**
	 * Upravi speciale zavislosti
	 * @param POST status[]
	 */
	function edit_special()
	{
		//
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
		// 
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
		//
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
		//
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