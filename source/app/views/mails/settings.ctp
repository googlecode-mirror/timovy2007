<?php $my->addCrumb(__("MENU_MAIL_SETTINGS", true)); ?>
<h1><?php __("MAIL_SETTINGS_TITLE")?></h1>
<form action="<?php echo $html->url('/mails/settings')?>" method="post">
<h2><?php __("MAIL_SETTINGS_FORWARD_MAIL");?></h2>
<div class="settings_box">
	<?php __("MAIL_SETTINGS_FORWARD_MAIL_DESCR")?><br />
	<p style="padding-bottom: 0px">
    <?php echo $form->text('User/forward_mail')?>
  </p>
</div>
<br />
<div class="settings_box">
	<?php __("MAIL_SETTINGS_LISTING")?>:<br />
	<p style="padding-bottom: 0px">
  	<select name="data[User][mail_listing]">
  		<option value="15" <?php if ($html->value('User.mail_listing')==15) echo 'selected';?>>15</option>
  		<option value="20" <?php if ($html->value('User.mail_listing')==20) echo 'selected';?>>20</option>
  		<option value="25" <?php if ($html->value('User.mail_listing')==25) echo 'selected';?>>25</option>
  		<option value="30" <?php if ($html->value('User.mail_listing')==30) echo 'selected';?>>30</option>
  		<option value="50" <?php if ($html->value('User.mail_listing')==50) echo 'selected';?>>50</option>
  		<option value="75" <?php if ($html->value('User.mail_listing')==75) echo 'selected';?>>75</option>
  		<option value="100" <?php if ($html->value('User.mail_listing')==100) echo 'selected';?>>100</option>
  	</select>
	</p>
	<p class="clear" />
</div>

<p>
	<input type="submit" value="<?php __("MAIL_SETTINGS_SUBMIT")?>" />
</p>
</form>