<?php

class LevelsController extends AppController 
{  
  var $uses = array('Levels');
  var $name = 'Levels';  
	var $components = array('Login');
	var $helpers = array('Form', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));

   	// Overi ci ma pouzivatel potrebne prava  
	private function check_permission()
	{
		if (!$this->Login->check('MANAGE_LEVELS')) {
			$this->My->setError(__('PERMISSION_DENIED',true));	
			$this->redirect('/login', null, true);
		}
	}
  
  function index()
  {
    $this->pageTitle = __('LEVELS_INDEX_TITLE', true);
		$this->check_permission();
		$this->set('data', $this->paginate('Levels'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->pageTitle = __('LEVELS_EDIT_TITLE', true);
	  $this->check_permission();
    $this->Levels->id = $id;
    if (empty($this->data))
    {
        $this->set('data', $this->Levels->read());
        $this->set('id', $id);
    }
    else
    {    
      if ($this->Levels->save($this->data)) {
        $this->My->setInfo(__('LEVELS_ITEM_UPDATED', true));
			  $this->redirect('/levels', null, true);
			}
      else { 
				$this->My->setError(__('LEVELS_ERROR_ON_INSERT', true));
			}       
    }
  }
  
  function add()
  {
    $this->pageTitle = __('LEVELS_ADD_TITLE', true);
	  $this->check_permission();
    if ($this->data) {
      if ($this->Levels->save($this->data)) {
        $this->My->setInfo(__('LEVELS_ITEM_ADDED', true));
			  $this->redirect('/levels', null, true);
			}
      else { 
				$this->My->setError(__('LEVELS_ERROR_ON_INSERT', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->pageTitle = __('LEVELS_DELETE_TITLE', true);
 	  $this->check_permission();
    $this->Levels->del($id);
    $this->redirect('/levels', null, true);
  }  
  
}
?>
