<h1><?php echo $post['Post']['title']?></h1>

<p><small>Created: <?php echo $post['Post']['created']?></small></p>

<p><?php echo str_replace("\n", "<br />", $post['Post']['body']); ?></p>