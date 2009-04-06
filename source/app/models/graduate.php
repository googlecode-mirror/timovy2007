<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Graduate extends AppModel 
{
	var $name = 'Graduate';
	
	
	var $belongsTo = array
	(
		'User' => array
		(
			'className' 	=> 'User',
			'foreignKey'	=> 'user_id'
		),
		'Specialization' => array
		(
			'className'		=> 'Specialization',
			'foreignKey'	=> 'specialization_id'
		)
	);
}