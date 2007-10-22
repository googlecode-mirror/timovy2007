<?php $my->addCrumb(__("MENU_ALUMNI_MYIMAGE", true)); ?>
<h1><?php echo __("MENU_ALUMNI_MYIMAGE")?></h1>

<br />
<form class="alumni_myprofile" action="<?php echo $html->url('/alumni/myimage')?>" method="POST" enctype="multipart/form-data">
<p class="myprofile">
	<img class="myprofile" align="left" src="<?php echo $html->url(file_exists('img/persons/'.$user['User']['username'].'.png') ? '/img/persons/'.$user['User']['username'].'.png' :'/img/person.png');?>?<?php echo rand(1, 5000)?>" />
	<?php __('ALUMNI_MYPROFILE_CHANGEIMAGE_TEXT')?> <br />
	<input type="file" name="userimage" value="" /><br />
	<br />

</p>
<p>
	<input type="submit" value="<?php __('ALUMNI_MYPROFILE_CHANGEIMAGE_SUBMIT')?>" />
	<input type="submit" name="delete_image" value="<?php __('ALUMNI_MYPROFILE_DELETEIMAGE_SUBMIT')?>" />
</p>
</form>