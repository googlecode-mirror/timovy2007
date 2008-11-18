<h1><?php __("NEWS_ADD_POST") ?></h1>
<form method="post" action="<?php echo $html->url('/posts/add')?>">
    <p>
        <label class="ind1"><?php __("NEWS_TITLE") ?>:</label>
        <?php echo $form->text('Post.title_sk', array('size' => '40'))?>
        <br />
        <label class="ind1"><?php __("NEWS_TITLE_EN") ?>:</label>
        <?php echo $form->text('Post.title_en', array('size' => '40'))?>
        <?php echo $form->error('Post.title_sk', 'Title sk is required.') ?>
        <?php echo $form->error('Post.title_en', 'Title en is required.') ?>
    </p>
    <p>
        <label><?php __("NEWS_BODY") ?>:</label><br />
    		<?php echo $form->textarea('Post.body_sk', array('style'=>'width: 510px; border: 1px solid grey; height: 300px;')); ?>
    		<br />
    		<label><?php __("NEWS_BODY_EN") ?>:</label><br />
		    <?php echo $form->textarea('Post.body_en', array('style'=>'width: 510px; border: 1px solid grey; height: 300px;')); ?>
        <?php echo $form->error('Post.body_sk', 'Body sk is required.') ?>
        <?php echo $form->error('Post.body_en', 'Body en is required.') ?>
    </p>
    <!--<p>-->
        <?php echo $form->submit(__("NEWS_SAVE", true)) ?>
    <!--</p>-->
</form>