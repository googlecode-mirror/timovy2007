<?php

class ProfessionsController extends AppController 
{  
  var $uses = array('Professions');
  var $name = 'Professions';  
	var $components = array('Login');
	var $helpers = array('Form', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
  
  function index()
  {
		$this->set('data', $this->paginate('Professions'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->Professions->id = $id;
    if (empty($this->data))
    {
        $this->set('data', $this->Professions->read());
        $this->set('id', $id);
    }
    else
    {    
      if ($this->Professions->save($this->data)) {
        $this->My->setInfo(__('Profesia uspesne upravena.', true));
			  $this->redirect('/professions', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani profesie.', true));
			}       
    }
  }
  
  function add()
  {
    if ($this->data) {
      if ($this->Professions->save($this->data)) {
        $this->My->setInfo(__('Nova profesia uspesne vlozena do db.', true));
			  $this->redirect('/professions', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani profesie do db.', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->Professions->del($id);
    $this->redirect('/professions', null, true);
  }  
  
}
?>
