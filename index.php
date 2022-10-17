<?php 

session_start();

$bdd = new PDO('mysql:host=localhost;dbname=vroomissimo;charset=utf8', 'root', 'Lens2022!');// on instancie un nouvel objet PDO pour nous connecter a notre base de donneés
$query = 'SELECT * from voiture natural join appartenir natural join photos';// on cree une variable pour stocker notre requete SQL
$allcars = $bdd->query($query);// on stock le resultat de la requete sur notre base donneés dans une variable
if(isset($_GET['s']) or isset($_GET['carburant']) or isset($_GET['modele'])) {// si l'une des zones de saisie est definie on declenche le block de code suivant
   // on definis no variable qui vont stocker le contenus de nos zones de saisies
    $recherche = htmlspecialchars($_GET['s']);
    $carburant = htmlspecialchars($_GET['carburant']);
    $modele = htmlspecialchars($_GET['modele']);
    // on definis une variable avec un tableau vide pour stocker les requetes complementaires
    $conditions = array();
    // on verifie si nos zones de saisie ne sont pas vide ensuite on ajoute des chaines de charactere a notre variable tableau
    if(!empty($recherche)) {
      $conditions[] = 'marque like "%'.$recherche.'%"';
    }
    if(!empty($carburant)) {
      $conditions[] = 'carburant like "%'.$carburant.'%"';
    }
    if(!empty($modele)) {
        $conditions[] = 'modele like "%'.$modele.'%"';
    }
    // si une des zones n'est pas vide on ajoute la chaine de character correspondante a la requete SQL initiale
    $sql = $query;
    if (count($conditions) > 0) {
      $sql .= " WHERE " . implode(' AND ', $conditions);
    }
    $allcars = $bdd->query($sql);
}
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
  <!--<div class="banner"></div>-->
  <div class="formulaire">
    <form method="GET" >
        <label for="s">Cherchez Votre Vehicule:</label><br/>
        <input type="search" name="s" placeholder="Par Marque" autocomplete="off">
        
        <br/>
        <!--<label for="carburant">par carburant</label><br/>-->
        <input type="search" id="carburant" name="carburant" placeholder="Par Carburant">
        <br/>
        <!--<label for="modele">Filtrer par modele:</label><br/>-->
        <input type="search" id="modele" name="modele" placeholder="Par Modele">
        <br/>
        <br/>
        <a href="http://localhost/php/vroomissimo/index.php">Reinitialiser</a>
        <input type="submit" name="Rechercher" value="Lancer Recherche">
        <!--<input type="search" id="Essence" name="carburant" value="Essence">
        <label for="Essence">Essence</label><br>-->
    </form>
    </div>
    <br/>
    <section class="afficher_voiture">
    
    <!-- <table class="centre" id="jolie">
                    <tr> <td> Marque </td> <td> Modèle </td> <td> prix </td><td> Kilométrage </td><td> Carburant </td><td> Carrosserie </td><td> Photo </td> </tr> -->
        <?php 
          // on verifie si la valeure de la requete sur notre base de donneés n'est pas nulle
            if($allcars->rowCount() > 0)  {
                  
              // tant que la variable voiture retourne des valeurs on cree des lignes dans un tableau HTML
              while($voiture = $allcars->fetch()) {
                    ?>
                    <!-- <tr><td><?= $voiture['marque'] ?></td>
                    <td><?=  $voiture['modele'] ?></td>
                    <td><?=  $voiture['prix'] ?>$</td>
                    <td><?=  $voiture['kilometrage'] ?></td>
                    <td><?=  $voiture['carburant'] ?></td>
                    <td><?=  $voiture['carroserie'] ?></td>
                    <td><img src="<?= $voiture['lien'] ?>"></td></tr> -->

                    <div class="afficher_article"> 
                    <img src="<?= $voiture['lien'] ?>">
                    <p>Marque: <?= $voiture['marque'] ?></p>
                    <p>Modele: <?=  $voiture['modele'] ?></p>
                    <p>Kilometrage: <?=  $voiture['kilometrage'] ?></p>
                    <p>Carburant: <?=  $voiture['carburant'] ?></p>
                    <p>Carroserrie: <?=  $voiture['carroserie'] ?></p>
                    <p>Prix: <?=  $voiture['prix'] ?>€</p>
                    <a class="bout_modif" http=#>Modifier</a>
                    <a class="bout_efac" http=#>Supprimer</a>
                    </div>

                    
                    
                    <?php
                  }  

            }else {
                ?>
                <p>Aucune voiture trouveé</p>
                <?php
            }
           
        
        ?>

    </section>
   
    <!--<footer>Vroomissimo</footer>-->
      
</body>
</html>