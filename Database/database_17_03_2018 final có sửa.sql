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
  PRIMARY KEY (`ma_cong_ty`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cong_ty`
--

LOCK TABLES `cong_ty` WRITE;
/*!40000 ALTER TABLE `cong_ty` DISABLE KEYS */;
INSERT INTO `cong_ty` VALUES (1,'Công ty hệ thống thông tin FPT','Tầng 20 - Keangnam - Nam Từ Liêm - Hà Nội','0987654321','support@fpt.com.vn','fpt.com.vn','Công ty Cổ phần FPT (FPT Corporation), thành lập ngày 13/09/1988, đã liên tục phát triển và trở thành tập đoàn CNTT và viễn thông hàng đầu Việt Nam. Lĩnh vực kinh doanh cốt lõi gồm 3 mảng chính: Dịch vụ CNTT, Nội dung số và Viễn thông. Trong nhiều năm qua, FPT triển khai các dự án công nghệ cho hầu hết các ngành trọng yếu của Việt Nam như tài chính - ngân hàng, thuế - kho bạc, dầu khí, an ninh quốc phòng, y tế, giáo dục… Các khách hàng chính gồm: Ngân hàng Nhà nước Việt Nam, Bộ Tài chính, Tổng cục Thuế, Kho bạc Nhà nước, Tổng cục Hải quan, Tổng Công ty Điện lực Việt Nam, Petrolimex, Bộ Thông tin Truyền thông, Bộ Công an, các ngân hàng, các tổng công ty lớn của Việt Nam …','FPT cũng đồng hành cùng nhiều doanh nghiệp Việt Nam. Nhiều hệ thống ERP đã được FPT triển khai và nghiệm thu đưa vào sử dụng hiệu quả, tại các đơn vị: Bộ Tài chính Việt Nam, Tập đoàn Thép Việt- Pomina, Công ty CP giấy Sài Gòn, Prime Group, Vinamilk, Đồng Tâm Group, Toàn Mỹ, Điện Quang, Vietsov Petro,... FPT là đơn vị tiên phong về xuất khẩu phần mềm và hiện đã có mặt tại 11 quốc gia trên thế giới như Mỹ, Nhật Bản, Châu Âu, Singapore, Úc, Thái Lan, Malaysia, Philippin, Lào, Campuchia. Với mong muốn hỗ trợ xây dựng thương hiệu quốc gia của ngành phần mềm Việt Nam, FPT đã chuyển giao bộ tài liệu về kinh nghiệm triển khai xây dựng, áp dụng và thi lấy chứng chỉ CMMi mức 5 cho cộng đồng doanh nghiệp CNTT Việt Nam thông qua Bộ TT&TT. ','null',0);
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
  `ma_cong_ty` int(9) NOT NULL,
  `ho_ten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `chuc_vu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dia_chi` text CHARACTER SET utf8,
  `dien_thoai` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ma_dai_dien`),
  KEY `dai_dien_cong_ty_ibfk_1` (`ma_cong_ty`),
  KEY `dai_dien_cong_ty_ibfk_2` (`email`),
  CONSTRAINT `dai_dien_cong_ty_ibfk_1` FOREIGN KEY (`ma_cong_ty`) REFERENCES `cong_ty` (`ma_cong_ty`),
  CONSTRAINT `dai_dien_cong_ty_ibfk_2` FOREIGN KEY (`email`) REFERENCES `login` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dai_dien_cong_ty`
--

LOCK TABLES `dai_dien_cong_ty` WRITE;
/*!40000 ALTER TABLE `dai_dien_cong_ty` DISABLE KEYS */;
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
  `trang_thai` int(1) DEFAULT NULL,
  PRIMARY KEY (`ma_de_tai`),
  KEY `de_tai_ibfk_2` (`ma_gvhd`),
  KEY `de_tai_ibfk_1` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_1` FOREIGN KEY (`ma_cong_ty`) REFERENCES `cong_ty` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_2` FOREIGN KEY (`ma_gvhd`) REFERENCES `giang_vien_huong_dan` (`ma_gvhd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_tai`
--

LOCK TABLES `de_tai` WRITE;
/*!40000 ALTER TABLE `de_tai` DISABLE KEYS */;
INSERT INTO `de_tai` VALUES (1,1,1,'Phân tích thiết kế hệ thống nhà thông minh','FPT cũng là một trong 4 nhà cung cấp đường truyền internet đầu tiên tại Việt Nam và đến nay đã trở thành công ty hàng đầu trong lĩnh vực viễn thông và dịch vụ trực tuyến gồm internet băng thông rộng, internet cáp quang, dịch vụ truyền hình trực tuyến. FPT Telecom đã được cấp giấy phép VoIP, ICP, ISP, OSP, IXP, giấy phép thiết lập mạng và cung cấp dịch vụ viễn thông, giấy phép thử nghiệm Wimax di động, giấy phép thử nghiệm công nghệ LTE (4G). Để tiếp tục khẳng định năng lực trong lĩnh vực ICT, hiện FPT đã triển khai và phát triển hạ tầng viễn thông tại 36 tỉnh thành thuộc cả 3 miền Bắc, Trung, Nam.','FPT cũng là một trong 4 nhà cung cấp đường truyền internet đầu tiên tại Việt Nam và đến nay đã trở thành công ty hàng đầu trong lĩnh vực viễn thông và dịch vụ trực tuyến gồm internet băng thông rộng, internet cáp quang, dịch vụ truyền hình trực tuyến. FPT Telecom đã được cấp giấy phép VoIP, ICP, ISP, OSP, IXP, giấy phép thiết lập mạng và cung cấp dịch vụ viễn thông, giấy phép thử nghiệm Wimax di động, giấy phép thử nghiệm công nghệ LTE (4G). Để tiếp tục khẳng định năng lực trong lĩnh vực ICT, hiện FPT đã triển khai và phát triển hạ tầng viễn thông tại 36 tỉnh thành thuộc cả 3 miền Bắc, Trung, Nam.','Admin',20,20,0);
/*!40000 ALTER TABLE `de_tai` ENABLE KEYS */;
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
INSERT INTO `giang_vien_huong_dan` VALUES (1,1,'Nguyễn Công Sơn','Nhân Viên FIS','0898595657','20138374@student.hust.edu.vn','null','Bách Khoa - Hai Bà Trưng - Hà Nội','Phân tích thiết kế hệ thống ngân hàng','Trang bị giải pháp quản lý tiền gửi và khoản vay');
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
INSERT INTO `login` VALUES ('20138374@student.hust.edu.vn','SonNguyen',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_dang_ky`
--

LOCK TABLES `sinh_vien_dang_ky` WRITE;
/*!40000 ALTER TABLE `sinh_vien_dang_ky` DISABLE KEYS */;
INSERT INTO `sinh_vien_dang_ky` VALUES (1,20138374,1,1,1);
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
  `mssv` int(8) NOT NULL,
  `ngoai_ngu` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `ky_nang_lt` text CHARACTER SET utf8,
  `ny_nang_khac` text CHARACTER SET utf8,
  `muc_tieu` text CHARACTER SET utf8,
  `hoat_dong` text CHARACTER SET utf8,
  `giai_thuong` text CHARACTER SET utf8,
  `so_thich` text CHARACTER SET utf8,
  `du_an` text CHARACTER SET utf8,
  PRIMARY KEY (`mssv`),
  CONSTRAINT `sinh_vien_info_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_info`
--

LOCK TABLES `sinh_vien_info` WRITE;
/*!40000 ALTER TABLE `sinh_vien_info` DISABLE KEYS */;
INSERT INTO `sinh_vien_info` VALUES (20138374,'tiếng pháp','dávbdasbv','vsbsdfb','vsfdbsdb','sbsdfbsd','dfsbsdfbsdf','fdsbfdbs','ssbsdbsfd');
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
  PRIMARY KEY (`id`),
  KEY `sinh_vien_thuc_tap_ibfk_1` (`mssv`),
  KEY `sinh_vien_thuc_tap_ibfk_2` (`ma_de_tai`),
  CONSTRAINT `sinh_vien_thuc_tap_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`),
  CONSTRAINT `sinh_vien_thuc_tap_ibfk_2` FOREIGN KEY (`ma_de_tai`) REFERENCES `de_tai` (`ma_de_tai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_thuc_tap`
--

LOCK TABLES `sinh_vien_thuc_tap` WRITE;
/*!40000 ALTER TABLE `sinh_vien_thuc_tap` DISABLE KEYS */;
INSERT INTO `sinh_vien_thuc_tap` VALUES (1,20138374,1,'2018-03-03','2018-04-03','');
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

-- Dump completed on 2018-03-17 21:50:11
