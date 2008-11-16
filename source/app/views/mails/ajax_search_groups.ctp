<?php if (count($groups) > 0) { ?>
<table class="mailsearchfound">
<?php foreach ($groups as $group) { ?>
<tr>
	<td>
		<input type="checkbox" value="<?php echo $group['MailGroup']['name']?><group>" id="mail_group<?php echo $group['MailGroup']['id']?>" class="groupfound noborder" />
	</td>
	<td><label for="mail_group<?php echo $group['MailGroup']['id']?>"><?php echo $group['MailGroup']['name']?> (<?php echo $group['MailGroup']['description']?>)</label></td>
</tr>
<?php } ?>
</table>
<?php } else { ?>
	<?php __('MAIL_COMPOSE_SEARCH_GROUPS_NO_RESULTS')?>
<?php } ?>