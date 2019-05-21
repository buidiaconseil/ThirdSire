<?php
$servername = "localhost";
$database = "buissondiazconseil";
$username = "root";
$password = "";

include '../config.php';

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
}
if( array_key_exists("type", $_POST)) {
    $type=mysqli_real_escape_string($conn,$_POST["type"]);
}
if( array_key_exists("email", $_POST)) {
    $email=mysqli_real_escape_string($conn,$_POST["email"]);
}else{
  //  header("HTTP/1.1 301 Moved Permanently"); 
    header("Location: /thanks.html"); 
    exit();
};
echo "Connected successfully";
$emailFileName="";
if($type=="recruteur"){
    $sql = "INSERT INTO emailrecruteur (Email) VALUES ('$email')";
    $emailFileName = "recruteur.email";
}elseif($type=="candidat"){
    $sql = "INSERT INTO emailcandidat (Email) VALUES ('$email')";
    $emailFileName = "candidat.email";
}
elseif($type=="conseil"){
    $sql = "INSERT INTO emailconseil (Email) VALUES ('$email')";
    $emailFileName = "conseil.email";
}
if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
//$sql = "EXPLAIN SELECT * from template where PK_TemplateEmail in (Select FK_Template from processustemplate WHERE FK_Processus in (SELECT FK_Processus from funnelprocessus where FK_Funnel in (Select PK_Funnel from funnel WHERE Clef=\"FUNCAND\")))";
mysqli_close($conn);
$file = file_get_contents('./'.$emailFileName, FILE_USE_INCLUDE_PATH);
$posLine=strpos($file, "\n");
$first_line = substr($file, 0, $posLine);
$messageFinal= substr($file,  $posLine+1);

$to      = $email;
     $subject = $first_line;
     $message = $messageFinal;
     $headers = 'From: postmaster@buissondiaz.com' . "\r\n" .
     'Reply-To: infos@buissondiaz.com' . "\r\n" .
     'X-Mailer: PHP/' . phpversion() . "\r\n" .
     'Bcc: sebastien.diaz@gmail.com';
     echo("eeee ".$to ." rrrr\n ".$subject." rrrr\n ".$message." rrrr\n ".$headers);
     mail($to, $subject, $message, $headers);


header("Location: /thanks.html"); 
    exit();
?>
