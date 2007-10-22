<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Project extends AppModel 
{
	var $name = 'Project';
	
	var $belongsTo = array
	(
		'ProjectType' => array
		(
			'className'		=> 'ProjectType',
			'foreignKey'	=> 'project_type_id'
		),
		'Graduate' => array
		(
			'className'		=> 'Graduate',
			'foreignKey'	=> 'graduate_id'
		),
		'Specialization' => array
		(
			'className'		=> 'Specialization',
			'foreignKey'	=> 'specialization_id'
		),
		'Academic' => array
		(
			'className'		=> 'Academic',
			'foreignKey'	=> 'academic_id'
		),
		'MasterAcademic' => array
		(
			'className'		=> 'Academic',
			'foreignKey'	=> 'master_academic_id'
		)
	);
}