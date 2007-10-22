<?php $my->addCrumb(__("MENU_SPRAVA_PRAV", true)); ?>
<h1><?php __("MENU_SPRAVA_PRAV")?></h1>

<h2>Zoznam všetkých vytvorených prístupových rolí:</h2>
<table class="std_table">
<tr>
	<th>Názov</th>
	<th>Popis</th>
	<th>Akcie</th>
</tr>
<?php foreach ($roles as $role) { ?>
<tr>
	<td><?php echo $role['Role']['name']?></td>
	<td><?php echo $role['Role']['description']?></td>
	<td>
		<a href="<?php echo $html->url('/roles/delete/'.$role['Role']['id'])?>">Vymazať</a>, 
		<a href="<?php echo $html->url('/roles/edit/'.$role['Role']['id'])?>">Upraviť</a>
	</td>
</tr>
<?php } ?>
</table>
<p>
	<a class="btn" href="<?php echo $html->url('/roles/create')?>">Vytvoriť novú rolu</a>
</p>