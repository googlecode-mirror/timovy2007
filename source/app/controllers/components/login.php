<?php
/**
 * Autorizacia a autentifikacia pouzivatelov
 * 
 * prihlasovanie prebieha za pomoci metody login a logout
 * 
 * [test: tests/cases/components/login.test.php]
 * 
 * 
 * Prihlaseny uzivatel sa identifikuje tym, ze ma vytvorenu premeennu $_SESSION['User']
 * - popri tom sa len ako informativna polozka uklada do db, ze je momentalne online.
 * 
 * TODO:
 * - zmenit md5 na crypt
 * 
 * @package AATeam
 * @subpackage app.controllers.components
 * @author franto
 */
require_once LIBS.'model'.DS.'model.php';
require_once APP.'app_model.php';
require_once MODELS.'user.php';
require_once MODELS.'users_online.php';
require_once MODELS.'login_history.php';
	
class LoginComponent extends Object  
{
	var $controller = true;
	var $components = array('Session');	 	
	
	/**
	 * Casovy interval, po ktorom su odmazane stare zaznamy z users online
	 * 
	 * default: 2 minuty.
	 */
	const online_timeout = 120;
	 	
	/**
	 * Vrati prihlasovacie meno aktualne prihlaseneho pouzivatela
	 * 
	 * ak nie je nikto prihlaseny, vrati false
	 * @return string
	 */
	public function username() 
	{
		return $_SESSION['User']['username'];
	}
	
	/**
	 * Vrati plne meno aktualne prihlaseneho pouzivatela, ak nie 
	 * je prihlaseny, vrati false
	 * 
	 * @return string
	 */
	public function fullname()
	{
		$names = array();
		$names[] = $_SESSION['User']['title'];
		$names[] = $_SESSION['User']['first_name'];
		$names[] = $_SESSION['User']['middle_name'];
		$names[] = $_SESSION['User']['last_name'];
		
		return implode(' ', $names);
	}
	
	/**
	 * Return forward_mail for current user
	 * if user has no mail set, then return false
	 * 
	 * @return string (mail) | false
	 */
	public function forward_mail()
	{
		return $_SESSION['User']['forward_mail'] == '' ? false : $_SESSION['User']['forward_mail'];
	}
	
	/**
	 * Vrati strankovanie mailov
	 */
	public function default_mail_listing()
	{
		$listing = 20;
		if (isset($_SESSION['User']['mail_listing']) and $_SESSION['User']['mail_listing'] > 1) {
			$listing = $_SESSION['User']['mail_listing'];
		}
		return $listing;		
	}
	
	/**
	 * Vrati user_id prihlaseneho uzivatela
	 * 
	 * ak nie je prihlaseny, vrati false
	 */
	public function user_id()
	{
		return isset($_SESSION['User']['id']) ? $_SESSION['User']['id'] : false;
	}
	
	/**
	 * Zisti ci je pouzivatel prihlaseny
	 *
	 * @return true/false
	 */
	public function isLogged() 
	{
		return isset($_SESSION['User']) ? true : false;
	}
	
	
	/**
	 * Funkcia volana pri starte
	 *
	 */
	public function init()
	{
		// odmaz z tabulky users_online stare zaznamy (timeout)
		$UsersOnline = new UsersOnline();
		
		$UsersOnline->query("DELETE FROM users_online WHERE (session_last_refresh + interval '" . LoginComponent::online_timeout . " second') < current_timestamp;");
		
		// over $_SESSION['User']['ip'] s momentalnou ip adresou
		// ak sa nezhoduju, tak odhlas uzivatela.
		
		// /// -> ???; comment by Spello, pretoze 'ip' nie je v poli $_SESSION
		if ($this->isLogged() and $_SESSION['User']['ip'] != $this->ip()) {
 			$this->logout();
 		}
	}
	
	/**
	 * Enter description here...
	 *
	 * @param string $username
	 * @param string $password
	 * @return true | false
	 */
	public function ldap_login($username, $password)
	{
		// nepripusti prazdne
		if ($username == '' || $password == '') {
			return false;
		}
		
		// pripoj sa na server
		$ldapconn = ldap_connect('ldap.stuba.sk');
		if (!$ldapconn) {
			return false; 
		}
		
		// over udaje
		ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
	    ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0); 
		$ldapbind = @ldap_bind($ldapconn, "uid=".$username.",ou=People,dc=stuba,dc=sk", $password);
		if (!$ldapbind) {
			return false;
		}
		
		// overovanie prebehlo uspesne
		return true;
	}
	
	/**
	 * Prihlasi pouzivatela do systemu na zaklade mena a hesla
	 * 
	 * vracia true/false na zaklade toho, ci sa podarilo pouzivatela 
	 * prihlasit do systemu
	 *
	 * @param string $username
	 * @param string $password
	 * @return boolean true/false
	 */
	public function login($username, $password) 
	{
		$User = new User();
		
		// zisti ci existuje
		$someone = $User->findByUsername($username);
		if (empty($someone['User']['username'])) {
			sleep(1);
			return false;
		}
		
		// ak ma ldapaname, skus ho prihlasit cez ldap najskor
		if (!$this->ldap_login($someone['User']['ldapname'], $password)) {
			if ($someone['User']['password'] != md5($password)) {
				sleep(1);
				return false;
			}
		}
		
		// ziskaj prava
		$permissions = array('permissions' => $this->clearances($someone['User']['username']));
		
		// ziskaj IP adresu
		$ip = $this->ip();
		$someone['User']['ip'] = $ip;
		
		// zapis do session
		$_SESSION['User'] = array_merge($someone['User'], $permissions);
		
		// zapis do login_history
		$LoginHistory = new LoginHistory();
		$LoginHistoryData = array
		(
			'user_id' 		=> $someone['User']['id'],
			'ip'			=> $ip,
			'login_time'	=> 'NOW()'
		);
		$LoginHistory->save($LoginHistoryData);

		// replace do users_online
		$UsersOnline = new UsersOnline();
		$this->Session->write('foo','bar');    
		$UsersOnlineData = array
		(
			'user_id'				=> $someone['User']['id'],
			'session_id'			=> $this->Session->id(),  //TODO poriesit aby tu bolo cislo session - nevklada sa !!!
			'session_start'			=> 'NOW()',
			'session_last_refresh'	=> 'NOW()'
		);
		$UsersOnline->delete(session_id());
		$UsersOnline->save($UsersOnlineData);

		return true;
	}
	
	/**
	 * Obnovi data o pouzivatelovi z databazy
	 * 
	 * Tuto funckiu treba zavolat, ak sa manipulovalo s pristupovymi alebo
	 * osobnymi udajmi o pouzivatelovi, aby sa preniesli do session premennej	 *
	 */
	public function refresh()
	{
		
		// musi byt prihlaseny
		if (!$this->isLogged()) {
			return false;
		}
		
		// jedna sa o momentalneho pouzivatela
		$username = $this->username();
		
		// ziskaj info o pouzivatelovi
		$User = new User();
		$someone = $User->findByUsername($username);
		
		// uzivatel neexistuje, bol vymazany z databazby
		if (empty($someone['User']['username'])) {
			return false;
		}
		
		// ziskaj prava
		$permissions = array('permissions' => $this->clearances($username));
		
		// ziskaj IP adresu
		$ip = $this->ip();
		$someone['User']['ip'] = $ip;
		
		// zapis do session
		$_SESSION['User'] = array_merge($someone['User'], $permissions);
		
		return true;
	}
	
		
	/**
	 * Odhlasi momentalne prihlaseneho pouzivate
	 * 
	 * ak nebol nikto prihlaseny vrati false, inak vrati true
	 * 
	 * @return boolean true/false
	 */
	public function logout() 
	{
		// ak nebol prihlaseny
		if (!isset($_SESSION['User'])) {
			return false;
		}
		
		// vymaz z users online
		$UsersOnline = new UsersOnline();
		$UsersOnline->delete(session_id());
		
		// vymaz zo session
		unset($_SESSION['User']);
		
		return true;
	}
		
	
	/**
	 * Overi, ci ma momentalny pouzivatel pravo na akciu
	 * 
	 * - ak je prihlaseny, nema ziadne privilegia
	 * 
	 * @param string $privilege
	 * @return boolean true/false
	 */
	public function check($privilege) 
	{
		// ak nie je prihlaseny nema ziadne privilegia
		if (!$this->isLogged()) {
			return false;
		}
		
		return in_array($privilege, $_SESSION['User']['permissions']);	
	}	
		
	/**
	 * Ziska zoznam vsetkych opravneni pre uzivatela
	 *
	 * @param int $user_id
	 * @return array of string (permissions)
	 */
	public function clearances($username)
	{
		// zoznam opravneni (clearances)
		$output = array();
	
		//
		// prava definovane na zaklade uzivatelskych roli.
		// 
		$User = new User();
		$result = $User->query
		('
			SELECT 
				Clearance.key
			FROM users_roles UsersRole
				JOIN users "User" ON "User".id=UsersRole.user_id
				JOIN roles Role ON Role.id=UsersRole.role_id
				JOIN roles_clearances RolesClearance ON RolesClearance.role_id=Role.id
				JOIN clearances Clearance ON Clearance.id=RolesClearance.clearance_id	
			WHERE 
				"User".username = \''.$username.'\'
			GROUP BY
				Clearance.key
		');
		foreach ($result as $r) {
			$output[] = $r[0]['key'];
		}
			
		// 
		// custom ALLOW prava
		// 
		$result = $User->query
		('
			SELECT 
				Clearance.key
			FROM users_clearances UsersClearance
				JOIN users "User" ON "User".id=UsersClearance.user_id
				JOIN clearances Clearance ON UsersClearance.clearance_id=Clearance.id
			WHERE 
				"User".username = \''.$username.'\' AND
				UsersClearance.access = \'allow\'
		');
		$allow_clearances = array();
		foreach ($result as $r) {
			$allow_clearances[] = $r[0]['key'];
		}
		$output = array_unique(array_merge($output, $allow_clearances));
			
		//
		// custom DENY prava
		// 
		$deny_clearances = array();
		$result = $User->query
		('
			SELECT 
				Clearance.key
			FROM users_clearances UsersClearance
				JOIN users "User" ON "User".id=UsersClearance.user_id
				JOIN clearances Clearance ON UsersClearance.clearance_id=Clearance.id
			WHERE 
				"User".username = \''.$username.'\' AND
				UsersClearance.access = \'deny\'
		');
		$deny_clearances = array();
		foreach ($result as $r) {
			$deny_clearances[] = $r[0]['key'];
		}
		$output = array_diff($output, $deny_clearances);
		
		// remove-reset array keys
		$output = array_values($output);
		
		return $output;
	}
	
	/**
	 * Vrati cas posledneho prihlasenia
	 * 
	 * ak je to po 1 krat, tak vrati false
	 * 
	 * @return LoginHistory array
	 */
	public function lastLogged() 
	{
		$LoginHistory = new LoginHistory();
		
		// unbind all association
		$LoginHistory->recursive = -1;
		
		// ziskaj posledne prihlasenie
		$user_id	= $_SESSION['User']['id'];
		$logins 	= $LoginHistory->findAll(array('user_id'=>$user_id), array('login_time', 'ip'), 'login_time DESC', 2);
		
		if (count($logins) == 2) {
			return $logins[1]['LoginHistory'];
		} else {
			return false;
		}
	}
	
	/**
	 * Vrati zoznam vsetkych aktualne prihlasenych pouzivatelov
	 *
	 * @return array of string array(array('userid'=>'username'), ...)
	 */
	public function usersOnline()
	{
		$UsersOnline = new UsersOnline();
		
		// najdem vsetkych uzivatelov [toto moze byt dost dlhy zoznam!]
		$users = $UsersOnline->findAll(null, array('User.id', 'User.username'), array('User.username ASC'));
		
		// prevediem na pozadovany vystupny tvar
		$output = array();
		foreach ($users as $u) {
			$output[$u['User']['id']] = $u['User']['username'];
		}
		
		// uzivatel moze byt prihlaseny aj viac krat
		$output = array_unique($output);
		
		return $output;
	}
	
	/**
	 * Zisti ci je pouzivatel momentalne prihlaseny v systeme
	 *
	 * @param string $username
	 * @return boolean true/false
	 */
	public function isOnlineUsername($username)
	{
		$UsersOnline = new UsersOnline();
		
		// zisti ci taky pouzivatel existuje v tabulke
		$result = $UsersOnline->hasAny(array('User.username'=>$username));
		
		return $result ? true : false;
	}
	
	/**
	 * Zisti ci je pouzivatel momentalne prihlaseny v systeme
	 *
	 * @param string $username
	 * @return boolean true/false
	 */
	
	public function isOnline($user_id)
	{
		$UsersOnline = new UsersOnline();
		
		// unbind all models
		$UsersOnline->recursive = -1;
		
		// zisti ci taky pouzivatel existuje v tabulke
		$result = $UsersOnline->hasAny(array('user_id'=>$user_id));
		
		return $result ? true : false;
	}
	
	
	/**
	 * Vrati zoznam vsetkych pouzivatel v systeme
	 *
	 * @param string $username
	 * @return array of string array(array('userid'=>'username'), ...)
	 */
	public function users()
	{
		$User = new User();
		
		// unbind all models
		$User->recursive = -1;
				
		// najdem vsetkych uzivatelov [toto moze byt dost dlhy zoznam!]
		$users = $User->findAll(null, array('id', 'username'), array('User.username ASC'));
		
		// prevediem na pozadovany vystupny tvar
		$output = array();
		foreach ($users as $u) {
			$output[$u['User']['id']] = $u['User']['username'];
		}
		return $output;
	}
	
	/**
	 * Zisti aktualnu IP adresu
	 * 
	 * vrateny zaznam sa sklada z ip adries oddelenych ciarkou
	 */
	public function ip()
	{
		$ips = array();
		
		if (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$ips[] = $_SERVER['HTTP_CLIENT_IP'];
		}
		if (isset($_SERVER['REMOTE_ADDR'])) {
			$ips[] = $_SERVER['REMOTE_ADDR'];
		}
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$ips[] = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}
		if (isset($_SERVER['HTTP_X_FORWARDED'])) {
			$ips[] = $_SERVER['HTTP_X_FORWARDED'];
		}
		if (isset($_SERVER['HTTP_FORWARDED_FOR'])) {
			$ips[] = $_SERVER['HTTP_FORWARDED_FOR'];
		}
		if (isset($_SERVER['HTTP_FORWARDED'])) {
			$ips[] = $_SERVER['HTTP_FORWARDED'];
		}
		if (count($ips) == 0) {
			$ips[] = '127.0.0.1';
		}
		return implode(';', $ips);
	}
	
	/**
	 * Zisti zi zadany pouzivatel s menom existuje v systeme
	 *
	 */
	public function userExists($username)
	{
		$User = new User();
		
		// unbind all models
		$User->recursive = -1;
		
		// zisti ci taky pouzivatel existuje v tabulke
		$result = $User->hasAny(array('username'=>$username));
		
		return $result ? true : false;
	}
}
?>
