<h1><?php __("USERS_ADD_TITLE") ?></h1>
<form class="alumni_myprofile" method="post" action="<?php echo $html->url('/users/add')?>">
  <h3>Údaje o používateľovi</h3><br />
  <p class="myprofile">
    <label>Titul:</label><?php echo $form->text('User.title', array('size' => '5'))?><br />
    <label>Meno:</label><?php echo $form->text('User.first_name', array('size' => '40'))?><br />
    <label>Druhé meno:</label><?php echo $form->text('User.middle_name', array('size' => '40'))?><br />
    <label>Priezvisko:</label><?php echo $form->text('User.last_name', array('size' => '40'))?><br />
  </p>

  <h3>Prihlasovacie údaje</h3><br />
  <p class="myprofile">
    <label>Login:</label><?php echo $form->text('User.username', array('size' => '40'))?><br />
    <label>Heslo:</label><?php echo $form->password('User.password', array('size' => '40', 'value' => ''))?><br />
    </p>

	<p></p>
	<p class="myprofile">
        <label>E-Mail:</label><?php echo $form->text('User.email', array('size' => '40'))?><br />
    </p>
    <p>
        <?php echo $form->submit(__("USER_SAVE", true)) ?>
    </p>
</form>