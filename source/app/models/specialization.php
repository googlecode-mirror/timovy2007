<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Specialization extends AppModel 
{
	var $name = 'Specialization';

	var $belongsTo = array
	(
		'StudyType' => array
		(
			'className' 	=> 'StudyType',
			'foreignKey' 	=> 'study_type_id'
		),
	);	
}
?>