<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class LoginController extends AppController 
{
	var $uses = array('User');
	var $components = array('Login');
	
	/**
	 * Prihlasenie sa do systemu
	 * 
	 * akcia
	 */
	function login()
	{
		//
		// prihlasovanie sa do systemu (ak uz nie je prihlaseny)
		if (!empty($this->data) AND !$this->Login->isLogged()) {
			
			//
			// over prihl. udaje
			if (!$this->Login->login($this->data['User']['username'], $this->data['User']['password'])) {
				
				//
				// aby sa mi to nezobrazovalo
				unset($this->data['User']);
				// 
				// chybova hlaska
				$this->My->setError(__('LOGIN_FAILED', true));
				//
				// ochrana proti spamovaniu
				sleep(1);
											
			} else {
				
				//
				// info hlaska
				$this->My->setInfo(__('LOGIN_SUCCESSFULL', true));
				
				//
				// ak bola zaslana informacia o povodnej stranky z kadial bol pouzivatel odhlaseny, 
				// tak ju na nu presmeruj.
				if (isset($_POST['post_redirect'])) {
					$this->redirect('/'.$_POST['post_redirect']);
				} else {
					$this->redirect('/');
				}
				exit();
			}
		}
		
		//
		// vyrenderuj index stranku
		$this->index();
	}
	
		
	/**
	 * Hlavna stranka pre prihlasenie
	 * 
	 * len zobrazovanie
	 */
	function index()
	{
		// 
		// na zaklade toho ci je uz prihlaseny alebo nie je ...
		if ($this->Login->isLogged()) {
			// 
			// uz je prihlaseny
			$this->render('allready_logged');
		
		} else {
			// 
			// este nie je prihlaseny
			$this->render('index');
		}
	}	
	
	/**
	 * Odhlasi zo systemu
	 * 
	 * funkcia
	 */
	function logout()
	{
		$this->Login->logout();
		$this->My->setInfo(__('LOGOUT_SUCCESSFULL', true));
		$this->redirect('/');
		exit();
	}
}
?>
