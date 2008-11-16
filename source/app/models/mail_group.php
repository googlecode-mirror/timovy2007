<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class MailGroup extends AppModel 
{
	var $name = 'MailGroup';
	var $useTable = 'mail_groups';
	
	var $hasMany = array
	(
		'MailGroupUser' => array
		(
			'className'		=> 'MailGroupUser',
			'foreignKey'	=> 'mail_group_id'
		)
	); 	
}