<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class SitemapController extends AppController 
{
	var $uses = array();
	
	function index()
	{
    $this->pageTitle = __('SITEMAP_INDEX_TITLE', true);		
	}
}
?>