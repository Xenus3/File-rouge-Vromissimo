<?php

function ajouter($marque, $modele, $annee_modele, $mise_en_circulation, $carrosserie, $kilometrage, $carburant, $prix, $couleur ) {
    if(require("connexion.php")) {
        $req = $access->prepare("INSERT into voitures (marque, modele, annee_modele, mise_en_circulation, carrosserie, kilometrage, carburant, prix, couleur) VALUES 
        ($marque, $modele, $annee_modele, $mise_en_circulation, $carrosserie, $kilometrage, $carburant, $prix, $couleur)");

        $req->execute(array($marque, $modele, $annee_modele, $mise_en_circulation, $carrosserie, $kilometrage, $carburant, $prix, $couleur));

        $req->closeCursor();
    }
}


function afficher() {

    if(require("connexion.php")) {
        $req=$access->prepare("SELECT marque, modele, prix, kilometrage, carburant, carrosserie, lien from voitures natural join appartenir natural join photos")
    }

        $req->execute();

        $data = $req->fetchAll(PDO::FETCH_OBJ);

        return $data;

        $req->closeCursor();
}


function supprimer($id) {
    if(require("connexion.php")) {
        $req=$access->prepare("DELETE * from voitures WHERE id_voiture=?");

        $req->execute(array($id));
    }
}

?>