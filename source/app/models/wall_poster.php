<?php
/**
 * @package AATeam
 * @subpackage app.models
 */
class WallPoster extends AppModel
{
	var $name = 'WallPoster';

	var $belongsTo = array('User' =>
								array('className'  => 'User',
									'conditions' => '',
									'order'      => '',
									'foreignKey' => 'user_id'
								)
	);


	var $validate = array(

          'created'  => VALID_NOT_EMPTY,
//          'valid_until'  => VALID_NOT_EMPTY,

    );

}

?>
