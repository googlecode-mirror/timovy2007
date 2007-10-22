<?php
/* SVN FILE: $Id: aclnode.test.php 4451 2007-02-05 05:32:30Z phpnut $ */
/**
 * Short description for file.
 *
 * Long description for file
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) Tests <https://trac.cakephp.org/wiki/Developement/TestSuite>
 * Copyright 2005-2007, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 *  Licensed under The Open Group Test Suite License
 *  Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright		Copyright 2005-2007, Cake Software Foundation, Inc.
 * @link				https://trac.cakephp.org/wiki/Developement/TestSuite CakePHP(tm) Tests
 * @package			cake.tests
 * @subpackage		cake.tests.cases.libs.controller.components.dbacl.models
 * @since			CakePHP(tm) v 1.2.0.4206
 * @version			$Revision: 4451 $
 * @modifiedby		$LastChangedBy: phpnut $
 * @lastmodified	$Date: 2007-02-04 23:32:30 -0600 (Sun, 04 Feb 2007) $
 * @license			http://www.opensource.org/licenses/opengroup.php The Open Group Test Suite License
 */
	session_start();

	if (!defined('CAKEPHP_UNIT_TEST_EXECUTION')) {
		define('CAKEPHP_UNIT_TEST_EXECUTION', 1);
	}
	
	require_once LIBS.'controller'.DS.'components'.DS.'session.php';
	require_once LIBS.'model'.DS.'model.php';
	require_once CAKE.'app_model.php';
	require_once MODELS.'user.php';
	require_once MODELS.'users_online.php';
	require_once MODELS.'login_history.php';
	require_once COMPONENTS.'login.php';
	

/**
 * Short description for class.
 *
 * @package		cake.tests
 * @subpackage	cake.tests.cases.libs.controller.components.dbacl.models
 */
class AclNodeTest extends UnitTestCase {

	/**
	 * @var LoginComponent
	 */
	private $auth;

	/**
	 * Test Start
	 */
	function setUp() {
		$this->auth = new LoginComponent();
	}
	
	/**
	 * Test End
	 */
	function tearDown() {
        ;
    }

    
	/**
	 * Otestuje ci naozaj vrati zoznam pouzivatelov
	 */
	function testUsers() 
	{
		$user = new User();
		$user_count = $user->findCount();
		$auth_count = count($this->auth->users());
		
		$this->assertEqual($user_count, $auth_count, 'Funkcia Auth->users() vracia nespravny pocet riadkov!');
	}
	
	/**
	 * Otestuje ci usersONline vracia spravy pocet riadkov
	 */
	function testUsersOnline()
	{
		$UsersOnline = new UsersOnline();
		
		$auth_user 	= count($this->auth->usersOnline());
		$online_cnt	= $UsersOnline->findCount();
		
		$this->assertEqual($online_cnt, $auth_user, 'Niektori uzivatel je asi prihlaseny 2 x - to moze byt ok, pri resetovnie session!!');
	}
	
	
	/**
	 * Otestuje ci sa spravne ziskavaju opravnenia
	 */
	function testClearances()
	{
		$priv1 = $this->auth->clearances('test');
		$priv2 = $this->auth->clearances('test2');
		$priv3 = $this->auth->clearances('nonexisting');
		$mabyt1 = array('FORUM_ACCESS','FORUM_WRITE', 'FORUM_ADMIN', 'SUPER_ADMIN');
		$mabyt2 = array('FORUM_ACCESS');
		$mabyt3 = array();
		
		$this->assertEqual($priv1, $mabyt1, 'Test 1 - zle privilegia');
		$this->assertEqual($priv2, $mabyt2, 'Test 2 - zle privilegia');
		$this->assertEqual($priv3, $mabyt3, 'Neexistujuci pouzivtel - zle privilegia');
	}
	

	/**
	 * over ci ma naozaj prihlasi
	 */
	function testLogin()
	{
		// odhlas ak nahodou je pri
		$this->auth->init();
		
		// over ze nie je prihlaseny
		$this->assertFalse($this->auth->isLogged());
			
		// presunie sa do login_history
		$this->assertTrue($this->auth->login('test', 'test'));
		$this->assertTrue($this->auth->login('test', 'test'));
				
		// users online
		$this->assertTrue($this->auth->isOnlineUsername('test'));
		$this->assertFalse($this->auth->isOnlineUsername('test2'));
		$this->assertFalse($this->auth->isOnlineUsername('testnonexists'));
		$this->assertTrue($this->auth->isOnline(1));
		$this->assertFalse($this->auth->isOnline(845546465));
		
		// last history
		$lastLogged = $this->auth->lastLogged();		
		$this->assertEqual($lastLogged['ip'], $this->auth->Ip());
		
		// zo session
		$this->assertNotNull($this->auth->fullname());
		$this->assertNotNull($this->auth->username());
		$this->assertNotNull($this->auth->user_id());
		
		// logout 
		$this->assertTrue($this->auth->logout());
		
		// over odhlasenie
		$this->assertFalse($this->auth->isLogged());
	}

}

?>
