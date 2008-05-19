<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class EventsController extends AppController 
{
	var $uses = array();
	public function index() {
    $this->pageTitle = __('EVENTS_INDEX_TITLE', true);
  }
}
?>