<h1>Edit Post</h1>
<form method="post" action="<?php echo $html->url('/posts/edit')?>">
    <?php echo $form->hidden('Post/id'); ?>
    <p>
        Title:
        <?php echo $form->input('Post/title', array('size' => '40'))?>
        <?php echo $form->error('Post/title', 'Title is required.') ?>
    </p>
    <p>
        Body:
        <?php echo $form->textarea('Post/body', array('rows'=>'10')) ?>
        <?php echo $form->error('Post/body', 'Body is required.') ?>
    </p>
    <p>
        <?php echo $form->submit('Save') ?>
    </p>
</form>