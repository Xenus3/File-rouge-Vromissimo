<?php
try {
    $access = new pdo("mysql:host=localhost;dbname=vroomissimo;charset=utf8", "root", "Lens2022!");

    $access->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
} catch (Exception $e) {
    $e->getMessage(); 
}


?> 