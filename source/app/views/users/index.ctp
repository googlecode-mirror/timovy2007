<?php $my->addCrumb(__("MENU_SPRAVA_POUZIVATELOF", true)); ?>

<h1><?php echo __("MENU_SPRAVA_POUZIVATELOF")?></h1>

<form action="<?php echo $html->url('/users/search/')?>" method="post" style="text-align: right;">
	<input type="text" name="name" value="<?=$name?>"/>
	<input type="submit" name="xxx" value="Hľadaj" />
</form>
<h2 style="margin-top: 0">Zoznam používateľov</h2>
<table class="std_table">
<tr>
	<th>Meno-Login</th>
	<th>Používateľské meno</th>
	<th>Prístupové práva</th>
	<th>Akcie</th>
</tr>
<?php foreach ($users as $user) { ?>
<tr>
	<td><?php echo $user['User']['username']?></td>
	<td><?php echo $user['User']['title'] .' '. $user['User']['first_name'] .' '. $user['User']['middle_name'] .' '. $user['User']['last_name']?></td>	
	<td>
		<?php $roles = array(); foreach ($user['Role'] as $r) { $roles[] = $r['name']; } echo count($roles)>0 ? implode(', ',$roles) : '-'?>
	</td>
	<td>
		<a href="<?=$html->url('/users/edit/'.$user['User']['id'])?>">upraviť</a>,
		<a href="<?=$html->url('/users/password/'.$user['User']['id'])?>">zmeniť heslo</a>
	</td>
</tr>
<?php } ?>
</table>
<p>
	<span style="float: right">
		<?php echo $paginator->next()?>
	</span>
	<span style="float: left">
		<?php echo $paginator->prev()?>
	</span>
</p>
<br />