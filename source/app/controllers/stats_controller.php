<?php

class StatsController extends AppController 
{  
  var $uses = array('Stat');
  var $name = 'Stats';  
	var $components = array('Login');
	var $helpers = array('Form', 'Excel', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));

   	// Overi ci ma pouzivatel potrebne prava  
	private function check_permission()
	{
		if (!$this->Login->check('MANAGE_STATS')) {
			$this->My->setError(__('_PERMISSION_DENIED',true));	
			$this->redirect('/login', null, true);
		}
	}
  
  function index()
  {
		$this->check_permission();

		$this->set('data', $this->paginate('Stat'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
	$this->check_permission();

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
		$this->check_permission();

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
	$this->check_permission();

    $this->Stat->del($id);
    $this->redirect('/stats', null, true);
  }  
  
  function select()
  {
 	$this->check_permission();

   $this->Stat->displayField = 'name_'. $this->Session->read('Config.language');
		$this->set('statistics', $this->Stat->find("list"));
		$this->set('lang', $this->Session->read('Config.language'));
  }
  
  function export() 
  {
   	$this->check_permission();

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
