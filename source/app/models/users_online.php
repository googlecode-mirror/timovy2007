<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class UsersOnline extends AppModel 
{
	var $name = 'UsersOnline';
	var $useTable = 'users_online';
	var $primaryKey = 'session_id';
	
	var $belongsTo = array
	(
		'User' => array 
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)
	);
}
?>