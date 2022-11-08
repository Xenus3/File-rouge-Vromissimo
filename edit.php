<?php
include ('lister.php');
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
		}
	}
