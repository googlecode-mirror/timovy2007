<script type="text/javascript">
	/** 
	 * Update language 
	 */
	function updateLang() {
		// skryjem vsetky
  		$$('.langitem').each(function (item) {
  			item.style.display = 'none';
  		});
  		// zobrazim vybrane
  		$$('.lang_'+$F('langChange')).each(function (item) {
  			item.style.display = 'block';
  		});
	}
	Event.observe(window, 'load', function() {
  		Event.observe('langChange', 'change', function() {
			updateLang();  			
  		});
  		updateLang();
	});
</script>


<?php $my->addCrumb(__("MENU_ALUMNI_MYPROFILE", true)); ?>
<h1><?php echo __("MENU_ALUMNI_MYPROFILE")?></h1>

<h2 class="alumni_profile">
<span style="float: right; font-size: small; color: black;">[ <a href="<?php echo $html->url('/alumni/profile/'.$user['User']['username'])?>"><?php __('View my profile')?></a> ]</span>
<?php __('ALUMNI_PROFILE_CHANGEINFO_TITLE')?>


</h2>
<form class="alumni_myprofile" action="<?php echo $html->url('/alumni/myprofile')?>" method="post">
<p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_EMAIL')?>:</label><input type="checkbox" name="publish_email" value="1" <?php echo ($user['User']['publish_email']==1) ? 'checked' : '';?> />
		<?php __("ALUMNI_MY_PROFILI_PUBLISH_EMAIL")?>
		<br />	
	<label>&nbsp;</label> <?php echo $form->text('User/email')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_ADDRESS')?>:</label> <?php echo $form->textarea('User/address', array('style'=>'width: 350px;', 'cols'=>100, 'rows'=>3))?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_PHONE')?>:</label> <?php echo $form->text('User/phone')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_ICQ')?>:</label> <?php echo $form->text('User/icq')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_OCCUPATION')?>:</label> <?php echo $form->textarea('User/occupation', array('style'=>'width: 350px;', 'cols'=>100, 'rows'=>3))?><br />
	
</p><br />
<div class="myprofile">
	<h3>
		<span style="float: right">
			<select id="langChange">
				<option value="sk">__Slovensky</option>
				<option value="en">__Anglicky</option>
			</select>
		</span>
		<?php __('ALUMNI_MY_PROFILE_PROFESSION')?>:
	</h3> 

	<!-- Profesie v databaze -->
	<?php foreach ($user_professions as $k=>$p): ?>
		<div class="profession">
			__POZICIA: <select name="profession_id[]">
				<?php foreach ($professions as $key => $value): ?>
				<option value="<?=$key?>" <?php if($key==$p['UserProfession']['profession_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
				<?php endforeach; ?>
			</select><br />
			__OD_ROKU:<input name="year_from[]" type="text" value="<?php echo $p['UserProfession']['year_from']; ?>" />
			__DO_ROKU:<input name="year_to[]" type="text" value="<?php echo $p['UserProfession']['year_from']; ?>" />
			<br />
			<div class="langitem lang_en">
				__POPIS_EN:<textarea name="description_en[]" rows="3" cols="20"><?php echo $p['UserProfession']['description_en']; ?></textarea>
			</div>
			<div class="langitem lang_sk">
				__POPIS_SK:<textarea name="description_sk[]" rows="3" cols="20"><?php echo $p['UserProfession']['description_sk']; ?></textarea>
			</div>
			<input type="hidden" name="user_profession_id[]" value="<?php echo $p['UserProfession']['id']; ?>" />			
			<input type="button" value="Zmazať" onclick="this.parentNode.parentNode.removeChild(this.parentNode);"/>
		</div>
	<?php endforeach; ?>
	<div id="append_profesion_div"></div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="pridat" onclick="cloneAppend('default_proffesion_form','append_profesion_div');" />
</div>


<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEINFO_SUBMIT')?>" />
	
</p>
</form>


<!-- skryty form pre pridavanie -->
<div class="profession" style="display:none;" id="default_proffesion_form">
	__POZICIA: <select name="profession_id[]">
		<?php foreach ($professions as $key => $value): ?>
		<option value="<?=$key?>"><?=$value?></option>
		<?php endforeach; ?>
	</select><br />
	__OD_ROKU:<input name="year_from[]" type="text" value="" />
	__DO_ROKU:<input name="year_to[]" type="text" value="" />
	<br />
	<div class="langitem lang_en">
		__POPIS_EN:<textarea  name="description_en[]" rows="3" cols="10"></textarea>
	</div>
	<div class="langitem lang_sk">
		__POPIS_SK:<textarea  name="description_sk[]" rows="3" cols="10"></textarea>
	</div>			
	<input type="button" value="Zmazať" onclick="this.parentNode.parentNode.removeChild(this.parentNode);"/>
</div>

