<h1><?php __("NEWS_MAIN_TITLE")?></h1>

<?php foreach ($posts as $post): ?>
	<h2><?php echo $post['Post']['title']?></h2>
	<small><?php __("NEWS_ADDED")?>: <?php echo date("j.n.Y", strtotime($post['Post']['created'])); ?></small>
	<p><?php echo $post['Post']['body']?></p>
<?php endforeach; ?>

<?php
//$paginator->setPaging($paging); // Initialize the pagination variables
/*$th = array (
            $paginator->sortBy('id'),
            $paginator->sortBy('title'),
            $paginator->sortBy('created')
); // Generate the paginator sort links
echo $html->tableHeaders($th); // Create the table headers with sort links if desired
*/
//foreach ($data as post)
//{

/*    $tr = array (
        $output['Post']['id'],
        $html->link($output['Post']['title'], "/Posts/View/{$output['Post']['id']}"),
        $output['Post']['created']
        );
    echo $html->tableCells($tr,array('class'=>'altRow'),array('class'=>'evenRow'));*/

?>

<?php echo $paginator->prev() . "&nbsp;" ?>
<?php echo $paginator->numbers() . "&nbsp;"; ?>
<?php echo $paginator->next(); ?> 
 