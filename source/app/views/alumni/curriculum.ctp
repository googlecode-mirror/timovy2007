<?php
    $fpdf->SetInfo();
    $fpdf->AddPage();

        
    $fpdf->WriteCurriculumRow(12, 50, "R", '', array('Arial','', 18), array(255,255,255), 10, 140, "L", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_CURRICULUM", true)), array('Arial','B',20), array(255,255,255));
    $fpdf->Ln(1);
    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_PERSONAL_DATA", true)), array('Arial','B', 16), array(241,241,241), 10, 140, "L", "", array('Arial','',10), array(255,255,255));
    $fpdf->Ln(1);
   
    $ws = '';
    if(!empty($user['User']['title'])) $ws .= $user['User']['title']." ";
    $ws .= $user['User']['first_name']." ";    
    if(!empty($user['User']['middle_name'])) 
    $ws .= $user['User']['middle_name']." ";    
    $ws .= $user['User']['last_name'];      
    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_NAME_AND_SURNAME", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", $ws, array('Arial','B',14), array(241,241,241));
    $fpdf->Ln(1);

    $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_ADDRESS", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['address'], array('Arial','',14), array(241,241,241));
    $fpdf->Ln(1);
    
    if(!empty($user['User']['phone'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_TELEPHONE", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['phone'], array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['User']['email'])) {
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_EMAIL", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", $user['User']['email'], array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);
    }
    
    if(!empty($user['UserProfession'])) {
      $ws = '';
      foreach($user['UserProfession'] as $key=>$value) {
        $ws .= iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_POSITION", true)).": ".$value['Profession']['name_'.$lang]."\n";
        $ws .= iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_FROM", true)).": ".$value['year_from']."\n";
        $ws .= iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_TO", true)).": ".$value['year_to']."\n";
        $ws .= iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_NOTE", true)).": ".$value['description_'.$lang]."\n";    
      }
      $ws = substr($ws, 0, -1);
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_EMPLOYMENT", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", $ws, array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }
    
    if(!empty($user['UserLanguage'])) {
      $ws = '';
      foreach($user['UserLanguage'] as $key=>$value) {
        $ws .= $value['Language']['name_'.$lang].": ";
        $ws .= $value['Level']['name_'.$lang]."\n";            
      }
      $fpdf->WriteCurriculumRow(10, 50, "R", iconv("UTF-8", "windows-1250", __("ALUMNI_MYPROFILE_CV_LANGUAGES", true)), array('Arial','', 14), array(241,241,241), 10, 140, "L", iconv("UTF-8", "windows-1250", $ws), array('Arial','',14), array(241,241,241));
      $fpdf->Ln(1);    
    }    

    echo $fpdf->fpdfOutput();    
?> 