<?php
/**
 * @package AATeam
 */

require_once LIBS.'model'.DS.'model.php';
require_once APP.'app_model.php';
require_once MODELS.'user_mail.php';

class AppController extends Controller
{
	var $components = array('Session', 'My', 'Login');
	var $helpers = array('Html','My', 'Javascript', 'Form');
	var $required_clearances = array();
	var $uses = array('UserMail');

	/**
	 * Login controller
	 *
	 * @var LoginComponent
	 */
	var $Login;
	
	
	function beforeRender()
	{
		/**
		 * Jednotlive podmienky pre menu, etc, kedy sa zobrazia
		 */
		if ($this->Login->isLogged()) {
			$this->set('LoggedAs', $this->Login->fullname());
		}
		
		//
		// prenesiem login do helpera ? :)
		$this->set('Login', $this->Login);
		$this->set('post_redirect', isset($this->params['url']['url']) ? $this->params['url']['url'] : 'about');
		
		//
		// mail settings - pocet novych sprav
		if ($this->Login->isLogged()) {
			
			// 
			// ak nie je vytvoreny model
			if (!isset($this->UserMail)) {
				$this->UserMail = new UserMail();
			}
			
			$this->set('mail_new_count', $this->UserMail->findCount(array('UserMail.user_id'=>$this->Login->user_id(), 'UserMail.user_mail_state_id'=>'NEW')));
			$this->set('mail_total_count', $this->UserMail->findCount(array('UserMail.user_id'=>$this->Login->user_id())));
		}
	}
	
		
	function beforeFilter()
	{
		//
		// Zmena jazyka
		// 
		if (isset($_GET['language'])) 
		{
			switch ($_GET['language']) 
			{
				case 'sk':
					$this->Session->write('Config.language', 'sk');					
					break;
				case 'en':
					$this->Session->write('Config.language', 'en');
					break;
			}
		}
		// default language
		if (!$this->Session->read('Config.language')) {
			$this->Session->write('Config.language', 'sk');
		}
		
		//
		// overi ci je pripojena databaza !!!
		// 
		ob_start();
		$db =& ConnectionManager::getDataSource('default');
		if (empty($db->connection)) 
		{
			$php_errors = @ob_get_clean();                   
            $this->viewPath = 'errors';
            $this->set('host', $db->config['host']);
            $this->set('user', $db->config['login']);
            $this->set('php_errors', $php_errors);
            
            $this->render('db_connection_failed', 'error');
            exit();
		}
		ob_end_clean();

		//
		// inicializuje session a login
		//
		$this->Login->init();
		
		//
		// overi uzivatel ma pravo na vybranu stranku
		// 
		foreach ($this->required_clearances as $c) {
			if (!$this->Login->check($c)) {
				
				// 
				// TODO (aby pouzivatel po prihlaseni pokracoval na povodnej stranke):
				// - uloz do session momentalnu adresu
				// - a po uspresnom prihlaseni na nu sprav redirect
				// 
				$this->My->setInfo(__("ERROR_ACCESS_DENIED", true));
				
				//
				// presmeruje view do adresara login a vyrenderuje akciu index (pre prihlasenie)
				$this->set("body", $this->requestAction('/login/index', array('return')));
				$this->viewPath = 'login';
				$this->render('access_denied');
				exit();
			}
		}
	}
	
}
?>
