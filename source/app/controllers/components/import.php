<?php
/**
 * Rodicovska trieda pre import ...
 * 
 */
abstract class ImportYonban extends Object 
{
	/**
	 * Vrati zoznam pouzivatelov
	 * 
	 * zaznam je vo formate:
	 * array
	 * (
	 * 		'username'
	 * 		'password'
	 * 		'title'
	 * 		'first_name'
	 * 		'middle_name'
	 * 		'last_name'
	 * 		'personal_number'
	 * 		'email'
	 * );
	 * 
	 * @return array of records
	 */
	abstract function users();
	
	/**
	 * Vrati zoznam studijnych odborov
	 * 
	 * kazda polozka je vo formate:
	 * array
	 * (
	 * 		'id'
	 * 		'name'
	 * );
	 *
	 * @return array of records
	 */
	abstract function studies();
	
	/**
	 * Vrati zoznam projektov konkretneho pouzivatela (osobne cislo)
	 * 
	 * kazda polozka je vo formate:
	 * array
	 * (
	 * 		'type',				// BP,TP,DB
	 * 		'student',			// osobne_cislo
	 * 		'lector',			// osobne_cislo
	 * 		'master_lector',	// osobne_cislo
	 * 		'specialization',	// ID specializacie
	 * 		'name',				// nazov
	 * 		'name_en',			// nazov_english
	 * 		'description',		// popis
	 * 		'description_en',	// popis
	 * 		'study_year'		// skolsky rok vo formate xxxx/xxxx
	 * );
	 *
	 * @return array of records
	 */
	abstract function projects($user);
}
?>