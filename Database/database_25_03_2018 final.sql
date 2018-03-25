-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: doantotnghiep
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `cong_ty`
--

DROP TABLE IF EXISTS `cong_ty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cong_ty` (
  `ma_cong_ty` int(9) NOT NULL AUTO_INCREMENT,
  `ten_cong_ty` varchar(500) CHARACTER SET utf8 NOT NULL,
  `dia_chi` varchar(500) CHARACTER SET utf8 NOT NULL,
  `dien_thoai` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 NOT NULL,
  `linh_vung_hoat_dong` text CHARACTER SET utf8,
  `mo_ta` text CHARACTER SET utf8,
  `logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `trang_thai` int(1) DEFAULT NULL,
  `ma_dai_dien` int(9) NOT NULL,
  PRIMARY KEY (`ma_cong_ty`),
  KEY `fk_cong_ty_dai_dien_cong_ty1_idx` (`ma_dai_dien`),
  CONSTRAINT `fk_cong_ty_dai_dien_cong_ty1` FOREIGN KEY (`ma_dai_dien`) REFERENCES `dai_dien_cong_ty` (`ma_dai_dien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cong_ty`
--

LOCK TABLES `cong_ty` WRITE;
/*!40000 ALTER TABLE `cong_ty` DISABLE KEYS */;
INSERT INTO `cong_ty` VALUES (1,'Công ty Hệ thống FPT','Keangnam - Hà Nội','0987654321','fpt@fpt.com.vn','fpt.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0),(2,'Công ty ABC','Haf Nooijbrfb','0987654321','abc.com.vn','abc.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0),(3,'Công ty hjv','Nooijbrfb','0987654321','vadsv.com.vn','ewfe.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0),(4,'Công ty jryku','Nooijbrfb','0987654321','bsb.com.vn','dfff.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0),(5,'Công ty htrj','Nooijbrfb','0987654321','etjr.com.vn','fgrht.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0),(6,'Công ty iukltyhj','Nooijbrfb','0987654321','bdnd.com.vn','erht.com.vn','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','null',1,0);
/*!40000 ALTER TABLE `cong_ty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dai_dien_cong_ty`
--

DROP TABLE IF EXISTS `dai_dien_cong_ty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dai_dien_cong_ty` (
  `ma_dai_dien` int(9) NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dia_chi` text CHARACTER SET utf8,
  `dien_thoai` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ma_dai_dien`),
  KEY `dai_dien_cong_ty_ibfk_2` (`email`),
  CONSTRAINT `dai_dien_cong_ty_ibfk_2` FOREIGN KEY (`email`) REFERENCES `login` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dai_dien_cong_ty`
--

LOCK TABLES `dai_dien_cong_ty` WRITE;
/*!40000 ALTER TABLE `dai_dien_cong_ty` DISABLE KEYS */;
INSERT INTO `dai_dien_cong_ty` VALUES (3,'Nguyễn Hoàng Long','Giám đốc','Phòng 201 - Tòa nhà B - Hai bà Trưng - Hà Nội','0987654321','daidiencongty@gmail.com','null'),(4,'Nguyễn Bảo Khánh','Giám đốc','Phong 401 - Tòa nhà số 1 - Hà Nội','0987654321','daidiencongty1@gmail.com','null'),(5,'Nguyễn Mạnh Hùng','Giám đốc','Tầng 22- phòng 1010 - Tòa nhà ABC - Hoàn Kiếm - Hà Nội','0987654321','daidiencongty2@gmail.com','null'),(6,'Hoàng Bảo Long','Giám đốc','Phong 40 - Tòa nhà ABC - Thanh Xuân - Hà Nội','0987654321','daidiencongty3@gmail.com','null'),(7,'Trương Thế Tùng','Giám đốc','Phòng 01 - Tòa nhà CLC - Hai Bà Trưng - Hà Nội','0987654321','daidiencongty4@gmail.com','null'),(8,'Nguyễn Văn Đức','Giám đốc','Phòng 99 - Khu công nghiệp CLC - Hà Nội','0987654321','daidiencongty5@gmail.com','null');
/*!40000 ALTER TABLE `dai_dien_cong_ty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `de_tai`
--

DROP TABLE IF EXISTS `de_tai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `de_tai` (
  `ma_de_tai` int(9) NOT NULL AUTO_INCREMENT,
  `ma_cong_ty` int(9) NOT NULL,
  `ma_gvhd` int(9) NOT NULL,
  `ten_de_tai` varchar(500) CHARACTER SET utf8 NOT NULL,
  `noi_dung` text CHARACTER SET utf8 NOT NULL,
  `yeu_cau` text CHARACTER SET utf8 NOT NULL,
  `nguoi_dang` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `so_luong` int(3) NOT NULL,
  `so_luong_con` int(3) DEFAULT NULL,
  `trang_thai` int(1) NOT NULL,
  `ngay_dang` date NOT NULL,
  `han_dang_ky` date NOT NULL,
  PRIMARY KEY (`ma_de_tai`),
  KEY `de_tai_ibfk_2` (`ma_gvhd`),
  KEY `de_tai_ibfk_1` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_1` FOREIGN KEY (`ma_cong_ty`) REFERENCES `cong_ty` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_2` FOREIGN KEY (`ma_gvhd`) REFERENCES `giang_vien_huong_dan` (`ma_gvhd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_tai`
--

LOCK TABLES `de_tai` WRITE;
/*!40000 ALTER TABLE `de_tai` DISABLE KEYS */;
/*!40000 ALTER TABLE `de_tai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dot_thuc_tap`
--

DROP TABLE IF EXISTS `dot_thuc_tap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dot_thuc_tap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ma_dot` int(11) NOT NULL,
  `thoi_gian_bat_dau` date NOT NULL,
  `thoi_gian_ket_thuc` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dot_thuc_tap`
--

LOCK TABLES `dot_thuc_tap` WRITE;
/*!40000 ALTER TABLE `dot_thuc_tap` DISABLE KEYS */;
/*!40000 ALTER TABLE `dot_thuc_tap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `noi_dung` text CHARACTER SET utf8,
  `nguoi_nhan` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `thoi_gian` datetime DEFAULT NULL,
  `trang_thai` bit(1) DEFAULT NULL,
  `nguoi_gui` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_ibfk_1` (`nguoi_gui`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`nguoi_gui`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ten_file` varchar(500) DEFAULT NULL,
  `noi_dung` varchar(1000) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `loai_nguoi_dung` int(11) DEFAULT NULL COMMENT '1: đối với giang viên phụ trách\n2: đối với người hướng dẫn (giảng viên hướng dẫn)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giang_vien_huong_dan`
--

DROP TABLE IF EXISTS `giang_vien_huong_dan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giang_vien_huong_dan` (
  `ma_gvhd` int(9) NOT NULL AUTO_INCREMENT,
  `ma_cong_ty` int(9) NOT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `chucvu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dien_thoai` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dia_chi` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `linh_vuc_hoat_dong` text CHARACTER SET utf8,
  `du_an` text CHARACTER SET utf8,
  PRIMARY KEY (`ma_gvhd`),
  KEY `giang_vien_huong_dan_ibfk_1` (`ma_cong_ty`),
  KEY `giang_vien_huong_dan_ibfk_2` (`email`),
  CONSTRAINT `giang_vien_huong_dan_ibfk_1` FOREIGN KEY (`ma_cong_ty`) REFERENCES `cong_ty` (`ma_cong_ty`),
  CONSTRAINT `giang_vien_huong_dan_ibfk_2` FOREIGN KEY (`email`) REFERENCES `login` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien_huong_dan`
--

LOCK TABLES `giang_vien_huong_dan` WRITE;
/*!40000 ALTER TABLE `giang_vien_huong_dan` DISABLE KEYS */;
/*!40000 ALTER TABLE `giang_vien_huong_dan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giang_vien_phu_trach`
--

DROP TABLE IF EXISTS `giang_vien_phu_trach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giang_vien_phu_trach` (
  `ma_gvpt` int(9) NOT NULL AUTO_INCREMENT,
  `ho_ten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dia_chi` varchar(500) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `dien_thoai` varchar(15) CHARACTER SET utf8 NOT NULL,
  `khoa_vien` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `bo_mon` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `cong_trinh_nghien_cuu` text CHARACTER SET utf8,
  `sach_xuat_ban` text CHARACTER SET utf8,
  `mon_giang_day` text CHARACTER SET utf8,
  `khac` text CHARACTER SET utf8,
  `avatar` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ma_gvpt`),
  KEY `giang_vien_phu_trach_ibfk_1` (`email`),
  CONSTRAINT `giang_vien_phu_trach_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien_phu_trach`
--

LOCK TABLES `giang_vien_phu_trach` WRITE;
/*!40000 ALTER TABLE `giang_vien_phu_trach` DISABLE KEYS */;
/*!40000 ALTER TABLE `giang_vien_phu_trach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `he_so_diem`
--

DROP TABLE IF EXISTS `he_so_diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `he_so_diem` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `diem_phan_hoi` double(2,2) DEFAULT NULL,
  `diem_bcqt` double(2,2) DEFAULT NULL,
  `diem_qt` double(2,2) DEFAULT NULL,
  `diem_ck` double(2,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `he_so_diem`
--

LOCK TABLES `he_so_diem` WRITE;
/*!40000 ALTER TABLE `he_so_diem` DISABLE KEYS */;
/*!40000 ALTER TABLE `he_so_diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rule` int(1) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('20138374@student.hust.edu.vn','SonNguyen',0),('20138375@student.hust.edu.vn','1234567890',0),('20138376@student.hust.edu.vn','1234567890',0),('20138377@student.hust.edu.vn','1234567890',0),('20138378@student.hust.edu.vn','1234567890',0),('20138379@student.hust.edu.vn','1234567890',0),('20138380@student.hust.edu.vn','1234567890',0),('daidiencongty1@gmail.com','1234567890',1),('daidiencongty2@gmail.com','1234567890',1),('daidiencongty3@gmail.com','1234567890',1),('daidiencongty4@gmail.com','1234567890',1),('daidiencongty5@gmail.com','1234567890',1),('daidiencongty@gmail.com','1234567890',1),('giangvienhuongdan1@gmail.com','1234567890',2),('giangvienhuongdan2@gmail.com','1234567890',2),('giangvienhuongdan3@gmail.com','1234567890',2),('giangvienhuongdan4@gmail.com','1234567890',2),('giangvienhuongdan5@gmail.com','1234567890',2),('giangvienhuongdan@gmail.com','1234567890',2),('nguoihuongdan1@gmail.com','1234567890',3),('nguoihuongdan2@gmail.com','1234567890',3),('nguoihuongdan3@gmail.com','1234567890',3),('nguoihuongdan4@gmail.com','1234567890',3),('nguoihuongdan5@gmail.com','1234567890',3),('nguoihuongdan@gmail.com','1234567890',3);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `thoi_gian` time DEFAULT NULL,
  `ngay_thang` date DEFAULT NULL,
  `nguoi_dung` varchar(255) CHARACTER SET utf8 NOT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_ibfk_1` (`nguoi_dung`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`nguoi_dung`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quy_trinh`
--

DROP TABLE IF EXISTS `quy_trinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quy_trinh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(500) DEFAULT NULL,
  `noi_dung` text,
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `ma_xac_thuc` varchar(45) DEFAULT NULL,
  `trang_thai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quy_trinh`
--

LOCK TABLES `quy_trinh` WRITE;
/*!40000 ALTER TABLE `quy_trinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `quy_trinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien`
--

DROP TABLE IF EXISTS `sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien` (
  `mssv` int(8) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lop` varchar(50) CHARACTER SET utf8 NOT NULL,
  `khoa_vien` varchar(255) CHARACTER SET utf8 NOT NULL,
  `khoa` int(3) NOT NULL,
  `gioi_tinh` bit(1) NOT NULL,
  `dien_thoai` varchar(15) CHARACTER SET utf8 NOT NULL,
  `dia_chi` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `avatar` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`mssv`),
  KEY `sinh_vien_ibfk_1` (`email`),
  CONSTRAINT `sinh_vien_ibfk_1` FOREIGN KEY (`email`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES (20138374,'20138374@student.hust.edu.vn','Nguyễn Công Sơn','inpg12','Viện đào tạo quốc tế',58,'','0987654321','bách khoa','1995-02-22','null');
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_dang_ky`
--

DROP TABLE IF EXISTS `sinh_vien_dang_ky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien_dang_ky` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mssv` int(8) NOT NULL,
  `ma_cong_ty` int(9) NOT NULL,
  `ma_de_tai` int(9) NOT NULL,
  `trang_thai` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_dang_ky`
--

LOCK TABLES `sinh_vien_dang_ky` WRITE;
/*!40000 ALTER TABLE `sinh_vien_dang_ky` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinh_vien_dang_ky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_diem`
--

DROP TABLE IF EXISTS `sinh_vien_diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien_diem` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mssv` int(8) NOT NULL,
  `diem_phan_hoi` double(2,2) DEFAULT NULL,
  `diem_bcqt` double(2,2) DEFAULT NULL,
  `diem_qua_trinh` double(2,2) DEFAULT NULL,
  `diem_cuoi_ky` double(2,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_diem_ibfk_1` (`mssv`),
  CONSTRAINT `sinh_vien_diem_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_diem`
--

LOCK TABLES `sinh_vien_diem` WRITE;
/*!40000 ALTER TABLE `sinh_vien_diem` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinh_vien_diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_file`
--

DROP TABLE IF EXISTS `sinh_vien_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien_file` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mssv` int(8) NOT NULL,
  `ten_file` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `mo_ta` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `loai_file` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_file_ibfk_1` (`mssv`),
  CONSTRAINT `sinh_vien_file_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_file`
--

LOCK TABLES `sinh_vien_file` WRITE;
/*!40000 ALTER TABLE `sinh_vien_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinh_vien_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_info`
--

DROP TABLE IF EXISTS `sinh_vien_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien_info` (
  `ngoai_ngu` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `ky_nang_lt` text CHARACTER SET utf8,
  `ny_nang_khac` text CHARACTER SET utf8,
  `muc_tieu` text CHARACTER SET utf8,
  `hoat_dong` text CHARACTER SET utf8,
  `giai_thuong` text CHARACTER SET utf8,
  `so_thich` text CHARACTER SET utf8,
  `du_an` text CHARACTER SET utf8,
  `mssv` int(8) NOT NULL,
  KEY `fk_sinh_vien_info_sinh_vien1_idx` (`mssv`),
  CONSTRAINT `fk_sinh_vien_info_sinh_vien1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_info`
--

LOCK TABLES `sinh_vien_info` WRITE;
/*!40000 ALTER TABLE `sinh_vien_info` DISABLE KEYS */;
INSERT INTO `sinh_vien_info` VALUES ('tiếng pháp','dávbdasbv','vsbsdfb','vsfdbsdb','sbsdfbsd','dfsbsdfbsdf','fdsbfdbs','ssbsdbsfd',0);
/*!40000 ALTER TABLE `sinh_vien_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien_thuc_tap`
--

DROP TABLE IF EXISTS `sinh_vien_thuc_tap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinh_vien_thuc_tap` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `mssv` int(8) NOT NULL,
  `ma_de_tai` int(9) NOT NULL,
  `thoi_gian_bat_dau` date DEFAULT NULL,
  `thoi_gian_ket_thuc` date DEFAULT NULL,
  `trang_thai` bit(1) NOT NULL,
  `dot_thuc_tap` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_thuc_tap_ibfk_1` (`mssv`),
  KEY `sinh_vien_thuc_tap_ibfk_2` (`ma_de_tai`),
  CONSTRAINT `sinh_vien_thuc_tap_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`),
  CONSTRAINT `sinh_vien_thuc_tap_ibfk_2` FOREIGN KEY (`ma_de_tai`) REFERENCES `de_tai` (`ma_de_tai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_thuc_tap`
--

LOCK TABLES `sinh_vien_thuc_tap` WRITE;
/*!40000 ALTER TABLE `sinh_vien_thuc_tap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinh_vien_thuc_tap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thong_bao` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `noi_dung` text CHARACTER SET utf8,
  `nguoi_dang` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ngay_thang` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0: thông báo\n1: banner',
  `photo_link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thong_bao_ibfk_1` (`nguoi_dang`),
  CONSTRAINT `thong_bao_ibfk_1` FOREIGN KEY (`nguoi_dang`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thong_bao`
--

LOCK TABLES `thong_bao` WRITE;
/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
/*!40000 ALTER TABLE `thong_bao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-25 11:08:44
