<?php
<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class UserProfession extends AppModel 
{
	var $name = 'UserProffesion';
	
	var $belongsTo = array
	(
		'Proffesion' => array
		(
			'className'		=> 'Proffesion',
			'foreignKey'	=> 'profession_id'
		),
		'User' => array
		(
			'className'		=> 'User',
			'foreignKey'	=> 'user_id'
		)
	);
}
?>