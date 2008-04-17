<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class UserProfession extends AppModel 
{
	var $name = 'UserProfession';
	
	var $belongsTo = array
	(
		'Profession' => array
		(
			'className'		=> 'Profession',
			'foreignKey'	=> 'profession_id'
		),
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)
	);
}
?>