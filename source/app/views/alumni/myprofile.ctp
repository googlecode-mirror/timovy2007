<?php $my->addCrumb(__("MENU_ALUMNI_MYPROFILE", true)); ?>
<h1><?php echo __("MENU_ALUMNI_MYPROFILE")?></h1>


<h2 class="alumni_profile">
<span style="float: right; font-size: small; color: black;">[ <a href="<?php echo $html->url('/alumni/profile/'.$user['User']['username'])?>"><?php __('View my profile')?></a> ]</span>
<?php __('ALUMNI_PROFILE_CHANGEINFO_TITLE')?>


</h2>
<form class="alumni_myprofile" action="<?php echo $html->url('/alumni/myprofile')?>" method="POST">
<p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_EMAIL')?>:</label><input type="checkbox" name="publish_email" value="1" <?php echo ($user['User']['publish_email']==1) ? 'checked' : '';?> />
		<?php __("ALUMNI_MY_PROFILI_PUBLISH_EMAIL")?>
		<br />	
	<label>&nbsp;</label> <?php echo $form->text('User/email')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_ADDRESS')?>:</label> <?php echo $form->textarea('User/address', array('style'=>'width: 350px;'))?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_PHONE')?>:</label> <?php echo $form->text('User/phone')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_ICQ')?>:</label> <?php echo $form->text('User/icq')?><br />
</p><br /><p class="myprofile">
	<label><?php __('ALUMNI_MY_PROFILE_OCCUPATION')?>:</label> <?php echo $form->textarea('User/occupation', array('style'=>'width: 350px;'))?><br />
	
</p><br />
<div class="myprofile">
	<h3><?php __('ALUMNI_MY_PROFILE_PROFESSION')?>:</h3> 
	
	<!-- Profesie v databaze -->
	<?php foreach ($user_professions as $p): ?>
		<div class="profession">
			<select name="profession_id[]">
				<?php foreach ($professions as $key => $value): ?>
				<option value="<?=$key?>"><?=$value?></option>
				<?php endforeach; ?>
			</select>
			<input name="year_from[]" type="text" value=""/>
			<input name="year_to[]" type="text" value=""/>
			<textarea name="description_en[]" rows="3"></textarea>
			<textarea name="description_sk[]" rows="3"></textarea>
			<input type="button" value="Zmaza" onclick="this.parent.remove()"/>
		</div>
	<?php endforeach; ?>
	<div id="dalsie">
	</div>
	
	<!-- Profesie generovane javascriptiom -->
	<input type="button" value="pridat" onclick="" />
	
	<!--  V javascripte ktory nastane po kliknuti na pridat tlacidlo sa do divu "dalsie" prida novy element  -->

	<?php 
/*	
	
	<select name="profession_id[]">
		<?php foreach ($professions as $key => $value): ?>
		<option value="<?=$key?>"><?=$value?></option>
		<?php endforeach; ?>
	</select>
	<input name="year_from[]" type="text" value=""/>
	<input name="year_to[]" type="text" value=""/>
	<textarea name="description_en[]" rows="3"></textarea>
	<textarea name="description_sk[]" rows="3"></textarea>
	*/ ?>
</div>


<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEINFO_SUBMIT')?>" />
	
</p>
</form>

