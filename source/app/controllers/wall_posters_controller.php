<?php
/**
 * @package AATeam
 * @subpackage app.controllers
 */
class WallPostersController extends AppController
{
	var $uses = array('WallPoster','User');
	var $helpers = array('Html', 'Session');
	var $components = array('Login');

	/**
	 * Pripraví údaje na zobrazenie aktuálnych oznamov
	 * a oznamov vlastníka(prihláseného používateľa) čakajúcich na potvrdenie
	 * Nastavuje príznaky práv na zápis a administráciu
	 * Nastavuje príznak či sa môže zobraziť odkaz na staré oznamy
	 *
	 */
	function index()
	{
		$this->Login->refresh(); // koli testom na clearances
		$dnes = date("Y-m-d");
		//"validUntil >= '".$dnes." 00:00:00'"
// 		$this->set('clearance_show', 0);
		$this->set('posts', array());
		
		$logged_user_id = 0;
// 		$anonymous_id = $this->Login->getAnonymousId();
		if($this->Login->isLogged())
   		$logged_user_id = $this->Login->user_id();
// 		elseif($anonymous_id !== false)
// 			$logged_user_id = $anonymous_id;

// 		if($this->Login->check('WALL_POSTER_ACCESS')){
				// implementacny pozozstatok, po odstraneni prava pristupu na natenku za ucelom citania
// 				$this->set('clearance_show', 1);

			// echo "user: ".$logged_user_id."<br />";

// 				AND
// 				(is_changed != 't' AND operation != 'd')

			//$this->set('posts', $this->WallPoster->findAll("valid_until >= '".$dnes." 00:00:00'", null, 'valid_until asc'));
			// vsetky nezmazane, ale nie tie co cakaju na potvrdenie
			$this->set('posts', $this->WallPoster->findAll(
				"is_deleted = 'f'
				AND
				(
					(
						(user_id = '$logged_user_id') AND (is_changed = 't') AND (operation != 'd')
					)
					OR
					(
               	(user_id = '$logged_user_id') AND (is_changed = 'f') AND (valid_until >= '".$dnes."')
					)
					OR
					(
                  (user_id != '$logged_user_id') AND (is_changed = 'f') AND (is_refused = 'f') AND (valid_from <= '".$dnes."') AND (valid_until >= '".$dnes."')
					)
				)"
				, null, "WallPoster.is_changed asc, WallPoster.is_refused asc, WallPoster.title asc, WallPoster.new_title asc, WallPoster.created asc")
			);
// 		}

		$this->set('clearance_write', 0);
		if($this->Login->check('WALL_POSTER_WRITE')) $this->set('clearance_write', 1);
		
		$this->set('clearance_admin', 0);
		if($this->Login->check('WALL_POSTER_ADMIN')) $this->set('clearance_admin', 1);
		
// 				(
// 					(user_id = '$logged_user_id') AND (is_changed = 't') AND (operation != 'd')
// 				)
// 				OR
		// zobrazit odkaz na zobrazenie starsich prispevkov na nastenke ?
		$tmp = $this->WallPoster->find(
			"is_deleted = 'f'
			AND
			(
				(
            	(user_id = '$logged_user_id') AND (is_changed = 'f') AND (valid_until < '".$dnes."')
				)
				OR
				(
               (user_id != '$logged_user_id') AND (is_changed = 'f') AND (is_refused = 'f') AND (valid_until < '".$dnes."')
				)
			)"
			, null, "");
		if(empty($tmp))
			$this->set('are_old_wall_posters_present', 0);
		else
		   $this->set('are_old_wall_posters_present', 1);
	}

	/**
	 * Pripraví údaje na zobrazenie starých oznamov
	 * a starých oznamov vlastníka čakajúcich na potvrdenie
	 * Nastavuje príznaky práv na zápis a administráciu
	 *
	 */
	function viewold()
	{
		$this->Login->refresh();
		$dnes = date("Y-m-d");
		//"validUntil >= '".$dnes." 00:00:00'"
		$this->set('clearance_show', 0);
		$this->set('posts', array());


// 		if($this->Login->check('WALL_POSTER_ACCESS')){
// 			$this->set('clearance_show', 1);

			$logged_user_id = 0;
// 			$anonymous_id = $this->Login->getAnonymousId();
			if($this->Login->isLogged())
	   		$logged_user_id = $this->Login->user_id();
// 			elseif($anonymous_id !== false)
// 				$logged_user_id = $anonymous_id;

			//echo "user: ".$logged_user_id."<br />";

// 					(
// 						(user_id = '$logged_user_id') AND (is_changed = 't') AND (operation != 'd')
// 					)
// 					OR
			$this->set('posts', $this->WallPoster->findAll(
				"is_deleted = 'f'
				AND
				(
					(
	            	(user_id = '$logged_user_id') AND (is_changed = 'f') AND (valid_until < '".$dnes."')
					)
					OR
					(
	               (user_id != '$logged_user_id') AND (is_changed = 'f') AND (is_refused = 'f') AND (valid_until < '".$dnes."')
					)
				)", null, "WallPoster.is_changed asc, WallPoster.is_refused asc, WallPoster.title asc, WallPoster.created asc"));
// 		}

		$this->set('clearance_write', 0);
		if($this->Login->check('WALL_POSTER_WRITE')) $this->set('clearance_write', 1);

		$this->set('clearance_admin', 0);
		if($this->Login->check('WALL_POSTER_ADMIN')) $this->set('clearance_admin', 1);
	}

	/**
	 * Pripraví údaje na zobrazenie oznamov čakajúcich
	 * na potvrdenie (len pre admin práva)
	 *
	 */
	function viewlist_admin()
	{
		$this->Login->refresh(); // koli testom na clearances
		$this->set('clearance_admin', 0);
      if(!$this->Login->check('WALL_POSTER_ADMIN')) return false;
		$this->set('clearance_admin', 1);

		$dnes = date("Y-m-d");

		//$this->set('posts', $this->WallPoster->findAll("valid_until >= '".$dnes." 00:00:00'", null, 'valid_until asc'));
		$this->set('posts', $this->WallPoster->findAll(/* "new_valid_until >= '".$dnes."' AND */ "is_changed = 't' AND is_deleted = 'f'", null, 'WallPoster.new_title asc, WallPoster.created asc'));

		$tmp = array();
// 		$tmp = $this->WallPoster->findAll("valid_until < '".$dnes."'", null, 'created asc');
		if(empty($tmp))
			$this->set('are_old_wall_posters_present', 0);
		else
		   $this->set('are_old_wall_posters_present', 1);
	}

	/**
	 * Pripraví zobrazenie požadovaných údajov oznamu
	 * Údaje oznamu budú zobrazené podľa práv prihláseného používateľa
	 * Nastavuje príznaky práv na zápis a administráciu
	 *
	 * @param unknown_type $id
	 * id oznamu, s ktorým sa pracuje
	 */
	function view($id = null)
	{
	   $this->Login->refresh(); // testing only, netreba stale refreshovat clearances predsa

		$this->set('clearance_show', 0);
		$this->set('posts', array());

//       $this->set('clearance_show', 0);
// 		if($this->Login->check('WALL_POSTER_ACCESS')) $this->set('clearance_show', 1);

		$this->set('clearance_write', 0);
		if($this->Login->check('WALL_POSTER_WRITE')) $this->set('clearance_write', 1);

		$this->set('clearance_admin', 0);
		if($this->Login->check('WALL_POSTER_ADMIN')){
			$this->set('clearance_admin', 1);
			$tmp = $this->WallPoster->find("WallPoster.id = '$id' AND is_deleted = 'f'");
			$this->set('post', $tmp);
  		}

		//elseif($this->Login->check('WALL_POSTER_ACCESS')){
		else {
			//$this->set('clearance_show', 1);
		   //$this->WallPoster->id = $id;
		   //$this->WallPoster->is_changed = 'f';
		   //$this->set('post', $this->WallPoster->read());

			$logged_user_id = 0;
			// kedze to nie je admin, aj tak musime zarucit, ze vlastnik svojho prispevku si ho bude moct editovat
// 			$anonymous_id = $this->Login->getAnonymousId();
			if($this->Login->isLogged())
	   		$logged_user_id = $this->Login->user_id();
// 			elseif($anonymous_id !== false)
// 				$logged_user_id = $anonymous_id;

			$this->set('logged_user_id', $logged_user_id);

		   $tmp = $this->WallPoster->find(
				"WallPoster.id = '$id'
				AND
				is_deleted = 'f'
				AND
				(
					(
						(user_id = '$logged_user_id') AND (is_changed = 't') AND (operation != 'd')
					)
					OR
					(
               	(user_id = '$logged_user_id') AND (is_changed = 'f')
					)
					OR
					(
                  (user_id != '$logged_user_id') AND (is_changed = 'f') AND (is_refused = 'f')
					)
				)"
			);

			//echo "TMP:<pre>"; print_r($tmp); echo "</pre>";
			$this->set('post', $tmp);
		}

	}

	/**
	 * Zobrazuje formulár na pridávanie oznamu
	 * a pridáva oznam pokiaľ má používateľ právo pridávať oznamy
	 * Nastavuje príznaky práv na zápis a administráciu
	 *
	 * Ak sú zaslané údaje z formulára, pridáva oznamy podľa práv do databázy
	 *
	 */
	function add()
	{
		$this->Login->refresh();

		$this->set('clearance_write', 0);
		if($this->Login->check('WALL_POSTER_WRITE')) $this->set('clearance_write', 1);

		$this->set('clearance_admin', 0);
		if($this->Login->check('WALL_POSTER_ADMIN')) $this->set('clearance_admin', 1);


		if (!empty($this->data))
		{
         if((!$this->Login->check('WALL_POSTER_WRITE')) && (!$this->Login->check('WALL_POSTER_ADMIN'))){
            $this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
            return;
			}

// 			$anonymous_id = $this->Login->getAnonymousId();
			if($this->Login->isLogged()) $logged_user_id = $this->Login->user_id();
// 			elseif($anonymous_id !== false) $logged_user_id = $anonymous_id;
			else{
            $this->flash(__("ERROR_NO_USER", true),'/wall_posters');
            return;
			}


		 	$this->data['WallPoster']['user_id'] = $logged_user_id;
		 	$this->data['WallPoster']['created'] = date("Y-m-d H:i:s");

			$this->data['WallPoster']['is_refused'] = '0';
			$this->data['WallPoster']['is_deleted'] = '0';

			if(!$this->Login->check('WALL_POSTER_ADMIN')) {
				// add to wall_posters table by ordinary user with Write Rule
				$this->data['WallPoster']['new_title'] = $this->data['WallPoster']['title'];
				$this->data['WallPoster']['new_text'] = $this->data['WallPoster']['text'];
				$this->data['WallPoster']['new_valid_from'] = $this->data['WallPoster']['valid_from'];
				$this->data['WallPoster']['new_valid_until'] = $this->data['WallPoster']['valid_until'];
				$this->data['WallPoster']['is_changed'] = '1';
				$this->data['WallPoster']['operation'] = 'a';
				unset($this->data['WallPoster']['title']);
				unset($this->data['WallPoster']['text']);
				unset($this->data['WallPoster']['valid_from']);
				unset($this->data['WallPoster']['valid_until']);
			}
			else
            // add to wall_posters table by user with ADMIN Rule
				$this->data['WallPoster']['is_changed'] = '0';

			if ($this->WallPoster->save($this->data))
			{
				$this->flash('Váš oznam bol pridaný.','/wall_posters');
			}
			else
			{
				$this->flash('Nepodarilo sa uložiť nový oznam.','/wall_posters');
			}
		}
	}

	/**
	 * Zobrazí požadovaný oznam vo formulári editácie ak má právo editovať oznamy
	 * a zodpovedá za editovanie, upravenie obsahu, potvrdenie a zamietanutie oznamov
	 * Nastavuje príznaky práv na zápis a administráciu
	 *
	 * Ak sú zaslané údaje z formulára, rozhoduje podľa práv prihláseného používateľa
	 * a podľa zvolenej metódy (tlačidla formulára), akú úpravu nad daným odkazom vykoná
	 * Táto funkcia zodpovedá za:
	 * - editáciu oznamu vlastníkom oznamu
	 * - editáciu oznamu administrátorom
	 * - potvrdenie oznamu
	 * - opätovné požiadanie o potvrdenie
	 * - zamietnutie zobrazovania oznamu
	 * - zmenu dôvodu zamietnutia
	 * - zrušenie zamietnutia zobrazovania
	 *
	 * @param unknown_type $id
	 * id oznamu, s ktorým sa pracuje
	 */
	function edit($id = null)
	{
		$this->Login->refresh();

//       $clearance_show = 0;
// 		if($this->Login->check('WALL_POSTER_ACCESS')) $clearance_show = 1;
// 		$this->set('clearance_show', $clearance_show);

		$clearance_write = 0;
		if($this->Login->check('WALL_POSTER_WRITE')) $clearance_write = 1;
		$this->set('clearance_write', $clearance_write);

		$clearance_admin = 0;
		if($this->Login->check('WALL_POSTER_ADMIN')) $clearance_admin = 1;
		$this->set('clearance_admin', $clearance_admin);

      $logged_user_id = 0;
// 		$anonymous_id = $this->Login->getAnonymousId();
		if($this->Login->isLogged())
   		$logged_user_id = $this->Login->user_id();
// 		elseif($anonymous_id !== false)
// 			$logged_user_id = $anonymous_id;

		if (empty($this->data))
		{
		   // Zobrazenie udajov oznamu pre ucely editacie
			$this->WallPoster->id = $id;
			$this->data = $this->WallPoster->read();

			if($this->data['WallPoster']['is_deleted'] == 't'){
				$this->flash('Tento oznam oznam je zmazaný.','/wall_posters/');
				return;
			}

	      if(
				(
// 					(!$clearance_show)
// 					||
					(!$clearance_write)
				)
				&&
				(!$clearance_admin)
			){
	         $this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
	         return;
			}

			$wall_poster_owner_name = '';
		   if($this->data['User']['username'] == 'anonymous')
		      $wall_poster_owner_name .= __("Anonymn", true);
			else {
				if(!empty($this->data['User']['title'])) $wall_poster_owner_name .= $this->data['User']['title']." ";
				$wall_poster_owner_name.= $this->data['User']['first_name']." ";
				if(!empty($this->data['User']['middle_name'])) $wall_poster_owner_name .= $this->data['User']['middle_name']." ";
				$wall_poster_owner_name .= $this->data['User']['last_name'];
			}
			$this->set('wall_poster_owner_name', $wall_poster_owner_name);

			if($clearance_admin){
			   if(($this->data['WallPoster']['is_changed'] == 't') && ($this->data['WallPoster']['operation'] == 'd'))
            	$this->data = '';

            unset($this->data['User']);
				$this->set('post', $this->data);
			}
			elseif(
// 				($clearance_show) &&
				($clearance_write)
				){
			   if((($this->data['WallPoster']['is_deleted'] == 't')) || (($this->data['WallPoster']['is_changed'] == 't') && ($this->data['WallPoster']['operation'] == 'd'))){
			      $this->data = '';
			      return;
				}
				if($logged_user_id != $this->data['WallPoster']['user_id']){
					$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
					return;
				}

				if(
					($this->data['WallPoster']['is_changed'] == 't')
					&&
					(
						($this->data['WallPoster']['operation'] == 'a')
						||
						($this->data['WallPoster']['operation'] == 'e')
      			)
				) {
					$this->data['WallPoster']['title'] = $this->data['WallPoster']['new_title'];
					$this->data['WallPoster']['text'] = $this->data['WallPoster']['new_text'];
					$this->data['WallPoster']['valid_from'] = $this->data['WallPoster']['new_valid_from'];
					$this->data['WallPoster']['valid_until'] = $this->data['WallPoster']['new_valid_until'];
				}

            unset($this->data['User']);
				$this->set('post', $this->data);

			}
			else {
				$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
				return;
			}

		} // if empty(data)

		else {
		   // prijate udajov zo sablonky Edit

 			$this->WallPoster->id = $this->data['WallPoster']['id'];
			$this->original_data = $this->WallPoster->read();

			if($this->original_data['WallPoster']['is_deleted'] == 't'){
				$this->flash('Tento oznam oznam je zmazaný.','/wall_posters/');
				return;
			}

			if($clearance_admin){

				if(isset($_POST['save_wall_poster'])){
// 					echo "DATA pred:<pre><br />"; print_r($this->original_data); echo "</pre><br />";
// 					echo "POST:<pre><br />"; print_r($this->data); echo "</pre><br />";

					// ulozenie zmien oznamu spravene adminom
					unset($this->data['WallPoster']['refusal_text']);

               $this->modified_data = $this->original_data;
					foreach($this->data['WallPoster'] as $each_id => $each_data){
						$this->modified_data['WallPoster'][$each_id] = $each_data;
					}
					$this->modified_data['WallPoster']['is_changed'] = ($this->original_data['WallPoster']['is_changed'] == 't') ? '1': '0';
					$this->modified_data['WallPoster']['is_refused'] = ($this->original_data['WallPoster']['is_refused'] == 't') ? '1': '0';
					$this->modified_data['WallPoster']['is_deleted'] = ($this->original_data['WallPoster']['is_deleted'] == 't') ? '1': '0';

					if ($this->WallPoster->save($this->modified_data['WallPoster']))
					{
						$this->flash('Oznam bol uložený.','/wall_posters/view/'.$this->data['WallPoster']['id']);
						//$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
					}
					else{
					  $this->flash('Nepodarilo sa uložiť oznam.','/wall_posters/edit/'.$this->data['WallPoster']['id']);
					}
				}
				elseif(isset($_POST['accept_wall_poster'])){
				   // potvrdenie oznamu

				   if(
						($this->original_data['WallPoster']['is_changed'] == 'f')
						||
						(
                     ($this->original_data['WallPoster']['is_changed'] == 't')
							&&
							(
								($this->original_data['WallPoster']['operation'] != 'a')
								&&
								($this->original_data['WallPoster']['operation'] != 'e')
							)
						)
					) {
						// ak je uz potvrdeny, nepotvrdzovat znova
						$this->flash('Oznam sa nedá potvrdiť alebo je označený ako zmazaný používateľom.','/wall_posters/view/'.$this->data['WallPoster']['id']);
						return;
					}

					$this->data['WallPoster']['title'] = $this->data['WallPoster']['new_title'];
					$this->data['WallPoster']['text'] = $this->data['WallPoster']['new_text'];
					$this->data['WallPoster']['valid_from'] = $this->data['WallPoster']['new_valid_from'];
					$this->data['WallPoster']['valid_until'] = $this->data['WallPoster']['new_valid_until'];
					$this->data['WallPoster']['is_changed'] = '0';
					$this->data['WallPoster']['is_refused'] = '0';
					$this->data['WallPoster']['is_deleted'] = '0';
					$this->data['WallPoster']['refusal_text'] = null;
					$this->data['WallPoster']['refused'] = null;
					$this->data['WallPoster']['operation'] = null;
					$this->data['WallPoster']['new_title'] = null;
					$this->data['WallPoster']['new_text'] = null;
					$this->data['WallPoster']['new_valid_from'] = null;
					$this->data['WallPoster']['new_valid_until'] = null;

					// save data
					if ($this->WallPoster->save($this->data['WallPoster']))
					{
					    $this->flash('Oznam bol potvrdený.','/wall_posters/view/'.$this->data['WallPoster']['id']);
					    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
					}
					else{
					  $this->flash('Nepodarilo sa potvrdiť oznam.','/wall_posters/edit/'.$this->data['WallPoster']['id']);
					}
				}
				elseif(isset($_POST['deny_wall_poster'])){
				   // zamietnutie oznamu
               $refusal_text = $this->data['WallPoster']['refusal_text'];
					unset($this->data);
					$this->data['WallPoster']['id'] = $this->WallPoster->id;
               $this->data['WallPoster']['is_refused'] = '1';
               $this->data['WallPoster']['refusal_text'] = $refusal_text;
               $this->data['WallPoster']['refused'] = date("Y-m-d H:i:s");

 					$this->data['WallPoster']['is_changed'] = ($this->original_data['WallPoster']['is_changed'] == 't') ? '1': '0';
 					$this->data['WallPoster']['is_deleted'] = ($this->original_data['WallPoster']['is_deleted'] == 't') ? '1': '0';

					// save data
					if ($this->WallPoster->save($this->data['WallPoster']))
					{
					    $this->flash('Oznam bol zamietnutý.','/wall_posters/view/'.$this->data['WallPoster']['id']);
					    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
					}
					else{
					  $this->flash('Nepodarilo sa zamietnuť oznam.','/wall_posters/edit/'.$this->data['WallPoster']['id']);
					}
				}
				elseif(isset($_POST['disable_deny_wall_poster'])){
				   // vypnutie oznacenia oznamu ako zamietnuteho ...
					unset($this->data);
					$this->data['WallPoster']['id'] = $this->WallPoster->id;
               $this->data['WallPoster']['is_refused'] = '0';
               $this->data['WallPoster']['refusal_text'] = null;
               $this->data['WallPoster']['refused'] = null;

 					$this->data['WallPoster']['is_changed'] = ($this->original_data['WallPoster']['is_changed'] == 't') ? '1': '0';
 					$this->data['WallPoster']['is_deleted'] = ($this->original_data['WallPoster']['is_deleted'] == 't') ? '1': '0';

					// save data
					if ($this->WallPoster->save($this->data['WallPoster']))
					{
					    $this->flash('Oznam už nie je označený za zamietnutý.','/wall_posters/view/'.$this->data['WallPoster']['id']);
					    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
					}
					else{
					  $this->flash('Nepodarilo sa odznačiť zamietnutie oznamu.','/wall_posters/edit/'.$this->data['WallPoster']['id']);
					}
				}
				else{
					$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
					return;
				}
				/* Clearance Admin Send Data from Edit form */
			}
			//elseif(($clearance_show) && ($clearance_write)){
			elseif($clearance_write){
			   if((($this->original_data['WallPoster']['is_deleted'] == 't')) || (($this->original_data['WallPoster']['is_changed'] == 't') && ($this->original_data['WallPoster']['operation'] == 'd'))){
			      //$this->data = '';
			      return;
				}
				if(
					($logged_user_id != $this->original_data['WallPoster']['user_id'])
					||
					(
						(!isset($_POST['edit_wall_poster']))
						&&
						(!isset($_POST['edit_request_accept_wall_poster']))
					)
				){
					$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
					return;
				}

			 	$this->data['WallPoster']['changed'] = date("Y-m-d H:i:s");;
				$this->data['WallPoster']['new_title'] = $this->data['WallPoster']['title'];
				$this->data['WallPoster']['new_text'] = $this->data['WallPoster']['text'];
				$this->data['WallPoster']['new_valid_from'] = $this->data['WallPoster']['valid_from'];
				$this->data['WallPoster']['new_valid_until'] = $this->data['WallPoster']['valid_until'];
				unset($this->data['WallPoster']['title']);
				unset($this->data['WallPoster']['text']);
				unset($this->data['WallPoster']['valid_from']);
				unset($this->data['WallPoster']['valid_until']);

            if(isset($_POST['edit_request_accept_wall_poster'])){
	            $this->data['WallPoster']['is_refused'] = '0';
	            $this->data['WallPoster']['refused'] = null;
	            $this->data['WallPoster']['refusal_text'] = null;
				}
				else
					$this->data['WallPoster']['is_refused'] = ($this->original_data['WallPoster']['is_refused'] == 't') ? '1': '0';

				$this->data['WallPoster']['is_changed'] = ($this->original_data['WallPoster']['is_changed'] == 't') ? '1': '0';
				$this->data['WallPoster']['is_deleted'] = ($this->original_data['WallPoster']['is_deleted'] == 't') ? '1': '0';

				if($this->original_data['WallPoster']['is_changed'] == 't'){
				   if(
						($this->original_data['WallPoster']['operation'] == 'a')
						||
						($this->original_data['WallPoster']['operation'] == 'e')
					){
						;
					}
					else{
						$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
						return;
					}
				}
				else{
					// ide o editaciu normalne zobrazeneho oznamu
					$this->data['WallPoster']['is_changed'] = '1';
					$this->data['WallPoster']['operation'] = 'e';
				}

				// save data
				if ($this->WallPoster->save($this->data))
				{
				    $this->flash('Žiadosť o zmenu Vášho oznamu bola zaznamenaná.','/wall_posters/view/'.$this->data['WallPoster']['id']);
				    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
				}
				else{
				  $this->flash('Nepodarilo sa zaznamenať žiadosť o zmenu Vášho oznamu.','/wall_posters');
				}

			}
			else {
				$this->flash(__("ERROR_ACCESS_DENIED", true),'/wall_posters');
				return;
			}
		} // else prijate udaje
	}

	/**
	 * Odstráni oznam ak má používateľ k tomu práva
	 * Oznamy sa neodstraňujú, označujú sa ako zmazané a zostávajú uchované v systéme
	 * Administrátor vidí oznam odstránený jeho vlastníkom
	 * Odstránený oznam administrátorom nástenky, nevidí úž nikto ...
	 *
	 * @param unknown_type $id
	 * id oznamu, s ktorým sa pracuje
	 */
	function delete($id = null)
	{
		//$this->checkSession();
		$logged_user_id = 0;
// 		$anonymous_id = $this->Login->getAnonymousId();
		if($this->Login->isLogged())
   		$logged_user_id = $this->Login->user_id();
// 		elseif($anonymous_id !== false)
// 			$logged_user_id = $anonymous_id;

		if (empty($this->data))
		{
			$this->data = $this->WallPoster->findById($id);

			if($this->Login->check('WALL_POSTER_ADMIN')){
			   unset($this->data);
			   $this->data['WallPoster']['id'] = $id;
			   $this->data['WallPoster']['is_deleted'] = 't';

		      //echo "zobrazenie cez admin";
				if((isset($_SESSION["options"]["wallPoster_view_admin"])) && ($_SESSION["options"]["wallPoster_view_admin"]))
					// kvoli admin view alebo admin view_old
					$viewold = ((isset($_SESSION["options"]["wallPoster_viewold_admin"])) && ($_SESSION["options"]["wallPoster_viewold_admin"]))?"viewoldlist_admin/":"viewlist_admin/";
				else
					// kvoli tomu, ci sa maju operacie vratit do zoznamu alebo do zoznamu administracie
		         $viewold = ((isset($_SESSION["options"]["wallPoster_viewold"])) && ($_SESSION["options"]["wallPoster_viewold"]))?"viewold/":"";

			   if($this->WallPoster->save($this->data)){
				    $this->flash('Váš oznam bol zmazaný.',"/wall_posters/$viewold");
				    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
				}
				else{
				  $this->flash('Nepodarilo sa zmazať Váš oznam.','/wall_posters/view/'.$this->data['WallPoster']['id']);
				}
			}
			elseif(($logged_user_id == $this->data['WallPoster']['user_id']) && ($this->Login->check('WALL_POSTER_WRITE'))){
			   unset($this->data);
			   $this->data['WallPoster']['id'] = $id;
				$this->data['WallPoster']['is_changed'] = 't';
			   $this->data['WallPoster']['operation'] = 'd';
            $this->data['WallPoster']['changed'] = date("Y-m-d H:i:s");

		      $viewold = ((isset($_SESSION["options"]["wallPoster_viewold"])) && ($_SESSION["options"]["wallPoster_viewold"]))?"viewold/":"";

			   if($this->WallPoster->save($this->data)){
				    $this->flash('Váš oznam bol zmazaný.',"/wall_posters/$viewold");
				    //$this->redirect('/posts/view/'.$this->data['WallPoster']['id']);
				}
				else{
				  $this->flash('Nepodarilo sa zmazať Váš oznam.','/wall_posters/view/'.$this->data['WallPoster']['id']);
				}
			}
			else{
			  $this->flash('Na túto operáciu nemáte právo.','/wall_posters/view/'.$id);
			  return;
			}
		}
	}
	
	function search(){
		// $search_string

		//$this->checkSession();
		$logged_user_id = 0;
// 		$anonymous_id = $this->Login->getAnonymousId();
		if($this->Login->isLogged())
   		$logged_user_id = $this->Login->user_id();
// 		elseif($anonymous_id !== false)
// 			$logged_user_id = $anonymous_id;


		if (!empty($this->data))
		{
			$sql = "";
			if((isset($this->data['WallPoster']['title'])) && (!empty($this->data['WallPoster']['title'])))
				$sql .= "title LIKE '%".$this->data['WallPoster']['title']."%'";

			if((isset($this->data['WallPoster']['text'])) && (!empty($this->data['WallPoster']['text']))){
			   if(!empty($sql)) $sql.= " AND ";
				$sql .= "text LIKE '%".$this->data['WallPoster']['text']."%'";
			}

			if((isset($this->data['WallPoster']['valid_from'])) && (!empty($this->data['WallPoster']['valid_from']))) {
			   if(!empty($sql)) $sql.= " AND ";
				$sql .= "valid_from >= '".$this->data['WallPoster']['valid_from']."'";
			}

			if((isset($this->data['WallPoster']['valid_until'])) && (!empty($this->data['WallPoster']['valid_until']))) {
			   if(!empty($sql)) $sql.= " AND ";
				$sql .= "valid_until <= '".$this->data['WallPoster']['valid_until']."'";
			}

			//echo "SQL: ".$sql."<br />";
			$this->set('posts', $this->WallPoster->findAll($sql, null, 'valid_from asc, created asc'));
		}
	}
}

?>
