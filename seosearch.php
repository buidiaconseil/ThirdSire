<?php

// site web à crawler
$url = 'http://www.buissondiaz.com';


// déclaration de la fonction de crawl
function crawl($url) {

  // initialisation de curl
  $ch = curl_init($url);
  $header[0] = "Accept: text/xml,application/xml,application/xhtml+xml,"; 
  $header[0] .= "text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"; 
  $header[] = "Cache-Control: max-age=0"; 
  $header[] = "Connection: keep-alive"; 
  $header[] = "Keep-Alive: 300"; 
  $header[] = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7"; 
  $header[] = "Accept-Language: en-us,en;q=0.5"; 
  $header[] = "Pragma: "; // browsers keep this blank. 
  $temp = tempnam("/tmp", "FOO");
  //echo "<br/>P ".$temp." P<br/>";
  // création d'un fichier texte pour stocker le contenu crawlé
  // effacement du fichier précédent si existe
  if(file_exists($temp)) {
    unlink($temp);
  }

  //$fp_fichier_html_brut = fopen($temp, 'a');

  // définition des paramètres curl
  // 1 redirection de l'output dans le fichier txt
  //curl_setopt($ch, CURLOPT_FILE, $fp_fichier_html_brut);
  curl_setopt($ch, CURLOPT_URL, $url); 
  curl_setopt($ch, CURLOPT_USERAGENT, 'Googlebot/2.1 (+http://www.google.com/bot.html)'); 
  curl_setopt($ch, CURLOPT_HTTPHEADER, $header); 
  curl_setopt($ch, CURLOPT_REFERER, 'http://www.google.com'); 
  curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate'); 
  curl_setopt($ch, CURLOPT_AUTOREFERER, true); 
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
  curl_setopt($ch, CURLOPT_TIMEOUT, 10);

  // exécution de curl
  $html_brut = curl_exec($ch);
  if (curl_error($ch)) {
    echo $url." ".$ch;
}
  // fermeture de la session curl
  curl_close($ch);

  // fermeture du fichier texte
  //fclose($fp_fichier_html_brut);


  // passage du contenu du fichier à une variable pour analyse
  //$html_brut = file_get_contents($temp);
  //echo $html_brut;
  if(file_exists($temp)) {
    unlink($temp);
  }
  // extraction des liens
  //preg_match('/\[([^\]]*)\]/', $str, $re);
  preg_match_all('/<meta(.*)>/',
  $html_brut,
    $out);
    $arr = array();
    foreach ($out as &$value) {
        foreach ($value as &$value2) {
            //echo "<br/>".$value2;
            $isIn=strpos(strtolower($value2),'name="keywords"');
            if($isIn){
                preg_match('/.*content="(.*)".*/',$value2,$outCont);
                foreach ($outCont as &$value3) {
                   
                    $arr = array_merge($arr,preg_split("/[\s,]+/", $value3));
                    
                }
            }
        }
    }
    foreach ($out as &$value) {
        foreach ($value as &$value2) {
            //echo "<br/>".$value2;
            $isIn=strpos(strtolower($value2),'name="description"');
            $isIn2=strpos(strtolower($value2),'property="description"');
            
            if($isIn || $isIn2 ){
                
                preg_match('/.*content="(.*)".*/',$value2,$outCont);
                foreach ($outCont as &$value3) {
                    $value3 = str_replace('property="description"'," ", $value3);
                    $value3 = str_replace('content="'," ", $value3);
                    $value3 = str_replace('<meta'," ", $value3);
                    $value3 = str_replace('>'," ", $value3);
                    $value3 = str_replace('['," ", $value3);
                    $value3 = str_replace('[['," ", $value3);
                    $value3 = str_replace('"'," ", $value3);
                    $value3 = str_replace(".", " ", $value3);
                    $value3 = str_replace("{", " ", $value3);
                    $value3 = str_replace("}", " ", $value3);
                    $value3 = str_replace(",", " ", $value3);

                    $listkey=preg_split("/ /", $value3);
                    $i=0;
                    $prevOne="";
                    $prevSecond="";
                    $finArray = array();
                    echo "<br/>".count($listkey);
                    foreach ($listkey as &$value) {
                        if (strlen($value)>4){
                            $finArray[]=$value;
                        }
                    }
                    $listkey=$finArray;
                    echo "<br/>".count($listkey);
                    
                    $finArray = array();
                    
                    foreach ($listkey as &$value) {
                        if($i>0){
                            $finArray[]=$prevOne." ".$value;
                        }
                        if($i>1){
                            $finArray[]=$prevSecond." ".$prevOne." ".$value;
                        }
                        $i=$i+1;
                    }
                    $arr = array_merge($arr,$finArray);
                    
                }
                
            }
        }
    }
    return $arr;
    //var_dump($arr);
  //<meta name="keywords" content="mot clé 1, mot clé 2...">
}

// déclaration de la fonction de crawl
function cextends($key) {

    $url="https://www.google.fr/complete/search?q=".urlencode($key)."&cp=3&client=psy-ab&xssi=t&gs_ri=gws-wiz&hl=en-FR&authuser=0&psi=-Rr0XNTOEOqzgwfR_4CICA.1559501564815&ei=-Rr0XNTOEOqzgwfR_4CICA";
    // initialisation de curl
    $ch = curl_init($url);
    $arr=array();
    $temp = tempnam("/tmp", "FOO");
    //echo "<br/>P ".$temp." P<br/>";
    // création d'un fichier texte pour stocker le contenu crawlé
    // effacement du fichier précédent si existe
    //if(file_exists($temp)) {
      //unlink($temp);
    //}
  
    //$fp_fichier_html_brut = fopen($temp, 'a');
  
    $header[0] = "Accept: text/xml,application/xml,application/xhtml+xml,"; 
  $header[0] .= "text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"; 
  $header[] = "Cache-Control: max-age=0"; 
  $header[] = "Connection: keep-alive"; 
  $header[] = "Keep-Alive: 300"; 
  $header[] = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7"; 
  $header[] = "Accept-Language: en-us,en;q=0.5"; 
  $header[] = "Pragma: "; // browsers keep this blank. 
  $temp = tempnam("/tmp", "FOO");
  //echo "<br/>P ".$temp." P<br/>";
  // création d'un fichier texte pour stocker le contenu crawlé
  // effacement du fichier précédent si existe
  if(file_exists($temp)) {
    unlink($temp);
  }

  //$fp_fichier_html_brut = fopen($temp, 'a');

  // définition des paramètres curl
  // 1 redirection de l'output dans le fichier txt
  //curl_setopt($ch, CURLOPT_FILE, $fp_fichier_html_brut);
  curl_setopt($ch, CURLOPT_URL, $url); 
  curl_setopt($ch, CURLOPT_USERAGENT, 'Googlebot/2.1 (+http://www.google.com/bot.html)'); 
  curl_setopt($ch, CURLOPT_HTTPHEADER, $header); 
  curl_setopt($ch, CURLOPT_REFERER, 'http://www.google.com'); 
  curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate'); 
  curl_setopt($ch, CURLOPT_AUTOREFERER, true); 
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
  curl_setopt($ch, CURLOPT_TIMEOUT, 10);

    // exécution de curl
    $html_brut = curl_exec($ch);
    
    if (curl_error($ch)) {
        echo $url." ".$ch;
    }

    // fermeture de la session curl
    curl_close($ch);
  
    // fermeture du fichier texte
    //fclose($fp_fichier_html_brut);
  
  
    // passage du contenu du fichier à une variable pour analyse
    //$html_brut = file_get_contents($temp);
    $html_brut = str_replace("\u003cb", "", $html_brut);
    $html_brut = str_replace("\u003c\\/b", "", $html_brut);
    $html_brut = str_replace("\u003e", "", $html_brut);
    $html_brut = str_replace("\u0026", "", $html_brut);
    $html_brut = str_replace("#39;", "", $html_brut);
    
    $html_brut = str_replace(")]}'", "", $html_brut);
    //echo "<br/>".$html_brut;
    $cutted=preg_split("/],/", $html_brut);
    foreach ($cutted as &$value) {
        $newValue=str_replace("[[[\"", "", $value);
        $newValue=str_replace("[\"", "", $newValue);
        $newValue=preg_replace("/\".*/", "", $newValue);
        $newValue = str_replace("{", " ", $newValue);
            $newValue = str_replace("}", " ", $newValue);
            $newValue = str_replace('['," ", $newValue);
        $arr[]=$newValue;
        
        
    }
    //var_dump( preg_split("/],/", $html_brut));
    if(file_exists($temp)) {
      unlink($temp);
    }
   
      return $arr;
      //var_dump($arr);
    //<meta name="keywords" content="mot clé 1, mot clé 2...">
  }

// on appelle une première fois la fonction avec l'url racine
if( array_key_exists("url", $_GET)) {
    $url=$_GET["url"];
}
$listkey=crawl($url);
///var_dump($listkey);

//$listkey=array_merge($finArray,$listkey);
echo "<br/>".count($listkey);
$i=0;
$listkey=array_unique($listkey);
echo "<br/>".count($listkey);

$finArray = array();
$prevOne="";
foreach ($listkey as &$value) {
    
    
    $prevSecond=$prevOne;
    $prevOne=$value;
    
   // echo $value;
    $finArray[$i]=$value;
    $i=$i+1;
    $finNew=cextends($value);
    foreach ($finNew as &$value2) {
        $finArray[$i]=trim($value2);
        $i=$i+1;
    }
    //$finArray=array_merge($finArray, $finNew);
    
    
}
$finArray=array_unique($finArray);
//$out = array_values($finArray);
//echo json_encode($out);
//$newArray=array();
//foreach ($finArray as $key => $value){
//    $newArray[]=$value;//
//}
var_dump($finArray);
echo json_encode($finArray);
echo "paris";
$ar = array('apple', 'orange', 'banana', 'strawberry');
echo json_encode($ar);
//echo json_encode($finArray);
 
?>
