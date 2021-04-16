<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstoredb
-- ------------------------------------------------------
-- Server version	8.0.22
=======
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstoredb
-- ------------------------------------------------------
-- Server version	8.0.23
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4

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
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `hoadon_id` int NOT NULL AUTO_INCREMENT,
  `sach_id` int NOT NULL,
  `donGia` int DEFAULT NULL,
  PRIMARY KEY (`hoadon_id`,`sach_id`),
  KEY `fk_ct_sach_idx` (`sach_id`),
  CONSTRAINT `fk_ct_hd` FOREIGN KEY (`hoadon_id`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `fk_ct_sach` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `khachhang_id` int NOT NULL,
  `tongTien` int NOT NULL,
  `ngayXuat` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hoadon_kh_idx` (`khachhang_id`),
  CONSTRAINT `fk_hoadon_kh` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `hoTen` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `hoTen` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisach`
--

DROP TABLE IF EXISTS `loaisach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaisach` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `tenLoai` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moTa` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `tenLoai` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `moTa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisach`
--

LOCK TABLES `loaisach` WRITE;
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `loaisach` VALUES (1,'comedy','khong'),(2,'action','hanhdong');
=======
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;
UNLOCK TABLES;

--
<<<<<<< HEAD
=======
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ho` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sdt` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `queQuan` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`) /*!80000 INVISIBLE */,
  KEY `fk_nhanvien_role_idx` (`id_role`),
  CONSTRAINT `fk_nhanvien_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Le Duong','Duc','0123456789','DaLat','2000-04-28',0),(2,'Luc Tuan','Kien','01234567','Kien Giang','2021-04-21',0),(4,'Pham Trung','Kien','0152455','NhaTrang','2021-04-03',3);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
-- Table structure for table `nhaxb`
--

DROP TABLE IF EXISTS `nhaxb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhaxb` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `tenNXB` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien_he` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `tenNXB` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien_he` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhaxb`
--

LOCK TABLES `nhaxb` WRITE;
/*!40000 ALTER TABLE `nhaxb` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `nhaxb` VALUES (1,'abc','105 bach dang','123456'),(2,'kim dong','144 au co','weqweqweqw');
=======
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `nhaxb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
<<<<<<< HEAD
  `role_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `role_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `role` VALUES (1,'admin'),(2,'guest');
=======
INSERT INTO `role` VALUES (0,'Quan Ly'),(1,'Pho Quan Ly'),(2,'Truong Ca'),(3,'Nhan Vien Ban Hang');
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `tenSach` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `tenSach` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  `loaiSach` int NOT NULL,
  `tacGia` int NOT NULL,
  `nhaXB` int NOT NULL,
  `lanTaiBan` int NOT NULL,
  `donGia` int NOT NULL,
  `soLuongTon` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sach_loaiSach_idx` (`loaiSach`),
  KEY `fk_sach_tacgia_idx` (`tacGia`),
  KEY `fk_sach_nxb_idx` (`nhaXB`),
  CONSTRAINT `fk_sach_loaiSach` FOREIGN KEY (`loaiSach`) REFERENCES `loaisach` (`id`),
  CONSTRAINT `fk_sach_nxb` FOREIGN KEY (`nhaXB`) REFERENCES `nhaxb` (`id`),
  CONSTRAINT `fk_sach_tacgia` FOREIGN KEY (`tacGia`) REFERENCES `tacgia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `sach` VALUES (1,'def',1,1,1,2,5000,10),(2,'journey to the center of the earth',2,2,2,5,7000,5);
=======
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tacgia` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `hoTen` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
=======
  `hoTen` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `tacgia` VALUES (1,'duc','nam','29/12/2000'),(2,'kien','nam','29/12/2000');
=======
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_idx` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
=======
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  CONSTRAINT `fk_nhanvien_user` FOREIGN KEY (`id`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `user` VALUES (2,'kienluc','123',1);
=======
INSERT INTO `user` VALUES (1,'duc','123'),(2,'kienluc','123'),(4,'kien','123');
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

<<<<<<< HEAD
-- Dump completed on 2021-04-13 16:37:24
=======
-- Dump completed on 2021-04-17  0:25:43
>>>>>>> 5cba52ed8b770d5504e8ee4428abf9adc711f0f4
