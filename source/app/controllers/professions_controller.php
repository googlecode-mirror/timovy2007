<?php

class ProfessionsController extends AppController 
{  
  var $uses = array('Professions');
  var $name = 'Professions';  
	var $components = array('Login');
	var $helpers = array('Form', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
  
  	// Overi ci ma pouzivatel potrebne prava  
	private function check_permission()
	{
		if (!$this->Login->check('MANAGE_PROFESSIONS')) {
			$this->My->setError(__('_PERMISSION_DENIED',true));	
			$this->redirect('/login', null, true);
		}
	}
  
  function index()
  {
		$this->check_permission();

		$this->set('data', $this->paginate('Professions'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
  	$this->check_permission();

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
	$this->check_permission();

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
  	$this->check_permission();

	$this->Professions->del($id);
    $this->redirect('/professions', null, true);
  }  
  
}
?>
