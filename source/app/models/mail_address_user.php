<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class MailAddressUser extends AppModel 
{
	var $name = 'MailAddressUser';
	var $useTable = 'mail_address_users';
	
	var $belongsTo = array
	(
		'Mail' => array
		(
			'className' 	=> 'Mail',
			'foreignKey' 	=> 'mail_id'
		),
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)
	);
}