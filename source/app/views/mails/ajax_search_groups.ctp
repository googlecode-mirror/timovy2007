<?php if (count($groups) > 0) { ?>
<table class="mailsearchfound">
<?php foreach ($groups as $group) { ?>
<tr>
	<td>
		<input type="checkbox" value="<?php echo $group['MailGroup']['name']?><group>" class="groupfound noborder" />
	</td>
	<td><?php echo $group['MailGroup']['name']?></td>
</tr>
<?php } ?>
</table>
<?php } else { ?>
	<?php __('MAIL_COMPOSE_SEARCH_GROUPS_NO_RESULTS')?>
<?php } ?>