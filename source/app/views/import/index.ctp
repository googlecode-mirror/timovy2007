<?php $my->addCrumb(__("MENU_IMPORT", true)); ?>
<h1><?php __("IMPORT_MAIN_TITLE");?></h1>
<p>
	<?php __("IMPORT_MAIN_TEXT");?>
</p>

<!--
<form action="<?php echo $html->url("/import/soap")?>" method="POST">
<h2><?php __("IMPORT_SOAP_TITLE");?></h2>
<p>
	<?php __("IMPORT_SOAP_TEXT");?>
	<?php echo $form->submit(__("IMPORT_SOAP", true), array('name'=>'value_test_soap'));?>
</p>
</form>
-->


<form action="<?php echo $html->url("/import/db")?>" method="POST">
<h2><?php __("IMPORT_DB_TITLE");?></h2>
<p>
	<?php __("IMPORT_DB_TEXT");?>
	<?php echo $form->submit(__("IMPORT_DB", true), array('name'=>'value_test_db'));?>
</p>
</form>

