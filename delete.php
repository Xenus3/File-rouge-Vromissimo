<?php

session_start();



include ('dbconfig.php');

$sql = "DELETE from voiture where id_voiture = :id";
$delete = $bdd->prepare($sql);
$id = $_SESSION["id"];
var_dump($id);
$delete->execute( array(":id"=>$id));

//header("location:http://localhost/php/vroomissimo/index.php");
