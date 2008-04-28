<?php 
App::import('Vendor','fpdf'.DS.'fpdf');
//App::import('Vendor','ufpdf'.DS.'ufpdf');

if (!defined('PARAGRAPH_STRING')) define('PARAGRAPH_STRING', '~~~');

class fpdfHelper extends FPDF {
	var $title;
	
	function setup ($orientation='P',$unit='mm',$format='A4') {
		$this->FPDF($orientation, $unit, $format); 
	}
	
	function fpdfOutput ($name = 'page.pdf', $destination = 's') {
		return $this->Output($name, $destination);
	}
	
	function xHeader()
	{
	    //Logo
	    //$this->Image(WWW_ROOT.DS.'img/logo.png',10,8,33);  
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
	function xFooter()
	{
	    //Position at 1.5 cm from bottom
	    $this->SetY(-15);
	    //Arial italic 8
	    $this->SetFont('Arial','I',8);
	    //Page number
	    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}
	
	function SetInfo(){
		$this->SetAuthor("ALUMNI");
		$this->SetCreator("ALUMNI");
		$this->SetKeywords("ALUMNI");
		$this->SetSubject("Curriculum vitae");
		$this->SetTitle("Curriculum vitae");
  }
	
	function WriteCurriculumRow($left_height, $left_width, $left_align, $left_data, $left_style, $left_fillcolor, $right_height, $right_width, $right_align, $right_data, $right_style, $right_fillcolor){
      $left_x = $this->GetX();
      $left_y1 = $this->GetY();      
      if(!empty($left_style)) $this->SetFont($left_style[0],$left_style[1],$left_style[2]);      	          
      $this->SetFillColor($left_fillcolor[0], $left_fillcolor[1], $left_fillcolor[2]);
	 		$this->MultiCell($left_width, $left_height, $left_data, 0, $left_align, 1);
      $left_y2 = $this->GetY();     
	 		$this->SetY($left_y1);		 		
	 		$this->SetX($left_x + $left_width + 1);
	 		$this->SetFillColor($right_fillcolor[0], $right_fillcolor[1], $right_fillcolor[2]);
	 		if(!empty($right_style)) $this->SetFont($right_style[0],$right_style[1],$right_style[2]);
	 		$this->MultiCell($right_width, $right_height, $right_data, 0, $right_align, 1);
	 		$left_y3 = $this->GetY();
	 		if($left_y2 < $left_y3) {
	 		  $this->SetXY($left_x, $left_y2);
        $this->SetFillColor($left_fillcolor[0], $left_fillcolor[1], $left_fillcolor[2]);
        $this->Cell($left_width, ($left_y3-$left_y2), '', 0, 2, $left_align, 1);  
      }
      if($left_y2 > $left_y3) {
	 		  $this->SetXY($left_x + $left_width + 1, $left_y3);
        $this->SetFillColor($right_fillcolor[0], $right_fillcolor[1], $right_fillcolor[2]);
        $this->Cell($right_width, ($left_y2-$left_y3), '', 0, 2, $right_align, 1);  
      }
  }
	
}
?>