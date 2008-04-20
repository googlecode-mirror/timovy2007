<?php 
class TestController extends AppController {

    var $name = 'Test';
    var $use = array('LdapUser');

    function index() {            
        /*$conditions = "id=1";
        $recursive = 1; 
        $data = $this->User->find($conditions, null, null, $recursive);*/
        pr($this->LdapUser->findAll('uid', '*')); 
        //$this->set('data', $data);
    }
}
?> 