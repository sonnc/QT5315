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
  `linh_vuc_hoat_dong` longtext CHARACTER SET utf8,
  `mo_ta` longtext CHARACTER SET utf8,
  `logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `trang_thai` int(1) DEFAULT NULL,
  `ma_dai_dien` int(9) NOT NULL,
  PRIMARY KEY (`ma_cong_ty`),
  KEY `fk_cong_ty_dai_dien_cong_ty1_idx` (`ma_dai_dien`),
  CONSTRAINT `fk_cong_ty_dai_dien_cong_ty1` FOREIGN KEY (`ma_dai_dien`) REFERENCES `dai_dien_cong_ty` (`ma_dai_dien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cong_ty`
--

LOCK TABLES `cong_ty` WRITE;
/*!40000 ALTER TABLE `cong_ty` DISABLE KEYS */;
INSERT INTO `cong_ty` VALUES (1,'Công ty Hệ thống FPT','Keangnam - Hà Nội','0987654321','fpt@fpt.com.vn','fpt.com.vn','vádasdvdsavadsv','vádasdvdsavadsv','pages/libs/img/index.png',1,3),(2,'Công ty ABC','Haf Nooijbrfb','0987654321','abc.com.vn','abc.com.vn','vádasdvdsavadsv','vádasdvdsavadsv','pages/libs/img/index.png',1,4),(3,'Công ty hjv','Nooijbrfb','0987654321','vadsv.com.vn','ewfe.com.vn','vádasdvdsavadsv','vádasdvdsavadsv','pages/libs/img/index.png',1,5),(4,'Công ty jryku','Nooijbrfb','0987654321','bsb.com.vn','dfff.com.vn','vádasdvdsavadsv','vádasdvdsavadsv','pages/libs/img/index.png',1,6),(5,'Công ty htrj','Nooijbrfb','0987654321','etjr.com.vn','fgrht.com.vn','vádasdvdsavadsv','vádasdvdsavadsv','pages/libs/img/index.png',1,7);
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
  `dia_chi` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
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
  `yeu_cau_lap_trinh` text CHARACTER SET utf8 NOT NULL,
  `nguoi_dang` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `so_luong` int(3) NOT NULL,
  `so_luong_con` int(3) DEFAULT NULL,
  `trang_thai` int(1) NOT NULL,
  `ngay_dang` date NOT NULL,
  `han_dang_ky` date NOT NULL,
  `yeu_cau_khac` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ma_de_tai`),
  KEY `de_tai_ibfk_2` (`ma_gvhd`),
  KEY `de_tai_ibfk_1` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_1` FOREIGN KEY (`ma_cong_ty`) REFERENCES `cong_ty` (`ma_cong_ty`),
  CONSTRAINT `de_tai_ibfk_2` FOREIGN KEY (`ma_gvhd`) REFERENCES `giang_vien_huong_dan` (`ma_gvhd`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `de_tai`
--

LOCK TABLES `de_tai` WRITE;
/*!40000 ALTER TABLE `de_tai` DISABLE KEYS */;
INSERT INTO `de_tai` VALUES (1,3,1,'IoT -  Phát triển hệ thống nhà thông minh','vdaslhvasdhvadsilvbasdlibhuasbdsalbsba','[java-tot][c++-tot][mysql-tot]','cádcasd',20,20,1,'2018-03-26','2018-03-28','null'),(2,1,2,'Phát triển úng dụng smart banking','vdaslhvasdhvadsilvbasdlibhuasbdsalbsba','[java-tot][c++-tot][mysql-tot]','cádcasd',20,10,1,'2018-03-26','2018-04-26','null');
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
  `mo_ta` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dot_thuc_tap`
--

LOCK TABLES `dot_thuc_tap` WRITE;
/*!40000 ALTER TABLE `dot_thuc_tap` DISABLE KEYS */;
INSERT INTO `dot_thuc_tap` VALUES (1,20182,'2018-03-25','2018-03-31','Đợt thực tập 2018'),(2,20183,'2018-03-25','2018-04-05','Đợt thực tập 20183'),(3,20184,'2018-03-25','2018-04-10','Đợt thực tập 20184'),(4,20185,'2018-02-25','2018-03-25','Đợt thực tập 20175');
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
  `tieu_de` varchar(500) CHARACTER SET utf8 NOT NULL,
  `noi_dung` text CHARACTER SET utf8 NOT NULL,
  `nguoi_nhan` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `thoi_gian` datetime DEFAULT NULL,
  `trang_thai` bit(1) NOT NULL,
  `nguoi_gui` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_ibfk_1` (`nguoi_gui`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`nguoi_gui`) REFERENCES `login` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'Thông báo','Thông báo','20138374@student.hust.edu.vn','2018-04-08 00:00:00','','giangvienhuongdan@gmail.com'),(2,'Lỗi đăng nhập','Kính gửi: E sn 2k. Năm nay e có ý định thi vào khoa EM – VUW của trường mình nhưng e thắc mắc tại sao các ac sv khoa EM – VUW đa phần sau khi học xog giai đoạn 1thì thường ở lại VN học nốt cho đến khi ra trường mà tại sao ko chuyển tiếp sang New Zealand học tiếp giai đoạn 2 nếu đủ điều kiện ạ?','giangvienhuongdan@gmail.com','2018-04-08 14:00:00','\0','20138374@student.hust.edu.vn'),(3,'Lỗi đăng ký đề tài','Timestamp timestamp = new Timestamp(today.getTime()); Timestamp t2 = getTimestamp(today); System.out.println(\"date: \" + today); System.out.println(\"timestamp: \" + timestamp); System.out.println(\"timestamp2: \" + t2); \r\n\r\nRead more: http://www.java67.com/2016/03/how-to-convert-javautildate-to-javasqlTimestamp-JDBC.html#ixzz5C4GY7akb','giangvienhuongdan@gmail.com','2018-04-08 15:33:51','\0','20138374@student.hust.edu.vn'),(4,'Lỗi đăng ký thực tập','Kính gửi cô Giang','giangvienhuongdan@gmail.com','2018-04-08 15:38:41','\0','20138374@student.hust.edu.vn'),(5,'Lỗi đăng ký thực tập 20183',' session.removeAttribute(\"emailMessage\");','giangvienhuongdan@gmail.com','2018-04-08 15:39:27','\0','20138374@student.hust.edu.vn'),(10,'Đăng ký thực tập','aaaaaaaaaaaaaaaaaaaaaaa','giangvienhuongdan@gmail.com','2018-04-08 22:55:49','\0','20138374@student.hust.edu.vn'),(11,'ácdasvadsvasv','ávdasdvdsavsad','giangvienhuongdan@gmail.com','2018-04-08 22:56:39','\0','20138374@student.hust.edu.vn'),(12,'cádcasdc','sdacsdacsdc','giangvienhuongdan@gmail.com','2018-04-08 22:57:29','\0','20138374@student.hust.edu.vn'),(13,'sssssssssssssssssssss','aaaaaaaaaaaaaaaaaaaaaaaaaa','giangvienhuongdan@gmail.com','2018-04-08 22:58:38','\0','20138374@student.hust.edu.vn'),(14,'hhhhhhhhhhhhhhhhhhhh','jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','giangvienhuongdan@gmail.com','2018-04-08 22:59:27','\0','20138374@student.hust.edu.vn'),(15,'qqqqqqq','jnhmgnbvcdfvgbn','giangvienhuongdan@gmail.com','2018-04-08 23:15:44','\0','20138374@student.hust.edu.vn'),(16,'nnnnnnnnnnnnn','mmmmmmmmmmmmmmmmmm','giangvienhuongdan@gmail.com','2018-04-08 23:35:48','\0','20138374@student.hust.edu.vn'),(17,'llllllllllllllllllll','\'\'hdxtartd','giangvienhuongdan@gmail.com','2018-04-08 23:38:43','\0','20138374@student.hust.edu.vn'),(18,'llllllllllllllllllll','\'\'hdxtartd','giangvienhuongdan@gmail.com','2018-04-08 23:39:31','\0','20138374@student.hust.edu.vn'),(19,'ffffffffffffffffff','fffffffffffffffff','giangvienhuongdan@gmail.com','2018-04-08 23:52:15','\0','20138374@student.hust.edu.vn'),(20,'Lỗi đăng ký đề tài','xscdvfghjkl;','giangvienhuongdan@gmail.com','2018-04-09 00:15:36','\0','20138374@student.hust.edu.vn'),(21,'llllllllllllllllllll','jk','giangvienhuongdan@gmail.com','2018-04-09 12:45:05','\0','20138374@student.hust.edu.vn');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_all`
--

DROP TABLE IF EXISTS `file_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_all` (
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
-- Dumping data for table `file_all`
--

LOCK TABLES `file_all` WRITE;
/*!40000 ALTER TABLE `file_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_all` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien_huong_dan`
--

LOCK TABLES `giang_vien_huong_dan` WRITE;
/*!40000 ALTER TABLE `giang_vien_huong_dan` DISABLE KEYS */;
INSERT INTO `giang_vien_huong_dan` VALUES (1,3,'Nguyễn Duy Quang','Quản lý','087654321','nguoihuongdan@gmail.com','null','Hà Nội','Null','Null'),(2,1,'Nguyễn Thị Hòa','Qunar lý','0987654321','nguoihuongdan1@gmail.com','NULL','Hà Nội','Null','Null');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `he_so_diem`
--

LOCK TABLES `he_so_diem` WRITE;
/*!40000 ALTER TABLE `he_so_diem` DISABLE KEYS */;
INSERT INTO `he_so_diem` VALUES (1,0.40,0.60,0.30,0.70),(2,0.50,0.50,0.30,0.70),(3,0.40,0.60,0.40,0.60);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quy_trinh`
--

LOCK TABLES `quy_trinh` WRITE;
/*!40000 ALTER TABLE `quy_trinh` DISABLE KEYS */;
INSERT INTO `quy_trinh` VALUES (1,'Đăng ký thực tập 20183','Thông báo đăng ký thực tập 20183. Tất cả sinh viên phải đăng ký thực tập từ ngày 04/04 đến  ngày 10/04. Nếu sinh viên nào không đăng ký, sẽ không được thực tập.','2018-04-04','2018-04-10'),(2,'Nộp báo cáo','Nộp báo cáo giữa kỳ','2018-04-15','2018-04-15');
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
  `laptop` bit(1) DEFAULT NULL,
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
INSERT INTO `sinh_vien` VALUES (20138374,'20138374@student.hust.edu.vn','Nguyễn Công Sơn','INPG 12','Viện Đào tạo Quốc Tế',58,'','0898595657','Hà nỘi','1995-01-22','data/avatar/images/Koala.jpg',''),(20138375,'20138375@student.hust.edu.vn','Trần Mạnh Tuấn','INPG 12','Viện công nghệ thông tin và truyền thông',58,'','0987654323','Hà nỘi','1995-01-22','data/avatar/images/Koala.jpg',''),(20138377,'20138377@student.hust.edu.vn','Nguyễn Mạnh Linh','INPG 12','Viện công nghệ thông tin và truyền thông',58,'','0987654323','Hà nỘi','1995-01-22','data/avatar/images/Koala.jpg','\0');
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
  `so_khop` double NOT NULL,
  `ngay_dang_ky` date DEFAULT NULL,
  `dot_thuc_tap` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_dang_ky`
--

LOCK TABLES `sinh_vien_dang_ky` WRITE;
/*!40000 ALTER TABLE `sinh_vien_dang_ky` DISABLE KEYS */;
INSERT INTO `sinh_vien_dang_ky` VALUES (1,20138374,1,2,0,77.77777777777777,'2018-04-01',20184),(3,20138374,3,1,1,77.77777777777777,'2018-04-08',20184);
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
  `diem_phan_hoi` double DEFAULT NULL,
  `diem_bcqt` double DEFAULT NULL,
  `diem_qua_trinh` double DEFAULT NULL,
  `diem_cuoi_ky` double DEFAULT NULL,
  `dot_thuc_tap` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_diem_ibfk_1` (`mssv`),
  CONSTRAINT `sinh_vien_diem_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_diem`
--

LOCK TABLES `sinh_vien_diem` WRITE;
/*!40000 ALTER TABLE `sinh_vien_diem` DISABLE KEYS */;
INSERT INTO `sinh_vien_diem` VALUES (4,20138374,NULL,NULL,NULL,NULL,20184);
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
  `ngay_thang` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sinh_vien_file_ibfk_1` (`mssv`),
  CONSTRAINT `sinh_vien_file_ibfk_1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_file`
--

LOCK TABLES `sinh_vien_file` WRITE;
/*!40000 ALTER TABLE `sinh_vien_file` DISABLE KEYS */;
INSERT INTO `sinh_vien_file` VALUES (14,20138374,'Quy trình thực tập','ád','file/sinhvien/01 OFA UI Framework.ppt',4,'2018-04-10'),(15,20138374,'Quy trình thực tập','sc','file/sinhvien/404-white-web.zip',4,'2018-04-10'),(16,20138374,'bài tập hoc tại công ty','hgf','file/sinhvien/2018.01.18 - LO Template - Lan 3 - Mapping_Vietnamese[9146].docx',4,'2018-04-10'),(17,20138374,'Bào cáo','sc','file/sinhvien/20162_SAI_MA_DATN.xlsx',5,'2018-04-10'),(18,20138374,'cacsadc','xdfg','file/sinhvien/common-lang3.jar',5,'2018-04-10'),(19,20138374,'Quy','f','file/sinhvien/404-white-web.zip',5,'2018-04-10'),(20,20138374,'kkkkk','cvd','file/sinhvien/9-faulttolerance-15-638.jpg',4,'2018-04-10'),(21,20138374,'bài tập hoc tại công ty','cdsbghjm','file/sinhvien/404-white-web.zip',4,'2018-04-10'),(22,20138374,'Bào cáocsa','ác','file/sinhvien/2018.01.18 - LO Template - Lan 3 - Mapping_Vietnamese[9146].docx',5,'2018-04-10'),(23,20138374,'Quy trình thực tập','kbjghfdvh','file/sinhvien/9-faulttolerance-15-638.jpg',5,'2018-04-10'),(35,20138374,'Quy trình thực tập','adscdsac','file/sinhvien/9-faulttolerance-15-638.jpg',0,'2018-04-10'),(36,20138374,'Quy trình thực tập','cá','file/sinhvien/404-white-web.zip',0,'2018-04-10'),(37,20138374,'cávc','avdsd','file/sinhvien/9-faulttolerance-15-638.jpg',0,'2018-04-10'),(38,20138374,'bfdbn','vdvzdxv','file/sinhvien/01 OFA UI Framework.ppt',1,'2018-04-10'),(39,20138374,'cacvasdvsdavdsavs','vádvsadvsadvsd','file/sinhvien/404-white-web.zip',1,'2018-04-10'),(40,20138374,'bài tập hoc tại công ty','cá','file/sinhvien/01 OFA UI Framework.ppt',1,'2018-04-10'),(41,20138374,'cấcdsc','cádcasdcsda','file/sinhvien/01 OFA UI Framework.ppt',0,'2018-04-10'),(42,20138374,'bài tập hoc tại công ty','cdasvdsav','file/sinhvien/404-white-web.zip',0,'2018-04-10'),(43,20138374,'báo cào bài tập tuần','cádcassd','file/sinhvien/BieumauvaQuytrinhTTKTSIE2017.rar',3,'2018-04-10'),(44,20138374,'Quy trình thực tập','D D D ','file/sinhvien/01 OFA UI Framework.ppt',0,'2018-04-11'),(45,20138374,'Quy trình thực tập','hj','file/sinhvien/404-white-web.zip',0,'2018-04-11');
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
  `ky_nang_khac` text CHARACTER SET utf8,
  `muc_tieu` text CHARACTER SET utf8,
  `hoat_dong` text CHARACTER SET utf8,
  `giai_thuong` text CHARACTER SET utf8,
  `so_thich` text CHARACTER SET utf8,
  `du_an` text CHARACTER SET utf8,
  PRIMARY KEY (`mssv`),
  KEY `fk_sinh_vien_info_sinh_vien1_idx` (`mssv`),
  CONSTRAINT `fk_sinh_vien_info_sinh_vien1` FOREIGN KEY (`mssv`) REFERENCES `sinh_vien` (`mssv`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien_info`
--

LOCK TABLES `sinh_vien_info` WRITE;
/*!40000 ALTER TABLE `sinh_vien_info` DISABLE KEYS */;
INSERT INTO `sinh_vien_info` VALUES (20138374,'Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','[java-thanhthao][c-tot]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]'),(20138375,'Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]','Đối với phần: Kỹ năng lập trình, các bạn phải thực hiện đúng cú pháp sau. Nếu sai, mọi so khớp của các bạn không thành công. Cú pháp: [abc.xyz] Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ. Ví dụ: [java.tot][php.kha]'),(20138377,'Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết','Trình độ bao gồm các mức sau:thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết');
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
  `ma_de_tai` int(9) DEFAULT NULL,
  `thoi_gian_bat_dau` date DEFAULT NULL,
  `thoi_gian_ket_thuc` date DEFAULT NULL,
  `trang_thai` bit(1) NOT NULL,
  `dot_thuc_tap` int(11) NOT NULL,
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
INSERT INTO `sinh_vien_thuc_tap` VALUES (1,20138374,1,'2018-04-15','2018-07-14','',20184);
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

-- Dump completed on 2018-04-15  3:39:29
