-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: petadopt
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_admin_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'ww','w@w','$2b$10$yGO6mVCiEKun2ieII12xc.ifd1pHa3Bt4LYo7cOM2wgRySEDkDklS');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `appointment_dt` datetime NOT NULL,
  `status` varchar(30) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (29,22,3,'2025-08-09 09:15:00','scheduled'),(34,29,1,'2025-08-01 10:00:00','cancelled'),(35,8,1,'2025-07-31 16:00:00','scheduled'),(37,2,2,'2025-08-08 16:45:00','cancelled'),(38,35,6,'2025-08-07 15:15:00','cancelled');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_adoptions`
--

DROP TABLE IF EXISTS `pet_adoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_adoptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `pet_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `adoption_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `pet_adoptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `pet_adoptions_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_adoptions`
--

LOCK TABLES `pet_adoptions` WRITE;
/*!40000 ALTER TABLE `pet_adoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_adoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_pet_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'kryptu','Dog','super',2,'/images/animals/animal-1-1753873756626.jpg',''),(2,'Buddy','Dog','Labrador',3,'/images/animals/animal-2-1753873168518.jpg','Friendly Labrador looking for a loving home.'),(3,'Whiskers','Cat','Siamese',2,'/images/animals/animal-3-1753873521450.jpg','Cute Siamese with blue eyes.'),(5,'BYD Seal','Cat','Dutch',2,'/images/animals/animal-5-1753873725179.jpg',''),(6,'Jerome','Dog','Pitbull',22,'/images/animals/Jerome.jpg','A man child'),(8,'Miku','Cat','Devon Rex',2,'https://th.bing.com/th/id/OIP.KaSOJdX6lSUKp5eL6PgdLQHaFj?w=245&h=184&c=7&r=0&o=7&dpr=2&pid=1.7&rm=3','you'),(9,'brownie','Dog','Cavapoo',5,'https://th.bing.com/th/id/OIP.2bxBELLx4dSUrqE3Iup8zgHaFN?w=272&h=190&c=7&r=0&o=7&dpr=2&pid=1.7&rm=3','');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'w','w@mail','$2b$10$Z1PZXtl9vgmJhtyBuKV9BOu7ud6NT1Pt/ASdkB1HhmqNNl0RQ4Pqe','222'),(8,'aa','aa@gmail.com','$2b$10$xMQ.vegz8YwxFFnGSC7RkewWIx18M9Y4f/i7jCfcmTU.OUXlJt5L6','123'),(17,'elly','nabilfahmi1603@gmail.com','$2b$10$cEFsGOplwsDhBGtgnVEuoeTmrXvHOnv8OqKTwEFkTYfa2Jw2n.oDm','90303279'),(22,'Tomato','t@gmail','$2b$10$J1Gc2TuLN.F37/TcEUKKZ.e69vqL451JUjJkkfX/CNQAv9fR92CPa',NULL),(29,'z','z@z','$2b$10$GTc1k6AHKBbMXaiNFVxASu65xcTGYMsiHf.N4r1hO1zINClRPf/Q.',NULL),(31,'test','test@gmail.com','$2b$10$Ipt0/YaCT0pBXF/MwVUBW.Xfr9WWyRm3j8vDk37D8W/B.i8cyz0qa',NULL),(32,'ccc','ccc@gmail.com','$2b$10$CHVt/qMzBzxl/AmurjcSZ.PA7JVSEsPFEJHJqpDuOwEp/Pa4HtqTq','111111'),(34,'NabilFahmi','nabilfahmi@email','$2b$10$/09vg30kmsUG/liM.riXhOcMRIzgBuTnk.BOVoQd5fA6CUFaXGMyC',NULL),(35,'romanium','d@dd','$2b$10$7YXEX5.ID30G9mkC2VwgFeySE0WH4.aGRtuXuIqxdG6TCxkbSlmY2','999'),(36,'tomato','tomato@qwe','$2b$10$xUdX./PB5TfGXcX28XjZE.QcixZcUejLuAzN5BTnWA3CkU5mDherG','1234567');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 20:14:09
