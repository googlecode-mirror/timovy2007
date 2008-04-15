<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Level extends AppModel 
{
	var $name = 'Level';
	
	var $hasMany = array
	(
		'UserLanguage' => array
		(
			'className'		=> 'UserLanguage',
			'foreignKey'	=> 'language_id'
		)
	);
}
?>