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
			$this->My->setError(__('PERMISSION_DENIED', true));	
			$this->redirect('/posts/index', null, true);
		}
	}
	
    function index()
    {
        $this->pageTitle = __('POSTS_INDEX_TITLE', true);
        $this->set('posts', $this->paginate('Post'));
        $this->set('lang', $this->Session->read('Config.language'));
    }

    function view($id)
    {
        $this->pageTitle = __('POSTS_VIEW_TITLE', true);
        $this->Post->id = $id;
        $this->set('post', $this->Post->read());
    }

    function admin()
    {
        $this->pageTitle = __('POSTS_ADMIN_TITLE', true);
		    $this->check_permission();
		    $this->set('posts', $this->Post->findAll(null,null,array('Post.created'=>'DESC')));
        $this->set('lang', $this->Session->read('Config.language'));		 
    }

    function add()
    {
        $this->pageTitle = __('POSTS_ADD_TITLE', true);
    		$this->check_permission();
            if (!empty($this->data))
            {
                $this->data['Post']['title_sk']= htmlentities($this->data['Post']['title_sk']);
                $this->data['Post']['title_en']= htmlentities($this->data['Post']['title_en']);
                $this->data['Post']['body_sk']= htmlentities($this->data['Post']['body_sk']);
                $this->data['Post']['body_en']= htmlentities($this->data['Post']['body_en']);
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
	      $this->pageTitle = __('POSTS_DELETE_TITLE', true);
    		$this->check_permission();
    	  $this->Post->del($id);
    	  //$this->flash('The post with id: '.$id.' has been deleted.', '/posts');
    		$this->My->setInfo(__("NEWS_ITEM_REMOVED", true));
    		$this->redirect('/posts/admin');
	}

	function edit($id = null)
	{
	      $this->pageTitle = __('POSTS_EDIT_TITLE', true); 
    		$this->check_permission();
    		if (empty($this->data))
    		{
    		    $this->Post->id = $id;
    		    $this->data = $this->Post->read();
    		}
    		else
    		{
            $this->data['Post']['title_sk']= htmlentities($this->data['Post']['title_sk']);
            $this->data['Post']['title_en']= htmlentities($this->data['Post']['title_en']);
            $this->data['Post']['body_sk']= htmlentities($this->data['Post']['body_sk']);
            $this->data['Post']['body_en']= htmlentities($this->data['Post']['body_en']);
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