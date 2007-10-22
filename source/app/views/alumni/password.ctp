<?php $my->addCrumb(__("MENU_ALUMNI_PASSWORD", true)); ?>

<h1><?php echo __("MENU_ALUMNI_PASSWORD")?></h1>
<p>
	<?php __('ALUMNI_PASSWORD_INFO');?>
</p>

<form action="<?php echo $html->url('/alumni/password')?>" method="POST">
<p>
	<label><?php __('ALUMNI_PASS_OLD')?>:</label> <input type="password" name="password_old" value="" />
</p>	
<p>
	<label><?php __('ALUMNI_PASS_NEW_1')?>:</label> <input type="password" name="password_1" value="" /><br />
	<label><?php __('ALUMNI_PASS_NEW_2')?>:</label> <input type="password" name="password_2" value="" />
</p>

<p>
	<input type="submit" value="<?php __('ALUMNI_PASSWORD_SUBMIT')?>" />
</p>
</form>