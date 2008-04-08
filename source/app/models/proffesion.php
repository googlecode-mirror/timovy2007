<?php
<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class Profession extends AppModel 
{
	var $name = 'Proffesion';
	
	var $hasMany = array
	(
		'UserProfession' => array
		(
			'className'		=> 'UserProfession',
			'foreignKey'	=> 'profession_id'
		)
	);
}
?>