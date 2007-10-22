<?php
class MyTimeHelper extends TimeHelper   
{
	/**
	 * Return time acording to current locale
	 *
	 */
	function nice($date_string = null) {
		if ($date_string != null) {
			$date = $this->fromString($date_string);
		} else {
			$date = time();
		}
		
		$ret = date("j.n.Y, H:i", $date);
		return $this->output($ret);
	}
	
	function nice_date($date_string = null) {
		if ($date_string != null) {
			$date = $this->fromString($date_string);
		} else {
			$date = time();
		}
		
		$ret = date("j.n.Y", $date);
		return $this->output($ret);
	}
}
?>