<?php $my->addCrumb(__("MENU_ALUMNI_PROFILE", true)); ?>
<h1><?=(trim($user['User']['title_before'].' '.$user['User']['first_name']))?> <?=$user['User']['last_name']?></h1>

<h2 class="alumni_profile"><?php __('ALUMNI_PROFILE_ZAKL_INFORMACIE')?></h2>
<p class="alumni_profile">
	<span style="border: 2px solid white; display: inline;  float: right; ">
		<?php if (file_exists('img/persons/'.$user['User']['username'].'.png')) { ?>
			<img src="<?php echo $html->url('/img/persons/'.$user['User']['username'].'.png');?>" />
		<?php } else { ?>
			<?php echo $html->image('person.png', array('alt'=>__('ALUMNI_PROFILE_MISSING_PICTURE', true)))?>
		<?php } ?>
	</span>


	<label><?php __('ALUMNI_PROFILE_MENO')?>:</label> <strong><?php echo $user['User']['first_name']?></strong> <br />
	<label><?php __('ALUMNI_PROFILE_PRIEZVISKO')?>:</label> <strong><?php echo $user['User']['middle_name']. ' '. $user['User']['last_name']?></strong> <br />
	<?php if ($user['User']['title_before'] != '') { ?>
	<label><?php __('ALUMNI_PROFILE_TITUL')?>:</label><?php echo $user['User']['title_before']?><br />
	<?php } ?>
	<?php if ($user['User']['address'] != '') { ?>
	<label><?php __('ALUMNI_PROFILE_ADDRESS')?>:</label>
	<span class="alumni_profile_right">
		<?php echo htmlspecialchars($user['User']['address']);?>
	</span>
	
	<?php } ?>
	<?php if (isset($specialization)) { ?>
	<label><?php __('ALUMNI_PROFILE_SPECIALIZATION')?>:</label> <?php echo htmlspecialchars($specialization);?>
	<?php } ?>
	<br clear="all" style="clear: both" />
</p>
<?php if ($Login->user_id() != $user['User']['id']) { ?>
<?php if ($Login->check('MAIL_WRITE')) { ?>
<div style="text-align: right; padding-top: 0.4em;">
	<a href="<?php echo $html->url('/mails/compose?user_id='.$user['User']['id'])?>">&gt;&gt; <?php __('ALUMNI_PROFILE_SEND_MESSAGE')?></a>
</div>
<?php } ?>
<?php } else { ?>
<div style="text-align: right; padding-top: 0.4em;">
	<a href="<?php echo $html->url('/alumni/myprofile')?>">&gt;&gt; <?php __('Edit my profile')?></a>
</div>
<?php } ?>


<?php if (count($projects) > 0) { ?>
<h2 class="alumni_profile"><?php __('ALUMNI_PROFILE_ODBORNE_PRACE')?></h2>
<p class="alumni_profile">
	<?php foreach ($projects as $project) { ?>
	
	<span class="alumni_profile_proj"><strong><?php echo htmlspecialchars($project['ProjectType'][__('DB_PROJECT_TYPE_NAME', true)])?></strong></span><br />
	<label><?php __('ALUMNI_PROFILE_TEMA')?>:</label><strong><?php echo htmlspecialchars($project['Project'][__('DB_PROJECT_NAME', true)])?></strong><br />
	<?php if (isset($project['Academic']['id'])) { ?>
	<label><?php __('ALUMNI_PROFILE_ACADEMIC')?>:</label> <?php echo $project['Academic']['title_before'].' '.$project['Academic']['first_name'].' '.$project['Academic']['middle_name'].' '.$project['Academic']['last_name']?><br />
	<label><?php __('ALUMNI_PROFILE_DESCRIPTION')?>:</label>
	<span class="alumni_profile_right">
		<?php echo htmlspecialchars($project['Project'][__('DB_PROJECT_DESCRIPTION', true)])?>		
	</span>
	<br />
	<br />
		
	<?php } ?>
	
	
	
	<?php } ?>
</p>
<?php } ?>

<h2 class="alumni_profile"><?php __('ALUMNI_PROFILE_KONTAKT_OSTATNE')?></h2>
<p class="alumni_profile">
	<label><?php __('ALUMNI_PROFILE_PHONE')?>:</label> <?php echo htmlspecialchars($user['User']['phone'])?><br />
	<label><?php __('ALUMNI_PROFILE_EMAIL')?>:</label> <?php echo htmlspecialchars( str_replace('@', '[at]', $user['User']['email']) )?><br />
	<?php if ($user['User']['icq'] != '') { ?>
		<label><?php __('ALUMNI_PROFILE_ICQ')?>:</label> <?php echo htmlspecialchars($user['User']['icq'])?><br />
	<?php } ?>
	<?php if ($user['User']['occupation'] != '') { ?>
		<label><?php __('ALUMNI_PROFILE_OCCUPATION')?>:</label> <?php echo htmlspecialchars($user['User']['occupation'])?><br />
	<?php } ?>
</p>

<p>
	<a href="<?php echo $html->url('/alumni')?>" onclick="history.go(-1); return false;" class="btn">&lt;&lt; <?php __('ALUMNI_PROFILE_BACK')?></a>
</p>