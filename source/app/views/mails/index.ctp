<?php $my->addCrumb(__("MENU_MAIL", true)); ?>

<form action="<?php echo $html->url('/mails/compose');?>" method="get">
<h1>
	<?php if ($Login->check('MAIL_WRITE')) { ?>
	<input type="submit" value="<?php __('MENU_MAIL_COMPOSE');?>" style="float: right;" />
	<?php } ?>
	<?php __('MAIL_BOX_TITLE');?>
</h1>
</form>

<form action="" method="post">
<table id="mail_inbox">
<tr>
	<th>#</th>
	<th><?php __('MAIL_BOX_FROM')?></th>
	<th><?php __('MAIL_BOX_SUBJECT')?></th>
	<th><?php __('MAIL_BOX_TIME')?></th>
</tr>
<?php if (count($mails)==0) { ?>
<tr>
	<td colspan="4" style="padding: 0.5em;">
		<?php __('MAIL_BOX_NO_MESSAGES')?>
	</td>
</tr>
<?php } ?>
<?php foreach ($mails as $mail) { ?>
<tr class="<?php if ($mail['UserMail']['user_mail_state_id']=='NEW') echo ' newmail'; ?>">
	<td>
		<input class="noborder" type="checkbox" name="mail[<?php echo $mail['UserMail']['id']?>]" value="<?php echo $mail['UserMail']['id']?>" />
	</td>
	<td><?php echo htmlspecialchars(trim($mail['Sender']['title'].' '.$mail['Sender']['first_name'].' '.$mail['Sender']['middle_name'].' '.$mail['Sender']['last_name']));?></td>
	<td><a href="<?php echo $html->url('/mails/read/'.$mail['UserMail']['id']);?>"><?php echo htmlspecialchars($mail['Mail']['subject'])?></a></td>
	<td><?php echo $myTime->nice($mail['Mail']['date_send'])?></td>
</tr>
<?php } ?>	
<tr>
	<td colspan="4" class="bottom">
		<span style="float: right">
			<?php echo $paginator->prev(__('MAIL_BOX_LISTING_PREV', true));?>
			<?php echo $paginator->counter(array('format'=>'<strong>%start%</strong> - <strong>%end%</strong> '.__('MAIL_BOX_LISTING_OF', true).' <strong>%count%</strong>'));?>
			<?php echo $paginator->next(__('MAIL_BOX_LISTING_NEXT', true))?>
			
		</span>
		<label style="float:left"><?php __('MAIL_BOX_BOTTOM_SELECTED')?>:</label>
		<select class="left_space" name="action" style="float: left">
			<option value=""></option>
			<option value="READED"><?php __('MAIL_BOX_ACTION_SET_READED')?></option>
			<option value="DELETED"><?php __('MAIL_BOX_ACTION_SET_DELETED')?></option>
		</select>
		<input class="left_space" type="submit" value="<?php __('MAIL_BOX_BOTTOM_SUBMIT');?>" />
	</td>
</tr>
</table>
</form>