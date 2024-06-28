-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: turmas
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `matricula` int NOT NULL,
  `cod_disciplina` varchar(10) NOT NULL,
  `cod_turma` int NOT NULL,
  `cod_prof` int NOT NULL,
  `ano` year NOT NULL,
  `frequencia` int NOT NULL,
  `nota` decimal(10,0) NOT NULL,
  PRIMARY KEY (`matricula`,`cod_disciplina`,`cod_turma`,`cod_prof`,`ano`),
  KEY `cod_disciplina` (`cod_disciplina`,`cod_turma`,`cod_prof`,`ano`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `alunos` (`matricula`),
  CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`cod_disciplina`, `cod_turma`, `cod_prof`, `ano`) REFERENCES `turma` (`cod_disciplina`, `cod_turma`, `cod_prof`, `ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (2015010101,'BD',1,212131,2015,8,8),(2015010101,'ENG',1,122135,2015,2,6),(2015010101,'POO',1,192011,2015,3,10),(2015010101,'WEB',1,192011,2015,1,10),(2015010102,'BD',1,212131,2015,8,8),(2015010102,'ENG',1,122135,2015,2,6),(2015010102,'POO',1,192011,2015,3,10),(2015010102,'WEB',1,192011,2015,1,10),(2015010103,'BD',2,212131,2015,8,8),(2015010103,'ENG',1,122135,2015,2,6),(2015010103,'POO',1,192011,2015,3,10),(2015010103,'WEB',1,192011,2015,1,10),(2015010104,'BD',1,212131,2015,8,8),(2015010104,'ENG',1,122135,2015,2,6),(2015010104,'POO',1,192011,2015,3,10),(2015010104,'WEB',1,192011,2015,1,10),(2015010105,'BD',2,212131,2015,8,8),(2015010105,'ENG',1,122135,2015,2,6),(2015010105,'POO',1,192011,2015,3,10),(2015010105,'WEB',1,192011,2015,1,10),(2015010106,'BD',2,212131,2015,8,8),(2015010106,'ENG',1,122135,2015,2,6),(2015010106,'POO',1,192011,2015,3,10),(2015010106,'WEB',1,192011,2015,1,10);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 17:53:48
