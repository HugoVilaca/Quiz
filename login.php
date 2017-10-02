<?php
session_start();
if (isset($_POST["monBouton"])) {
	

$login = $_POST["login"];
$mdp = $_POST["mdp"];

try{
	$connect = new PDO('mysql:host=localhost;dbname=quiz','root','');
		//comma
		$connect->exec('SET NAMES UTF8');
}catch(PDOException $e){
	echo "Erreur de connexion";
}

$req = "select * from user where login = '$login' and mdp = '$mdp'";
$res = $connect->query($req);
if ($res->rowcount() >0) {
	//création une variable de session
	$_SESSION["logOk"] = 1;
	header("location:pagePrivee.php");
} else $erreur = "<h2>Erreur de login ou mot de passe !</h2>"; }
?>


<html>
<head><meta charset="utf-8"></head>

<body>
<center>
	<h1>Connexion</h1>
	<hr width="50%" color="red" size="3" />
<form action="login.php" method="post">
	Entrez votre login : <input type="text" name="login" /><br /><br />
	Entrez votre mot de passe : <input type="password" name="mdp"><br /><br />
	<input type="submit" value="Envoyer" name="monBouton" /><br /><br />

<?php
if (isset($erreur)) {
	echo $erreur;
}
?>