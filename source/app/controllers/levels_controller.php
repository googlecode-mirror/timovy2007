<?php

class LevelsController extends AppController 
{  
  var $uses = array('Levels');
  var $name = 'Levels';  
	var $components = array('Login');
	var $helpers = array('Form', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
  
  function index()
  {
		$this->set('data', $this->paginate('Levels'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->Levels->id = $id;
    if (empty($this->data))
    {
        $this->set('data', $this->Levels->read());
        $this->set('id', $id);
    }
    else
    {    
      if ($this->Levels->save($this->data)) {
        $this->My->setInfo(__('Uroven uspesne upravena.', true));
			  $this->redirect('/levels', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri urovne jazyka do db.', true));
			}       
    }
  }
  
  function add()
  {
    if ($this->data) {
      if ($this->Levels->save($this->data)) {
        $this->My->setInfo(__('Nova uroven uspesne vlozena do db.', true));
			  $this->redirect('/levels', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani urovne do db.', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->Levels->del($id);
    $this->redirect('/levels', null, true);
  }  
  
}
?>
