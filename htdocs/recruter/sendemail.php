<?php
$servername = "localhost";
$database = "buissondiazconseil";
$username = "root";
$password = "";

include '../config.php';
require_once '../vendor/autoload.php';
// Create connection

$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection

if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
}
if( array_key_exists("type", $_POST)) {
    $type=mysqli_real_escape_string($conn,$_POST["type"]);
}
echo 'Bonjour ' . htmlspecialchars($_POST["type"]) . '!';
if( array_key_exists("email", $_POST)) {
    $email=mysqli_real_escape_string($conn,$_POST["email"]);
}else{
    echo "rrrrrrrrrrrrrrrrrrr";
  //  header("HTTP/1.1 301 Moved Permanently"); 
    header("Location: /thanks.html"); 
    exit();
};
echo 'Bonjour ' . htmlspecialchars($_POST["email"]) . '!';
echo "Connected successfully";
if($type=="recruteur"){
    $sql = "INSERT INTO emailrecruteur (Email) VALUES ('$email')";
}elseif($type=="candidat"){
    $sql = "INSERT INTO emailcandidat (Email) VALUES ('$email')";
}
elseif($type=="conseil"){
    $sql = "INSERT INTO emailconseil (Email) VALUES ('$email')";
}
if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}


$loader = new \Twig\Loader\ArrayLoader([
    'index' => 'Hello {{ name }}!',
]);
$twig = new \Twig\Environment($loader);

echo $twig->render('index', ['name' => 'Fabien']);

$sql = "EXPLAIN SELECT * from template where PK_TemplateEmail in (Select FK_Template from processustemplate WHERE FK_Processus in (SELECT FK_Processus from funnelprocessus where FK_Funnel in (Select PK_Funnel from funnel)))";


mysqli_close($conn);


//header("HTTP/1.1 302 Moved Permanently"); 
    header("Location: /thanks.html"); 
    exit();
?>
