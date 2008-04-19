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
	<label><?php __('ALUMNI_MYPROFILE_EMAIL')?>:</label><?php echo $form->text('User/email')?><input class="left_space" type="checkbox" name="publish_email" value="1" <?php echo ($user['User']['publish_email']==1) ? 'checked' : '';?> />
    <?php __("ALUMNI_MYPROFILE_PUBLISH_EMAIL")?>
		<br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MYPROFILE_ADDRESS')?>:</label> <?php echo $form->textarea('User/address', array('style'=>'width: 350px;', 'cols'=>100, 'rows'=>3))?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MYPROFILE_PHONE')?>:</label> <?php echo $form->text('User/phone')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MYPROFILE_ICQ')?>:</label> <?php echo $form->text('User/icq')?><br />
</p><br />
<!--
<p class="myprofile">
	<label><?php __('ALUMNI_MYPROFILE_OCCUPATION')?>:</label> <?php echo $form->textarea('User/occupation', array('style'=>'width: 350px;', 'cols'=>100, 'rows'=>3))?><br />
</p><br />
-->

<div class="myprofile">
	<h3>
		<?php __('ALUMNI_MYPROFILE_PROFESSION')?>:
	</h3>
	<div class="profession" style="float: left">
    <select id="langChange" class="left_space" style="float: right">
  		<option <?=($lang=='sk' ? 'selected="selected"': '');?> value="sk"><?php __("ALUMNI_MYPROFILE_LANGUAGE_SLOVAK")?></option>
  		<option <?=($lang=='en' ? 'selected="selected"': '');?> value="en"><?php __("ALUMNI_MYPROFILE_LANGUAGE_ENGLISH")?></option>
  	</select>
  	<?php __('ALUMNI_MYPROFILE_PROFESSION_LANGUAGE_SELECTION')?>:
  </div>
	<!-- Profesie v databaze -->
	 <?php foreach ($user_professions as $k=>$p): ?>	
		<div class="profession" style="clear: left">
			<p>
        <label><?php __("ALUMNI_MYPROFILE_PROFESSION_POSITION")?>:</label>
        <select name="profession_id[]">
				  <?php foreach ($professions as $key => $value): ?>
				  <option value="<?=$key?>" <?php if($key==$p['UserProfession']['profession_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
				  <?php endforeach; ?>
			  </select>
      </p>
			<p>
        <label><?php __("ALUMNI_MYPROFILE_PROFESSION_YEAR_FROM")?>:</label><input name="year_from[]" type="text" value="<?php echo $p['UserProfession']['year_from']; ?>" />
			  <label class="left_space" style="width: 98px"><?php __("ALUMNI_MYPROFILE_PROFESSION_YEAR_TO")?>:</label><input name="year_to[]" type="text" value="<?php echo $p['UserProfession']['year_to']; ?>" />
      </p>
			<div class="lang_en">
				<label><?php __("ALUMNI_MYPROFILE_PROFESSION_DESCRIPTION_EN")?>:</label><textarea name="description_en[]" rows="3" cols="100" style="width: 350px;"><?php echo $p['UserProfession']['description_en']; ?></textarea>
			</div>
			<div class="lang_sk">
				<label><?php __("ALUMNI_MYPROFILE_PROFESSION_DESCRIPTION_SK")?>:</label><textarea name="description_sk[]" rows="3" cols="100" style="width: 350px;"><?php echo $p['UserProfession']['description_sk']; ?></textarea>
			</div>
			<input type="hidden" name="user_profession_id[]" value="<?php echo $p['UserProfession']['id']; ?>" />			
			<p style="text-align: center; margin-bottom: 0em"><input type="button" value="<?php __("ALUMNI_MYPROFILE_PROFESSION_DELETE")?>" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" /></p>
		</div>	
	<?php endforeach; ?>
	
	<div id="append_profesion_div"></div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="<?php __("ALUMNI_MYPROFILE_PROFESSION_ADD")?>" onclick="cloneAppend('default_proffesion_form','append_profesion_div');" />
	<br /><br />
</div>
<br />

<div class="myprofile">
	<h3>
		<?php __('ALUMNI_MYPROFILE_LANGUAGES')?>:
	</h3> 
	<!-- Profesie v databaze -->
	 <?php foreach ($user_languages as $k=>$p): ?>	
		<div class="profession">
			<p>
        <label><?php __("ALUMNI_MYPROFILE_LANGUAGE")?>:</label>
        <select name="language_id[]" style="width: 175px">
  				<?php foreach ($languages as $key => $value): ?>
  				<option value="<?=$key?>" <?php if($key==$p['UserLanguage']['language_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
  				<?php endforeach; ?>
  			</select>
        <select name="level_id[]" class="left_space" style="width: 175px">
  				<?php foreach ($levels as $key => $value): ?>
  				<option value="<?=$key?>" <?php if($key==$p['UserLanguage']['level_id']) echo "selected=\"selected\""; ?>><?=$value?></option>
  				<?php endforeach; ?>
  			</select>
      </p>			
			<input type="hidden" name="user_language_id[]" value="<?php echo $p['UserLanguage']['id']; ?>" />			
			<p style="text-align: center; margin-bottom: 0em"><input type="button" value="<?php __("ALUMNI_MYPROFILE_LANGUAGE_DELETE")?>" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" /></p>
		</div>	
	<?php endforeach; ?>
	
	<div id="append_language_div"></div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="<?php __("ALUMNI_MYPROFILE_LANGUAGE_ADD")?>" onclick="cloneAppend('default_language_form','append_language_div');" />
	<br /><br />
</div>

<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEINFO_SUBMIT')?>" />
	
</p>
</form>


<!-- skryty form pre pridavanie profesii -->
<div class="profession" style="display:none;" id="default_proffesion_form">
	<p>
    <label><?php __("ALUMNI_MYPROFILE_PROFESSION_POSITION")?>:</label>
    <select name="profession_id[]">
  		<?php foreach ($professions as $key => $value): ?>
  		<option value="<?=$key?>"><?=$value?></option>
  		<?php endforeach; ?>
  	</select>
  </p>
	<p>
    <label><?php __("ALUMNI_MYPROFILE_PROFESSION_YEAR_FROM")?>:</label><input name="year_from[]" type="text" value="" />
  	<label class="left_space" style="width: 98px"><?php __("ALUMNI_MYPROFILE_PROFESSION_YEAR_TO")?>:</label><input name="year_to[]" type="text" value="" />
  </p>
	<div class="lang_en">
		<label><?php __("ALUMNI_MYPROFILE_PROFESSION_DESCRIPTION_EN")?>:</label><textarea  name="description_en[]" rows="3" cols="100" style="width: 350px;"></textarea>
	</div>
	<div class="lang_sk">
		<label><?php __("ALUMNI_MYPROFILE_PROFESSION_DESCRIPTION_SK")?>:</label><textarea  name="description_sk[]" rows="3" cols="100" style="width: 350px;"></textarea>
	</div>			
	<p style="text-align: center"><input type="button" value="<?php __("ALUMNI_MYPROFILE_PROFESSION_DELETE")?>" onclick="this.parentNode.parentNode.removeChild(this.parentNode);"/></p>
</div>

<!-- skryty form pre pridavanie jazykov -->
<div class="profession" style="display:none;" id="default_language_form">
	<p>
    <label><?php __("ALUMNI_MYPROFILE_LANGUAGE")?>:</label>
    <select name="language_id[]" style="width: 175px">
  		<?php foreach ($languages as $key => $value): ?>
  		 <option value="<?=$key?>"><?=$value?></option>
  		<?php endforeach; ?>
  	</select>
    <select name="level_id[]" class="left_space" style="width: 175px">
  		<?php foreach ($levels as $key => $value): ?>
  		  <option value="<?=$key?>"><?=$value?></option>
  		<?php endforeach; ?>
  	</select>
  </p>			
	<p style="text-align: center; margin-bottom: 0em"><input type="button" value="<?php __("ALUMNI_MYPROFILE_LANGUAGE_DELETE")?>" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" /></p>
</div>	