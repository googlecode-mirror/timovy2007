<?php
/**
 * @package AATeam
 * @subpackage app.controllers.components
 */
class MyComponent extends Object 
{
	var $controller = true;
	var $components = array('Session');
	
	function setError($flashMessage)
	{
		return $this->Session->setFlash($flashMessage, null, array(), 'error');
	}
	
	function setInfo($flashMessage)
	{
		return $this->Session->setFlash($flashMessage, null, array(), 'info');	
	}
}
?>