<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class User extends AppModel 
{
	public $name = 'User';
	public $validate = array
	(
		'username'		=> array('rule'=>array('custom', '/^[\d\w\_\.\-]{1,255}$/i')),
		'password'		=> VALID_NOT_EMPTY,
		'forward_mail' 	=> array('rule'=>array('email'), 'allowEmpty' => true),
		'email'			=> array('rule'=>array('email')),
		'icq'			=> array('rule'=>array('custom', '/^[\d\-]{0,255}$/i')),
	);
	
	var $hasOne = array
	(
		'Graduate'	=> array
		(
			'className' 	=> 'Graduate',
			'foreignKey' 	=> 'id'
		),
		'Academic'	=> array
		(
			'className' 	=> 'Academic',
			'foreignKey'	=> 'id'
		)
	);
	
	var $hasMany = array
	(
		'UserProfession' => array
		(
			'className'		=> 'UserProfession',
			'foreignKey'	=> 'user_id'
		)
	); 
	
	var $hasAndBelongsToMany = array
	(
		'Role' => array
		(
			'className'				=> 'Role',
			'joinTable'				=> 'users_roles',
			'foreignKey'			=> 'user_id',
			'associationForeignKey'	=> 'role_id',
			'unique'				=> 'true'
		)
	);
	
	/**
	 * Retrieve array of user roles for selected user
	 *
	 * @param int $user_id
	 * @return array of roles (string)
	 */
	public function custom_clearances($user_id)
	{
		$out = array();
		$rows = $this->query("SELECT uc.*, c.key, c.name, c.description FROM users_clearances uc JOIN clearances c ON c.id=uc.clearance_id WHERE user_id=".(int)$user_id);
		foreach ($rows as $r)
		{
			$out[$r[0]['key']] = $r[0];
		}
		return $out;
	}
}