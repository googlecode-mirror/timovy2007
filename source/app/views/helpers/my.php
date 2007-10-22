<?php
class MyHelper extends Helper  
{
	var $helpers = array('Html', 'Session');
	var $_crumbs = array();

	function imgLink($image, $url, $title = null, $confirmMessage = null)
	{
		$a_params  = array('title'=>$title);
		if ($confirmMessage) {
			$a_params['onclick'] = "return confirm('".addslashes($confirmMessage)."');";
		}
		return $this->Html->link($this->Html->image($image, array('alt'=>$title)), $url, $a_params, false, false);
	}
	
	function flashAll()
	{
		$this->flashError();
		$this->flashInfo();
	}
	function flashError()
	{
		if ($this->Session->check('Message.error')) 
		{
			echo '<div class="errorMessage">';
			echo '<div class="errorMessageRight">';
			echo '<div class="errorMessageLeft">';
			echo '<div class="message"><img src="'.$this->Html->url('/css/images/error.gif').'" /><span>';
			$this->Session->flash('error');
			echo '</span><img src="'.$this->Html->url('/css/images/error.gif').'" /></div>';
			echo '</div>';
			echo '</div>';
			echo '</div>';
		}
	}
	function flashInfo()
	{
		if ($this->Session->check('Message.info')) 
		{
			echo '<div class="flashMessage">';
			echo '<div class="flashMessageRight">';
			echo '<div class="flashMessageLeft">';
			echo '<div class="message"><img src="'.$this->Html->url('/css/images/notice.gif').'" /><span>';
			$this->Session->flash('info');
			echo '</span><img src="'.$this->Html->url('/css/images/notice.gif').'" /></div>';
			echo '</div></div></div>';	
		}
	}
	
	function button($napis, $kam)
	{
		return '<input type="reset" value="'.$napis.'" onclick="document.location=\''.$this->Html->url($kam).'\'" />';
	}
	
	function addCrumb($name, $link = null, $first = false)
	{
		$item = array('name'=>$name, 'link'=>$link);
		if ($first) {
			$this->_crumbs = array_merge(array($item), $this->_crumbs);
		} else {
			$this->_crumbs[] = $item;
		}
	}
		
	function getCrumbs()
	{
		$temp = array();
		foreach ($this->_crumbs as $c) {
			if ($c['link'] !== null) {
				$temp[] = $this->Html->link($c['name'], $c['link']);
			} else {
				$temp[] = '<span>'.$c['name'].'</span>';
			}
		}
		return implode(' &raquo; ', $temp);
	}
}
?>