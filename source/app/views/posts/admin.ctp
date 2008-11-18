<?php $my->addCrumb(__("MENU_AKTUALITY", true)); ?> 
<h1><?php __("NEWS_MANAGEMENT");?></h1>
<p><?php echo $html->link(__("NEWS_ADD_POST", true), "/posts/add"); ?></p>
<h2 style="margin-top: 0pt;"><?php __("NEWS_LIST");?></h2>
<table class="std_table">
    <tr>
<!--        <th>Id</th> -->
        <th><?php echo $paginator->sort(__('NEWS_CREATED', true), 'created');?></th>
        <th width="60%"><?php echo $paginator->sort(__('NEWS_TITLE', true), 'title_'.$lang);?></th>
        <th><?php __("NEWS_ACTION") ?></th>
        
    </tr>

    <?php /* Here's where we loop through our $posts array, printing out post info */ ?>

    <?php foreach ($posts as $post): ?>
    <tr>
<!--        <td><?php echo $post['Post']['id']; ?></td> -->
        <td><?php echo date("j.n.Y", strtotime($post['Post']['created'])); ?></td>
        <td>
            <?php echo $html->link($post['Post']['title_'.$lang], '/posts/edit/'.$post['Post']['id']);?>
        </td>
        <td>
            <?php echo $html->link(
                __("NEWS_DELETE_POST",true),
                "/posts/delete/{$post['Post']['id']}",
                null,
                __("NEWS_ARE_YOU_SURE_DELETE",true)
            )?>,
            <?php echo $html->link(__("NEWS_EDIT",true), '/posts/edit/'.$post['Post']['id']);?>
        </td>
    </tr>
    <?php endforeach; ?>

</table>