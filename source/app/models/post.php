<?php
class Post extends AppModel
{
    var $name = 'Post';

    var $validate = array(

        'title'  => array(
                VALID_NOT_EMPTY,
                'rule' => array('maxLength', 50)
        ),         
        'body'   => VALID_NOT_EMPTY

    );
}
?>