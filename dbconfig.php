<?php

$host = "localhost";
$dbname = "vroomissimo";
$username = "root"; 
$password = "Lens2022!";


try {
    $option = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);
    $bdd = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password, $option);
} catch (PDOException $e) {
    printf("Echec connexion : %s\n", $e->getMessage());
}