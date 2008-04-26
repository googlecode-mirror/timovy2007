<h1><?php __("NEWS_EDIT_POST") ?></h1>
<form method="post" action="<?php echo $html->url('/posts/edit')?>">
    <?php echo $form->hidden('Post/id'); ?>
    <p>
        <label><?php __("NEWS_TITLE") ?>:</label></br>
        <?php echo $form->text('Post/title', array('size' => '40'))?>
        <?php echo $form->error('Post/title', 'Title is required.') ?>
    </p>
    <p>
        <label><?php __("NEWS_BODY") ?>:</label></br>
        <?php echo $form->textarea('Post/body', array('style'=>'width: 100%; border: 1px solid grey; height: 300px;')); ?>
        <?php echo $form->error('Post/body', 'Body is required.') ?>
    </p>
    <p>
        <?php echo $form->submit(__("NEWS_SAVE", true)) ?>
    </p>
</form>