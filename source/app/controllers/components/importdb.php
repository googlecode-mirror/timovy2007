<?php
/**
 * @package AATeam
 * @subpackage app.controllers.components
 * @author franto
 */

require_once LIBS.'model'.DS.'model.php';
require_once APP.'app_model.php';
require_once MODELS.'yonban_pouzivatel.php';
require_once MODELS.'yonban_enumeracie.php';
require_once MODELS.'yonban_projekt.php';

require_once(dirname(__FILE__).'/import.php');

class ImportdbComponent extends ImportYonban  
{
	var $controller = true;
	
	/**
	 * @see ImportYonban:users
	 */
	public function users()
	{
		$output = array();
		
		//
		// vrati stlpce z tabulky pouzivatel
		$YPouzivatel = new YonbanPouzivatel();
		$users = $YPouzivatel->findAll(null, array('osobne_cislo', 'meno', 'priezvisko', 'titul_pred', 'titul_za', 'login', 'heslo', 'email'));
		if ($users === false) {
			return false;
		}
		
		foreach ($users as $user) {
			
			$user = $user['YonbanPouzivatel'];
			
			//
			// middle name
			$middle_name 	= '';
			$last_name 		= $user['priezvisko'];
			
			$parts = explode(' ', $user['priezvisko']);
			if (count($parts) > 1) {
				$middle_name 	= array_shift($parts);
				$last_name 		= implode(' ', $parts);
			}
			
			$row = array
			(
				'personal_number'	=> $user['osobne_cislo'],
				'username'			=> $user['login'],
				'password'			=> '--secred--', // $user['heslo'],
				'title'				=> '',
				'first_name'		=> $user['meno'],
				'middle_name'		=> $middle_name,
				'last_name'			=> $last_name,
				'email'				=> 'secred@franto.sk' //$user['email']
			);
			$output[] = $row;
		}
		
		return $output;
	}
	
	/**
	 * @see ImportYonban::studies()
	 */
	public function studies()
	{
		$output = array();
		
		//
		// ziskaj to z tabulky enumeracie pod polickom 7 [ dufam ze je to tam napevno ]
		$YEnumeracie = new YonbanEnumeracie();
		$studies = $YEnumeracie->findAll(array('enum_id'=>7));
		if ($studies === false) {
			return false;
		}
		
		foreach ($studies as $study) {
			$output[] = array
			(
				'id'	=> $study['YonbanEnumeracie']['poradove_cislo'],
				'name'	=> $study['YonbanEnumeracie']['hodnota']
			);
		}
		return $output;
	}
	
	
	public function projects($user)
	{
		//
		// ziskaj zoznam z databazy
		uses('sanitize');
		$sanit = new Sanitize();
		$YProjekt = new YonbanProjekt();
		$projects = $YProjekt->query("
			SELECT 
				Projekt.id as Projekt__id,
				Projekt.nazov as Projekt__nazov,
				Projekt.nazov_en as Projekt__nazov_en,
				Projekt.zameranie as Projekt__zameranie,
				TypProjektu.skratka as TypProjektu__skratka,
				Lector.osobne_cislo as Lector__osobne_cislo,
				PedagLector.osobne_cislo as PedagLector__osobne_cislo,
				Projekt.rieseny_v_roku as Projekt__rieseny_v_roku,
				Zadanie.id as Zadanie__id
			FROM Projekt as Projekt 
				JOIN typ_projektu as TypProjektu ON Projekt.id_typ_projektu=TypProjektu.id
				JOIN pouzivatel as Pouzivatel ON pouzivatel.id=Projekt.id_riesitel
				LEFT JOIN pouzivatel as Lector ON Lector.id=Projekt.id_veduci
				LEFT JOIN pouzivatel as PedagLector ON PedagLector.id=Projekt.id_pedagog_veduci
				LEFT JOIN zadanie as Zadanie on Zadanie.id_projekt=Projekt.id
			WHERE 
				Pouzivatel.osobne_cislo='".$sanit->sql($user)."'
		");
		
		
		//
		// preparsuj to na korektny vystup
		$output = array();
		foreach ($projects as $p) {
			
			$row = array
			(
				'type'				=> $p['typprojektu']['skratka'],
				'student'			=> $user,
				'academic'			=> $p['lector']['osobne_cislo'],
				'master_academic'	=> $p['pedaglector']['osobne_cislo'],
				'specialization'	=> $p['projekt']['zameranie'],
				'name'				=> $p['projekt']['nazov'],
				'name_en'			=> $p['projekt']['nazov_en'],
				'description'		=> '',
				'description_en'	=> '',
				'study_year'		=> $p['projekt']['rieseny_v_roku']
			);
			
			//
			// ziskaj znenie zadania
			$des = $YProjekt->query("
				SELECT 
					hodnota as zadanie__hodnota
				FROM pl_zadania
				WHERE 
					id_pl_sablony_zadania=1 AND
					pl_zadania.id_zadanie=".(int)$p['zadanie']['id']."
			");
			
			//
			// ak sa naslo
			if (count($des) == 1) {
				$row['description'] = $des[0]['zadanie']['hodnota'];
				$row['description_en'] = $des[0]['zadanie']['hodnota'];
			}
			
			$output[] = $row;
		}
		return $output;
	}
}
?>
