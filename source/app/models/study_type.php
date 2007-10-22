<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class StudyType extends AppModel 
{
	var $name = 'StudyType';
	
	var $hasMany = array
	(
		'Specialization' => array
		(
			'className'		=> 'Specialization',
			'foreignKey'	=> 'study_type_id'
		)
	);
}