<?php

class LanguagesController extends AppController 
{  
  var $uses = array('Languages');
  var $name = 'Languages';  
	var $components = array('Login');
	var $helpers = array('Form', 'Paginator', 'Html');
	var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
  
  function index()
  {
		$this->set('data', $this->paginate('Languages'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->Languages->id = $id;
    if (empty($this->data))
    {
        $this->set('data', $this->Languages->read());
        $this->set('id', $id);
    }
    else
    {    
      if ($this->Languages->save($this->data)) {
        $this->My->setInfo(__('Jazyk uspesne upraveny.', true));
			  $this->redirect('/languages', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani jazyka do db.', true));
			}       
    }
  }
  
  function add()
  {
    if ($this->data) {
      if ($this->Languages->save($this->data)) {
        $this->My->setInfo(__('Novy jazyk uspesne vlozeny do db.', true));
			  $this->redirect('/languages', null, true);
			}
      else { 
				$this->My->setError(__('Problem pri ukladani jazyka do db.', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->Languages->del($id);
    $this->redirect('/languages', null, true);
  }  
  
}
?>
