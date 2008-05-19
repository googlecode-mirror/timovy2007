<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class ContactController extends AppController 
{
	var $uses = array();
	
	public function index() {
	   $this->pageTitle = __('CONTACT_INDEX_TITLE', true);
  }
}
?>