<?php
// ouverture de connexion vers base de donneés vroomissimo
$dsn = "mysql:dbname=vroomissimo;host=localhost;charset=utf8";
$user = "root";
$mdp = "Lens2022!";

try {
    $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
    $connexion = new PDO($dsn, $user, $mdp, $option);
} catch (PDOException $e) {
    printf("Echec connexion : %s\n", $e->getMessage());

}
// preparation de la requete avec des marqeurs nommés
/*$sql = "INSERT INTO voiture (marque, modele, kilometrage, carburant, carroserie, prix) VALUES (:marque, :modele, :kilometrage, :carburant, :carroserie, :prix)";
$reponse = $connexion->prepare($sql);

// recuperation des valeurs issues de la soumission du formulaire
$marque = $_GET["marque"];
$modele = $_GET["modele"];
$kilometrage = $_GET["kilometrage"];
$carburant = $_GET["carburant"];
$carroserie = $_GET["carroserie"];
$prix = $_GET["prix"];

// execution de la requete prepareé

$reponse->execute( array( ":marque" =>$marque,
                          ":modele" =>$modele,
                          ":kilometrage" =>$kilometrage,
                          ":carburant" =>$carburant,
                          ":carroserie" =>$carroserie,
                          ":prix" =>$prix));*/
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moteur de Recherche</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
    <div class="logo">
      <img src="assets/photos/vintage_cars.png">
      <h1>Vroomissimo</h1>
    </div>
    <div class="navigation">
      <ul>
        <li><a href="http://localhost/php/vroomissimo/index.php">Accueil</a><li>
        <li><a href=#>Lister</a><li>
        <li><a href=#>Connection</a><li>
        <li><a href=#>Panier</a><li>
      </ul>
    </div>

  </header>
    <div id="form_inserer">
        <form method="GET">
            <label for="marque">Marque:</label>
            <input type="text" name="marque">
            <br/>
            <label for="modele">Modele:</label>
            <input type="text" name="modele">
            <br/>
            <label for="kilometrage">Kilometrage:</label>
            <input type="text" name="kilometrage">
            <br/>
            <label for="carburant">Carburant:</label>
            <input type="text" name="carburant">
            <br/>
            <label for="carroserie">Carroserie:</label>
            <input type="text" name="carroserie">
            <br/>
            <label for="prix">Prix:</label>
            <input type="text" name="prix">
            <br/>
            <input type="submit" value="Soumettre"></input>
        </form>
</div>
</body>
</html>