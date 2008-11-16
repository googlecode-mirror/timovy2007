<?php
class MailgroupsController extends AppController 
{
   var $name = 'Mailgroups';
   var $uses = array('Mail', 'User', 'UserMail', 'MailGroup', 'MailAddressGroup', 'MailAddressUser', 'MailGroupUser');
   var $helpers = array('Form', 'Ajax', 'Time', 'MyTime');
   var $components = array('Login', 'Email');
   var $paginate = array('limit' => 15, 'page' => 1, 'order'=>array('id' => 'asc'));
      
   /**
    * Hlavne zobrazenie - zobrazi zoznam mailovych skupin pouzivatela
    */    
  function index()
  {
    $this->pageTitle = __('MAILGROUPS_INDEX_TITLE', true);
		$this->set('data', $this->paginate('MailGroup'));
		$this->set('lang', $this->Session->read('Config.language'));
  } 
  
  function edit($id)
  {
    $this->pageTitle = __('MAILGROUPS_EDIT_TITLE', true);
    $this->MailGroup->id = $id;
    if (empty($this->data))
    {
        $this->MailGroup->recursive = 2;
        $this->set('data', $this->MailGroup->read());
        $this->set('id', $id);
    }
    elseif (isset($this->data['name']) && $this->data['name']!='') {

			// rozdelim to na jednotlive adresy
			$u_addresses = array();
			$address = $_POST['address'];
			$address = explode(',', $address);
			foreach ($address as $addr) {
				
				$addr = trim($addr, " \n\r");				
				$addr = trim(strip_tags($addr), " \n");
				
				// over ci takyto pouzivatel existuje
				if (false === ($user_id = $this->User->field('id', array('User.username'=>$addr)))) {
					$this->My->setError(__('MAIL_COMPOSE_BAD_ADDRESS', true));
					return;
				}
				$u_addresses[] = $user_id;
				
			}    
   		$this->MailGroup->id = $id;
      if ($this->MailGroup->save(array('name'=>$this->data['name'],'description'=>$this->data['description'], 'user_id'=>$this->Login->user_id()))) {
        // vymaz existujuce relacie        
        $this->MailGroupUser->deleteAll("mail_group_id=".$id);
        // uloz relacie danej mailgrupy        
        foreach($u_addresses as $user_id) {
          $this->MailGroupUser->create();
          if (!$this->MailGroupUser->save(array('MailGroupUser'=>array('user_id'=>$user_id, 'mail_group_id'=>$this->MailGroup->id)))) {
            $this->My->setError(__('MAILGROUPS_ERROR_ON_INSERT', true));
            return;  
          }
        }
      
        $this->My->setInfo(__('MAILGROUPS_ITEM_EDITED', true));
			  $this->redirect('/mailgroups', null, true);
			}
      else { 
				$this->My->setError(__('MAILGROUPS_ERROR_ON_UPDATED', true));
			}			
    }
  }
  
  function add()
  {  
    $this->pageTitle = __('MAILGROUPS_ADD_TITLE', true);
    if (isset($this->data['name']) && $this->data['name']!='') {

			// rozdelim to na jednotlive adresy
			$u_addresses = array();
			$address = $_POST['address'];
			$address = explode(',', $address);
			foreach ($address as $addr) {
				
				$addr = trim($addr, " \n\r");				
				$addr = trim(strip_tags($addr), " \n");
				
				// over ci takyto pouzivatel existuje
				if (false === ($user_id = $this->User->field('id', array('User.username'=>$addr)))) {
					$this->My->setError(__('MAIL_COMPOSE_BAD_ADDRESS', true));
					return;
				}
				$u_addresses[] = $user_id;
				
			}    
    
      if ($this->MailGroup->save(array('MailGroup'=>array('name'=>$this->data['name'],'description'=>$this->data['description'], 'user_id'=>$this->Login->user_id())))) {
        // uloz relacie danej mailgrupy        
        foreach($u_addresses as $user_id) {
          $this->MailGroupUser->create();
          if (!$this->MailGroupUser->save(array('MailGroupUser'=>array('user_id'=>$user_id, 'mail_group_id'=>$this->MailGroup->id)))) {
            $this->My->setError(__('MAILGROUPS_ERROR_ON_INSERT', true));
            return;  
          }
        }
      
        $this->My->setInfo(__('MAILGROUPS_ITEM_ADDED', true));
			  $this->redirect('/mailgroups', null, true);
			}
      else { 
				$this->My->setError(__('MAILGROUPS_ERROR_ON_INSERT', true));
			}			
    }
  }  

  function delete($id)
  {
    $this->pageTitle = __('MAILGROUPS_DELETE_TITLE', true);
    $this->MailGroupUser->deleteAll("mail_group_id=".$id);
    $this->MailGroup->del($id);
    $this->My->setInfo(__('MAILGROUPS_ITEM_DELETED', true));
    $this->redirect('/mailgroups', null, true);
  }    
      

}
?>