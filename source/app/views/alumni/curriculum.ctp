<?php
// europas url example
// http://www.minedu.sk/index.php?lang=sk&rootId=1354
    //$fpdf->setup();
    $fpdf->AddPage();
    $fpdf->SetFont('Arial','B',16);    
    $fpdf->Cell(40, 10, "ZIVOTOPIS");
    echo $fpdf->fpdfOutput();    
?> 