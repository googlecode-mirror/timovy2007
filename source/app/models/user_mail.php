<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class UserMail extends AppModel 
{
	public $name = 'UserMail';
	public $useTable = 'user_mails';
	
	public $validate = array
	(
		'user_id'			=> VALID_NOT_EMPTY,
		'mail_id'			=> VALID_NOT_EMPTY,
		'mail_status_Id' 	=> VALID_NOT_EMPTY
	);	
	
	
	var $belongsTo = array
	(
		'User' => array 
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		),
		'Mail' => array 
		(
			'className'		=> 'Mail',
			'foreignKey'	=> 'mail_id'
		),
		'UserMailState' => array
		(
			'calssName'		=> 'UserMailState',
			'foreignKey'	=> 'user_mail_state_id'
		)
	);
}
?>