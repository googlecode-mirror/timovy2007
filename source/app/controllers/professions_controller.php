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
			$this->My->setError(__('PERMISSION_DENIED',true));	
			$this->redirect('/login', null, true);
		}
	}
  
  function index()
  {
    $this->pageTitle = __('PROFESSIONS_INDEX_TITLE', true);
		$this->check_permission();
		$this->set('data', $this->paginate('Professions'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->pageTitle = __('PROFESSIONS_EDIT_TITLE', true);
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
        $this->My->setInfo(__('PROFESSIONS_ITEM_UPDATED', true));
			  $this->redirect('/professions', null, true);
			}
      else { 
				$this->My->setError(__('PROFESSIONS_ERROR_ON_INSERT', true));
			}       
    }
  }
  
  function add()
  {
    $this->pageTitle = __('PROFESSIONS_ADD_TITLE', true);
	  $this->check_permission();
    if ($this->data) {
      if ($this->Professions->save($this->data)) {
        $this->My->setInfo(__('PROFESSIONS_ITEM_ADDED', true));
			  $this->redirect('/professions', null, true);
			}
      else { 
				$this->My->setError(__('PROFESSIONS_ERROR_ON_INSERT', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->pageTitle = __('PROFESSIONS_DELETE_TITLE', true);
  	$this->check_permission();
	  $this->Professions->del($id);
    $this->redirect('/professions', null, true);
  }  
  
}
?>
