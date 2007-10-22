<H1><?php __('NEWS_TITLE')?></H1>
<br />

<div style="float: right; width: 250px;">
sdfsdfsd
f s
f
sf
</div>

<?php foreach ($news as $n) { ?>
<h2><?php echo $n['News']['title']?></h2>
<p>
	<?php echo $n['News']['body'];?>
</p>
<p>
	<small><?php __('Published')?>: <?php echo $n['News']['date']?>, <?php echo $n['User']['title'].' '.$n['User']['first_name'].' '.$n['User']['middle_name'].' '.$n['User']['last_name']?></small>
</p>
<?php } ?>