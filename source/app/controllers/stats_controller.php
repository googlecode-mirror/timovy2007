<?php

class StatsController extends AppController 
{  
  var $uses = array('Stat');  
	var $components = array('Login');
	var $helpers = array('Form', 'Excel'); 
  
  function index()
  {
    $this->Stat->displayField = 'name_'. $this->Session->read('Config.language');
		$this->set('statistics', $this->Stat->find("list"));
		$this->set('lang', $this->Session->read('Config.language'));
  }
  
  function export() {
  
    if ($this->data) {
      $sql = $this->Stat->find(array('id' => $this->data['Stat']['id']) );
      $data = $this->Stat->SqlQuery($sql['Stat']['sql']);            
      $this->set('data', $data);
      $this->render('action', 'excel');
      $this->layout = 'excel'; 
    }
    else {
      $this->redirect('/stats', null, true);
    }  
  }
  
}
?>
