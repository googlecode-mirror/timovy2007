<?php $my->addCrumb(__("MENU_IMPORT", true)); ?>
<h1><?php echo __("MENU_IMPORT")?></h1>
<p>
	Importovanie údajov zo systému YonBan.
</p>


<form action="<?php echo $html->url("/import/soap")?>" method="POST">
<h2>Importovať údaje pomocou webservice</h2>
<p>
	Systém na spojenie využije externé rozhranie SOAP systému yonban. Toto je preferovaný spôsob importu.
	<?php echo $form->submit('Importovať cez SOAP', array('name'=>'value_test_soap'));?>
</p>
</form>


<form action="<?php echo $html->url("/import/db")?>" method="POST">
<h2>Importovať údaje priamo z databázy:</h2>
<p>
	Systém sa napojí priamo na databázu systému YonBan.
	<?php echo $form->submit('Importovať z databázy', array('name'=>'value_test_db'));?>
</p>
</form>

