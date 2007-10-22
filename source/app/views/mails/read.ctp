<?php $my->addCrumb(__("MENU_MAIL", true)); ?>
<h1><?php __('MENU_MAIL');?></h1>
<div id="mail_message">
	<div style="padding-top: 1em;">
		<a onclick="history.go(-1); return false;" href="<?php echo $html->url('/mails')?>"><?php __('MAIL_READ_BACK_TO_INDEX')?></a>
	</div>
	<h2 class="mail_read_title" style="text-align: right">
		<span style="float: left">
			<?php echo $message['Mail']['subject']?>
		</span>
		&nbsp;
		<span style="font-size: 65%">
			[ <a href="<?php echo $html->url('/mails/compose/'.$message['UserMail']['id'])?>"><?php __('MAIL_READ_REPLY')?></a> ]
		</span>
		
	</h2>
	<div class="mail_read_hlavicka">
		<strong><?php __('MAIL_READ_FROM')?></strong>: <?php echo $message['Sender']['username']?> "<em><?php echo $message['Sender']['title'].' '.$message['Sender']['first_name'].' '.$message['Sender']['middle_name'].' '.$message['Sender']['last_name']?></em>"<br />
		<strong><?php __('MAIL_READ_TO')?></strong>: <?php echo $to_address;?>
			
	</div>
	<p class="mail_read_body" style="margin-bottom: 2em;"><?php echo nl2br(htmlspecialchars($message['Mail']['body']))?></p>
	
	<hr />
	<a class="btn" href="<?php echo $html->url('/mails')?>" onclick="history.go(-1); return false;">&lt;&lt; <?php __('MAIL_READ_BACK_TO_INDEX')?></a>

</div>