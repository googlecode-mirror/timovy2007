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
	
</p>
<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEINFO_SUBMIT')?>" />
	
</p>
</form>

