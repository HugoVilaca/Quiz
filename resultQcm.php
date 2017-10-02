<?php
try{
	$connect = new PDO('mysql:host=localhost;dbname=quiz','root','');
		$connect->exec('SET NAMES UTF8');
}catch(PDOException $e){
	echo "Erreur de connexion";
}

$note = 0;
$erreur = 0;
for($i=1; $i<6; $i++){
	$req = "select * from responses where id = ".$_POST["$i"];
	//echo $req;
	$res = $connect->query($req);
	$k = $res->fetch(PDO::FETCH_OBJ);
	if($k->correct == 1){
		$note += 4;
	}else{
		$erreur++;
		echo "<br />Erreur à la question $i, la bonne reponse était :<br />";
		$req2 = "select sentence from responses
					where id_questions = ".$k->id_questions.
					" and correct = 1";
		$res2 = $connect->query($req2);
		$k2 = $res2->fetch(PDO::FETCH_OBJ);
		echo $k2->sentence."<br />";	
	}
}
$rn = $connect->exec('INSERT INTO score(login,score,idscore,datescore) VALUES (login,note,note,note)');

echo "<br /><br />Vous avez fait $erreur erreur(s), votre note est
		donc : $note / 20";

 $requser = $connect->prepare('SELECT * FROM score WHERE id = ?');

   $userinfo = $requser->fetch();
echo $userinfo['score'];


?>