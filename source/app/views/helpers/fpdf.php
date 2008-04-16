<?php 
App::import('Vendor','fpdf\fpdf');

if (!defined('PARAGRAPH_STRING')) define('PARAGRAPH_STRING', '~~~');

class fpdfHelper extends FPDF {
	var $title;
	
	function setup ($orientation='P',$unit='mm',$format='A4') {
		$this->FPDF($orientation, $unit, $format); 
	}
	
	function fpdfOutput ($name = 'page.pdf', $destination = 's') {
		return $this->Output($name, $destination);
	}
	
	function Header()
	{
	    //Logo
	    $this->Image(WWW_ROOT.DS.'img/logo.png',10,8,33);  
		// you can use jpeg or pngs see the manual for fpdf for more info
	    //Arial bold 15
	    $this->SetFont('Arial','B',15);
	    //Move to the right
	    $this->Cell(80);
	    //Title
	    $this->Cell(30,10,$this->title,1,0,'C');
	    //Line break
	    $this->Ln(20);
	}

	//Page footer
	function Footer()
	{
	    //Position at 1.5 cm from bottom
	    $this->SetY(-15);
	    //Arial italic 8
	    $this->SetFont('Arial','I',8);
	    //Page number
	    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}
}
?>