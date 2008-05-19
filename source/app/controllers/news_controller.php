<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class NewsController extends AppController 
{
	var $uses = array();
	
	function index()
	{
    $this->pageTitle = __('NEWS_INDEX_TITLE', true);		
	}
}
?>