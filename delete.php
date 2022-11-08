<?php

session_start();
include ('dbconfig.php');

if (isset($_GET['del'])) {
	$id = $_GET['del'];
	$sql = "DELETE FROM voiture WHERE id_voiture=:id";
    $delete = $bdd->prepare($sql);
    $delete->execute( array(":id"=>$id));
	$_SESSION['message'] = "Annonce effacee!"; 
	header('location: index.php');
}

//header("location:http://localhost/php/vroomissimo/index.php");
