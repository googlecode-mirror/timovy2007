<?php $my->addCrumb(__("MENU_SPRAVA_POUZIVATELOV", true)); ?>

<h1><?php echo __("MENU_SPRAVA_POUZIVATELOV")?></h1>

<form action="<?php echo $html->url('/users/search/')?>" method="post" style="text-align: right;">
	<input type="text" name="name" value="<?=$name?>"/>
	<input type="submit" name="xxx" value="<?php __("USERS_SEARCH");?>" />
</form>

<?php echo $html->link(__("USER_ADD_NEW", true), "/users/add"); ?>

<h2 style="margin-top: 0"><?php __("USERS_LIST");?></h2>
<table class="std_table">
<tr>
	<th><?php __("USERS_LOGIN");?></th>
	<th><?php __("USERS_NAME");?></th>
	<th><?php __("USERS_RIGHTS");?></th>
	<th><?php __("USERS_ACTIONS");?></th>
</tr>
<?php foreach ($users as $user) { ?>
<tr>
	<td><?php echo $user['User']['username']?></td>
	<td><?php echo $user['User']['title'] .' '. $user['User']['first_name'] .' '. $user['User']['middle_name'] .' '. $user['User']['last_name']?></td>	
	<td>
		<?php $roles = array(); foreach ($user['Role'] as $r) { $roles[] = $r['name']; } echo count($roles)>0 ? implode(', ',$roles) : '-'?>
	</td>
	<td>
		<a href="<?=$html->url('/users/edit/'.$user['User']['id'])?>"><?php __("USERS_EDIT");?></a>,
		<a href="<?=$html->url('/users/password/'.$user['User']['id'])?>"><?php __("USERS_CHANGE_PASSWORD");?></a>
		<! --<?php echo $html->link(	__("USERS_DELETE",true), "/users/delete/{$user['User']['id']}", null, __("USERS_ARE_YOU_SURE_DELETE",true))?>-->
	</td>
</tr>
<?php } ?>
</table>
<p>
	<span style="float: right">
		<?php echo $paginator->next(__("USERS_NEXT", true)." >>")?>
	</span>
	<span style="float: left">
		<?php echo $paginator->prev("<< ".__("USERS_PREVIOUS", true))?>
	</span>
</p>
<br />