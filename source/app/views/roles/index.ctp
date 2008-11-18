<?php $my->addCrumb(__("ROLES_MANAGEMENT", true)); ?>
<h1><?php __("ROLES_MANAGEMENT"); ?></h1>

<h2><?php __("ROLES_LIST"); ?></h2>
<table class="std_table">
<tr>
	<th><?php __("ROLES_NAME"); ?></th>
	<th><?php __("ROLES_DESCRIPTION"); ?></th>
	<th><?php __("ROLES_ACTIONS"); ?></th>
</tr>
<?php foreach ($roles as $role) { ?>
<tr>
	<td><?php echo $role['Role']['name']?></td>
	<td><?php echo $role['Role']['description']?></td>
	<td>
		<a href="<?php echo $html->url('/roles/delete/'.$role['Role']['id'])?>"><?php __("ROLES_DELETE"); ?></a>, 
		<a href="<?php echo $html->url('/roles/edit/'.$role['Role']['id'])?>"><?php __("ROLES_EDIT"); ?></a>
	</td>
</tr>
<?php } ?>
</table>
<p>
	<a class="btn" href="<?php echo $html->url('/roles/create')?>"><?php __("ROLES_CREATE"); ?></a>
</p>