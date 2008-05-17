<?php
class Stat extends AppModel
{
    var $name = 'Stat';
    var $displayField = "name_sk";
    
    public function SqlQuery($sql){
      $out = array();
  		$rows = @$this->query($sql);
  		if(is_array($rows)){
    		foreach ($rows as $k=>$v)
    		{
    			$out[$k] = $v[0];
    		}
    		return $out;      
      }
      else {
        return array(0=>array('SQL Syntax'=>'Error'));
      }

    }
    
}
?>
