<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Language extends AppModel 
{
	var $name = 'Language';
	
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