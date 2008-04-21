<?php $my->addCrumb("Pridanie novej role"); ?>
<h1>Pridanie novej role</h1>
<form method="post" action="<?php $html->url('/roles/create')?>">
<p>
	<label>Názov role:</label>
	<?php echo $html->input('Role/name')?>
	<?php echo $html->tagErrorMsg('Role/name', 'Prosím zadajte meno role!')?>
</p>
<p>
	<label>Popis role:</label><br />
	<?php echo $html->textarea('Role/description', array('style'=>'width: 100%; border: 1px solid grey; height: 50px;'))?>
	<?php echo $html->tagErrorMsg('Role/description', 'Prosím zadajte popis pre rolu!')?>
</p>

<p style="margin-bottom: 0; padding-bottom: 0;">
	<label>Oprávnenia:</label>
</p>
<table class="std_table">
<tr>
	<th>#</th>
	<th>Názov</th>
	<th>Popis</th>
</tr>
<?php foreach ($clearances as $c) { ?>
<tr>
	<td><input type="checkbox" value="<?php echo $c['Clearance']['id']?>" name="clearance[<?php echo $c['Clearance']['id']?>]" /></td>
	<td><?php echo $c['Clearance']['name_'.$lang]?></td>
	<td><?php echo $c['Clearance']['description_'.$lang]?></td>
</tr>
<?php } ?>
</table>

<p>
	<?php echo $form->submit('Vytvoriť')?>
</p>
</form>
