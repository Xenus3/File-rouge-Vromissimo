<?php
session_start();
include("dbconfig.php");





// preparation de la requete avec des marqeurs nommés
$sql = "INSERT into voiture (marque, modele, kilometrage, carburant, carroserie, prix, photos_1) values (:marque, :modele, :kilometrage, :carburant, :carroserie, :prix, :photos_1)";
$reponse = $bdd->prepare($sql);
$targetDir = "assets/photos/";
$fileName = basename($_FILES["file"]["name"] );
$targetFilePath = $targetDir . $fileName;
$fileType = pathinfo($targetFilePath,PATHINFO_EXTENSION);
$dbName = pathinfo($fileName, PATHINFO_FILENAME);
var_dump($dbName);

if(isset($_POST["soumettre"]) && !empty($_FILES["file"]["name"])){
         
 // Allow certain file formats
 $allowTypes = array('jpg','png','jpeg','gif','pdf', 'jfif');
 if(in_array($fileType, $allowTypes)){
    move_uploaded_file($_FILES["file"]["tmp_name"], $targetFilePath);
 }
    

  } 

// recuperation des valeurs issues de la soumission du formulaire
if(isset($_POST["marque"]) and isset($_POST["modele"]) and isset($_POST["kilometrage"]) and isset($_POST["carburant"]) and isset($_POST["carroserie"]) and isset($_POST["prix"]) and isset($_POST["soumettre"]) and !empty($_FILES["file"]["name"])){
$marque = $_POST["marque"];
$modele = $_POST["modele"];
$kilometrage = $_POST["kilometrage"];
$carburant = $_POST["carburant"];
$carroserie = $_POST["carroserie"];
$prix = $_POST["prix"];
$targetFilePath = $targetDir . $fileName;

// execution de la requete prepareé

$reponse->execute( array( ":marque" =>$marque,
                          ":modele" =>$modele,
                          ":kilometrage" =>$kilometrage,
                          ":carburant" =>$carburant,
                          ":carroserie" =>$carroserie,
                          ":prix" =>$prix,
                          ":photos_1" =>$targetFilePath));
}



  header("location: http://localhost/php/vroomissimo/lister.php");
  exit();

             


