<?php
/**
 * @package AATeam
 * @subpackage app.controllers.components
 * @author franto
 */

require_once LIBS.'model'.DS.'model.php';
require_once APP.'app_model.php';
require_once MODELS.'ais_projekt.php';

class ImportdbComponent  
{
	var $controller = true;

	
	/**
	 * @see ImportYonban::specializations()
	 */
	public function specializations()
	{
		$output = array();
		$AisProjekt = new AisProjekt();
		$projects = $AisProjekt->query("SELECT DISTINCT(PROGRAM) AS program FROM PRENOS.STUDIA_FIIT");
		foreach ($projects as $p) {
		  $p = current($p);
			$output[] = $p['program'];
    }		
		return $output;
	}
	
	/**
	 * @see ImportYonban::studies()
	 */
	public function studies($max_id)
	{
		$output = array();
		$AisProjekt = new AisProjekt();
		$studies = $AisProjekt->query("SELECT  
    PRENOS.STUDIA_FIIT.id AS ais_studia_id, PRENOS.UZIVATEL.id AS personal_number, PRENOS.STUDIA_FIIT.program AS program, PRENOS.STUDIA_FIIT.koniec_studia AS koniec_studia, PRENOS.UZIVATEL.tituly_pred AS tituly_pred, PRENOS.UZIVATEL.tituly_za AS tituly_za, PRENOS.UZIVATEL.meno AS meno, PRENOS.UZIVATEL.priezvisko AS priezvisko  
    FROM PRENOS.STUDIA_FIIT LEFT JOIN PRENOS.UZIVATEL ON PRENOS.STUDIA_FIIT.UZIVATEL=PRENOS.UZIVATEL.ID 
    WHERE PRENOS.STUDIA_FIIT.DOVOD_UKONCENIA=1 AND PRENOS.STUDIA_FIIT.ID>".$max_id."  ORDER BY PRENOS.STUDIA_FIIT.ID");
		foreach ($studies as $p) {
			$output[] = current($p);
    }
		return $output;
	}	
	
	public function projects($user)
	{

		$output = array();
		$AisProjekt = new AisProjekt();
		$projects = $AisProjekt->query("SELECT * FROM PRENOS.PUBLIKACIE_ALL LEFT JOIN PRENOS.PUBLIKACIE_ALL_AUTORI ON PRENOS.PUBLIKACIE_ALL.ID=PRENOS.PUBLIKACIE_ALL_AUTORI.PUBLIKACIA  WHERE PRENOS.PUBLIKACIE_ALL.DRUH=41 AND PRENOS.PUBLIKACIE_ALL_AUTORI.AUTOR_AIS IS NOT NULL");
		/*
		$studies = $AisProjekt->query("SELECT  
    PRENOS.STUDIA_FIIT.id AS ais_studia_id, PRENOS.UZIVATEL.id AS personal_number, PRENOS.STUDIA_FIIT.program AS program, PRENOS.STUDIA_FIIT.koniec_studia AS koniec_studia, PRENOS.UZIVATEL.tituly_pred AS tituly_pred, PRENOS.UZIVATEL.tituly_za AS tituly_za, PRENOS.UZIVATEL.meno AS meno, PRENOS.UZIVATEL.priezvisko AS priezvisko  
    FROM PRENOS.STUDIA_FIIT LEFT JOIN PRENOS.UZIVATEL ON PRENOS.STUDIA_FIIT.UZIVATEL=PRENOS.UZIVATEL.ID 
    WHERE PRENOS.STUDIA_FIIT.DOVOD_UKONCENIA=1 AND PRENOS.STUDIA_FIIT.ID>".$max_id." AND PRENOS.STUDIA_FIIT.ID<10 ORDER BY PRENOS.STUDIA_FIIT.ID");
    */
		foreach ($projects as $p) {
			$output[] = current($p);
    }
		return $output;
	}
}
?>
