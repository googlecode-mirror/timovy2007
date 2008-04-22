<?php

class StatsController extends AppController 
{  
  var $uses = array('Stat');
  var $name = 'Stats';  
	var $components = array('Login');
	var $helpers = array('Form', 'Excel', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
  
  function index()
  {
		$this->set('data', $this->paginate('Stat'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->Stat->id = $id;
    if (empty($this->data))
    {
        $this->set('data', $this->Stat->read());
        $this->set('id', $id);
    }
    else
    {    
      if ($this->Stat->save($this->data)) {
        $this->My->setInfo(__('Statistika uspesne upravena.', true));
			  $this->redirect('/stats', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani sql dotazu do db.', true));
			}       
    }
  }
  
  function add()
  {
    if ($this->data) {
      if ($this->Stat->save($this->data)) {
        $this->My->setInfo(__('Nova statistika uspesne vlozena do db.', true));
			  $this->redirect('/stats', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani sql dotazu do db.', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->Stat->del($id);
    $this->redirect('/stats', null, true);
  }  
  
  function select()
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
      $this->layout = 'excel'; 
    }
    else {
      $this->redirect('/stats', null, true);
    }  
  }
  
}
?>
