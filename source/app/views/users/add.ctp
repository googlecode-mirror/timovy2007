<h1><?php __("USERS_ADD_TITLE") ?></h1>
<form method="post" action="<?php echo $html->url('/users/add')?>">
    <p>
        <label>Meno používateľa:</label></br>
        <label>Titul:</label></br><?php echo $form->text('User/title', array('size' => '5'))?></br>
        <label>Meno:</label></br><?php echo $form->text('User/first_name', array('size' => '40'))?></br>
        <label>Druhé meno:</label></br><?php echo $form->text('User/middle_name', array('size' => '40'))?></br>
        <label>Priezvisko:</label></br><?php echo $form->text('User/last_name', array('size' => '40'))?></br>
    </p>
    <p>
        <label>Prihlasovacie meno:</label></br>
        <?php echo $form->text('User/username', array('size' => '40'))?></br>
        <label>Prihlasovacie heslo:</label></br>
        <?php echo $form->text('User/password', array('size' => '40'))?>
    </p>
    <p>
        <label>E-Mail:</label></br>
        <?php echo $form->text('User/email', array('size' => '40'))?>
    </p>
    <p>
        <?php echo $form->submit(__("USER_SAVE", true)) ?>
    </p>
</form>