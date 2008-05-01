<?php $my->addCrumb(__("ROLES_ADD_ITEM", true)); ?>
<h1>Pridanie novej role</h1>
<form method="post" action="<?php $html->url('/roles/create')?>">
<p>
	<label><?php __("ROLES_NAME"); ?>:</label>
	<!--<?php echo $form->input('Role/name')?>-->
	<!--<?php echo $form->error('Role/name', 'Prosím zadajte meno role!')?>-->
	<input class="left_space" name="data[Role][name]" type="text" value="" id="RoleName" />
</p>
<p>
	<label><?php __("ROLES_DESCRIPTION"); ?>:</label><br />
	<?php echo $form->textarea('Role/description', array('style'=>'width: 100%; border: 1px solid grey; height: 50px;'))?>
	<?php echo $form->error('Role/description', 'Prosím zadajte popis pre rolu!')?>
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
	<td><input type="checkbox" value="<?php echo $c['Clearance']['id']?>" name="clearance[<?php echo $c['Clearance']['id']?>]" /></td>
	<td><?php echo $c['Clearance']['name_'.$lang]?></td>
	<td><?php echo $c['Clearance']['description_'.$lang]?></td>
</tr>
<?php } ?>
</table>

<p>
	<?php echo $form->submit(__("ROLES_CREATE", true)); ?>
</p>
</form>
