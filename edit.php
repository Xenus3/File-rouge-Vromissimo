<?php

session_start();
include ('dbconfig.php');



	if (isset($_GET['edit'])) {

		$id = $_GET['edit'];
		$update = true;
		$sql = "SELECT * FROM voiture WHERE id_voiture=:id";
        $edit = $bdd->prepare($sql);
        $edit->execute( array(":id"=>$id));

		if ($edit->rowCount() == 1 ) {

			$n = $edit->fetch(PDO::FETCH_ASSOC);

            $photo = $n['photos_1'];
			      $marque = $n['marque'];
			      $modele = $n['modele'];
            $kilometrage = $n['kilometrage'];
            $carburant = $n['carburant'];
            $carroserie = $n['carroserie'];
            $prix = $n['prix'];

            if (isset($_POST['modifier'])) {

              $id = $_POST['id'];
              var_dump($id);
              $marque = $_POST['marque'];
              $modele = $_POST['modele'];
              $kilometrage = $_POST['kilometrage'];
              $carburant = $_POST['carburant'];
              $carroserie = $_POST['carroserie'];
              $prix = $_POST['prix'];
              //$photo = $_POST['file'];
              $targetDir = "assets/photos/";
              $fileName = basename($_FILES["file"]["name"] );
              $targetFilePath = $targetDir . $fileName;
          
              $sql = "UPDATE voiture SET marque=:marque, modele=:modele, kilometrage=:kilometrage, carburant=:carburant, carroserie=:carroserie, prix=:prix, photos_1=:photo WHERE id_voiture=:id";

              $edit = $bdd->prepare($sql);

              $edit->execute( array(":id"=>$id,
                                    ":marque"=>$marque,
                                    ":modele"=>$modele,
                                    ":kilometrage"=>$kilometrage,
                                    ":carburant"=>$carburant,
                                    ":carroserie"=>$carroserie,
                                    ":prix"=>$prix,
                                    ":photo"=>$targetFilePath ));

              $_SESSION['message'] = "Address updated!"; 

              header('location: http://localhost/php/vroomissimo/index.php');
          }
          
		}
   
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
    <?php include("header.php"); ?>
    <div id="form_inserer">
        <h1 style="text-align:center; padding-bottom:60px">Modifiez votre Annonce</h1>
        <form method="POST" id="form_2" action="" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?= $id ?>">
            <label for="marque">Marque:</label>
            <input type="text" name="marque" required value="<?= $marque ?>">
            <br/>
            <label for="modele">Modele:</label>
            <input type="text" name="modele" required value="<?= $modele ?>">
            <br/>
            <label for="kilometrage">Kilometrage:</label>
            <input type="text" name="kilometrage" required value=<?= $kilometrage ?>>
            <br/>
            <label for="carburant">Carburant:</label>
            <input type="text" name="carburant" required value=<?= $carburant ?>>
            <br/>
            <label for="carroserie">Carroserie:</label>
            <input type="text" name="carroserie" required value=<?= $carroserie ?>>
            <br/>
            <label for="prix">Prix:</label>
            <input type="text" name="prix" required value=<?= $prix ?>>
            <br/>
            <label for="image">Selectionnez une image:</label>
            <input type="file" name="file" >
            <?php if ($update === true): ?>
            <input type="submit" value="Modifier" name="modifier" style="background: #556B2F; width: 30%;"></input>
            <?php else: ?>
            <input type="submit" value="Soumettre" name="soumettre" style="width: 30%"></input>
            <?php endif ?>
        </form>
</div>
</body>
</html>


