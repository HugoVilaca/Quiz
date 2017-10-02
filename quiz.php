

<?php
try{
	$connect = new PDO('mysql:host=localhost;dbname=quiz','root','');
		//commande pour afficher les accents
		$connect->exec('SET NAMES UTF8');
}catch(PDOException $e){
	echo "Erreur de connexion";
}

$i = 1;
// là on met du html, on peut ouvrir une balise html pour que les couleurs s'affichent, c'est plus simple pour nous
//Toujours utiliser POST, car Get affiche dans l'URL les mdp etc...
echo "<form action='resultQcm.php' method='post'>";
// requete qui prend au hasard et limite a 5 questions
$req = "select * from questions order by rand() limit 5";
try{
	$res = $connect->query($req);
	$j = 0;
	while($k = $res->fetch(PDO::FETCH_OBJ)){
		$j++;
		echo "<p>".$i++."-<b>".$k->sentence."</b></p>";
		$idQ = $k->id;
		$req = "select * from responses where id_questions = $idQ";
		$res2 = $connect->query($req);
		while($l2 = $res2->fetch(PDO::FETCH_OBJ)){
			// bouton radio = 1 reponse, checkbox = plusieurs choix
			// nom des boutons pour chaque rep, pour une question, toutes les reponses auront le meme nom, donc un choix possible ici
			echo "<input type='radio' name='".$j."' 
			value = '".$l2->id."' /> ".$l2->sentence."<br />";
		}	
	}
echo "<br /><br /><input type='submit' value='Fini!!!' />";
}catch(PDOException $e){
	echo "Erreur de requete";
}


?>