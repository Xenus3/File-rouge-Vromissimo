-- MySQL dump 10.13  Distrib 5.6.51, for Win64 (x86_64)
--
-- Host: localhost    Database: vroomissimo
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartenir` (
  `id_voiture` int NOT NULL,
  `id_photos` int NOT NULL,
  PRIMARY KEY (`id_voiture`,`id_photos`),
  KEY `id_photos` (`id_photos`),
  CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`),
  CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`id_photos`) REFERENCES `photos` (`id_photos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenir`
--

LOCK TABLES `appartenir` WRITE;
/*!40000 ALTER TABLE `appartenir` DISABLE KEYS */;
INSERT INTO `appartenir` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `appartenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avoir` (
  `id_voiture` int NOT NULL,
  `id_caracteristique` int NOT NULL,
  PRIMARY KEY (`id_voiture`,`id_caracteristique`),
  KEY `id_caracteristique` (`id_caracteristique`),
  CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`),
  CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`id_caracteristique`) REFERENCES `caracteristiques_technique` (`id_caracteristique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avoir`
--

LOCK TABLES `avoir` WRITE;
/*!40000 ALTER TABLE `avoir` DISABLE KEYS */;
INSERT INTO `avoir` VALUES (1,1),(2,1),(4,1),(6,1),(8,1),(10,1),(3,2),(5,2),(7,2),(9,2),(2,3),(3,3),(5,3),(9,3),(1,4),(4,4),(6,4),(7,4),(8,4),(10,4),(7,5),(2,6),(5,6),(9,6),(10,6),(1,7),(4,7),(6,7),(3,8),(4,8),(8,8),(9,8),(10,9),(5,10),(7,10),(8,10),(3,11),(4,12),(6,12),(10,12),(9,13),(10,15);
/*!40000 ALTER TABLE `avoir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonne_affaire`
--

DROP TABLE IF EXISTS `bonne_affaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonne_affaire` (
  `id_bonne_affaire` int NOT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bonne_affaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonne_affaire`
--

LOCK TABLES `bonne_affaire` WRITE;
/*!40000 ALTER TABLE `bonne_affaire` DISABLE KEYS */;
INSERT INTO `bonne_affaire` VALUES (1,'Très bon prix'),(2,'Bon prix'),(3,'Prix correct'),(4,'Pas d\'information');
/*!40000 ALTER TABLE `bonne_affaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristiques_technique`
--

DROP TABLE IF EXISTS `caracteristiques_technique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristiques_technique` (
  `id_caracteristique` int NOT NULL,
  `nom_caracteristique` varchar(50) DEFAULT NULL,
  `valeur_caracteristique` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_caracteristique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristiques_technique`
--

LOCK TABLES `caracteristiques_technique` WRITE;
/*!40000 ALTER TABLE `caracteristiques_technique` DISABLE KEYS */;
INSERT INTO `caracteristiques_technique` VALUES (1,'Transmission','Manuelle'),(2,'Transmission','Automatique'),(3,'Vitesses','5'),(4,'Vitesses','4'),(5,'Sieges','5'),(6,'Portes','5'),(7,'Portes','3'),(8,'Type de moteur','Avant'),(9,'Type de moteur','Arriere'),(10,'Puissance','50 CH'),(11,'Puissance','60 CH'),(12,'Puissance','70 CH'),(13,'Poids a vide','850 kg'),(14,'Type de moteur','900 kg'),(15,'Type de moteur','950 kg');
/*!40000 ALTER TABLE `caracteristiques_technique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenir` (
  `id_voiture` int NOT NULL,
  `id_equipement` int NOT NULL,
  PRIMARY KEY (`id_voiture`,`id_equipement`),
  KEY `id_equipement` (`id_equipement`),
  CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`),
  CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenir`
--

LOCK TABLES `contenir` WRITE;
/*!40000 ALTER TABLE `contenir` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description` (
  `id_description` int NOT NULL,
  `description` text,
  PRIMARY KEY (`id_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,'Voiture en bon etat, CT ok'),(2,'Carroserie en bon etat, pas cher'),(3,'Voiture economique(carburant, assurance)'),(4,'Toutes options, bon etat generale'),(5,'Voiture a achetr les yoeux fermés'),(6,'N\'hesitez pas a me contacter pour plus d\'infos'),(7,'Frais à prévoir éclat parbrise avant et 2 pneus arrière à prévoir'),(8,'Bonjour, je vend ma voiture sans CT, uniquement pour pieces'),(9,'Visible sur rendez-vous avec personne sérieuse et motivée.'),(10,'Controle technique fait le 20 Février 2018');
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipement` (
  `id_equipement` int NOT NULL,
  `nom_equipement` varchar(50) DEFAULT NULL,
  `category_equipment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement`
--

LOCK TABLES `equipement` WRITE;
/*!40000 ALTER TABLE `equipement` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantie`
--

DROP TABLE IF EXISTS `garantie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantie` (
  `id_garantie` int NOT NULL,
  `longueur_garantie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_garantie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantie`
--

LOCK TABLES `garantie` WRITE;
/*!40000 ALTER TABLE `garantie` DISABLE KEYS */;
INSERT INTO `garantie` VALUES (1,'3 mois'),(2,'6 mois'),(3,'12 mois'),(4,'24 mois');
/*!40000 ALTER TABLE `garantie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localisation`
--

DROP TABLE IF EXISTS `localisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localisation` (
  `id_localisation` int NOT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localisation`
--

LOCK TABLES `localisation` WRITE;
/*!40000 ALTER TABLE `localisation` DISABLE KEYS */;
INSERT INTO `localisation` VALUES (1,'Bruxelle','Belgique'),(2,'Zurich','Suisse'),(3,'Amsterdam','Pays-bas'),(4,'Rome','Italie'),(5,'Madrid','Espagne'),(6,'Paris','France'),(7,'Marseille','France'),(8,'Lille','France'),(9,'Lyon','France'),(10,'Bordeaux','France');
/*!40000 ALTER TABLE `localisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id_photos` int NOT NULL,
  `nom_photo` varchar(50) DEFAULT NULL,
  `lien` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id_photos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'Megane','assets/photos/Renault_Megane_II.jfif'),(2,'Corsa','assets/photos/opel_corsa.jpg'),(3,'206','assets/photos/Peugeot_206.jpg'),(4,'Logan','assets/photos/dacia-logan-2.jpg'),(5,'A4','assets/photos/Audi-A4.jpg'),(6,'Twingo','assets/photos/Renault_twingo.jpg'),(7,'C3','assets/photos/Citroën_C3.jpg'),(8,'Mondeo','assets/photos/Ford_Mondeo.jpg'),(9,'Golf','assets/photos/VW_Golf.jpg'),(10,'Uno','assets/photos/Fiat-uno.jpg');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendeur`
--

DROP TABLE IF EXISTS `vendeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendeur` (
  `id_vendeur` int NOT NULL,
  `type_vendeur` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_vendeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendeur`
--

LOCK TABLES `vendeur` WRITE;
/*!40000 ALTER TABLE `vendeur` DISABLE KEYS */;
INSERT INTO `vendeur` VALUES (1,'Pro','Verrill','Faure','04.04.57.17.98'),(2,'Particulier','Astolpho','Dupéré','04.01.45.07.87'),(3,'Pro','Soren','Gagné','01.87.05.19.95'),(4,'Pro','Bellamy','Leroy','04.09.26.31.82'),(5,'Particulier','Pierrette','Lanteigne','01.83.33.68.27'),(6,'Particulier','Franck','Marier','01.33.94.79.98'),(7,'Pro','Charles','Monjeau','05.77.26.87.70'),(8,'Particulier','Garland','Grondin','03.33.61.18.24'),(9,'Particulier','Clementine','Breton','04.51.15.52.88'),(10,'Pro','Clothilde','LeBatelier','05.21.23.66.40');
/*!40000 ALTER TABLE `vendeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiture` (
  `id_voiture` int NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `annee_modele` int DEFAULT NULL,
  `mise_en_circulation` date DEFAULT NULL,
  `carroserie` varchar(50) DEFAULT NULL,
  `kilometrage` varchar(50) DEFAULT NULL,
  `carburant` varchar(50) DEFAULT NULL,
  `prix` decimal(19,2) DEFAULT NULL,
  `couleur` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_garantie` int DEFAULT NULL,
  `id_bonne_affaire` int NOT NULL,
  `id_vendeur` int DEFAULT NULL,
  `id_description` int NOT NULL,
  `id_localisation` int DEFAULT NULL,
  PRIMARY KEY (`id_voiture`),
  UNIQUE KEY `id_description` (`id_description`),
  KEY `id_garantie` (`id_garantie`),
  KEY `id_bonne_affaire` (`id_bonne_affaire`),
  KEY `id_vendeur` (`id_vendeur`),
  KEY `id_localisation` (`id_localisation`),
  CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`id_garantie`) REFERENCES `garantie` (`id_garantie`),
  CONSTRAINT `voiture_ibfk_2` FOREIGN KEY (`id_bonne_affaire`) REFERENCES `bonne_affaire` (`id_bonne_affaire`),
  CONSTRAINT `voiture_ibfk_3` FOREIGN KEY (`id_vendeur`) REFERENCES `vendeur` (`id_vendeur`),
  CONSTRAINT `voiture_ibfk_4` FOREIGN KEY (`id_description`) REFERENCES `description` (`id_description`),
  CONSTRAINT `voiture_ibfk_5` FOREIGN KEY (`id_localisation`) REFERENCES `localisation` (`id_localisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voiture`
--

LOCK TABLES `voiture` WRITE;
/*!40000 ALTER TABLE `voiture` DISABLE KEYS */;
INSERT INTO `voiture` VALUES (1,'Renault','Megane',2010,'2012-03-25','Berline','150000 km','Essence',3000.00,'Marron',2,3,6,5,3),(2,'Opel','Corsa',1998,'2000-04-12','Berline','200000 km','Essence',2000.00,'Gris',1,2,7,3,7),(3,'Peugeot','206',2005,'2006-05-10','Berline','112000 km','Diesel',2500.00,'Blanc',3,4,10,2,1),(4,'Dacia','Logan',2006,'2008-11-26','Berline','170000 km','Essence',3200.00,'Noire',4,1,4,1,5),(5,'Audi','A4',2000,'2003-11-20','Berline','252000 km','Diesel',5000.00,'Metal',2,2,1,4,6),(6,'Renault','Twingo',2000,'2000-11-10','Berline','173000 km','Essence',1990.00,'Blanc',2,2,4,6,4),(7,'Citroen','C3',2000,'2004-06-17','Berline','205000 km','Essence',3000.00,'Bleu',1,4,8,10,2),(8,'Ford','Mondeo',1995,'1998-08-02','Berline','150000 km','Essence',1490.00,'Gris',1,4,9,9,8),(9,'Volkswagen','Golf',2000,'2003-07-10','Berline','300000 km','Diesel',3000.00,'Gris',2,3,8,7,5),(10,'Fiat','Uno',1990,'1992-06-28','Berline','92000 km','Essence',1300.00,'Bleu',2,3,5,8,10);
/*!40000 ALTER TABLE `voiture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vroomissimo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-14 11:36:04
