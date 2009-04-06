<?php if (count($users) > 0) { ?>
<table class="mailsearchfound">
<?php foreach ($users as $user) {
		$fullname = str_replace('  ', ' ', ltrim($user['User']['title_before'].' '.$user['User']['first_name'].' '.$user['User']['middle_name'].' '.$user['User']['last_name']));
	?>
	<tr>
		<td>
			<input type="checkbox" value="<?php echo $user['User']['username']?><<?php echo $fullname;?>>" class="userfound noborder" />
		</td>
		<td><?php echo $user['User']['username']?></td>
		<td><?php echo $fullname;?></td>
	</tr>
<?php } ?>
</table>
<?php } else { ?>
	<?php __('MAIL_COMPOSE_SEARCH_NO_RESULTS')?>
<?php } ?>