<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moteur de Recherche</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
  <!--<header>
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

  </header>-->
  <?php include("header.php"); ?>
    <div id="form_inserer">
        <h1 style="text-align:center; padding-bottom:60px">Listez votre Vehicule</h1>
        <form method="POST" id="form_2" action="upload.php" enctype="multipart/form-data">
            <label for="marque">Marque:</label>
            <input type="text" name="marque" required>
            <br/>
            <label for="modele">Modele:</label>
            <input type="text" name="modele" required>
            <br/>
            <label for="kilometrage">Kilometrage:</label>
            <input type="text" name="kilometrage" required>
            <br/>
            <label for="carburant">Carburant:</label>
            <input type="text" name="carburant" required>
            <br/>
            <label for="carroserie">Carroserie:</label>
            <input type="text" name="carroserie" required>
            <br/>
            <label for="prix">Prix:</label>
            <input type="text" name="prix" required>
            <br/>
            <label for="image">Selectionnez une image:</label>
            <input type="file" name="file" >
            <input type="submit" value="Soumettre" name="soumettre"></input>
        </form>
</div>
</body>
</html>







