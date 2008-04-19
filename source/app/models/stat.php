<?php
class Stat extends AppModel
{
    var $name = 'Stat';
    var $displayField = "name_sk";
    
    public function SqlQuery($sql){
      $out = array();
  		$rows = $this->query($sql);
  		foreach ($rows as $k=>$v)
  		{
  			$out[$k] = $v[0];
  		}
  		return $out;
    }
    
}
?>
