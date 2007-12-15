<h1>Add Post</h1>
<form method="post" action="<?php echo $html->url('/posts/add')?>">
    <p>
        <label>Title:</label></br>
        <?php echo $form->text('Post/title', array('size' => '40'))?>
        <?php echo $form->error('Post/title', 'Title is required.') ?>
    </p>
    <p>
        <label>Body:</label></br>
		<?php echo $form->textarea('Post/body', array('style'=>'width: 100%; border: 1px solid grey; height: 50px;')); ?>
        <?php echo $form->error('Post/body', 'Body is required.') ?>
    </p>
    <p>
        <?php echo $form->submit('Save') ?>
    </p>
</form>