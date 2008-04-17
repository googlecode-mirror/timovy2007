<?php
    $fpdf->SetInfo();
    $fpdf->AddPage();

        
    $fpdf->WriteCurriculumRow(12, 50, "R", '', array('Arial','', 18), array(255,255,255), 10, 140, "L", iconv("UTF-8", "windows-1250", "__Životopis"), array('Arial','B',20), array(255,255,255));
    $fpdf->Ln(1);
    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Osobné údaje"), array('Arial','B', 16), array(241,241,241), 10, 140, "L", "", array('Arial','',10), array(255,255,255));
    $fpdf->Ln(1);
   
    $ws = '';
    if(!empty($user['User']['title'])) $ws .= $user['User']['title']." ";
    $ws .= $user['User']['first_name']." ";    
    if(!empty($user['User']['middle_name'])) 
    $ws .= $user['User']['middle_name']." ";    
    $ws .= $user['User']['last_name'];      
    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Meno(á) / Priezvisko(á)"), array('Arial','', 14), array(241,241,241), 10, 140, "L",iconv("UTF-8", "windows-1250", $ws), array('Arial','B',14), array(241,241,241));
    $fpdf->Ln(1);

    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Adresa"), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $user['User']['address']), array('Arial','',14), array(241,241,241));
    $fpdf->Ln(1);
    
    if(!empty($user['User']['phone'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Telefón"), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $user['User']['phone']), array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['User']['email'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Email"), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $user['User']['email']), array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['UserProfession'])) {
      $ws = '';
      foreach($user['UserProfession'] as $key=>$value) {
        $ws .= "_Pozícia: ".$value['Profession']['name_'.$lang]."\n";
        $ws .= "_Od: ".$value['year_from']."\n";
        $ws .= "_Do: ".$value['year_to']."\n";
        $ws .= "_Poznamka: ".$value['description_'.$lang]."\n";    
      }
      $ws = substr($ws, 0, -1);
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Zamestnania"), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $ws), array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }
    
    if(!empty($user['UserLanguage'])) {
      $ws = '';
      foreach($user['UserLanguage'] as $key=>$value) {
        $ws .= $value['Language']['name_'.$lang].": ";
        $ws .= $value['Level']['name_'.$lang]."\n";            
      }
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", "__Jazyky"), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $ws), array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }    

    echo $fpdf->fpdfOutput();    
?> 