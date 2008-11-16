<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class MailGroupUser extends AppModel 
{
	var $name = 'MailGroupUser';
	var $useTable = 'mail_group_users';
	
	var $belongsTo = array
	(
		'MailGroup' => array
		(
			'className' 	=> 'MailGroup',
			'foreignKey' 	=> 'mail_group_id'
		),
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)		
	);
}