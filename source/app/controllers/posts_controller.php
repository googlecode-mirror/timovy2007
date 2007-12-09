<?php

class PostsController extends AppController
{
    var $name = 'Posts';
	var $helpers = array('Html', 'Form');
	
    function index()
    {
         $this->set('posts', $this->Post->findAll());
    }

    function view($id)
    {
        $this->Post->id = $id;
        $this->set('post', $this->Post->read());

    }

    function add()
    {
        if (!empty($this->data))
        {
            if ($this->Post->save($this->data))
            {
                $this->flash('Your post has been saved.','/posts');
            }
        }
    }

	function delete($id)
	{
	    $this->Post->del($id);
	    $this->flash('The post with id: '.$id.' has been deleted.', '/posts');
	}

	function edit($id = null)
	{
		if (empty($this->data))
		{
		    $this->Post->id = $id;
		    $this->data = $this->Post->read();
		}
		else
		{
		    if ($this->Post->save($this->data['Post']))
		    {
		        $this->flash('Your post has been updated.','/posts');
		    }
		}
	}
}

?>