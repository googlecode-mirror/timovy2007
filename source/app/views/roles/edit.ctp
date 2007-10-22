<?php $my->addCrumb(__("Edit role", true)); ?>
<h1><?php __("Edit role")?></h1>



<form method="post" action="<?php $html->url('/roles/edit/'.$role_id)?>">
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
	<td><input type="checkbox" value="<?php echo $c['Clearance']['id']?>" <?php if (in_array($c['Clearance']['id'], $clearance_ids)) { echo 'checked'; }?> name="data[Clearance][Clearance][]" /></td>
	<td><?php echo $c['Clearance']['name']?></td>
	<td><?php echo $c['Clearance']['description']?></td>
</tr>
<?php } ?>
</table>

<p>
	<input type="submit" value="Upraviť" />	<a class="btn" href="<?php echo $html->url('/roles/')?>">&lt;&lt; Späť na zoznam</a>
</p>
</form>
