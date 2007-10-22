<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Mail extends AppModel 
{
	var $name = 'Mail';
	var $useTable = 'mails';
	
	var $hasMany = array
	(
		'UserMail' => array
		(
			'className' 	=> 'UserMail',
			'foreignKey'	=> 'mail_id'
		)		
	);
}