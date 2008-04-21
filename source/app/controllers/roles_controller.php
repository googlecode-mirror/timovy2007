<?php
class RolesController extends AppController 
{
   var $name = 'Roles';
   var $uses = array('Role', 'Clearance', 'RolesClearance');
   var $required_clearances = array('MANAGE_USERS');
   var $helpers = array('Form');
   
   /**
    * Hlavne zobrazenie
    */
	public function index()
	{
		//
		// najde vsetky role
		//
		// - listovanie nie je treba, roli by nemalo byt vela
		$this->set('roles', $this->Role->findAll());
	}
	
	function create()
	{
		//
		// akcia uloz
		if (isset($this->data)) {
			
			// 
			// zacni transakciu
			$this->Role->begin();
			
			
			//
			// uloz model
			if ($x = $this->Role->save($this->data)) {
				
				//
				// id pridanej role
				$role_id = $this->Role->getInsertID();
				
				//
				// uloz jednotlive clearances
				if (isset($_POST['clearance']) and is_array($_POST['clearance'])) {
					$error = false;
					foreach ($_POST['clearance'] as $c) {
						$data = array
						(
							'role_id' 		=> $role_id,
							'clearance_id'	=> (int)$c
						);
					
						//
						// ak to spadne ...
						if (!$this->RolesClearance->save($data)) {
							$error = true;
							break;
						}
					}
					if ($error) {
						// vyhlas chybu
						$this->Role->rollback();
						$this->My->setError('Nepodarilo sa pridat opravnenie !');
					} else {
						// redirect
						$this->Role->commit();
						$this->My->setInfo("Rola bola úspešne uložená!");
						$this->redirect('/roles');
						exit();
					}
				} else {
					// redirect
					$this->Role->commit();
					$this->My->setInfo("Rola bola úspešne uložená!");
					$this->redirect('/roles');
					exit();
				}
			} else {
				$this->My->setError('Nepodarilo sa uložiť rolu!');
			}
		}
		
		// 
		// render
		$this->set('clearances', $this->Clearance->findAll());
		$this->set('lang', $this->Session->read('Config.language'));
	}
	
	function delete($role_id)
	{
		$this->Role->id = $role_id;
		if (!($data = $this->Role->read())) {
			$this->My->setError('Neexistujúci identifikátor pre rolu.');
		} else {
			if ($this->Role->del()) {
				$this->My->setInfo('Používateľská rola s názvom '.$data['Role']['name']. ' bola úspešne vymazaná!');
			} else {
				$this->My->setError('Nepodarilo sa vymazať rolu, pravdepodobne je ešte priradená používateľom!');
			}
		}
		$this->redirect('/roles');
		exit();
	}
	
	function edit($role_id)
	{
		//
		// pribinduj tabulku clearances
		$this->Role->bindModel(array('hasAndBelongsToMany' => array('Clearance' => array('className' => 'Clearance','joinTable'    => 'roles_clearances','foreignKey'   => 'role_id','associationForeignKey'=> 'clearance_id',))));
		
		//
		// over ci rola existuje
		$this->Role->id = $role_id;
		if (!($role = $this->Role->read())) {
			$this->My->setError(__('Nonexisting role', true));
			$this->redirect('/roles', null, true);
		}
		
		//print_r($this->data);
		//exit();
		
		//
		// uloz akcia
		if ($this->data) {
			if ($this->Role->save($this->data)) {
				$this->My->setInfo(__('Permission role has been successfully updated!', true));
				$this->redirect('/roles/edit/'.$role_id, null, true);
			} else {
				$this->My->setError(__('There was a error by updating permission role', true));
			}
		}
		
		//
		// rendering data
		$clearance_ids = array();
		foreach ($role['Clearance'] as $c) {
			$clearance_ids[] = $c['id'];
		}
		
		$this->data = $role;	
		$this->set('role', $role);
		$this->set('role_id', $role_id);
		$this->set('clearance_ids', $clearance_ids);
		$this->set('clearances', $this->Clearance->findAll());
		$this->set('lang', $this->Session->read('Config.language'));
	}
}
?>