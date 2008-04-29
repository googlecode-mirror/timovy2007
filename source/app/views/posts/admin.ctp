<?php $my->addCrumb(__("MENU_AKTUALITY", true)); ?> 
<h1><?php __("NEWS_MANAGEMENT");?></h1>
<p><?php echo $html->link(__("NEWS_ADD_POST", true), "/posts/add"); ?></p>
<table>
    <tr>
<!--        <th>Id</th> -->
        <th width="70%" align=left><?php __("NEWS_TITLE") ?></th>
        <th align=left><?php __("NEWS_ACTION") ?></th>
        <th align=left><?php __("NEWS_CREATED") ?></th>
    </tr>

   <!-- Here's where we loop through our $posts array, printing out post info -->

    <?php foreach ($posts as $post): ?>
    <tr>
  <!--      <td><?php echo $post['Post']['id']; ?></td> -->
        <td>
            <?php echo $html->link($post['Post']['title'], '/posts/edit/'.$post['Post']['id']);?>
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
        <td><?php echo date("j.n.Y", strtotime($post['Post']['created'])); ?></td>
    </tr>
    <?php endforeach; ?>

</table>