<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class UserLanguage extends AppModel 
{
	var $name = 'UserLanguage';
	
	var $belongsTo = array
	(
		'Language' => array
		(
			'className'		=> 'Language',
			'foreignKey'	=> 'language_id'
		),
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		),
		'Level' => array
		(
			'className'		=> 'Level',
			'foreignKey'	=> 'level_id'
		)		
	);
}
?>