<?php

class PostsController extends AppController
{
    var $name = 'Posts';
	var $helpers = array('Html', 'Form');
	
	private function check_permission()
	{
    	// over ci ma k tomu pravi
    	// permission pridat do databazy
		if (!$this->Login->check('MANAGE_NEWS')) {
			$this->My->setError(__('NEWS_PERMISSION_DENIED',true));	// Error msg, po edit
			$this->redirect('/posts/index', null, true);
		}
	}
	
    function index()
    {
         $this->set('posts', $this->Post->findAll());
    }

    function view($id)
    {
        $this->Post->id = $id;
        $this->set('post', $this->Post->read());

    }

    function admin()
    {
		$this->check_permission();
		$this->set('posts', $this->Post->findAll());
    }

    function add()
    {
		$this->check_permission();
        if (!empty($this->data))
        {
            if ($this->Post->save($this->data))
            {
                //$this->flash('Your post has been saved.','/posts');
				$this->My->setInfo("Aktualita bola úspešne uložená!");
				$this->redirect('/posts/admin');
            }
        }
    }

	function delete($id)
	{
		$this->check_permission();
	    $this->Post->del($id);
	    //$this->flash('The post with id: '.$id.' has been deleted.', '/posts');
		$this->My->setInfo("Aktualita číslo ".$id." bola vymazaná!");
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
				$this->My->setInfo("Aktualita bola úspešne uložená!");
				$this->redirect('/posts/admin');
		    }
		}
	}
}

?>