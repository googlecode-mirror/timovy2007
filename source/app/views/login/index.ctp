<?php $my->addCrumb(__("MENU_LOGIN", true)); ?>
<h1><?php __("MENU_LOGIN");?></h1>
<div style="padding: 10px 0 0 0px;">
<form action="<?=$html->url('/login/login')?>" method="post">
	<input type="hidden" name="post_redirect" value="<?php echo $post_redirect;?>" />
	<label><?php echo __("Login")?>:</label><br /> <?=$form->text('User/username')?><br />
	<label><?php echo __('Heslo')?>:</label><br /> <?=$form->password('User/password')?><br />
	<br />
	<input type="submit" value="Prihlásiť" />
</form>
</div>