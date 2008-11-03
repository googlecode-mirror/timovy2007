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
   
   function afterFind($results) {
      foreach ($results as $k => $v) {
        if(is_array($v)) {
          $results[$k] = $this->afterFind($v);
        } else {
          $results[$k] = html_entity_decode($results[$k]);
        }
      }
      return $results;
   }
   
   function beforeSave($data) { 
      foreach ($data as $k => $v) {
        if(is_array($v)) {
          $data[$k] = $this->beforeSave($v);
        } else {
          $data[$k] = htmlentities($results[$k]);
        }
      }
      return $data;
   }
}
?>