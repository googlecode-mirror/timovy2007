<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class MailAddressGroup extends AppModel 
{
	var $name = 'MailAddressGroup';
	var $useTable = 'mail_address_groups';
	
	var $belongsTo = array
	(
		'Mail' => array
		(
			'className' 	=> 'Mail',
			'foreignKey' 	=> 'mail_id'
		),
		'MailGroup' => array
		(
			'className'		=> 'MailGroup',
			'foreignKey'	=> 'mail_group_id'
		)
	);
}