<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class HelpController extends AppController 
{
	var $uses = array();
	
	function index()
	{
    $this->pageTitle = __('HELP_INDEX_TITLE', true);		
	}
}
?>