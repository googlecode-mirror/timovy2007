<?php $my->addCrumb(__("MENU_UPRAVA_POUZIVATELOV", true)); ?>
<h1>Zmena hesla</h1>
<p>
	<a onclick="history.go(-1); return false;" href="<?php echo $html->url('/users')?>">&laquo; naspäť na zoznam</a>
</p>

<h2>Zmena hesla pre používateľa s prihlasovacím menom <em><?php echo $user['User']['username']?></em></h2>

<form action="<?php echo $html->url("/users/password/".$user['User']['id'])?>" method="post">
<p>
	<input type="password" value="" name="password" />
</p>
<p>
	<input type="submit" value="Zmeniť heslo" />
</p>
</form>
