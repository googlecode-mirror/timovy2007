<?php $my->addCrumb(__("MENU_MAIL_COMPOSE", true)); ?>
<h1><?php __('MENU_MAIL_COMPOSE')?></h1>

<form method="post" action="<?php $html->url('/mails/compose')?>">
	<table id="mailsend">
		<tr>
			<td class="mailsendlabel"><?php __("MAIL_COMPOSE_ADDRESS")?>:</td>
			<td>
				<textarea name="address" id="address" rows="3" style="width: 60%"><?php echo $address;?></textarea>
				<br />
				<a href="#" onclick="show_search_users(); return false;"><?php __('MAIL_COMPOSE_SEARCH_USERS')?></a> | 
				<a href="#" onclick="show_search_groups(); return false;"><?php __('MAIL_COMPOSE_SEARCH_GROUPS')?></a> 
				
				-
				
				<?php __('MAIL_COMPOSE_ADDRESS_INFO'); ?>
			</td>
		</tr>
		<tr>
			<td class="mailsendlabel"><?php __("MAIL_COMPOSE_NAME")?>:</td>
			<td>
				<input type="text" name="subject" value="<?php echo $subject;?>" style="width: 100%;"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="body" style="width: 100%; height: 20em;"><?php echo $body;?></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<?php echo $form->submit(__('MAIL_COMPOSE_SUBMIT', true))?>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">

	var win = null;
	var wing = null;
	/**
	 * Zobrazi dialog pre hladanie pouzivatelov
	 */
	function show_search_users()
	{
		// vytvori nove okno
		if (win == null) {
			win = new Window({className: "alphacube", resizable: false, width: 300, height:410}); 	
			win.setTitle("<?php __('MAIL_COMPOSE_SEARCH_USERS_TITLE')?>");
			$('sarch_users_results').innerHTML = "";
			win.setContent('mail_search_users', false, false) 
		}
		
		
		// vynuluj checkboxy
		var frminp = $$('.userfound');
		for (var i=0; i<frminp.length; i++) {
			var addr = frminp[i];
			addr.checked = false;
		}
		
		win.showCenter(); 
	}
	
	function show_search_groups()
	{
		// vytvori nove okno
		if (wing == null) {
			wing = new Window({className: "alphacube", resizable: false, width: 300, height:410}); 	
			wing.setTitle("<?php __('MAIL_COMPOSE_SEARCH_GROUPS_TITLE')?>");
			new Ajax.Updater('seach_groups_results', '<?php echo $html->url('/mails/ajax_search_groups')?>');
			$('seach_groups_results').innerHTML = "";
			wing.setContent('mail_search_groups', false, false) 
		}
		wing.showCenter(); 
	}
	
	function search_users_add()
	{
		var frminp = $$('.userfound');
		var najdene = new Array();
		
		// najdem len tie co su checked
		for (var i=0; i<frminp.length; i++) {
			
			var addr = frminp[i];
			if (addr.checked) {
				najdene.push(addr.value);
			}
		}

		// pridam ich do vysledneho pola
		for (var i=0; i<najdene.length; i++) {
			if ($F('address') == '') {
				$('address').value = najdene[i];
			} else {
				$('address').value += ', '+"\n"+najdene[i];
			}
		}
			
		// zavrie vsetky okna
		Windows.closeAll();
	}
	
	function search_groups_add()
	{
		var frminp = $$('.groupfound');
		var najdene = new Array();
		
		// najdem len tie co su checked
		for (var i=0; i<frminp.length; i++) {
			
			var addr = frminp[i];
			if (addr.checked) {
				najdene.push(addr.value);
			}
		}

		// pridam ich do vysledneho pola
		for (var i=0; i<najdene.length; i++) {
			if ($F('address') == '') {
				$('address').value = najdene[i];
			} else {
				$('address').value += ', '+"\n"+najdene[i];
			}
		}
			
		// zavrie vsetky okna
		Windows.closeAll();
	}
</script>



<div id="mail_search_users" style="display: none; text-align: left;">
	<div  style="padding: 0 10px 5px 10px; text-align: left;">
	<h2><?php __('MAIL_COMPOSE_SEARCH_USERS_LABEL')?></h2>
	<?php echo $ajax->form('/mails/ajax_search_users', 'post', array('update'=>'sarch_users_results', 'before'=>"$('sarch_users_results').innerHTML = \"".__('MAIL_COMPOSE_SEARCH_LOADING', true)."\""))?>
	<p>
		<input type="text" name="username" value="" style="width: 98%; padding: 2px;" /><br />
		<input type="submit" value="<?php __('MAIL_COMPOSE_SEARCH_USER_SUBMIT')?>" />
	</p>
	</form>
	
	
	<div>
		<div id="sarch_users_results" style="height: 290px; border: 1px solid silver; overflow: auto"></div>
		<input type="reset" onclick="search_users_add(); return false;" value="<?php __('MAIL_COMPOSE_SEARCH_USER_ADD')?>" />
	</div>
	</div>
</div>


<div id="mail_search_groups" style="display: none; text-align: left">
	<div  style="padding: 0 10px 5px 10px; text-align: left;">
		<h2><?php __('MAIL_COMPOSE_SEARCH_GROUPS_LABEL')?></h2>
		<div id="seach_groups_results" style="height: 310px; border: 1px solid silver; overflow: auto"></div>
		
		<input type="reset" onclick="search_groups_add(); return false;" value="<?php __('MAIL_COMPOSE_SEARCH_GROUP_ADD')?>" />
		<p>	
			<small>
				<?php __('MAIL_COMPOSE_SEARCH_GROUPS_INFO')?>
			</small>	
		</p>
	</div>	
</div>