<?php $my->addCrumb(__("ROLES_EDIT_ITEM", true)); ?>
<h1><?php __("ROLES_EDIT_ITEM"); ?></h1>
<form method="post" action="<?php $html->url('/roles/edit/'.$role_id)?>">
<p>
	<label><?php __("ROLES_NAME"); ?>:</label>
	<!--<?php echo $form->input('Role.name')?>-->
	<!--<?php echo $form->error('Role.name', 'Prosím zadajte meno role!')?>-->
	<input class="left_space" name="data[Role][name]" type="text" value="" id="RoleName" />
</p>
<p>
	<label><?php __("ROLES_DESCRIPTION"); ?>:</label><br />
	<?php echo $form->textarea('Role.description', array('style'=>'width: 510px; border: 1px solid grey; height: 50px;'))?>
	<?php echo $form->error('Role.description', 'Prosím zadajte popis pre rolu!')?>
</p>

<p style="margin-bottom: 0; padding-bottom: 0;">
	<label><?php __("ROLES_CLEARANCES"); ?>:</label>
</p>
<table class="std_table">
<tr>
	<th>#</th>
	<th><?php __("ROLES_NAME"); ?></th>
	<th><?php __("ROLES_DESCRIPTION"); ?></th>
</tr>
<?php foreach ($clearances as $c) { ?>
<tr>
	<td><input type="checkbox" value="<?php echo $c['Clearance']['id']?>" <?php if (in_array($c['Clearance']['id'], $clearance_ids)) { echo 'checked'; }?> name="data[Clearance][Clearance][]" /></td>
	<td><?php echo $c['Clearance']['name_'.$lang]?></td>
	<td><?php echo $c['Clearance']['description_'.$lang]?></td>
</tr>
<?php } ?>
</table>

<p>
	<input type="submit" value="<?php __("ROLES_SAVE"); ?>" />	<a class="btn" href="<?php echo $html->url('/roles/')?>">&lt;&lt; <?php __("ROLES_BACK_TO_LIST"); ?></a>
</p>
</form>
