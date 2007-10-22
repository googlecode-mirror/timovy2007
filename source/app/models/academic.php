<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Academic extends AppModel 
{
	var $name = 'Academic';
	
	var $belongsTo = array
	(
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'id'
		)
	);
}