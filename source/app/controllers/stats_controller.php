<?php

class StatsController extends AppController
{

  var $uses = array('User', 'UserProfession', 'UserLanguage', 'Stat');

  function index()
  {
    $this->Stat->displayField = 'name_'. $this->Session->read('Config.language');
		$this->set('professions', $this->Stat->find("list"));
  }
/*
    function view($id)
    {
        //action logic goes here..
    }

    function rent($customer_id, $video_id)
    {
        //action logic goes here..
    }

    function search($query)
    {
        //action logic goes here..
    }
    */
}
?>
