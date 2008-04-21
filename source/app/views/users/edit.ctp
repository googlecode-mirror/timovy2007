<?php $my->addCrumb(__("MENU_UPRAVA_POUZIVATELOV", true)); ?>
<h1>Úprava používateľských práv</h1>
<p>
	<a href="<?php echo $html->url('/users')?>">&laquo; naspäť na zoznam</a>
</p>
<p>
	<label>Meno používateľa:</label> <strong><?php echo $user['User']['title'].' '.$user['User']['first_name'].' '.$user['User']['middle_name'].' '.$user['User']['last_name'];?></strong><br />
	<label>Prihlasovacie meno:</label> <strong><?php echo $user['User']['username']?></strong><br />
	<label>E-Mail:</label> <strong><a href="mailto: <?php echo $user['User']['email']?>"><?php echo $user['User']['email']?></a></strong>
</p>


<h2>Priradené práva:</h2>
<?php if (count($user['Role'])>0) { ?>
	<table>
	<?php foreach ($user['Role'] as $role) { ?>
	<tr>
		<td><?php echo $role['name']?></td>
		<td><?php echo $role['description']?></td>
		<td><a href="<?php echo $html->url('/users/removerole/'.$user['User']['id'].'/'.$role['id']);?>">odobrať</a></td>
	</tr>
	<?php } ?>
	</table>
<?php } else { ?>
	<p>
		Používateľ mená pridelené žiade oprávnenia v systéme.
	</p>
<?php } ?>
<?php if (count($roles) > 0) { ?>
<form action="<?php echo $html->url("/users/add_role/".$user['User']['id'])?>" method="post">
<p>
	<select name="role_id">
		<?php foreach ($roles as $r) { ?>
		<option value="<?php echo $r['id']?>"><?php echo $r['name']?> - <?php echo $r['description']?></option>
		<?php } ?>
	</select>
	<button>Priradiť právo</button>
</p>
</form>
<?php } else { ?>
<p>Používateľ má priradené všetky existujúce role!</p>
<?php } ?>

<h2>Špecifické práva pre používateľa:</h2>
<form action="<?php echo $html->url('/users/edit_special')?>" method="post">
<input type="hidden" name="user_id" value="<?php echo $user['User']['id']?>" />
<table class="std_table">
<tr>
	<th>Právo</th>
	<th>Momentálny stav</th>
	<th>Predvolené</th>
	<th>Povoliť</th>
	<th>Zakázať</th>
</tr>
<?php foreach ($clearances as $c) { ?>
<tr >
	<td><?php echo $c['Clearance']['name_'.$lang]?></td>
	<td><?Php echo $c['Clearance']['description_'.$lang]?></td>
	<td><input type="radio" onclick="updatex_status();" class="ctr_default" value="default" name="status[<?php echo $c['Clearance']['id']?>]" <?php if ($c['Clearance']['access']=='default') echo 'checked'?> /> Predvolené</td>
	<td><input type="radio" onclick="updatex_status();" class="ctr_allow" value="allow" name="status[<?php echo $c['Clearance']['id']?>]" <?php if ($c['Clearance']['access']=='allow') echo 'checked'?> /> Áno</td>
	<td><input type="radio" onclick="updatex_status();" class="ctr_deny" value="deny" name="status[<?php echo $c['Clearance']['id']?>]" <?php if ($c['Clearance']['access']=='deny') echo 'checked'?> /> Nie</td>	
</tr>
<?php } ?>
</table>
<p>
	<span style="float: right">
		<input type="submit" name="edit_special" value="Upraviť" />
	</span>
	[ <a href="#" onclick="select_predvolene(); return false;">Označ všetky ako predvolené</a> ]
</p>
</form>
<script type="text/javascript">
	/* funkcia prebehne tabuku a tam kde je default, nastavi sedu farbu pre tr */	
	function updatex_status()
	{
		var in_default = document.getElementsByClassName('ctr_default');
		var in_allow = document.getElementsByClassName('ctr_allow');
		var in_deny = document.getElementsByClassName('ctr_deny');
		
		for (var i=0; i<in_default.length; i++) {
			if (in_default[i].checked) {
				in_default[i].parentNode.parentNode.setStyle({color: 'silver'});
			}
		}
		for (var i=0; i<in_allow.length; i++) {
			if (in_allow[i].checked) {
				in_allow[i].parentNode.parentNode.setStyle({color: 'black'});
			}
		}
		for (var i=0; i<in_deny.length; i++) {
			if (in_deny[i].checked) {
				in_deny[i].parentNode.parentNode.setStyle({color: 'black'});
			}
		}		
	}
	function select_predvolene()
	{
		var in_default = document.getElementsByClassName('ctr_default');
		var in_allow = document.getElementsByClassName('ctr_allow');
		var in_deny = document.getElementsByClassName('ctr_deny');
		
		for (var i=0; i<in_default.length; i++) {
			in_default[i].checked = true;
			in_allow[i].checked = false;
			in_deny[i].checked = false;
		}
		updatex_status();
	}
	
	updatex_status();
</script>

<br />
