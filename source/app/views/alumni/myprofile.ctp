<script type="text/javascript">


  function changecss(theClass,element,value) {  
    var cssRules;
    if (document.all) {
      cssRules = 'rules';
    }
    else if (document.getElementById) {
      cssRules = 'cssRules';
    }
    for (var S = 0; S < document.styleSheets.length; S++){
      for (var R = 0; R < document.styleSheets[S][cssRules].length; R++) {
        if (document.styleSheets[S][cssRules][R].selectorText == theClass) {
            document.styleSheets[S][cssRules][R].style[element] = value;
        }
      }
    }
  }

	function updateLang() {
	 if($F('langChange')=='sk') {
      changecss('.lang_en', 'display', 'none');
      changecss('.lang_sk', 'display', 'block');
   }
   else {
      changecss('.lang_sk', 'display', 'none');
      changecss('.lang_en', 'display', 'block');   
   }
	}

	/** 
	 * Update language 
	 * old long time on more lang items	 
	 *
	function updateLang() {
		// skryjem vsetky
  		$$('.langitem').each(function (item) {
  			item.style.display = 'none';
  		});
  		// zobrazim vybrane
  		$$('.lang_'+$F('langChange')).each(function (item) {
  			item.style.display = 'block';
  		});
	}*/
	
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
</p><br />
<!--
<p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_OCCUPATION')?>:</label> <?php echo $form->textarea('User/occupation', array('style'=>'width: 350px;', 'cols'=>100, 'rows'=>3))?><br />
</p><br />
-->

<p class="myprofile">
    <?php __('VYBER_VSTUPNEHO_JAZYKA_PRE_PROFESIE_JAZYKY_OSTATNE')?>:
	<span style="float: right;">
		<select id="langChange">
			<option <?=($lang=='sk' ? 'selected="selected"': '');?> value="sk">__Slovensky</option>
			<option <?=($lang=='en' ? 'selected="selected"': '');?> value="en">__Anglicky</option>
		</select>
	</span>
</p><br />

<div class="myprofile">
	<h3>
		<?php __('ALUMNI_MY_PROFILE_PROFESSION')?>:
	</h3> 
	<!-- Profesie v databaze -->
	 <?php foreach ($user_professions as $k=>$p): ?>	
		<div class="profession">
			<label>__POZICIA:</label><select name="profession_id[]">
				<?php foreach ($professions as $key => $value): ?>
				<option value="<?=$key?>" <?php if($key==$p['UserProfession']['profession_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
				<?php endforeach; ?>
			</select><br />
			<label>__OD_ROKU:</label><input name="year_from[]" type="text" value="<?php echo $p['UserProfession']['year_from']; ?>" />
			__DO_ROKU:<input name="year_to[]" type="text" value="<?php echo $p['UserProfession']['year_from']; ?>" />
			<br />
			<div class="lang_en">
				<label>__POPIS_EN:</label><textarea name="description_en[]" rows="3" cols="100" style="width: 350px;"><?php echo $p['UserProfession']['description_en']; ?></textarea>
			</div>
			<div class="lang_sk">
				<label>__POPIS_SK:</label><textarea name="description_sk[]" rows="3" cols="100" style="width: 350px;"><?php echo $p['UserProfession']['description_sk']; ?></textarea>
			</div>
			<input type="hidden" name="user_profession_id[]" value="<?php echo $p['UserProfession']['id']; ?>" />			
			<input type="button" value="__ZMAZAT" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" />
		</div>	
	<?php endforeach; ?>
	
	<div id="append_profesion_div"></div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="__PRIDAT_DALSIE_ZAMESTNANIE" onclick="cloneAppend('default_proffesion_form','append_profesion_div');" />
	<br /><br />
</div>
<br />

<div class="myprofile">
	<h3>
		<?php __('ALUMNI_MY_PROFILE_LANGUAGES')?>:
	</h3> 
	<!-- Profesie v databaze -->
	 <?php foreach ($user_languages as $k=>$p): ?>	
		<div class="profession">
			<label>__JAZYK:</label>
      <select name="language_id[]">
				<?php foreach ($languages as $key => $value): ?>
				<option value="<?=$key?>" <?php if($key==$p['UserLanguage']['language_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
				<?php endforeach; ?>
			</select>
      <select name="level_id[]">
				<?php foreach ($levels as $key => $value): ?>
				<option value="<?=$key?>" <?php if($key==$p['UserLanguage']['level_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
				<?php endforeach; ?>
			</select>			
			<input type="hidden" name="user_language_id[]" value="<?php echo $p['UserLanguage']['id']; ?>" />			
			<input type="button" value="__ZMAZAT" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" />
		</div>	
	<?php endforeach; ?>
	
	<div id="append_language_div"></div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="__PRIDAT_DALSI_JAZYK" onclick="cloneAppend('default_language_form','append_language_div');" />
	<br /><br />
</div>

<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEINFO_SUBMIT')?>" />
	
</p>
</form>


<!-- skryty form pre pridavanie profesii -->
<div class="profession" style="display:none;" id="default_proffesion_form">
	__POZICIA: <select name="profession_id[]">
		<?php foreach ($professions as $key => $value): ?>
		<option value="<?=$key?>"><?=$value?></option>
		<?php endforeach; ?>
	</select><br />
	__OD_ROKU:<input name="year_from[]" type="text" value="" />
	__DO_ROKU:<input name="year_to[]" type="text" value="" />
	<br />
	<div class="lang_en">
		__POPIS_EN:<textarea  name="description_en[]" rows="3" cols="100" style="width: 350px;"></textarea>
	</div>
	<div class="lang_sk">
		__POPIS_SK:<textarea  name="description_sk[]" rows="3" cols="100" style="width: 350px;"></textarea>
	</div>			
	<input type="button" value="__ZMAZAT" onclick="this.parentNode.parentNode.removeChild(this.parentNode);"/>
</div>

<!-- skryty form pre pridavanie jazykov -->
<div class="profession" style="display:none;" id="default_language_form">
	<label>__JAZYK:</label>
  <select name="language_id[]">
		<?php foreach ($languages as $key => $value): ?>
		 <option value="<?=$key?>"><?=$value?></option>
		<?php endforeach; ?>
	</select>
  <select name="level_id[]">
		<?php foreach ($levels as $key => $value): ?>
		  <option value="<?=$key?>"><?=$value?></option>
		<?php endforeach; ?>
	</select>			
	<input type="button" value="__ZMAZAT" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" />
</div>	