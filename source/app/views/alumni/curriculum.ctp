<?php
    $fpdf->SetInfo();
    $fpdf->AddPage();

        
    $fpdf->WriteCurriculumRow(12, 50, "R", '', array('Arial','', 18), array(255,255,255), 10, 140, "L", __("CURRICULUM", true), array('Arial','B',20), array(255,255,255));
    $fpdf->Ln(1);
    $fpdf->WriteCurriculumRow(10, 50, "R", __("PERSONAL_DATA", true), array('Arial','B', 16), array(241,241,241), 10, 140, "L", "", array('Arial','',10), array(255,255,255));
    $fpdf->Ln(1);
   
    $ws = '';
    if(!empty($user['User']['title'])) $ws .= $user['User']['title']." ";
    $ws .= $user['User']['first_name']." ";    
    if(!empty($user['User']['middle_name'])) 
    $ws .= $user['User']['middle_name']." ";    
    $ws .= $user['User']['last_name'];      
    $fpdf->WriteCurriculumRow(10, 50, "R", __("NAME_AND_SURNAME", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $ws, array('Arial','B',14), array(241,241,241));
    $fpdf->Ln(1);

    $fpdf->WriteCurriculumRow(10, 50, "R", __("ADDRESS", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['address'], array('Arial','',14), array(241,241,241));
    $fpdf->Ln(1);
    
    if(!empty($user['User']['phone'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", __("TELEPHONE", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['phone'], array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['User']['email'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", __("EMAIL", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['email'], array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['UserProfession'])) {
      $ws = '';
      foreach($user['UserProfession'] as $key=>$value) {
        $ws .= __("POSITION", true).": ".$value['Profession']['name_'.$lang]."\n";
        $ws .= __("FROM", true).": ".$value['year_from']."\n";
        $ws .= __("TO", true).": ".$value['year_to']."\n";
        $ws .= __("NOTE", true).": ".$value['description_'.$lang]."\n";    
      }
      $ws = substr($ws, 0, -1);
      $fpdf->WriteCurriculumRow(10, 50, "R", __("EMPLOYMENT", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $ws, array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }
    
    if(!empty($user['UserLanguage'])) {
      $ws = '';
      foreach($user['UserLanguage'] as $key=>$value) {
        $ws .= $value['Language']['name_'.$lang].": ";
        $ws .= $value['Level']['name_'.$lang]."\n";            
      }
      $fpdf->WriteCurriculumRow(10, 50, "R", __("LANGUAGES", true), array('Arial','', 14), array(241,241,241), 10, 140, "L", $ws, array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }    

    echo $fpdf->fpdfOutput();    
?> 