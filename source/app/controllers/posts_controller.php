<?php
class PostsController extends AppController
{
    var $name = 'Posts';
    var $use = array('Posts');
	var $helpers = array('Html', 'Form', 'Paginator');
	var $paginate = array('limit' => 5, 'page' => 1, 'order'=>array('created' => 'desc'));
	
   	// Overi ci ma pouzivatel potrebne prava  
	private function check_permission()
	{
		if (!$this->Login->check('MANAGE_NEWS')) {
			$this->My->setError(__('NEWS_PERMISSION_DENIED',true));	
			$this->redirect('/posts/index', null, true);
		}
	}
	
    function index()
    {
        // $this->set('posts', $this->Post->findAll());
        $this->set('posts', $this->paginate('Post'));
    }

    function view($id)
    {
        $this->Post->id = $id;
        $this->set('post', $this->Post->read());
    }

    function admin()
    {
		$this->check_permission();
		$this->set('posts', $this->Post->findAll(null,null,array('Post.created'=>'DESC')));
		 
    }

    function add()
    {
		$this->check_permission();
        if (!empty($this->data))
        {
            if ($this->Post->save($this->data))
            {
                //$this->flash('Your post has been saved.','/posts');
				$this->My->setInfo(__("NEWS_ITEM_ADDED", true), true);
				$this->redirect('/posts/admin', null, true);
				
/*				$this->My->setInfo(__('Your profile has been changed.', true));	
				$this->redirect('/alumni/myprofile', null, true);*/
            }
        }
    }

	function delete($id)
	{
		$this->check_permission();
	    $this->Post->del($id);
	    //$this->flash('The post with id: '.$id.' has been deleted.', '/posts');
		$this->My->setInfo(__("NEWS_ITEM_REMOVED", true));
		$this->redirect('/posts/admin');
	}

	function edit($id = null)
	{
		$this->check_permission();
		if (empty($this->data))
		{
		    $this->Post->id = $id;
		    $this->data = $this->Post->read();
		}
		else
		{
		    if ($this->Post->save($this->data['Post']))
		    {
		  		//$this->flash('Your post has been updated.','/posts');
				$this->My->setInfo(__("NEWS_ITEM_UPDATED", true));
				$this->redirect('/posts/admin');
		    }
		}
	}
}
?>