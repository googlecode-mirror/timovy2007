<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class LoginHistory extends AppModel 
{
	var $name = 'LoginHistory';
	var $useTable = 'login_history';
	
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