<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Role extends AppModel 
{
	var $name = 'Role';
	var $useTable = 'roles';
	
	var $validate = array
	(
		'name' => VALID_NOT_EMPTY
	);
	
	
	
	var $hasAndBelongsToMany = array
	(
		'Clearance' => array
		(
			'className' => 'Clearance',
            'joinTable'    => 'roles_clearances',
			'foreignKey'   => 'role_id',
            'associationForeignKey'=> 'clearance_id',
		)
	);
	
}