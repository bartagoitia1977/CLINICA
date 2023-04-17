CREATE DATABASE  IF NOT EXISTS `clinica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `cpf_sec` varchar(11) NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL,
  `cpf_dentista` varchar(11) NOT NULL,
  `data_agendamento` date NOT NULL,
  `hora_agendamento` time NOT NULL,
  `status_agendamento` varchar(20) NOT NULL,
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_agendamento`),
  KEY `cpf_sec` (`cpf_sec`),
  KEY `cpf_paciente` (`cpf_paciente`),
  KEY `cpf_dentista` (`cpf_dentista`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`cpf_sec`) REFERENCES `secretaria` (`cpf_sec`),
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf_paciente`),
  CONSTRAINT `agendamento_ibfk_3` FOREIGN KEY (`cpf_dentista`) REFERENCES `medico_dentista` (`cpf_dentista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistido_por`
--

DROP TABLE IF EXISTS `assistido_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistido_por` (
  `cpf_tec` varchar(11) NOT NULL,
  `cod_procedimento` int NOT NULL,
  PRIMARY KEY (`cpf_tec`,`cod_procedimento`),
  KEY `cod_procedimento` (`cod_procedimento`),
  CONSTRAINT `assistido_por_ibfk_1` FOREIGN KEY (`cpf_tec`) REFERENCES `tec_saude_bucal` (`cpf_tec`),
  CONSTRAINT `assistido_por_ibfk_2` FOREIGN KEY (`cod_procedimento`) REFERENCES `procedimento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistido_por`
--

LOCK TABLES `assistido_por` WRITE;
/*!40000 ALTER TABLE `assistido_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `assistido_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `cpf_paciente` varchar(11) NOT NULL,
  `cpf_dentista` varchar(11) NOT NULL,
  `data_consulta` date NOT NULL,
  PRIMARY KEY (`cpf_paciente`,`cpf_dentista`,`data_consulta`),
  KEY `cpf_dentista` (`cpf_dentista`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf_paciente`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`cpf_dentista`) REFERENCES `medico_dentista` (`cpf_dentista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES ('11122233246','11122233341','2023-04-09'),('55566677789','11122233341','2023-04-05'),('55566677789','11122233341','2023-04-07'),('11122233246','22233344452','2023-04-06'),('55566677789','22233344452','2023-04-08');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `cpf_pessoa` char(11) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `num` varchar(10) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` char(2) NOT NULL,
  `cep` varchar(10) NOT NULL,
  PRIMARY KEY (`cpf_pessoa`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`cpf_pessoa`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura` (
  `cod_fatura` int NOT NULL AUTO_INCREMENT,
  `valor_total` decimal(10,2) NOT NULL,
  `data_pag` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `dt_venc` date NOT NULL,
  `dt_geracao` date NOT NULL,
  `cod_ordem` int NOT NULL,
  PRIMARY KEY (`cod_fatura`),
  KEY `cod_ordem` (`cod_ordem`),
  CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`cod_ordem`) REFERENCES `ordem_de_compra` (`cod_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filial` (
  `cnpj_filial` varchar(18) NOT NULL,
  `edifício` varchar(50) NOT NULL,
  `numero` int NOT NULL,
  `data_abertura` date NOT NULL,
  `cep` varchar(8) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`cnpj_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES ('12345678901234','Edifício A',123,'2010-03-08','12345678','(11) 1234-5678','filiala@clinica.com'),('45678901234567','Edifício C',789,'2015-05-20','45678901','(11) 3456-7890','filialc@clinica.com'),('98765432109876','Edifício B',456,'2022-02-01','87654321','(11) 2345-6789','filialb@clinica.com');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `codigo_horario` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `dia` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_horario`),
  UNIQUE KEY `hora_inicio` (`hora_inicio`,`hora_fim`,`dia`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'Segunda-feira das 8h às 10h','08:00:00','10:00:00','Segunda-feira'),(2,'Segunda-feira das 14h às 18h','14:00:00','18:00:00','Segunda-feira'),(3,'Terça-feira das 14h às 16h','14:00:00','16:00:00','Terça-feira'),(4,'Terça-feira das 09h às 12h','09:00:00','12:00:00','Terça-feira'),(5,'Quarta-feira das 10h às 12h','10:00:00','12:00:00','Quarta-feira'),(6,'Quarta-feira das 8h às 11h','08:00:00','11:00:00','Quarta-feira'),(7,'Quinta-feira das 13h às 15h','13:00:00','15:00:00','Quinta-feira'),(8,'Quinta-feira das 08h às 12h','08:00:00','12:00:00','Quinta-feira'),(9,'Sexta-feira das 9h às 11h','09:00:00','11:00:00','Sexta-feira'),(10,'Sexta-feira das 14h às 17h','14:00:00','17:00:00','Sexta-feira'),(11,'Sábado das 8h às 12h','08:00:00','12:00:00','Sábado');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_produto`
--

DROP TABLE IF EXISTS `item_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_produto` (
  `cod_produto` int NOT NULL,
  `cod_ord_compra` int NOT NULL,
  `num_lote` varchar(50) NOT NULL,
  `qtd_solicitada` int NOT NULL,
  PRIMARY KEY (`cod_produto`,`cod_ord_compra`),
  KEY `cod_ord_compra` (`cod_ord_compra`),
  CONSTRAINT `item_produto_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`),
  CONSTRAINT `item_produto_ibfk_2` FOREIGN KEY (`cod_ord_compra`) REFERENCES `ordem_de_compra` (`cod_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_produto`
--

LOCK TABLES `item_produto` WRITE;
/*!40000 ALTER TABLE `item_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_solicitado`
--

DROP TABLE IF EXISTS `item_solicitado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_solicitado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_produto` int NOT NULL,
  `cod_pedido_material_cir` int NOT NULL,
  `quant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_produto` (`cod_produto`),
  KEY `cod_pedido_material_cir` (`cod_pedido_material_cir`),
  CONSTRAINT `item_solicitado_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`),
  CONSTRAINT `item_solicitado_ibfk_2` FOREIGN KEY (`cod_pedido_material_cir`) REFERENCES `pedido_material_cir` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_solicitado`
--

LOCK TABLES `item_solicitado` WRITE;
/*!40000 ALTER TABLE `item_solicitado` DISABLE KEYS */;
INSERT INTO `item_solicitado` VALUES (1,1,4,5),(2,2,4,5),(3,3,5,8),(4,4,5,6),(5,5,6,4),(6,9,4,5),(7,10,4,6),(8,10,4,6),(9,10,4,6),(10,10,4,6);
/*!40000 ALTER TABLE `item_solicitado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualiza_quant_produto` AFTER INSERT ON `item_solicitado` FOR EACH ROW BEGIN
    UPDATE produto
    SET quant_atual = quant_atual - NEW.quant
    WHERE cod_produto = NEW.cod_produto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medico_dentista`
--

DROP TABLE IF EXISTS `medico_dentista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico_dentista` (
  `cpf_dentista` char(11) NOT NULL,
  `num_carteira_trab` varchar(20) NOT NULL,
  `dt_admissao` date NOT NULL,
  `cfo` varchar(10) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`cpf_dentista`),
  CONSTRAINT `medico_dentista_ibfk_1` FOREIGN KEY (`cpf_dentista`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_dentista`
--

LOCK TABLES `medico_dentista` WRITE;
/*!40000 ALTER TABLE `medico_dentista` DISABLE KEYS */;
INSERT INTO `medico_dentista` VALUES ('11122233341','CT-001','2010-03-08','01234','Ortodontia'),('22233344452','CT-002','2010-06-25','12345','Implantodontia'),('33344455563','CT-003','2015-02-05','23456','Cirurgia Buco-Maxilo-Facial'),('44455566674','CT-004','2010-03-08','34567','Odontopediatria');
/*!40000 ALTER TABLE `medico_dentista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_possui_horario`
--

DROP TABLE IF EXISTS `medico_possui_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico_possui_horario` (
  `cpf_dentista` varchar(11) NOT NULL,
  `cod_horario` int NOT NULL,
  PRIMARY KEY (`cpf_dentista`,`cod_horario`),
  KEY `cod_horario` (`cod_horario`),
  CONSTRAINT `medico_possui_horario_ibfk_1` FOREIGN KEY (`cpf_dentista`) REFERENCES `medico_dentista` (`cpf_dentista`),
  CONSTRAINT `medico_possui_horario_ibfk_2` FOREIGN KEY (`cod_horario`) REFERENCES `horario` (`codigo_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_possui_horario`
--

LOCK TABLES `medico_possui_horario` WRITE;
/*!40000 ALTER TABLE `medico_possui_horario` DISABLE KEYS */;
INSERT INTO `medico_possui_horario` VALUES ('11122233341',1),('22233344452',1),('11122233341',2),('22233344452',2),('11122233341',3),('22233344452',3),('22233344452',4),('22233344452',5),('22233344452',6),('22233344452',7);
/*!40000 ALTER TABLE `medico_possui_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_de_compra`
--

DROP TABLE IF EXISTS `ordem_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_de_compra` (
  `cod_compra` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `total_consolidado` decimal(10,2) NOT NULL,
  `foi_cancelada` tinyint(1) DEFAULT NULL,
  `cnpj_filial` varchar(18) NOT NULL,
  `dt_realiza` date NOT NULL,
  PRIMARY KEY (`cod_compra`),
  KEY `cnpj_filial` (`cnpj_filial`),
  CONSTRAINT `ordem_de_compra_ibfk_1` FOREIGN KEY (`cnpj_filial`) REFERENCES `filial` (`cnpj_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_de_compra`
--

LOCK TABLES `ordem_de_compra` WRITE;
/*!40000 ALTER TABLE `ordem_de_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `cpf_paciente` char(11) NOT NULL,
  `idade` int NOT NULL,
  `em_tratamento` tinyint(1) NOT NULL,
  PRIMARY KEY (`cpf_paciente`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cpf_paciente`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('07114896455',34,1),('11122233246',24,1),('55566677768',48,0),('55566677789',44,0);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_idade` BEFORE INSERT ON `paciente` FOR EACH ROW SET NEW.idade = (SELECT YEAR(CURDATE()) - YEAR(data_nasc) FROM PESSOA WHERE cpf = NEW.cpf_paciente) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido_material_cir`
--

DROP TABLE IF EXISTS `pedido_material_cir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_material_cir` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `status_pedido` varchar(50) NOT NULL,
  `data_pedido` date NOT NULL,
  `cod_procedimento` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cod_procedimento` (`cod_procedimento`),
  CONSTRAINT `pedido_material_cir_ibfk_1` FOREIGN KEY (`cod_procedimento`) REFERENCES `procedimento` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_material_cir`
--

LOCK TABLES `pedido_material_cir` WRITE;
/*!40000 ALTER TABLE `pedido_material_cir` DISABLE KEYS */;
INSERT INTO `pedido_material_cir` VALUES (4,'Concluído','2022-03-10',4),(5,'Concluído','2022-03-10',2),(6,'Concluído','2022-03-10',3);
/*!40000 ALTER TABLE `pedido_material_cir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf` char(11) NOT NULL,
  `rg` varchar(7) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(11) NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `tipo_sang` varchar(3) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('00011122231','0123456','Juliana Oliveira','1950-10-10','juliana.oliveira@gmail.com','11876543210','F','O-'),('07114896455','3456789','Bruno Silva','1989-01-01','bruno.silva@gmail.com','81995975456','M','O+'),('11122233246','1234567','Lucas Santos','1999-11-11','lucas.santos@gmail.com','11765432109','M','B+'),('11122233341','1234567','João da Silva','1990-01-01','joao.silva@gmail.com','11987654321','M','AB+'),('22233344452','2345678','Maria Oliveira','1995-02-02','maria.oliveira@gmail.com','11876543210','F','O-'),('22233344456','2345678','Amanda Souza','1994-12-12','amanda.souza@gmail.com','11654321098','F','A-'),('33344455563','3456789','José Santos','1985-03-03','jose.santos@gmail.com','11765432109','M','B+'),('33344455566','3456789','Bruno Rodrigues','1984-11-13','bruno.rodrigues@gmail.com','11543210987','M','AB-'),('44455566674','4567890','Ana Souza','1980-04-04','ana.souza@gmail.com','11654321098','F','A-'),('44455567774','4567890','Luana Pereira','1989-10-14','luana.pereira@gmail.com','11432109876','F','O+'),('55566677768','5678901','Pedro Rodrigues','1975-05-05','pedro.rodrigues@gmail.com','11543210987','M','AB-'),('55566677789','5678901','Roberto Almeida','1979-09-15','roberto.almeida@gmail.com','11321098765','M','A+'),('66677788859','6789012','Mariana Pereira','1970-06-06','mariana.pereira@gmail.com','11432109876','F','O+'),('77788899910','7890123','Paulo Almeida','1965-07-07','paulo.almeida@gmail.com','11321098765','M','B-'),('88899900031','8901234','Carla Costa','1960-08-08','carla.costa@gmail.com','11210987654','F','A+'),('99900011522','9012345','Fernando Silva','1955-09-09','fernando.silva@gmail.com','11987654321','M','AB+');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimento`
--

DROP TABLE IF EXISTS `procedimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimento` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `data_procedimento` date NOT NULL,
  `status_procedimento` varchar(50) NOT NULL,
  `id_tratamento` int NOT NULL,
  `cpf_dentista` varchar(11) NOT NULL,
  `cpf_tecnico` varchar(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `id_tratamento` (`id_tratamento`),
  KEY `cpf_dentista` (`cpf_dentista`),
  KEY `cpf_tecnico` (`cpf_tecnico`),
  CONSTRAINT `procedimento_ibfk_1` FOREIGN KEY (`id_tratamento`) REFERENCES `tratamento` (`id_tratamento`),
  CONSTRAINT `procedimento_ibfk_2` FOREIGN KEY (`cpf_dentista`) REFERENCES `medico_dentista` (`cpf_dentista`),
  CONSTRAINT `procedimento_ibfk_3` FOREIGN KEY (`cpf_tecnico`) REFERENCES `tec_saude_bucal` (`cpf_tec`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimento`
--

LOCK TABLES `procedimento` WRITE;
/*!40000 ALTER TABLE `procedimento` DISABLE KEYS */;
INSERT INTO `procedimento` VALUES (2,'Limpeza','Preventivo','2022-03-10','Concluído',1,'11122233341','55566677768'),(3,'Extração de Dente','Corretivo','2022-02-15','Concluído',2,'11122233341','55566677768'),(4,'Restauração','Corretivo','2022-01-20','Concluído',3,'11122233341','55566677768');
/*!40000 ALTER TABLE `procedimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `cod_produto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `fabricante` varchar(50) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `tipo_unidade` varchar(20) NOT NULL,
  `qtd_minima` int NOT NULL,
  `dt_validade` date NOT NULL,
  `dt_fabricacao` date NOT NULL,
  `quant_atual` int NOT NULL,
  PRIMARY KEY (`cod_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Escova de Dentes','Colgate',4.99,'unidade',10,'2024-06-30','2022-01-01',95),(2,'Pasta de Dentes','Colgate',3.49,'unidade',5,'2024-06-30','2022-01-01',75),(3,'Enxaguante Bucal','Listerine',7.99,'ml',50,'2023-12-31','2021-06-01',192),(4,'Fio Dental','Oral-B',2.99,'metro',20,'2025-03-31','2022-03-01',144),(5,'Escova Interdental','TePe',9.99,'unidade',5,'2024-09-30','2022-01-01',36),(6,'Gel Anestésico','Dental Speed',15.99,'grama',10,'2023-06-30','2022-01-01',30),(7,'Cera Ortodôntica','Ortho Caps',4.99,'unidade',10,'2024-12-31','2022-01-01',60),(8,'Clareador Dental','Whiteness',49.99,'seringa',2,'2023-06-30','2022-01-01',10),(9,'Prótese Dentária','DentFlex',499.99,'unidade',1,'2026-12-31','2022-01-01',78),(10,'Moldeira para Clareamento','Sorriso Ideal',29.99,'unidade',5,'2026-06-30','2022-01-01',100);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secretaria` (
  `cpf_sec` char(11) NOT NULL,
  `num_carteira_trab` varchar(20) NOT NULL,
  `dt_admissao` date NOT NULL,
  PRIMARY KEY (`cpf_sec`),
  CONSTRAINT `secretaria_ibfk_1` FOREIGN KEY (`cpf_sec`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES ('00011122231','67890','2022-01-01'),('88899900031','12345','2010-03-08'),('99900011522','54321','2020-05-20');
/*!40000 ALTER TABLE `secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tec_saude_bucal`
--

DROP TABLE IF EXISTS `tec_saude_bucal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tec_saude_bucal` (
  `cpf_tec` char(11) NOT NULL,
  `num_carteira_trab` varchar(20) NOT NULL,
  `dt_admissao` date NOT NULL,
  `diploma_ens_medio` tinyint(1) NOT NULL,
  `dt_diploma` date NOT NULL,
  PRIMARY KEY (`cpf_tec`),
  CONSTRAINT `tec_saude_bucal_ibfk_1` FOREIGN KEY (`cpf_tec`) REFERENCES `pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tec_saude_bucal`
--

LOCK TABLES `tec_saude_bucal` WRITE;
/*!40000 ALTER TABLE `tec_saude_bucal` DISABLE KEYS */;
INSERT INTO `tec_saude_bucal` VALUES ('55566677768','CTSB-001','2010-03-08',1,'2020-12-30'),('66677788859','CTSB-002','2010-03-08',1,'2021-12-31'),('77788899910','CTSB-003','2010-03-08',1,'2018-12-30');
/*!40000 ALTER TABLE `tec_saude_bucal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecsaude_possui_horario`
--

DROP TABLE IF EXISTS `tecsaude_possui_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecsaude_possui_horario` (
  `cpf_tec` varchar(11) NOT NULL,
  `cod_horario` int NOT NULL,
  PRIMARY KEY (`cpf_tec`,`cod_horario`),
  KEY `cod_horario` (`cod_horario`),
  CONSTRAINT `tecsaude_possui_horario_ibfk_1` FOREIGN KEY (`cpf_tec`) REFERENCES `tec_saude_bucal` (`cpf_tec`),
  CONSTRAINT `tecsaude_possui_horario_ibfk_2` FOREIGN KEY (`cod_horario`) REFERENCES `horario` (`codigo_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecsaude_possui_horario`
--

LOCK TABLES `tecsaude_possui_horario` WRITE;
/*!40000 ALTER TABLE `tecsaude_possui_horario` DISABLE KEYS */;
INSERT INTO `tecsaude_possui_horario` VALUES ('55566677768',1),('77788899910',1),('55566677768',2),('66677788859',2),('66677788859',3),('77788899910',3),('66677788859',4),('55566677768',5),('55566677768',6),('66677788859',7);
/*!40000 ALTER TABLE `tecsaude_possui_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_tratamento`
--

DROP TABLE IF EXISTS `tipo_tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_tratamento` (
  `cod_tipo_trat` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_tipo_trat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_tratamento`
--

LOCK TABLES `tipo_tratamento` WRITE;
/*!40000 ALTER TABLE `tipo_tratamento` DISABLE KEYS */;
INSERT INTO `tipo_tratamento` VALUES (1,'Tratamento de canal'),(2,'Extração dentária'),(3,'Implante dentário'),(4,'Limpeza dentária');
/*!40000 ALTER TABLE `tipo_tratamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamento`
--

DROP TABLE IF EXISTS `tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamento` (
  `id_tratamento` int NOT NULL AUTO_INCREMENT,
  `status_tratamento` varchar(50) NOT NULL,
  `obs` varchar(500) DEFAULT NULL,
  `motivo` varchar(500) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `cpf_paciente` varchar(11) NOT NULL,
  `cpf_dentista` varchar(11) NOT NULL,
  `cod_tipo_trat` int NOT NULL,
  PRIMARY KEY (`id_tratamento`),
  KEY `cpf_paciente` (`cpf_paciente`),
  KEY `cpf_dentista` (`cpf_dentista`),
  KEY `cod_tipo_trat` (`cod_tipo_trat`),
  CONSTRAINT `tratamento_ibfk_1` FOREIGN KEY (`cpf_paciente`) REFERENCES `paciente` (`cpf_paciente`),
  CONSTRAINT `tratamento_ibfk_2` FOREIGN KEY (`cpf_dentista`) REFERENCES `medico_dentista` (`cpf_dentista`),
  CONSTRAINT `tratamento_ibfk_3` FOREIGN KEY (`cod_tipo_trat`) REFERENCES `tipo_tratamento` (`cod_tipo_trat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamento`
--

LOCK TABLES `tratamento` WRITE;
/*!40000 ALTER TABLE `tratamento` DISABLE KEYS */;
INSERT INTO `tratamento` VALUES (1,'Em andamento','Tratamento de canal','Dente com cárie profunda','2023-04-05','2023-04-06','55566677789','11122233341',1),(2,'Concluído',NULL,'Extração de dente do siso','2023-04-06','2023-04-06','11122233246','22233344452',2),(3,'Em andamento','Ortodontia','Má oclusão','2023-04-06','2023-04-06','11122233246','11122233341',3),(4,'Concluído',NULL,'Implante dentário','2023-04-06','2023-04-06','55566677789','22233344452',4),(5,'Em andamento','Tratamento de canal','Dente com cárie profunda','2023-04-06','2023-04-06','55566677789','11122233341',1);
/*!40000 ALTER TABLE `tratamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tratamento_por_paciente`
--

DROP TABLE IF EXISTS `tratamento_por_paciente`;
/*!50001 DROP VIEW IF EXISTS `tratamento_por_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tratamento_por_paciente` AS SELECT 
 1 AS `cpf_paciente`,
 1 AS `cpf_dentista`,
 1 AS `cod_tipo_trat`,
 1 AS `quantidade_tratamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_consultas`
--

DROP TABLE IF EXISTS `view_consultas`;
/*!50001 DROP VIEW IF EXISTS `view_consultas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_consultas` AS SELECT 
 1 AS `id_tratamento`,
 1 AS `cpf_paciente`,
 1 AS `cpf_dentista`,
 1 AS `codigo_procedimento`,
 1 AS `descricao_procedimento`,
 1 AS `tipo_procedimento`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'clinica'
--

--
-- Dumping routines for database 'clinica'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_qtd_estoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_qtd_estoque`(cd_pro int) RETURNS int
return (SELECT quant_atual FROM PRODUTO WHERE cod_produto = cd_pro) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_verifica_atendimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_verifica_atendimento`(cod INT, qtd INT) RETURNS tinyint(1)
BEGIN
    DECLARE qtd_atual INT;
    SELECT quant_atual INTO qtd_atual FROM PRODUTO WHERE cod = cod_produto;
    RETURN qtd_atual >= qtd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `tratamento_por_paciente`
--

/*!50001 DROP VIEW IF EXISTS `tratamento_por_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tratamento_por_paciente` AS select `t`.`cpf_paciente` AS `cpf_paciente`,`t`.`cpf_dentista` AS `cpf_dentista`,`t`.`cod_tipo_trat` AS `cod_tipo_trat`,count(0) AS `quantidade_tratamento` from `tratamento` `t` where (`t`.`data_inicio` between '2022-01-01' and '2023-12-31') group by `t`.`cpf_paciente`,`t`.`cpf_dentista`,`t`.`cod_tipo_trat` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_consultas`
--

/*!50001 DROP VIEW IF EXISTS `view_consultas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_consultas` AS select `t`.`id_tratamento` AS `id_tratamento`,`t`.`cpf_paciente` AS `cpf_paciente`,`m`.`cpf_dentista` AS `cpf_dentista`,`p`.`codigo` AS `codigo_procedimento`,`p`.`descricao` AS `descricao_procedimento`,`p`.`tipo` AS `tipo_procedimento` from ((`tratamento` `t` join `procedimento` `p` on((`t`.`id_tratamento` = `p`.`id_tratamento`))) join `medico_dentista` `m` on((`p`.`cpf_dentista` = `m`.`cpf_dentista`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 12:34:40
