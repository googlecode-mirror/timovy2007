<?php

class StatsController extends AppController 
{  
  var $uses = array('Stat', 'User', 'Graduate', 'StudyType', 'Specialization', 'UsersOnline', 'Project', 'UserProfession', 'Profession', 'Level', 'Language', 'UserLanguage');  
	var $components = array('Login');
	var $helpers = array('form','Excel');
  
  function index()
  {
    $this->Stat->displayField = 'name_'. $this->Session->read('Config.language');
		$this->set('statistics', $this->Stat->find("list"));
		$this->set('lang', $this->Session->read('Config.language'));
  }
  
  function export() {
    if ($this->data) {
      $data = array();
      $data['sheet1'] = $this->Language->findAll(NULL, NULL, NULL, NULL, 1, 2);
      $this->set('data', $data);
      $this->render('action', 'excel');
    }
    else {
      $this->redirect('/stats', null, true);
    }  
  }
  
}
?>
