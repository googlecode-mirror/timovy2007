<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class News extends AppModel 
{
	var $name = 'News';
	var $useTable = 'news';
	
	var $belongsTo = array
	(
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)
	);
}