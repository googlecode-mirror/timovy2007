<?php 
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class AboutController extends AppController 
{
	var $uses = array('Graduate', 'WallPoster', 'News');
	var $helpers = array('Time', 'MyTime');
	
	function index()
	{
		//
		// nastenka, poslednych 5 oznamov
		$this->set('odkazy', $this->WallPoster->findAll(array('is_changed'=>'f', 'is_refused'=>'f', 'valid_from'=>'< NOW()', 'valid_until' => '> NOW()'), null, array('WallPoster.created'=>'DESC'), 5));
		
		//
		// pocet absolventov v stysteme
		$this->set('pocet_absolventov', $this->Graduate->findCount());
		
		//
		// spravy
		$this->set('news', $this->News->findAll(null, null, array('News.created'=>'DESC')));
	}
}
?>