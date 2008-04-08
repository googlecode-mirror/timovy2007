<h1><?php __("NEWS_TITLE")?></h1>

<?php foreach ($posts as $post): ?>
	<h2><?php echo $post['Post']['title']?></h2>
	<small><?php __("NEWS_ADDED")?>: <?php echo date("j.n.Y", strtotime($post['Post']['created'])); ?></small>
	<p><?php echo $post['Post']['body']?></p>
<?php endforeach; ?>
