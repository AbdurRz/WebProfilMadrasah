/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: mtsn1_bukittinggi
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `level` enum('kota','provinsi','nasional','internasional') NOT NULL DEFAULT 'kota',
  `category` enum('akademik','non-akademik','keagamaan') NOT NULL DEFAULT 'akademik',
  `rank` varchar(50) DEFAULT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES
(1,'KSM Matematika Terintegrasi','Aisyah Rahmadani','provinsi','akademik','Medali Emas',2026,'Medali Emas KSM Matematika Terintegrasi tingkat Provinsi.','https://images.pexels.com/photos/40117754/pexels-photo-40117754.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'MTQ Pelajar Cabang Tilawah','Muhammad Fadhil','kota','keagamaan','Juara 1',2026,'Juara 1 MTQ Pelajar Cabang Tilawah tingkat Kota.','https://images.unsplash.com/photo-1629273229664-11fabc0becc0?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Olimpiade IPA Madrasah','Nabila Putri Azzahra','nasional','akademik','Medali Perak',2025,'Medali Perak Olimpiade IPA Madrasah tingkat Nasional.','https://images.unsplash.com/photo-1518152006812-edab29b069ac?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Lomba Pidato Bahasa Arab','Zahra Khairunnisa','provinsi','keagamaan','Juara 2',2025,'Juara 2 Lomba Pidato Bahasa Arab tingkat Provinsi.','https://images.pexels.com/photos/29599422/pexels-photo-29599422.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Festival Silek Tradisi Minangkabau','Tim Silek MTsN 1','kota','non-akademik','Juara Umum',2025,'Juara Umum Festival Silek Tradisi Minangkabau tingkat Kota.','https://images.unsplash.com/photo-1599717460927-8101594d1418?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'Musabaqah Hifzhil Qur\'an 5 Juz','Rafi Alhaq','provinsi','keagamaan','Juara 3',2025,'Juara 3 Musabaqah Hifzhil Qur\'an 5 Juz tingkat Provinsi.','https://images.unsplash.com/photo-1629273229214-d96be4552b9a?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,'Lomba Karya Tulis Ilmiah Remaja','Tim KIR','nasional','akademik','Finalis',2024,'Finalis Lomba Karya Tulis Ilmiah Remaja tingkat Nasional.','https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,'Jambore Pramuka Penggalang','Gudep MTsN 1','provinsi','non-akademik','Tergiat',2024,'Tergiat Jambore Pramuka Penggalang tingkat Provinsi.','https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `action` varchar(30) NOT NULL,
  `subject_type` varchar(80) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES
(1,1,'login',NULL,NULL,'Masuk ke dashboard','127.0.0.1','2026-10-18 19:05:19'),
(2,2,'login',NULL,NULL,'Masuk ke dashboard','127.0.0.1','2026-10-18 19:06:00'),
(3,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:07:33'),
(4,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:07:35'),
(5,1,'create','Post',11,'Menambah Berita: TEST Berita Terbit 2073c6','136.110.244.150','2026-10-18 19:07:37'),
(6,1,'create','Post',12,'Menambah Berita: TEST Berita Draf 5faa3f','136.110.244.150','2026-10-18 19:07:37'),
(7,1,'delete','Post',11,'Menghapus Berita: TEST Berita Terbit 2073c6','136.110.244.150','2026-10-18 19:07:37'),
(8,1,'delete','Post',12,'Menghapus Berita: TEST Berita Draf 5faa3f','136.110.244.150','2026-10-18 19:07:37'),
(9,1,'create','Post',13,'Menambah Berita: TEST XSS 766721','136.110.244.150','2026-10-18 19:07:38'),
(10,1,'delete','Post',13,'Menghapus Berita: TEST XSS 766721','136.110.244.150','2026-10-18 19:07:39'),
(11,1,'create','Category',6,'Menambah Kategori: TEST Kategori Z','136.110.244.150','2026-10-18 19:07:39'),
(12,1,'update','Category',6,'Memperbarui Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:07:39'),
(13,1,'delete','Category',6,'Menghapus Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:07:40'),
(14,1,'create','Event',9,'Menambah Agenda: TEST Agenda Z','136.110.244.150','2026-10-18 19:07:40'),
(15,1,'update','Event',9,'Memperbarui Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:07:40'),
(16,1,'delete','Event',9,'Menghapus Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:07:41'),
(17,1,'create','Announcement',6,'Menambah Pengumuman: TEST Pengumuman Z','136.110.244.150','2026-10-18 19:07:41'),
(18,1,'update','Announcement',6,'Memperbarui Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:07:41'),
(19,1,'delete','Announcement',6,'Menghapus Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:07:42'),
(20,1,'create','Statistic',49,'Menambah Data statistik: TEST Label','136.110.244.150','2026-10-18 19:07:42'),
(21,1,'update','Statistic',49,'Memperbarui Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:07:42'),
(22,1,'delete','Statistic',49,'Menghapus Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:07:43'),
(23,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:10:52'),
(24,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:11:08'),
(25,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:14:28'),
(26,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:14:30'),
(27,1,'create','Post',14,'Menambah Berita: TEST Berita Terbit 3b622a','136.110.244.150','2026-10-18 19:14:31'),
(28,1,'create','Post',15,'Menambah Berita: TEST Berita Draf a46136','136.110.244.150','2026-10-18 19:14:32'),
(29,1,'delete','Post',15,'Menghapus Berita: TEST Berita Draf a46136','136.110.244.150','2026-10-18 19:14:32'),
(30,1,'delete','Post',14,'Menghapus Berita: TEST Berita Terbit 3b622a','136.110.244.150','2026-10-18 19:14:32'),
(31,1,'create','Post',16,'Menambah Berita: TEST XSS e98043','136.110.244.150','2026-10-18 19:14:33'),
(32,1,'delete','Post',16,'Menghapus Berita: TEST XSS e98043','136.110.244.150','2026-10-18 19:14:33'),
(33,1,'create','Category',7,'Menambah Kategori: TEST Kategori Z','136.110.244.150','2026-10-18 19:14:34'),
(34,1,'update','Category',7,'Memperbarui Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:14:34'),
(35,1,'delete','Category',7,'Menghapus Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:14:34'),
(36,1,'create','Event',10,'Menambah Agenda: TEST Agenda Z','136.110.244.150','2026-10-18 19:14:35'),
(37,1,'update','Event',10,'Memperbarui Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:14:35'),
(38,1,'delete','Event',10,'Menghapus Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:14:35'),
(39,1,'create','Announcement',7,'Menambah Pengumuman: TEST Pengumuman Z','136.110.244.150','2026-10-18 19:14:35'),
(40,1,'update','Announcement',7,'Memperbarui Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:14:36'),
(41,1,'delete','Announcement',7,'Menghapus Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:14:36'),
(42,1,'create','Statistic',50,'Menambah Data statistik: TEST Label','136.110.244.150','2026-10-18 19:14:36'),
(43,1,'update','Statistic',50,'Memperbarui Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:14:37'),
(44,1,'delete','Statistic',50,'Menghapus Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:14:37'),
(45,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:15:16'),
(46,1,'create','Post',17,'Menambah Berita: TEST Cover 7be911','136.110.244.150','2026-10-18 19:15:16'),
(47,1,'delete','Post',17,'Menghapus Berita: TEST Cover 7be911','136.110.244.150','2026-10-18 19:15:17'),
(48,1,'create','Gallery',6,'Menambah Album: TEST Album 807591','136.110.244.150','2026-10-18 19:15:17'),
(49,1,'delete','Gallery',6,'Menghapus Album: TEST Album 807591','136.110.244.150','2026-10-18 19:15:18'),
(50,1,'create','Teacher',13,'Menambah Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:15:18'),
(51,1,'delete','Teacher',13,'Menghapus Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:15:18'),
(52,1,'create','Facility',7,'Menambah Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:15:19'),
(53,1,'delete','Facility',7,'Menghapus Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:15:19'),
(54,1,'create','Achievement',9,'Menambah Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:15:20'),
(55,1,'delete','Achievement',9,'Menghapus Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:15:20'),
(56,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:15:21'),
(57,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:15:21'),
(58,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:15:22'),
(59,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:15:22'),
(60,1,'create','User',3,'Menambah Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:15:22'),
(61,NULL,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:15:23'),
(62,NULL,'create','Post',18,'Menambah Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:15:23'),
(63,1,'delete','Post',18,'Menghapus Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:15:24'),
(64,1,'delete','User',3,'Menghapus Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:15:24'),
(65,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:18:13'),
(66,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:18:55'),
(67,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:19:12'),
(68,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:19:24'),
(69,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:19:52'),
(70,1,'create','Post',19,'Menambah Berita: TEST UI Berita Trix','136.110.244.150','2026-10-18 19:19:54'),
(71,1,'update','Post',19,'Memperbarui Berita: TEST UI Berita Trix Edit','136.110.244.150','2026-10-18 19:19:55'),
(72,1,'delete','Post',19,'Menghapus Berita: TEST UI Berita Trix Edit','136.110.244.150','2026-10-18 19:19:56'),
(73,1,'create','Gallery',7,'Menambah Album: TEST UI Album','136.110.244.150','2026-10-18 19:19:58'),
(74,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:20:48'),
(75,1,'delete','Gallery',7,'Menghapus Album: TEST UI Album','136.110.244.150','2026-10-18 19:20:55'),
(76,1,'logout',NULL,NULL,'Keluar dari dashboard','136.110.244.150','2026-10-18 19:20:56'),
(77,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:21:16'),
(78,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:21:44'),
(79,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:22:00'),
(80,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:22:01'),
(81,1,'create','Post',20,'Menambah Berita: TEST Berita Terbit b4e425','136.110.244.150','2026-10-18 19:22:03'),
(82,1,'create','Post',21,'Menambah Berita: TEST Berita Draf 1cc601','136.110.244.150','2026-10-18 19:22:03'),
(83,1,'delete','Post',21,'Menghapus Berita: TEST Berita Draf 1cc601','136.110.244.150','2026-10-18 19:22:04'),
(84,1,'delete','Post',20,'Menghapus Berita: TEST Berita Terbit b4e425','136.110.244.150','2026-10-18 19:22:04'),
(85,1,'create','Post',22,'Menambah Berita: TEST XSS 1e9f57','136.110.244.150','2026-10-18 19:22:04'),
(86,1,'delete','Post',22,'Menghapus Berita: TEST XSS 1e9f57','136.110.244.150','2026-10-18 19:22:05'),
(87,1,'create','Category',8,'Menambah Kategori: TEST Kategori Z','136.110.244.150','2026-10-18 19:22:05'),
(88,1,'update','Category',8,'Memperbarui Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:22:05'),
(89,1,'delete','Category',8,'Menghapus Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:22:06'),
(90,1,'create','Event',11,'Menambah Agenda: TEST Agenda Z','136.110.244.150','2026-10-18 19:22:06'),
(91,1,'update','Event',11,'Memperbarui Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:22:07'),
(92,1,'delete','Event',11,'Menghapus Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:22:07'),
(93,1,'create','Announcement',8,'Menambah Pengumuman: TEST Pengumuman Z','136.110.244.150','2026-10-18 19:22:07'),
(94,1,'update','Announcement',8,'Memperbarui Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:22:08'),
(95,1,'delete','Announcement',8,'Menghapus Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:22:08'),
(96,1,'create','Statistic',51,'Menambah Data statistik: TEST Label','136.110.244.150','2026-10-18 19:22:08'),
(97,1,'update','Statistic',51,'Memperbarui Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:22:09'),
(98,1,'delete','Statistic',51,'Menghapus Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:22:09'),
(99,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:22:10'),
(100,1,'create','Post',23,'Menambah Berita: TEST Cover 56bd13','136.110.244.150','2026-10-18 19:22:10'),
(101,1,'delete','Post',23,'Menghapus Berita: TEST Cover 56bd13','136.110.244.150','2026-10-18 19:22:11'),
(102,1,'create','Gallery',8,'Menambah Album: TEST Album 4bf022','136.110.244.150','2026-10-18 19:22:11'),
(103,1,'delete','Gallery',8,'Menghapus Album: TEST Album 4bf022','136.110.244.150','2026-10-18 19:22:12'),
(104,1,'create','Teacher',14,'Menambah Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:22:12'),
(105,1,'delete','Teacher',14,'Menghapus Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:22:13'),
(106,1,'create','Facility',8,'Menambah Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:22:13'),
(107,1,'delete','Facility',8,'Menghapus Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:22:14'),
(108,1,'create','Achievement',10,'Menambah Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:22:14'),
(109,1,'delete','Achievement',10,'Menghapus Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:22:15'),
(110,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:22:15'),
(111,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:22:15'),
(112,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:22:16'),
(113,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:22:16'),
(114,1,'create','User',4,'Menambah Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:22:17'),
(115,NULL,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:22:17'),
(116,NULL,'create','Post',24,'Menambah Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:22:18'),
(117,1,'delete','Post',24,'Menghapus Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:22:18'),
(118,1,'delete','User',4,'Menghapus Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:22:19'),
(119,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:33:48'),
(120,1,'login',NULL,NULL,'Masuk ke dashboard','127.0.0.1','2026-10-18 19:37:57'),
(121,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:41:02'),
(122,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:41:04'),
(123,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:41:04'),
(124,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:41:05'),
(125,1,'update','PpdbRegistration',6,'Mengubah status PPDB PPDB-2026-0006 menjadi Diverifikasi','136.110.244.150','2026-10-18 19:41:07'),
(126,1,'delete','PpdbRegistration',6,'Menghapus pendaftar PPDB PPDB-2026-0006','136.110.244.150','2026-10-18 19:41:08'),
(127,1,'create','Document',10,'Menambah Dokumen: TEST Dokumen d8f471','136.110.244.150','2026-10-18 19:41:09'),
(128,1,'update','Document',10,'Memperbarui Dokumen: TEST Dokumen d8f471','136.110.244.150','2026-10-18 19:41:10'),
(129,1,'create','Announcement',9,'Menambah Pengumuman: TEST WA mendesak 283c8','136.110.244.150','2026-10-18 19:41:11'),
(130,1,'delete','Announcement',9,'Menghapus Pengumuman: TEST WA mendesak 283c8','136.110.244.150','2026-10-18 19:41:11'),
(131,1,'create','Announcement',10,'Menambah Pengumuman: TEST WA normal 55026','136.110.244.150','2026-10-18 19:41:11'),
(132,1,'delete','Announcement',10,'Menghapus Pengumuman: TEST WA normal 55026','136.110.244.150','2026-10-18 19:41:12'),
(133,1,'create','Extracurricular',9,'Menambah Ekstrakurikuler: TEST Ekskul 4d5d2','136.110.244.150','2026-10-18 19:41:12'),
(134,1,'delete','Extracurricular',9,'Menghapus Ekstrakurikuler: TEST Ekskul 4d5d2','136.110.244.150','2026-10-18 19:41:13'),
(135,1,'create','OsimMember',11,'Menambah Pengurus OSIM: TEST Osim Member','136.110.244.150','2026-10-18 19:41:14'),
(136,1,'delete','OsimMember',11,'Menghapus Pengurus OSIM: TEST Osim Member','136.110.244.150','2026-10-18 19:41:14'),
(137,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:16'),
(138,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:42:17'),
(139,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:42:17'),
(140,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:18'),
(141,1,'create','Document',11,'Menambah Dokumen: TEST Dokumen cd1889','136.110.244.150','2026-10-18 19:42:18'),
(142,1,'update','Document',11,'Memperbarui Dokumen: TEST Dokumen cd1889','136.110.244.150','2026-10-18 19:42:19'),
(143,1,'delete','Document',11,'Menghapus Dokumen: TEST Dokumen cd1889','136.110.244.150','2026-10-18 19:42:20'),
(144,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:29'),
(145,1,'create','Post',25,'Menambah Berita: TEST Cover 11726c','136.110.244.150','2026-10-18 19:42:29'),
(146,1,'delete','Post',25,'Menghapus Berita: TEST Cover 11726c','136.110.244.150','2026-10-18 19:42:30'),
(147,1,'create','Gallery',9,'Menambah Album: TEST Album ece540','136.110.244.150','2026-10-18 19:42:30'),
(148,1,'delete','GalleryItem',23,'Menghapus foto dari album: TEST Album ece540','136.110.244.150','2026-10-18 19:42:31'),
(149,1,'delete','Gallery',9,'Menghapus Album: TEST Album ece540','136.110.244.150','2026-10-18 19:42:31'),
(150,1,'create','Teacher',15,'Menambah Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:42:31'),
(151,1,'delete','Teacher',15,'Menghapus Data guru: TEST Guru Zeta','136.110.244.150','2026-10-18 19:42:32'),
(152,1,'create','Facility',9,'Menambah Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:42:33'),
(153,1,'delete','Facility',9,'Menghapus Fasilitas: TEST Fasilitas Zeta','136.110.244.150','2026-10-18 19:42:34'),
(154,1,'create','Achievement',11,'Menambah Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:42:34'),
(155,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:35'),
(156,1,'delete','Achievement',11,'Menghapus Prestasi: TEST Prestasi Zeta','136.110.244.150','2026-10-18 19:42:35'),
(157,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:42:35'),
(158,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:42:36'),
(159,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:42:37'),
(160,1,'update','Page',3,'Memperbarui halaman profil: Visi','136.110.244.150','2026-10-18 19:42:38'),
(161,1,'create','User',5,'Menambah Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:42:39'),
(162,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:39'),
(163,NULL,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:42:39'),
(164,1,'create','Post',26,'Menambah Berita: TEST Berita Terbit dae778','136.110.244.150','2026-10-18 19:42:43'),
(165,1,'create','Post',27,'Menambah Berita: TEST Berita Draf 6feef0','136.110.244.150','2026-10-18 19:42:43'),
(166,1,'delete','Post',27,'Menghapus Berita: TEST Berita Draf 6feef0','136.110.244.150','2026-10-18 19:42:43'),
(167,NULL,'create','Post',28,'Menambah Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:42:43'),
(168,1,'delete','Post',26,'Menghapus Berita: TEST Berita Terbit dae778','136.110.244.150','2026-10-18 19:42:44'),
(169,1,'delete','Post',28,'Menghapus Berita: TEST Editor Post','136.110.244.150','2026-10-18 19:42:44'),
(170,1,'delete','User',5,'Menghapus Pengguna: TEST Editor','136.110.244.150','2026-10-18 19:42:44'),
(171,1,'create','Post',29,'Menambah Berita: TEST XSS 853bfc','136.110.244.150','2026-10-18 19:42:44'),
(172,1,'delete','Post',29,'Menghapus Berita: TEST XSS 853bfc','136.110.244.150','2026-10-18 19:42:45'),
(173,1,'create','Category',9,'Menambah Kategori: TEST Kategori Z','136.110.244.150','2026-10-18 19:42:45'),
(174,1,'update','Category',9,'Memperbarui Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:42:45'),
(175,1,'delete','Category',9,'Menghapus Kategori: TEST Kategori Z Edit','136.110.244.150','2026-10-18 19:42:46'),
(176,1,'create','Event',12,'Menambah Agenda: TEST Agenda Z','136.110.244.150','2026-10-18 19:42:46'),
(177,1,'update','Event',12,'Memperbarui Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:42:46'),
(178,1,'delete','Event',12,'Menghapus Agenda: TEST Agenda Z Edit','136.110.244.150','2026-10-18 19:42:47'),
(179,1,'create','Announcement',11,'Menambah Pengumuman: TEST Pengumuman Z','136.110.244.150','2026-10-18 19:42:47'),
(180,1,'update','Announcement',11,'Memperbarui Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:42:47'),
(181,1,'delete','Announcement',11,'Menghapus Pengumuman: TEST Pengumuman Z Edit','136.110.244.150','2026-10-18 19:42:48'),
(182,1,'create','Statistic',52,'Menambah Data statistik: TEST Label','136.110.244.150','2026-10-18 19:42:48'),
(183,1,'update','Statistic',52,'Memperbarui Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:42:48'),
(184,1,'delete','Statistic',52,'Menghapus Data statistik: TEST Label Edit','136.110.244.150','2026-10-18 19:42:49'),
(185,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:45:51'),
(186,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:46:07'),
(187,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:46:17'),
(188,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:46:30'),
(189,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:47:23'),
(190,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:48:10'),
(191,1,'update','PpdbRegistration',7,'Mengubah status PPDB PPDB-2026-0006 menjadi Diterima','136.110.244.150','2026-10-18 19:48:11'),
(192,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:49:00'),
(193,1,'create','Announcement',12,'Menambah Pengumuman: TEST UI Mendesak Libur','136.110.244.150','2026-10-18 19:49:00'),
(194,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:50:48'),
(195,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:50:49'),
(196,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:50:56'),
(197,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:51:10'),
(198,1,'update','Page',9,'Memperbarui halaman profil: Wadah kepemimpinan siswa','136.110.244.150','2026-10-18 19:51:11'),
(199,1,'update','Page',9,'Memperbarui halaman profil: Wadah kepemimpinan siswa','136.110.244.150','2026-10-18 19:51:12'),
(200,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:51:33'),
(201,1,'delete','Announcement',12,'Menghapus Pengumuman: TEST UI Mendesak Libur','136.110.244.150','2026-10-18 19:51:34'),
(202,1,'delete','PpdbRegistration',7,'Menghapus pendaftar PPDB PPDB-2026-0006','136.110.244.150','2026-10-18 19:51:34'),
(203,1,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:52:42'),
(204,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:52:44'),
(205,1,'update',NULL,NULL,'Memperbarui pengaturan situs','136.110.244.150','2026-10-18 19:52:44'),
(206,2,'login',NULL,NULL,'Masuk ke dashboard','136.110.244.150','2026-10-18 19:52:46'),
(207,1,'update','PpdbRegistration',8,'Mengubah status PPDB PPDB-2026-0006 menjadi Diverifikasi','136.110.244.150','2026-10-18 19:52:47'),
(208,1,'delete','PpdbRegistration',8,'Menghapus pendaftar PPDB PPDB-2026-0006','136.110.244.150','2026-10-18 19:52:48'),
(209,1,'create','Document',12,'Menambah Dokumen: TEST Dokumen 819090','136.110.244.150','2026-10-18 19:52:50'),
(210,1,'update','Document',12,'Memperbarui Dokumen: TEST Dokumen 819090','136.110.244.150','2026-10-18 19:52:51'),
(211,1,'delete','Document',12,'Menghapus Dokumen: TEST Dokumen 819090','136.110.244.150','2026-10-18 19:52:51'),
(212,1,'create','Announcement',13,'Menambah Pengumuman: TEST WA mendesak e0204','136.110.244.150','2026-10-18 19:52:51'),
(213,1,'delete','Announcement',13,'Menghapus Pengumuman: TEST WA mendesak e0204','136.110.244.150','2026-10-18 19:52:52'),
(214,1,'create','Announcement',14,'Menambah Pengumuman: TEST WA normal 405e4','136.110.244.150','2026-10-18 19:52:52'),
(215,1,'delete','Announcement',14,'Menghapus Pengumuman: TEST WA normal 405e4','136.110.244.150','2026-10-18 19:52:53'),
(216,1,'create','Extracurricular',10,'Menambah Ekstrakurikuler: TEST Ekskul b5327','136.110.244.150','2026-10-18 19:52:53'),
(217,1,'delete','Extracurricular',10,'Menghapus Ekstrakurikuler: TEST Ekskul b5327','136.110.244.150','2026-10-18 19:52:54'),
(218,1,'create','OsimMember',12,'Menambah Pengurus OSIM: TEST Osim Member','136.110.244.150','2026-10-18 19:52:55'),
(219,1,'delete','OsimMember',12,'Menghapus Pengurus OSIM: TEST Osim Member','136.110.244.150','2026-10-18 19:52:55'),
(220,1,'update','Page',9,'Memperbarui halaman profil: Wadah kepemimpinan siswa','136.110.244.150','2026-10-18 19:52:58'),
(221,1,'update','Page',9,'Memperbarui halaman profil: Wadah kepemimpinan siswa','136.110.244.150','2026-10-18 19:52:58');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `priority` enum('normal','penting','mendesak') NOT NULL DEFAULT 'normal',
  `attachment` varchar(255) DEFAULT NULL,
  `starts_at` date DEFAULT NULL,
  `ends_at` date DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `announcements_slug_unique` (`slug`),
  KEY `announcements_is_published_index` (`is_published`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES
(1,'Pendaftaran Peserta Didik Baru (PPDB) Tahun Pelajaran 2026/2027','pendaftaran-peserta-didik-baru-ppdb-tahun-pelajaran-20262027','<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>Pendaftaran Peserta Didik Baru (PPDB) Tahun Pelajaran 2026/2027</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>','mendesak',NULL,'2026-10-13','2026-11-17',1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Jadwal Penilaian Akhir Semester Genap','jadwal-penilaian-akhir-semester-genap','<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>Jadwal Penilaian Akhir Semester Genap</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>','penting',NULL,'2026-10-16','2026-11-07',1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Libur Hari Raya Iduladha 1447 H','libur-hari-raya-iduladha-1447-h','<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>Libur Hari Raya Iduladha 1447 H</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>','normal',NULL,'2026-10-17','2026-11-01',1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Pengambilan Rapor dan Pertemuan Wali Murid','pengambilan-rapor-dan-pertemuan-wali-murid','<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>Pengambilan Rapor dan Pertemuan Wali Murid</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>','penting',NULL,'2026-10-18','2026-11-12',1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Seleksi Tim Olimpiade Sains Madrasah','seleksi-tim-olimpiade-sains-madrasah','<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>Seleksi Tim Olimpiade Sains Madrasah</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>','normal',NULL,'2026-10-08','2026-10-28',1,'2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES
('mtsn-1-bukittinggi-cache-5c785c036466adea360111aa28563bfd556b5fba','i:4;',1792327137),
('mtsn-1-bukittinggi-cache-5c785c036466adea360111aa28563bfd556b5fba:timer','i:1792327137;',1792327137),
('mtsn-1-bukittinggi-cache-9fbe1fa5f2ade50f96719d8ce9dba6e147d111a1','i:1;',1792328136),
('mtsn-1-bukittinggi-cache-9fbe1fa5f2ade50f96719d8ce9dba6e147d111a1:timer','i:1792328136;',1792328136),
('mtsn-1-bukittinggi-cache-settings','a:19:{s:9:\"site_name\";s:18:\"MTsN 1 Bukittinggi\";s:7:\"tagline\";s:62:\"Madrasah Hebat, Bermartabat — Islami, Berprestasi, Berbudaya\";s:10:\"hero_title\";s:58:\"Mendidik generasi berakhlak karimah di kaki Gunung Marapi.\";s:13:\"hero_subtitle\";s:172:\"Madrasah Tsanawiyah Negeri 1 Bukittinggi memadukan keunggulan akademik, tradisi keilmuan Islam, dan nilai adat Minangkabau \"Adat Basandi Syarak, Syarak Basandi Kitabullah\".\";s:4:\"npsn\";s:8:\"10310836\";s:13:\"accreditation\";s:10:\"A (Unggul)\";s:7:\"address\";s:116:\"Jl. Raya Kusuma Bhakti KM 1, Kubu Gulai Bancah, Kec. Mandiangin Koto Selayan, Kota Bukittinggi, Sumatera Barat 26122\";s:5:\"phone\";s:12:\"(0752) 22939\";s:5:\"email\";s:28:\"info@mtsn1bukittinggi.sch.id\";s:12:\"office_hours\";s:32:\"Senin–Jumat, 07.15–16.00 WIB\";s:8:\"facebook\";s:21:\"https://facebook.com/\";s:9:\"instagram\";s:22:\"https://instagram.com/\";s:7:\"youtube\";s:20:\"https://youtube.com/\";s:10:\"maps_embed\";s:109:\"https://maps.google.com/maps?q=MTsN%201%20Bukittinggi&amp;t=&amp;z=16&amp;ie=UTF8&amp;iwloc=&amp;output=embed\";s:8:\"ppdb_url\";s:27:\"https://ppdb.kemenag.go.id/\";s:8:\"whatsapp\";s:13:\"6281234567890\";s:9:\"ppdb_open\";s:1:\"1\";s:9:\"ppdb_year\";s:9:\"2026/2027\";s:10:\"ppdb_quota\";s:3:\"320\";}',2107687964),
('mtsn-1-bukittinggi-cache-test_rl_cc0069@x.com|136.110.244.150','i:5;',1792327412),
('mtsn-1-bukittinggi-cache-test_rl_cc0069@x.com|136.110.244.150:timer','i:1792327412;',1792327412);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Kegiatan Madrasah','kegiatan-madrasah',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Prestasi','prestasi',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Keagamaan','keagamaan',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Akademik','akademik',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Informasi','informasi',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `category` enum('silabus','formulir','regulasi','lainnya') NOT NULL DEFAULT 'lainnya',
  `description` varchar(500) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `downloads` int(10) unsigned NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_category_index` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES
(1,'Kalender Pendidikan 2025/2026','regulasi','Kalender akademik resmi madrasah tahun pelajaran 2025/2026.','uploads/documents/kalender-pendidikan-20252026.pdf',156,1,'2026-10-18 19:37:53','2026-10-18 19:49:31'),
(2,'Tata Tertib Peserta Didik','regulasi','Ketentuan disiplin, seragam, dan sanksi bagi peserta didik.','uploads/documents/tata-tertib-peserta-didik.pdf',173,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(3,'Surat Edaran Libur Iduladha 1447 H','regulasi',NULL,'uploads/documents/surat-edaran-libur-iduladha-1447-h.pdf',115,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(4,'Formulir Izin Tidak Masuk Sekolah','formulir','Diisi orang tua/wali dan diserahkan ke wali kelas.','uploads/documents/formulir-izin-tidak-masuk-sekolah.pdf',8,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(5,'Formulir Permohonan Mutasi Siswa','formulir',NULL,'uploads/documents/formulir-permohonan-mutasi-siswa.pdf',195,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(6,'Formulir Pendaftaran Ekstrakurikuler','formulir',NULL,'uploads/documents/formulir-pendaftaran-ekstrakurikuler.pdf',191,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(7,'Silabus Fikih Kelas VII','silabus','Kurikulum Merdeka — Fase D.','uploads/documents/silabus-fikih-kelas-vii.pdf',159,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(8,'Modul Ajar Matematika Kelas VIII','silabus','Kurikulum Merdeka — Fase D.','uploads/documents/modul-ajar-matematika-kelas-viii.pdf',41,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(9,'Silabus Bahasa Arab Kelas IX','silabus',NULL,'uploads/documents/silabus-bahasa-arab-kelas-ix.pdf',161,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(10,'TEST Dokumen d8f471','silabus',NULL,'uploads/documents/xrlzyzMbrDkQ1rGBWankCLzoOWSYMVPrxjJn2QIy.pdf',1,0,'2026-10-18 19:41:09','2026-10-18 19:41:10');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `category` enum('akademik','keagamaan','kesiswaan','umum') NOT NULL DEFAULT 'umum',
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_slug_unique` (`slug`),
  KEY `events_starts_at_index` (`starts_at`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(1,'Penilaian Akhir Semester Genap','penilaian-akhir-semester-genap','Kegiatan Penilaian Akhir Semester Genap diikuti oleh warga madrasah sesuai ketentuan panitia.','Ruang kelas','akademik','2026-10-24 07:30:00','2026-10-27 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Manasik Haji Siswa Kelas VII','manasik-haji-siswa-kelas-vii','Kegiatan Manasik Haji Siswa Kelas VII diikuti oleh warga madrasah sesuai ketentuan panitia.','Lapangan madrasah','keagamaan','2026-10-27 07:30:00','2026-10-27 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Rapat Pleno Kenaikan Kelas','rapat-pleno-kenaikan-kelas','Kegiatan Rapat Pleno Kenaikan Kelas diikuti oleh warga madrasah sesuai ketentuan panitia.','Aula madrasah','akademik','2026-11-01 07:30:00','2026-11-01 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Pembagian Rapor Semester Genap','pembagian-rapor-semester-genap','Kegiatan Pembagian Rapor Semester Genap diikuti oleh warga madrasah sesuai ketentuan panitia.','Ruang kelas','akademik','2026-11-05 07:30:00','2026-11-05 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Masa Ta\'aruf Siswa Madrasah (MATSAMA)','masa-taaruf-siswa-madrasah-matsama','Kegiatan Masa Ta\'aruf Siswa Madrasah (MATSAMA) diikuti oleh warga madrasah sesuai ketentuan panitia.','Aula & lapangan','kesiswaan','2026-11-17 07:30:00','2026-11-19 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'Lomba Pidato Tiga Bahasa','lomba-pidato-tiga-bahasa','Kegiatan Lomba Pidato Tiga Bahasa diikuti oleh warga madrasah sesuai ketentuan panitia.','Aula madrasah','kesiswaan','2026-10-21 07:30:00','2026-10-21 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,'Kajian Jumat Guru dan Tendik','kajian-jumat-guru-dan-tendik','Kegiatan Kajian Jumat Guru dan Tendik diikuti oleh warga madrasah sesuai ketentuan panitia.','Musala Al-Ikhlas','keagamaan','2026-10-20 07:30:00','2026-10-20 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,'Rapat Komite Madrasah','rapat-komite-madrasah','Kegiatan Rapat Komite Madrasah diikuti oleh warga madrasah sesuai ketentuan panitia.','Ruang rapat','umum','2026-10-14 07:30:00','2026-10-14 12:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extracurriculars`
--

DROP TABLE IF EXISTS `extracurriculars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `extracurriculars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` enum('keagamaan','olahraga','seni','akademik','kepanduan') NOT NULL DEFAULT 'akademik',
  `coach_name` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `gallery_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extracurriculars_slug_unique` (`slug`),
  KEY `extracurriculars_gallery_id_foreign` (`gallery_id`),
  CONSTRAINT `extracurriculars_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extracurriculars`
--

LOCK TABLES `extracurriculars` WRITE;
/*!40000 ALTER TABLE `extracurriculars` DISABLE KEYS */;
INSERT INTO `extracurriculars` VALUES
(1,'Tahfiz Al-Qur\'an','tahfiz-al-quran','keagamaan','Ust. Hafizul Ikhwan, Lc','Senin & Kamis, 14.00–15.30 WIB','Musala Al-Ikhlas','Program pembinaan hafalan Al-Qur\'an dengan target minimal 3 juz selama tiga tahun. Peserta dibimbing dengan metode talaqqi dan murajaah berkala.','https://images.pexels.com/photos/33451744/pexels-photo-33451744.jpeg?auto=compress&cs=tinysrgb&w=1400',1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(2,'Pramuka','pramuka','kepanduan','Rahmat Hidayat, S.Pd','Jumat, 14.00–16.00 WIB','Lapangan madrasah','Ekstrakurikuler wajib bagi kelas VII yang menanamkan kedisiplinan, kemandirian, dan cinta tanah air melalui kegiatan kepanduan.','https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400',2,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(3,'Kelompok Ilmiah Remaja (KIR)','kelompok-ilmiah-remaja-kir','akademik','Yusnimar, S.Pd','Rabu, 14.00–15.30 WIB','Laboratorium IPA','Wadah bagi siswa yang gemar meneliti. Anggota KIR rutin mengikuti lomba karya tulis ilmiah dan KSM.','https://images.pexels.com/photos/40117754/pexels-photo-40117754.jpeg?auto=compress&cs=tinysrgb&w=1400',3,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(4,'Silek Tradisi Minangkabau','silek-tradisi-minangkabau','seni','Zulkifli, S.Sn','Sabtu, 08.00–10.00 WIB','Aula madrasah','Pelestarian seni bela diri tradisional Minangkabau yang memadukan keterampilan fisik dan nilai-nilai adat.','https://images.unsplash.com/photo-1599717460927-8101594d1418?w=1400&q=75',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(5,'Drumband','drumband','seni','Tim Pelatih Drumband','Selasa & Sabtu, 15.00–17.00 WIB','Lapangan madrasah','Tim drumband madrasah tampil dalam upacara, pawai budaya, dan berbagai perlombaan tingkat kota.','https://images.unsplash.com/photo-1665664660924-255a6167f498?w=1400&q=75',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(6,'Futsal','futsal','olahraga','Dedi Kurniawan, S.Pd','Kamis, 15.30–17.00 WIB','Lapangan serbaguna','Pembinaan olahraga futsal putra dan putri untuk kompetisi antarsekolah.','https://images.pexels.com/photos/37097046/pexels-photo-37097046.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-10-18 19:37:53','2026-10-18 19:54:21'),
(7,'Muhadharah & Pidato 3 Bahasa','muhadharah-pidato-3-bahasa','keagamaan','Fitri Handayani, S.Pd.I','Sabtu, 10.00–11.30 WIB','Ruang kelas IX-A','Latihan berpidato dalam Bahasa Indonesia, Arab, dan Inggris untuk membangun kepercayaan diri dan kemampuan dakwah.','https://images.pexels.com/photos/29599422/pexels-photo-29599422.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(8,'Literasi & Jurnalistik','literasi-jurnalistik','akademik','Silvia Marni, S.Pd','Rabu, 14.00–15.00 WIB','Perpustakaan','Mengelola majalah dinding dan berita sekolah, serta melatih kemampuan menulis kreatif.','https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400',5,'2026-10-18 19:37:53','2026-10-18 19:37:53');
/*!40000 ALTER TABLE `extracurriculars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES
(1,'Laboratorium IPA','Dilengkapi mikroskop, alat praktikum fisika dan biologi untuk pembelajaran berbasis eksperimen.','https://images.pexels.com/photos/40117754/pexels-photo-40117754.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Perpustakaan Madrasah','Koleksi lebih dari 8.000 judul buku, ruang baca nyaman, dan pojok literasi digital.','https://images.unsplash.com/photo-1595315342809-fa10945ed07c?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Musala Al-Ikhlas','Pusat kegiatan ibadah, tahfiz, dan kajian keislaman warga madrasah.','https://images.unsplash.com/photo-1629273229214-d96be4552b9a?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Ruang Kelas Representatif','30 ruang kelas dengan proyektor dan sirkulasi udara yang baik.','https://images.pexels.com/photos/35548841/pexels-photo-35548841.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Laboratorium Komputer','40 unit komputer untuk pembelajaran informatika dan asesmen berbasis komputer.','https://images.pexels.com/photos/35548842/pexels-photo-35548842.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'Lapangan Olahraga','Lapangan serbaguna untuk upacara, futsal, voli, dan kegiatan pramuka.','https://images.pexels.com/photos/6638645/pexels-photo-6638645.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `galleries_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES
(1,'Wisuda Tahfiz Angkatan VII','wisuda-tahfiz-angkatan-vii','Dokumentasi kegiatan Wisuda Tahfiz Angkatan VII.','https://images.pexels.com/photos/33451744/pexels-photo-33451744.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-10-13','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Kemah Bakti Pramuka','kemah-bakti-pramuka','Dokumentasi kegiatan Kemah Bakti Pramuka.','https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-09-30','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Projek P5 Kearifan Lokal','projek-p5-kearifan-lokal','Dokumentasi kegiatan Projek P5 Kearifan Lokal.','https://images.pexels.com/photos/35548841/pexels-photo-35548841.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-09-18','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Profil Video MTsN 1 Bukittinggi','profil-video-mtsn-1-bukittinggi','Dokumentasi kegiatan Profil Video MTsN 1 Bukittinggi.','https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1600&q=75','https://www.youtube.com/watch?v=ysz5S6PUM-U','2026-08-19','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Kunjungan Perpustakaan Daerah','kunjungan-perpustakaan-daerah','Dokumentasi kegiatan Kunjungan Perpustakaan Daerah.','https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400',NULL,'2026-08-04','2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_items`
--

DROP TABLE IF EXISTS `gallery_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) unsigned NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_items_gallery_id_foreign` (`gallery_id`),
  CONSTRAINT `gallery_items_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_items`
--

LOCK TABLES `gallery_items` WRITE;
/*!40000 ALTER TABLE `gallery_items` DISABLE KEYS */;
INSERT INTO `gallery_items` VALUES
(1,1,'https://images.pexels.com/photos/33451744/pexels-photo-33451744.jpeg?auto=compress&cs=tinysrgb&w=1400','Wisuda Tahfiz Angkatan VII','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,1,'https://images.unsplash.com/photo-1629273229664-11fabc0becc0?w=1400&q=75','Wisuda Tahfiz Angkatan VII','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,1,'https://images.unsplash.com/photo-1629273229214-d96be4552b9a?w=1400&q=75','Wisuda Tahfiz Angkatan VII','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,2,'https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400','Kemah Bakti Pramuka','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,2,'https://images.pexels.com/photos/6638645/pexels-photo-6638645.jpeg?auto=compress&cs=tinysrgb&w=1400','Kemah Bakti Pramuka','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,2,'https://images.unsplash.com/photo-1665664660924-255a6167f498?w=1400&q=75','Kemah Bakti Pramuka','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,3,'https://images.pexels.com/photos/35548841/pexels-photo-35548841.jpeg?auto=compress&cs=tinysrgb&w=1400','Projek P5 Kearifan Lokal','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,3,'https://images.pexels.com/photos/35548842/pexels-photo-35548842.jpeg?auto=compress&cs=tinysrgb&w=1400','Projek P5 Kearifan Lokal','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(9,3,'https://images.unsplash.com/photo-1625111380820-9a371d413cc4?w=1400&q=75','Projek P5 Kearifan Lokal','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(10,4,'https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1600&q=75','Profil Video MTsN 1 Bukittinggi','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(11,4,'https://images.unsplash.com/photo-1599717460927-8101594d1418?w=1400&q=75','Profil Video MTsN 1 Bukittinggi','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(12,5,'https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400','Kunjungan Perpustakaan Daerah','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(13,5,'https://images.unsplash.com/photo-1595315342809-fa10945ed07c?w=1400&q=75','Kunjungan Perpustakaan Daerah','2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `gallery_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2026_06_01_000001_add_role_to_users_table',1),
(5,'2026_06_01_000002_create_content_tables',1),
(6,'2026_06_01_000003_create_school_tables',1),
(7,'2026_06_02_000001_create_student_affairs_tables',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osim_members`
--

DROP TABLE IF EXISTS `osim_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `osim_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(100) NOT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  `period` varchar(9) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osim_members`
--

LOCK TABLES `osim_members` WRITE;
/*!40000 ALTER TABLE `osim_members` DISABLE KEYS */;
INSERT INTO `osim_members` VALUES
(1,'Muhammad Fadhil Ramadhan','Ketua OSIM','IX-B','2025/2026',NULL,0,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(2,'Aisyah Rahmadani','Wakil Ketua OSIM','VIII-A','2025/2026',NULL,1,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(3,'Nabila Putri Azzahra','Sekretaris','VIII-C','2025/2026',NULL,2,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(4,'Rafi Alhaq','Bendahara','VIII-B','2025/2026',NULL,3,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(5,'Zahra Khairunnisa','Sekbid Keimanan & Ketakwaan','VIII-D','2025/2026',NULL,4,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(6,'Fikri Maulana','Sekbid Kepemimpinan','VIII-E','2025/2026',NULL,5,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(7,'Salsabila Putri','Sekbid Seni & Budaya','VIII-F','2025/2026',NULL,6,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(8,'Arkan Hafiz','Sekbid Olahraga','VIII-A','2025/2026',NULL,7,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(9,'Keisya Amanda','Sekbid Lingkungan Hidup','VII-C','2025/2026',NULL,8,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(10,'Dzaky Al-Fatih','Sekbid Teknologi Informasi','VII-B','2025/2026',NULL,9,'2026-10-18 19:37:53','2026-10-18 19:37:53');
/*!40000 ALTER TABLE `osim_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,'sambutan','Sambutan Kepala Madrasah','<p>Assalamu\'alaikum warahmatullahi wabarakatuh.</p><p>Puji syukur kita panjatkan ke hadirat Allah SWT. Website resmi ini kami hadirkan sebagai jendela informasi bagi orang tua, peserta didik, alumni, dan masyarakat untuk mengenal lebih dekat MTsN 1 Bukittinggi.</p><p>Kami berkomitmen menyelenggarakan pendidikan yang menyeimbangkan kecerdasan intelektual, kedalaman spiritual, dan kepedulian sosial. Dengan dukungan seluruh warga madrasah, kami terus berbenah agar setiap anak tumbuh menjadi pribadi yang berilmu, beramal, dan berakhlak mulia.</p><p>Wassalamu\'alaikum warahmatullahi wabarakatuh.</p>','https://images.unsplash.com/photo-1625111381887-458fce74a923?w=1400&q=75','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'sejarah','Sejarah Singkat','<p>MTsN 1 Bukittinggi berawal dari Pendidikan Guru Agama (PGA) yang kemudian dialihfungsikan menjadi Madrasah Tsanawiyah Negeri pada akhir dekade 1970-an melalui kebijakan penegerian madrasah oleh Kementerian Agama.</p><p>Sejak itu madrasah terus berkembang, baik dari sisi jumlah peserta didik, kualitas tenaga pendidik, maupun sarana prasarana. Berlokasi di Kubu Gulai Bancah, madrasah ini menjadi salah satu rujukan pendidikan menengah pertama berbasis keislaman di Kota Bukittinggi dan sekitarnya.</p><p>Kini MTsN 1 Bukittinggi terakreditasi A dan aktif mengembangkan program unggulan tahfiz, sains, literasi, serta pembinaan karakter berbasis budaya Minangkabau.</p>','https://images.pexels.com/photos/16584280/pexels-photo-16584280.jpeg?auto=compress&cs=tinysrgb&w=1400','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'visi','Visi','<p>Terwujudnya madrasah yang Islami, unggul dalam prestasi, berwawasan lingkungan, dan berbudaya Minangkabau.</p>',NULL,'2026-10-18 18:58:37','2026-10-18 19:42:38'),
(4,'misi','Misi','<ul><li>Menanamkan akidah dan membiasakan ibadah serta akhlak karimah dalam kehidupan sehari-hari.</li><li>Menyelenggarakan pembelajaran aktif, kreatif, dan bermakna sesuai Kurikulum Merdeka.</li><li>Mengembangkan program tahfiz Al-Qur\'an dan literasi keagamaan.</li><li>Membina potensi akademik dan non-akademik peserta didik hingga tingkat nasional.</li><li>Mewujudkan lingkungan madrasah yang bersih, hijau, dan ramah anak.</li><li>Melestarikan nilai adat Basandi Syarak, Syarak Basandi Kitabullah.</li></ul>',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'struktur','Struktur Organisasi','<p>Kepala Madrasah dibantu oleh Kepala Tata Usaha serta Wakil Kepala Madrasah bidang Kurikulum, Kesiswaan, Sarana Prasarana, dan Humas. Setiap wakil membawahi koordinator program, wali kelas, dan guru mata pelajaran.</p>',NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'ppdb_alur','Alur Pendaftaran','<ol><li>Isi formulir pendaftaran online dan unggah berkas.</li><li>Simpan nomor pendaftaran yang muncul setelah formulir terkirim.</li><li>Panitia memverifikasi berkas (1–3 hari kerja).</li><li>Ikuti tes seleksi: baca tulis Al-Qur\'an, akademik dasar, dan wawancara.</li><li>Cek pengumuman hasil seleksi melalui menu Cek Status.</li><li>Lakukan daftar ulang bagi calon peserta didik yang diterima.</li></ol>',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(7,'ppdb_persyaratan','Persyaratan Pendaftaran','<ul><li>Lulusan SD/MI atau sederajat tahun 2026 / kelas 6 yang akan lulus.</li><li>Usia maksimal 15 tahun pada 1 Juli 2026.</li><li>Fotokopi Kartu Keluarga dan akta kelahiran.</li><li>Fotokopi rapor kelas 4 dan 5 yang dilegalisir.</li><li>Pas foto berwarna 3×4 sebanyak 2 lembar.</li><li>Sertifikat prestasi (jika ada) untuk jalur prestasi.</li></ul>',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(8,'ppdb_jadwal','Jadwal PPDB 2026/2027','<ul><li><strong>2 Feb – 28 Mar 2026</strong> · Pendaftaran online</li><li><strong>30 Mar – 3 Apr 2026</strong> · Verifikasi berkas</li><li><strong>11 Apr 2026</strong> · Tes seleksi &amp; wawancara</li><li><strong>20 Apr 2026</strong> · Pengumuman hasil</li><li><strong>27 – 30 Apr 2026</strong> · Daftar ulang</li><li><strong>13 Jul 2026</strong> · MATSAMA (Masa Ta\'aruf Siswa Madrasah)</li></ul>',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(9,'osim','Wadah kepemimpinan siswa','<p>OSIM MTsN 1 Bukittinggi merupakan satu-satunya organisasi resmi peserta didik di lingkungan madrasah. Pengurus dipilih secara demokratis melalui pemilihan ketua OSIM setiap tahun ajaran.</p><h3>Program kerja unggulan</h3><ul><li>Gerakan Salat Duha dan Tadarus Pagi berjamaah.</li><li>Pekan Seni dan Olahraga (PORSENI) antarkelas.</li><li>Bakti sosial dan santunan anak yatim setiap Ramadan.</li><li>Madrasah Bersih dan Hijau (Adiwiyata).</li><li>Peringatan Hari Besar Islam dan Hari Besar Nasional.</li></ul>',NULL,'2026-10-18 19:37:53','2026-10-18 19:52:58');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` varchar(500) DEFAULT NULL,
  `content` longtext NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_published_at_index` (`published_at`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES
(1,2,1,'Siswa MTsN 1 Bukittinggi Raih Medali Emas KSM Tingkat Provinsi Sumatera Barat','siswa-mtsn-1-bukittinggi-raih-medali-emas-ksm-tingkat-provinsi-sumatera-barat','Tiga siswa MTsN 1 Bukittinggi berhasil meraih medali pada Kompetisi Sains Madrasah tingkat provinsi, satu di antaranya medali emas bidang Matematika Terintegrasi.','<p>Tiga siswa MTsN 1 Bukittinggi berhasil meraih medali pada Kompetisi Sains Madrasah tingkat provinsi, satu di antaranya medali emas bidang Matematika Terintegrasi.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/40117754/pexels-photo-40117754.jpeg?auto=compress&cs=tinysrgb&w=1400','published',1,1335,'2026-10-16 09:00:00','2026-10-18 18:58:37','2026-10-18 19:42:30'),
(2,3,1,'Wisuda Tahfiz Angkatan VII: 48 Siswa Tuntaskan Hafalan 3 Juz','wisuda-tahfiz-angkatan-vii-48-siswa-tuntaskan-hafalan-3-juz','Sebanyak 48 peserta didik mengikuti wisuda tahfiz yang disaksikan orang tua dan tokoh masyarakat Bukittinggi.','<p>Sebanyak 48 peserta didik mengikuti wisuda tahfiz yang disaksikan orang tua dan tokoh masyarakat Bukittinggi.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/33451744/pexels-photo-33451744.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,1336,'2026-10-13 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,4,1,'Pelaksanaan Asesmen Madrasah Kelas IX Berjalan Lancar dan Tertib','pelaksanaan-asesmen-madrasah-kelas-ix-berjalan-lancar-dan-tertib','Asesmen Madrasah berbasis komputer diikuti seluruh siswa kelas IX dengan tingkat kehadiran 100 persen.','<p>Asesmen Madrasah berbasis komputer diikuti seluruh siswa kelas IX dengan tingkat kehadiran 100 persen.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/35548842/pexels-photo-35548842.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,1389,'2026-10-09 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,1,1,'Gerakan Literasi Pagi: Lima Belas Menit Membaca Sebelum Belajar','gerakan-literasi-pagi-lima-belas-menit-membaca-sebelum-belajar','Program literasi pagi kembali digalakkan untuk menumbuhkan kebiasaan membaca seluruh warga madrasah.','<p>Program literasi pagi kembali digalakkan untuk menumbuhkan kebiasaan membaca seluruh warga madrasah.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,504,'2026-10-05 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,1,1,'Kemah Bakti Pramuka Gugus Depan MTsN 1 Bukittinggi di Bumi Perkemahan Panorama','kemah-bakti-pramuka-gugus-depan-mtsn-1-bukittinggi-di-bumi-perkemahan-panorama','Ratusan anggota pramuka penggalang mengikuti kemah bakti selama tiga hari dengan berbagai lomba ketangkasan.','<p>Ratusan anggota pramuka penggalang mengikuti kemah bakti selama tiga hari dengan berbagai lomba ketangkasan.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,266,'2026-09-30 09:00:00','2026-10-18 18:58:37','2026-10-18 19:06:50'),
(6,3,1,'Peringatan Maulid Nabi Muhammad SAW Bersama Wali Murid','peringatan-maulid-nabi-muhammad-saw-bersama-wali-murid','Peringatan maulid diisi tausiyah, penampilan seni islami, dan santunan bagi siswa yatim.','<p>Peringatan maulid diisi tausiyah, penampilan seni islami, dan santunan bagi siswa yatim.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.unsplash.com/photo-1629273229664-11fabc0becc0?w=1400&q=75','published',0,734,'2026-09-24 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,4,1,'Implementasi Kurikulum Merdeka: Projek Penguatan Profil Pelajar Pancasila dan Rahmatan lil Alamin','implementasi-kurikulum-merdeka-projek-penguatan-profil-pelajar-pancasila-dan-rahmatan-lil-alamin','Siswa kelas VII dan VIII menampilkan hasil projek bertema kearifan lokal Minangkabau dan gaya hidup berkelanjutan.','<p>Siswa kelas VII dan VIII menampilkan hasil projek bertema kearifan lokal Minangkabau dan gaya hidup berkelanjutan.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/35548841/pexels-photo-35548841.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,175,'2026-09-18 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,5,1,'Upacara Peringatan Hari Amal Bakti Kementerian Agama','upacara-peringatan-hari-amal-bakti-kementerian-agama','Seluruh guru, tenaga kependidikan, dan siswa mengikuti upacara HAB Kemenag dengan khidmat.','<p>Seluruh guru, tenaga kependidikan, dan siswa mengikuti upacara HAB Kemenag dengan khidmat.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.pexels.com/photos/6638645/pexels-photo-6638645.jpeg?auto=compress&cs=tinysrgb&w=1400','published',0,824,'2026-09-10 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(9,2,1,'Tim Drumband MTsN 1 Bukittinggi Tampil Memukau di Pawai Budaya Kota','tim-drumband-mtsn-1-bukittinggi-tampil-memukau-di-pawai-budaya-kota','Penampilan tim drumband madrasah mendapat apresiasi dari pemerintah kota dan masyarakat.','<p>Penampilan tim drumband madrasah mendapat apresiasi dari pemerintah kota dan masyarakat.</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>','https://images.unsplash.com/photo-1665664660924-255a6167f498?w=1400&q=75','published',0,1385,'2026-09-03 09:00:00','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(10,5,1,'Draf: Rencana Studi Tiru ke Madrasah Unggulan','draf-rencana-studi-tiru-ke-madrasah-unggulan',NULL,'<p>Draf berita internal.</p>',NULL,'draft',0,0,NULL,'2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppdb_registrations`
--

DROP TABLE IF EXISTS `ppdb_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ppdb_registrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `registration_number` varchar(20) NOT NULL,
  `academic_year` varchar(9) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `previous_school` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `parent_name` varchar(255) NOT NULL,
  `parent_phone` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `achievement_note` text DEFAULT NULL,
  `doc_kk` varchar(255) DEFAULT NULL,
  `doc_rapor` varchar(255) DEFAULT NULL,
  `status` enum('baru','diverifikasi','diterima','ditolak') NOT NULL DEFAULT 'baru',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ppdb_registrations_academic_year_nisn_unique` (`academic_year`,`nisn`),
  UNIQUE KEY `ppdb_registrations_registration_number_unique` (`registration_number`),
  KEY `ppdb_registrations_academic_year_index` (`academic_year`),
  KEY `ppdb_registrations_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppdb_registrations`
--

LOCK TABLES `ppdb_registrations` WRITE;
/*!40000 ALTER TABLE `ppdb_registrations` DISABLE KEYS */;
INSERT INTO `ppdb_registrations` VALUES
(1,'PPDB-2026-0001','2026/2027','Ahmad Zaki Mubarak','0141230000','L','Bukittinggi','2014-03-12','SDN 01 Kubu Gulai Bancah','Jl. Contoh No. 3, Kota Bukittinggi','Orang Tua Ahmad','08126100000',NULL,NULL,NULL,NULL,'baru',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(2,'PPDB-2026-0002','2026/2027','Siti Aulia Rahma','0141231371','P','Agam','2014-07-25','MIN 1 Bukittinggi','Jl. Contoh No. 4, Kota Bukittinggi','Orang Tua Siti','08126100777',NULL,NULL,NULL,NULL,'diverifikasi',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(3,'PPDB-2026-0003','2026/2027','Rizky Pratama','0141232742','L','Padang Panjang','2013-11-02','SDIT Al-Hikmah','Jl. Contoh No. 5, Kota Bukittinggi','Orang Tua Rizky','08126101554',NULL,NULL,NULL,NULL,'diterima',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(4,'PPDB-2026-0004','2026/2027','Nadia Syafitri','0141234113','P','Bukittinggi','2014-01-18','SDN 05 Aur Kuning','Jl. Contoh No. 6, Kota Bukittinggi','Orang Tua Nadia','08126102331',NULL,NULL,NULL,NULL,'baru',NULL,'2026-10-18 19:37:53','2026-10-18 19:37:53'),
(5,'PPDB-2026-0005','2026/2027','Habib Alfarizi','0141235484','L','Payakumbuh','2014-05-30','MIS Tarbiyah','Jl. Contoh No. 7, Kota Bukittinggi','Orang Tua Habib','08126103108',NULL,NULL,NULL,NULL,'ditolak','Kuota jalur reguler sudah terpenuhi.','2026-10-18 19:37:53','2026-10-18 19:37:53');
/*!40000 ALTER TABLE `ppdb_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('07qXfKCQ85kC8KyZSy5NgdWqP83Sy4RfMQ5Z12z6',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2wxaDJFcE5Kd1c3anp3UmhVRktSV1VoVVFDcUU2akRDeEhaVXZ4eSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmklNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326141),
('09BKh5cD3ppSbC86brL0hHUHScjciJDOD4OSNxHE',3,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNjI4MGVrR0JidDhSZktQV0RJaTBzYWQ1Vmp4dFBnRkZ0Zzg1RTFVMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wb3N0cyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucG9zdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJjYWJkYmY4ZGNjYjRjNDhkZThiNDk3MjQ2ZjdjMzg2NmU5ZmIxZGUzMGIzMDliNzc3ZmU0YTM4OTliNjM1ZTgzIjt9',1792325724),
('0bySPVHem3Fqwn3mv9SlN3liYcVXF2uMPxOinzvj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT24xc09tTTVTVjN0bTNaNzAwWXcxYjRnNEw1eTIyUVpicjhPSENUbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327979),
('0Lwi2lzWVQ53pL8wFCaleSqiv7ZHC63nWWNZDTxm',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGRoMm9Zdzh5aVpaUFBTT3FGOEt3ZHJyQjQ4UUFndUROUXduZjB4TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS1lY2U1NDAiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327350),
('0OPNU8kKK53yApO1F66AcZvAXj3S8IE3xckEJI25',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibmtnNmJhRUVhc1Vqblc0VTc4aUhyeHpFTFFxMUJJekUwMEVPckRtbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDAzJnRhbmdnYWxfbGFoaXI9MjAxMy0xMS0wMyI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327265),
('0oT2ulSN58XAO2wEPBxkCIbOfAZtXdYMz7Tishpc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1hQQnJINWZRRW5mM0xLWGFlbWlNMmplbnhQcmJnUEtxYWZJTXRIYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbT9wZXJpb2RlJTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjQ6Im9zaW0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327275),
('0PFiiEIhBQGskZCsqFigXejqnfz1P8DjwKx1EnTJ',1,'127.0.0.1','curl/7.88.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoieUxaaVpBbWZPQXZXaFh5V1lnd0VjSDNZbHNaZTV4RDcyVXRRVUZsOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325119),
('0qkcU32wtsROYtdPUhhHnU2qc6t81MyflXG15Drk',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWJ4U3NWUjYxelFQek50ZnpVZjdPOVl5YTRQd0ZwVmRKdm5OdnZCNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327977),
('0viUaSkNSujIUHJEXPAFtXWjrosoJK0I65OiDseh',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU44d0FMUjFmRjBwM0hQcjNiVHdKS05uRklKTEw3dGxKY1MzZnFtUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('1A4nuDwlJuPKsC4i6iYqmKBczWO68GCdn5PrJ0Dt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3JYUWE4OFgzZXBMYjNrOWdsMjIxcWV4ZzV2d3ZXZkdqSHhtdjZ0eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325662),
('1eXWeTfWfx5L3K822QEdjTZhvlFbxJNIHV7cmChz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibnZEeFVkWVZIcjlBREtsYnZvZHFZaGYxVDZVbXZoWFJtR3ZuSG5lTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT0lMjUiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327365),
('1l32RBkCXVFflcVyWwNeL0WTnfWoEjGV8BZjO7YZ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWtFN3dodzgzdDdsQldOdm1wT1hXaWxSNVlBYUNvYldNQTBHSW5UaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327273),
('1m7iB85vaR47fSf6NOavAVdRrpV4z1VlB1afjsxi',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW5zeVNIYkFBZ3QxSFRtVG0zNTRWUFZqNEU0UTMyMlhDcVFGdUQ1YiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326133),
('1pJGm6UuVvp8owCO0Il9eR08UMCds8z1Mqo5JAVm',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG5YdXBnT3lzU2ZibkZFVm9VQmNqS3ljejhURlYyanFISWQ0ZlZGTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325721),
('1wYvxFQQfRqQei1rI6yr1OQfZV9h5MPjozPwOohB',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUFuZlhqNzdxOTkwN0hNWExWWXgzd0xLZEFXMFpjQ0RLWGs0TjU3VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC1jb3Zlci01NmJkMTMiO3M6NToicm91dGUiO3M6OToibmV3cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326131),
('2210lKAXu9GGMt4yyKLuPKmUzVGtvaXy6pu9bzgb',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVxdWtDUWlmWFpnWjhlRjNRb3MwczZRT2J0NlVwV0RNM1BRYWdycSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326091),
('27yT79www1KgOhP0Z6lykpX7B0ghpKHig73qNoIJ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FxSkdIc0lwRlpMaEhLY3NROW5VR0FOc3prYXNmYks1eW5iNERZNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325663),
('288UJtrYPmi3aaST8ZVjq7yff8fQqOAApTiNKMkQ',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0tZMDRVVHRjTDFaUFVHc3NEUDNmVGZEM2lvWUZ6MXpObkVxdXFPZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325627),
('2ccZKvyvNeHNraRRCZGBnqcJGocsxOonCcyY5cpw',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiblRWeEloa1htZmwycDFoM0FHSnVFNGxxbGd6MlphVm1kNmhwYVZ6NCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326102),
('2d3BT8gd6s3YVVHwo0KnfmMFXIdMltFRsO5yq2Gt',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTZYc1V3UDZ2ZUFDMERsMkMydkxSS2laU0NVUjlLOEQ3SDZvM0JNSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGE/cSU1QjAlNUQ9eCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326226),
('2NBNWgzlnKVzClNQfQuO0y0IeAijKHbPyxassTGL',NULL,'136.110.244.150','curl/7.88.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ29hN3hNbHVCaVdZNUxuUW9tdkI3eDA2VlAwdlE2TGtiVGZPc2phZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325629),
('2TaH37Fx6HJZVYMUOSd1W4Ra7ZABKT4oGQM4z6Kh',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoibnNKUlZPbjdIQVRCTm5HMFRzdE1BTTVoUVJWRlhZZDBBVktRNmV3dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325724),
('2uHs7X1Qa59X25UaLSnOe7YWNjPEbX4JnuZcN82N',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmxiMDgyYmViRWdzM2pVV2doWVhVZHI4dDZkZnZ6MEwycXQxNDZRRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325662),
('3CiYlc0XIl0LhlZFSWigSRdwIcOkZytrOzvhStHr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidndwRjA0d1RmNXVSM0ZlTWpPb2lXMUFVakd2RGh2czFpcmhkaU5jZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT0yIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325249),
('3jUWiGh4IpAlPCkDAer4dOKrfNCSZToxPPMmozrm',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1p6TnJPQTN6ZkFXdVZQZXIzRjh3Z2p1VVN4Y2dTUUJkcTd3T2NaeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327272),
('3seQBIuNyYJ298DE7sMqUJSMhwaFMAQpvIil8xWz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVA4VEh2MWswMk1JcTdEOE5KQ1VzdGFENjVGVjdxdzBKaVBRU3dyRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327276),
('3SSTdzpY3Uils8D4xB3gGOUgeECmY9rxKiPrEEE4',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0FDTTdlNjd4S3hwb1l6MURpRVRqNUxMbW84WW0zeGtldjlWVFExNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325628),
('3XiG1ieGGy1OHv4qZG9P8mFAFGtEScyXS1FQtSNZ',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ3ZtRHdmZm9pY3NqMjd6QWJmQ1BsT0RjMTcwYWxmeDlSOVFyd2M2UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9jYXRlZ29yaWVzIjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5jYXRlZ29yaWVzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTAwYjZjYjBhNzY2Y2QzNDE3MjI2MmJjZTkyM2VkMTlkNjE0OTE5OTMyMDkwZDExMGJiYmUxOGYwMmVkOTUxOSI7fQ==',1792325254),
('40Tw1Qo2FadDg6drVC7fNT6YrXn887hBDG0HJcfW',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicXJXV3diUFE1WlRLa0xUd1VzNGxEMXJ1VlUyZ1NZRDZTREpFWUlibyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9jYXRlZ29yaWVzIjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5jYXRlZ29yaWVzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTAwYjZjYjBhNzY2Y2QzNDE3MjI2MmJjZTkyM2VkMTlkNjE0OTE5OTMyMDkwZDExMGJiYmUxOGYwMmVkOTUxOSI7fQ==',1792327359),
('4hYsr7ZpNbvMx9clV1ygb3kOVyOssl0OdVo3iq8D',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE5mUlZNUGxnVmRqbkNRc3ZWZFI1U3o4UjJ4Mk5GVlBIWTNlU3dyWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('4ry4PFZUrzqPpiC44drXQdOvnHDnWwyU1FlghBOo',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmVadVBaOVRQbzg5dW1OajUyV0ZZeEptek9LR2E1TjlmdDBEVVdYViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvd2lzdWRhLXRhaGZpei1hbmdrYXRhbi12aWkiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325429),
('4tPcWVwY5g6Kz8HPWpKtAH7BNta6AYwULzqekgTp',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVVHUWtZRkt3T3NnVENCWDVoYWlUZmRlYnFLcWtHeGtwZUl1VWF6bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9fQ==',1792327965),
('4XC5qRNWJZmXw4wU7HduIuZtJ7KbAMhlhZZrxNQB',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWWJzYVpBQk9mekVnbW8zVGlaZGxyZjNXQk5wVTB0c3FVV3dVc2VMVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327590),
('51XXt5Ja7KWYMiLxjwqkRgDb4u1SDEow9sh9NaHr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEQwMDNSdWpuNWVNQnY1aDQ4Z1c4aWRaUDFVSlhSVlZqbk1qZ0ZvNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325662),
('52ZSSXpsBIrXhwZ3PTKJdm5OQFBtyUw3Ei38QuOA',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW5xWmhQamh4OFNqYm9RNThHaXFrSml5ajAzdlcxdm9keTJ3alAzaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325628),
('584s1AFdwpAx4ysYgh4pvaPcDEQJxIQnhM1gEbjA',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidEdBSFhDZDhxWkJ3a3BpYWlYa1gxdWlwMHcweDVCVjFlWWhKc1FiQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327351),
('5BiPe0wXy8XpJiLLLcLyXKNtEYQLU08buvI8wYK2',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiakNIOXNseWZPM3BxOGNGSlZGZWxQd2dramJzcktRclR5WlQ4UldGTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwQ292ZXIlMjA3YmU5MTEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325716),
('5E4nEm9NLZEtSgCaUlxB8jIx5BdBgPkDX5JCwcOY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3hCUjJMek1KZ0x2RkVBdjdkSmN0dkkzMWU0U3h4emZSUzRJUEhraCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49MjAyMyUyRjIwMjQiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327350),
('5lzxFH2tJVpJJw45WyGkf6oQztQ3wZTFVp9QFUK5',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlljdVpPQWxrV3BzcjBNektjZlRiZ2tidWxReEVmQThMWXhTbGZrYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327275),
('5OUljgfohaLk3ERQRXOmyJv6aXRwlNcCXCBylkX1',2,'127.0.0.1','curl/7.88.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiekFndTNiQ0hHSDhHNnEzVGJCZVV6TGZmMGFlUU5OM1VTSzRRZjd5WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbi91c2VycyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4udXNlcnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJhMDBiNmNiMGE3NjZjZDM0MTcyMjYyYmNlOTIzZWQxOWQ2MTQ5MTk5MzIwOTBkMTEwYmJiZTE4ZjAyZWQ5NTE5Ijt9',1792325160),
('5P67DcmNBnLoS0ZjyPcOayGiXWE7fIzl6UPFLwxL',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNFhieDU2bWFJRjN3WFJxMTlxVEVrYlE5TWZxeGtJWWZBWUc2QVpXVCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327590),
('5PE1tlRMZ2ouibeOxDLhtQpKK92dBgwWBKTnv8ot',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZHNPcVBMNHZHWE1pdk5oTGFkNTEySzk5WkpRRDlSOEswNkc0Q3d3TiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9jYXRlZ29yaWVzIjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5jYXRlZ29yaWVzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTAwYjZjYjBhNzY2Y2QzNDE3MjI2MmJjZTkyM2VkMTlkNjE0OTE5OTMyMDkwZDExMGJiYmUxOGYwMmVkOTUxOSI7fQ==',1792325669),
('5WR50dlhL8nrDu8YcDB9LNWBirYfs30KaMBkgou3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFackJocmNOQ3JlZm55ZzNtU1hGZ0ZoOFRZOXAwdGFkZUZzQlYwNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325248),
('5X5ruuUq1zvRckYCBqQKSXebh1Ie4nGYl5mkRi1v',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidENOOFFDRTR2QXlHZlpBYUFnS2lTS1lieVk3RnZxYzdta0hDZDF5byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGE/a2F0ZWdvcmklNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326226),
('5ZvUwMw6FBFzY5dhAXX8MpsHRK9gfkICWtAUatnt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnZQbmhtUzM4OHF6MUppVTFNeklHWTF3QlM3TTJ2Tm5DNjhRNEowZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327976),
('6CGoO2uU3RYzYr02pCWOatspAimh1YyTF7zPjB3g',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0FOUHlTV3lmaDFYTFdLWW9NdnZLUXNqSU81WGtlUFdoVGtVNVprYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXJlZ3VsYXNpIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327969),
('6Ec9bYsfrpTz6OLl1qClx1i7hDqTGK2uTDoDHNto',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRms0ZjNmYktaV1pXWTc2SFdubUlVMFdiVHE1Tk5UanF5SHNtZlE3RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792326139),
('6FGLnAxOW3eBiEIqsJFl25aYz9BJdSiAuS0QGdpi',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSmJrd1N0ZmZNVWNRTUFVYlpyU1UzQ09pckFRdDJJSzhFTXFvamNyTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327340),
('6IsAsGtsZllV0pGPSZS8WI5UZOIFJiCaiK8NuhJG',NULL,'136.110.244.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREdBZFFWMGtFcEI5VHRUYlI4aVA0REJlbXZZZEUweTVGaUMyNUNLWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325198),
('6jU5biXX7s1SYdi7ma5eSg5IhBVp9fRKwqzzTIYu',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFM0QlJEaDVLUGFEZWN5dVFOeFAyWnFBZlpjbVpPWTlaaFZ0SjYxQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGlkYWstYWRhLXh5eiI7czo1OiJyb3V0ZSI7czo5OiJuZXdzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326115),
('6Q63wyHb0p0U38Mq7a5kQBW3RH0aRHm0yvUyO3bt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2VENGlJU3Jid1g1MFBXbUE0ZlkzcHdSNGxkcWs4MWdOdUJ1Q2dSaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325246),
('6qbrjKWCNlAf8XJkvkDGGmw3ePGk5XvulqCD60dX',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFlVYlIwNm05WU1uQTBlS28yc0Nzbk5NdFIyR1Jjb0pqRlFHRWZYaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327349),
('6SLgNxo5VFYReRoY4WrCHCkmtrdIbczn7xu16c9v',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0RrRmM1Y3BjMThpbTl0YnVPazA5SmhNc052cnFPWlpSRGlXUDBxUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327964),
('6UmQ7K5YSvUvfD9tvJedfpuJAxZzSkM1fOQsY2kj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzJWa0hGVVdTNjJCYWN0SDVBZ2lMdTJ3eEZzZ1F3WjVmZ1FZbDg2biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cSU1QjAlNUQ9eCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326140),
('6YWj0bvveEvoN9nE4NMN9wyKb0SYJ1sEVG9iaVK5',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDY0T3RhWlk3bXBQcm8wM1RjSmY1VTc3YTN4NHJkOGl4VEh5Yko1OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325110),
('708yMjbHNFgPylwvWmHZXR6ZkJxmd0ylv4lC9Ylg',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoic29BWERwamU2VUdra2FIdEZEcENud2Rxa0Z2endJTmhubWRzejdtSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325369),
('72DkYl5Gd39MBragj3l8s1Y4Qfxqvaj25tKpLzy3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVdFOTFmYXg1SHZOVFVOSkZQM0pXaEF4RWJQdlUwcDNNcW1HOGo0eSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325654),
('7ft28jYILXQEAf14UPkHw2t1pUwPG7sHGGAAB47w',NULL,'136.110.244.150','python-requests/2.34.2','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZjBjOThwSDZVYkVXR0VIS3dtQ250OVZkejVsTHNlOUl3WllGSTNWcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327264),
('7gm4RABUgT4J1bN8jdQAJ8FmKoTS4UMikSMlBl9k',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3dPZFNUQm9Sa2l5YWZVN0dOaThkc0hUNGtNdTA0a0YySkNhbHZ1TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325270),
('7h7xK17iiHfDhExhExx3vsqAmh5OLbxQOY53Cx1O',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1BWSDZTUVg5RVUyZEQydFFvS0c3RVZ1T0FYNXVSWml1SmI2VEpoRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT0lMjUiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326140),
('7jBphPo3SDwsyiLTUlBBnZHLBoL72bPclOaLSu4O',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFo0TlZUVWVNdW1oekJTdTRCbkx2YXllNXJxYVJpZDBwemdSV0RHRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS00YmYwMjIiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326132),
('7oR7PTq8ULA5fuAzVSjr2n41N6DUjpkzqLfDD3WM',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoia21RRnByT0dhNjREYnI5NGdnSzlEVFZrM0ZUa25Yc21zRlBCNDBFbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327348),
('8qamGkbejjVWRxW1OetSp6qv3mA95QyHyJsnxY3Z',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJKN0Rkc3NvYVVmejBud29FN2Q2SlF0OUZ1Rng2MTN0QlFBR0NaQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjA4MTkwOTAiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327970),
('8SZHdlBshoR0idievpLPYBt7O7024rhywmz0d7pv',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkM0aWhEM2N6TWtuWEhHZmJRZDFMbU9IR04zV3lpRWRyMVJwZnk1NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcmVzdGFzaT90aW5na2F0JTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326203),
('8Y5D1lptJ04cp5TG5I6s1D4Xk6a3KLOTqf6p0IZ2',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnI0TVhUQUlyUTFadEtXMklqMmhUWHo5UWlLdnhIWndyYmVJWnY0QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325248),
('8zDzXxirhYa11SuJnXCtdaUIumXnKGlFwjlJPbUc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzQydjc1RzZPM1VlRWNkakJYUUIxNmNadGtFM2JvOVNUWWlmdjkxbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325662),
('90W470ghae7YtRuuIX3oPuPlw69BFe2mWyAzUljL',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHBsc3JUY3pudllqN01hN1JUeHNjY0JwMFo5SHhXVlFTWWVITnF2VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327348),
('91qgpFtIAaHOO3XPvSR750sKRWoeFDCwZZRUI4XW',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoid290VHp6dDR4d2hISnlMajRmR2lpb2VsU3NWZndXaWZkQWI0VVc2cyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327551),
('92lGSzWhH8Ka9STg6dbEpBiMBumYeE73jS5DcLkn',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlNubVpuRGVVeXFPWm1DN2tWTGJKNGxuOVFLYTJZemg3TU54Mjc3ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcGRiL2Nlay1zdGF0dXM/bm9tb3I9UFBEQi0yMDI2LTAwMDMmdGFuZ2dhbF9sYWhpcj0yMDEzLTExLTAyIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmNoZWNrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('9Fw2eIt0i8QZIXQzDfmHM9w4eFKxG38LtIGeqaqY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTI2MjJTSU1XaVU4Mm1nMWJmUW9jeGx3SDV2UmVMc0FndmVyc2syQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325654),
('9GSIFqXxxd9x7L78eFeQAV2fjNZ0vOfPu6N0JD3o',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjdrc0p5ZUlmSE5nS20xQjg2V254YWNYUkJ5WXgzOEE1bkVBREFybCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327337),
('9hAqtNp1IloB7y1lgKHskYvP25Byy8z4mEJJUr5P',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicWsyZXZUSzlRdG43cDZIaWhQUmNqM1JKN2lJR3hNdWt2TzNYczNJbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327577),
('9hRHtXOQ8GaEfM3rbg1S53iuaZsmSwzqDLrbF0kJ',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicFdtUU16QkVaaU9NVjJXeXRlOERwdm5IWEJnMWl3dGh4YkptQWVscCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wYWdlcyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucGFnZXMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327872),
('9lKJ1aj0wC3Y8tx8MGf8Qn4O9VZpa15p3H0oSfzL',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUs5clJlNUlsS1ZxNDVJZDBWRTVhRXZyY2NEcFR2RnJZbkV5VGI1aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327365),
('9nTj7rGaTCySwe3kM1ARPrcJ18zlU2DB0wCOtXqa',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVV2SkR5SUZRWThmOEFMOEVreWV6ODA1aVVpNjNFUERDbHNxVjZmaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326115),
('9pmWeHz8RCwutiS9hIwHhA1ou06ilwJpOIPyiyZz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWpLc1p5ZkdVVGxMV1JhVE00VnlGM01Kb3p2cDVnNW4ydExjeVNvUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1tYWRyYXNhaCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325664),
('9r0v9zYozclDaEyNPy66HxwpELB7FMuiLWers5qr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlBNa2JobjczaVc0eUE1RTY0VTNEcUkzUlo5ZkNEWTBTcUlmYmF6NyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwWFNTIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325673),
('9SOqtfAskuKzZDYcIXSWT9a8Qe5oUnufgawJU5n8',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUpBV3BkM1pocjBweFZUcHJYVkZHMXVJTTFxTHBrMjJqeGp0OFpOMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9nYWxlcmkvd2lzdWRhLXRhaGZpei1hbmdrYXRhbi12aWkiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325119),
('a0K9JJqKQRebxbXK5ZcBf9qVVoZKtx6R0INWbaMQ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEFpQ1JlNUxITkZnbGJaWnBpNjZvdnFBclNyNTV2Qm1IOEp2SkxLNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327268),
('A2bLY1SmjeuuITldZVgNfYcnElB7AWhhzsPe8Zvs',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic2d3MGVNWTV2V3dMQnVqTFNYODhBWndDeXlsMGRkMDk4RzFwb2lNcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327814),
('A5tgo2mbEBXVIrZyjhUK6pML1HQi29bAa9G0wmTS',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGlsdG1ESm9pazJsUG5pVVJQUVpFcW9QSUd1cWJOWTFQY0lEZTllWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327383),
('A5xv801Ze47DIvJbgfkbhImqFN57SRLwrA3amIi1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW13MzdUSkFibE5GMkRkUGZqdTc5S0Qzb2xFMjR4RGJjSmlNaVo4OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwQ292ZXIlMjAxMTcyNmMiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327349),
('AA0r8E5aBNn09EyKG9ZIcgfq7dZRjyhYpce7HoT1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWld3eElQcE9JaGVzMlpHSU1sVmhJMEF4eG9wODdhSmE4dVF5VDFhMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327350),
('aDHcljGJj6lilJoCt5EXveMfrONYhOUjZFsJU6qx',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTE9wVmlhNVdQSFBxaDE0cEpObU9YVXAwdVdGbkVXVDJTMVJKdzQ3RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGlkYWstYWRhLXh5eiI7czo1OiJyb3V0ZSI7czo5OiJuZXdzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325248),
('adMKJHvBWTfie2XIZEAIjcdcQURAgJ83U4pKKXgJ',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUFIb1dVTU91SmZWbUVIQ2lGeklTRktkdElra2ZzQUFIZ0ZBamhURyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wZW5ndW11bWFuL3BlbmRhZnRhcmFuLXBlc2VydGEtZGlkaWstYmFydS1wcGRiLXRhaHVuLXBlbGFqYXJhbi0yMDI2MjAyNyI7czo1OiJyb3V0ZSI7czoxODoiYW5ub3VuY2VtZW50cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('aH4x2zpEdtlmQLfl6E6EYtEk7n7er1xuIsWfZaV7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2FVUnh1UTJROFFxbE43VE9SaTZER3RMSlM2cDM0UW5pTW9qZnZ4UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327974),
('aIqycGNGoGYAtFXd1xsBcAYXWFF2RfLgUc42ctZg',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWdWenY5WE94eVZybWFvaGJaak5vOEprV1NJUjdTQjdGYUdxVGFIViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326113),
('AJRNrOX6hx0MWqgSTndUSamHjLBXhAFuZ5XucI5F',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmNNNExmdTBLMnk5ZGJ6R0tXd044enhnV3RxcGV5RWdUSDVQaFM5TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPXBwZGItMjAyNi0wMDA2JnRhbmdnYWxfbGFoaXI9MjAxMy0wNS0wMSI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327967),
('ajU4B7tj4DNdNPpbSCZe6oOls2NlqEJIaEyDrKJ3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiejVVMUFBSVh2b2Z1NDJKWUhmMTRUcGhtQzFxNXY5b0g0Qm9YMUVPUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPWZvcm11bGlyIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327268),
('Akd1rAudCEQL8iXwEUEAgafZ0QZJQ01MmIBGQH8U',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFlYWlZuTTZ5ZFU4dE9wZGpybjJnajNDZmRDanljb1NPMlAyT3VRdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49MjAyMyUyRjIwMjQiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325249),
('aLaaT5MeAUwFA3Bq4RsUxP5ckFAQj99QkOuva1DR',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR28xYlQ0NmNJaWJhbklqR1NLSm9LcW4zVFVaalMxZXp0QmFnZEV3UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327356),
('aLXwcbps5tIKhx3ymw6bICl8ocm1M6ZcwbCIkzBf',2,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSExOcU11ZkR4ZHlIenFyVURIcURmVjg1UDdkdkZZV3JZczlHMmNzdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wb3N0cyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucG9zdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJhMDBiNmNiMGE3NjZjZDM0MTcyMjYyYmNlOTIzZWQxOWQ2MTQ5MTk5MzIwOTBkMTEwYmJiZTE4ZjAyZWQ5NTE5Ijt9',1792326105),
('apqPvIJ145wr2hKv1ahzvByMCOF2tO48QZXOf0jG',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoidFNFQ3VSWWszVVhEdnZIcTREU1NRVVozdUg2ek4zYTViNW1zamxlRCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjYwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYWRtaW4vbG9naW4iO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325452),
('aQ24rnZjzGghQMdahY6dS9KOYfeseZj1nTkGI3Ud',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWtIQkswUUFKV3cwS25nZWY3VXl5QWlXQ1ZyVFVzUU5hbXFCY1NpbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PW5hc2lvbmFsIjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325664),
('AQWzKr93wGis4sYPKff3ZQkwt8pKmcep08pyhMVg',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3BsWWRseEVRQ0h4bXFSdm94bzBnT1E5NXp6Nm5aTEptNWV3dWU1VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325248),
('b0tgUmEYBvxaRlUvvwMURcj8amvss7YZ48D5bshP',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUk1Rm9qbFlNSHBsbmh6S0FPYWs4OGswckRlZDAxZWd1dW12RkpxYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325627),
('b53PiFt4baG3UyzBw9NFhsPB2m6AGIHYH8GPAGFH',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibHQ1Tk5ZdGIxRldiUGluSllzSkl3YU1WWU5nUVhRcHVuTzF2ZGlvRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326226),
('b6LcECu3QWvoPi9WgleCiqquPCFDOegQowByEzUR',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaWZDR0dvMXA4U0ZGY0owQWlkVENtZjIwU2pTQmNubWxLU1U1NnVSYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9kb2N1bWVudHMiO3M6NToicm91dGUiO3M6MjE6ImFkbWluLmRvY3VtZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImEwMGI2Y2IwYTc2NmNkMzQxNzIyNjJiY2U5MjNlZDE5ZDYxNDkxOTkzMjA5MGQxMTBiYmJlMThmMDJlZDk1MTkiO30=',1792327970),
('B6Ls7uOCLcZKXdbPjL4mmh7zUDukjYf5FJJTvDtp',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFlTSzg3dHVMa3hxWjJlazJrVEQ2NUVLMjFkWllPbThrcUZtbUlmZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC14c3MtNzY2NzIxIjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325259),
('BB4UOsmcmJIa0lTMsgHY6mn1W8AM2fVMbeSLkC3O',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9YWTBvTFVZMzVrRHJoQmxYQ056ejNxV2htTWdIR3VRUW1kRVRBUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAxOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20va2VzaXN3YWFuL2Vrc3RyYWt1cmlrdWxlci9rZWxvbXBvay1pbG1pYWgtcmVtYWphLWtpciI7czo1OiJyb3V0ZSI7czoyMToiZXh0cmFjdXJyaWN1bGFycy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327756),
('BD3AYZ2ek84Slp8mDVbuuW6tUVHGzAIIACZFM7ol',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2Q2N0ZQVEJ2VlpBSXQ5WEFPTmlMSGpoUWZocjFWOEZ1VXNIVGZNSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXp6eiI7czo1OiJyb3V0ZSI7czo5OiJkb3dubG9hZHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327269),
('BDuoHT5IEyD6LGV3oDdp8OnSGyCh6XbEzhpq90uK',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREZTWWtSb25DQlppM2hCbE9GMGlINXg1MXlQUWVKU1ZHdVVsZUdiZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326084),
('bgih0CDc0Gy6r7edjIdnm8m4nxMWU6rFw8eVnfjS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoib0dpaUZCd0VtaFFEZ1dndmZjeWdNc0hVekpjRkFGaGx5Z1pSbDRYZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326114),
('BjfTucA6NxF6nQReA5ubsApd8LZikoJIrR5ZrNCR',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMXc5VjVFS25ObThTVFoza3hzY3RKMlF5bDdOYkJsUXVJbzhHTzVOMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wYWdlcy85L2VkaXQiO3M6NToicm91dGUiO3M6MTY6ImFkbWluLnBhZ2VzLmVkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327857),
('BL2s19EKL6EBAw1LOjQzws9MSbpqgkLKDBlzlvUr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTVFVGRudHFRVTN3dWJyQ3BqcjZHQUQ1SXhMTkRZN29TV2ZqUllSMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PXp6eiI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327365),
('BM0jLbaTjpq01XwOG01UHy089f2JXknV8tWMIxdT',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWg3WmJrc29ObVZMVFZmb0NtbVlVNEd6Q2RZOWJFdDk5QWJSMVRBQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327962),
('bM8oJNvMNq6FLppRy4NPBFf6lGSMV353rxe2aVom',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoick4zQUZZd3BBUHpPNFAydUpHTmVTdGoxQkI5SU5IckdIRWJJbHluTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC1jb3Zlci03YmU5MTEiO3M6NToicm91dGUiO3M6OToibmV3cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325716),
('BMyZhuy4LKSUjX0v1QVglYU28Awg8O7SlUNsMiFo',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0E4ZFJOZXIyRVdIcHZmY0pCZE5qMlo2emhmem5ZeHNaSHFqSDhVQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325663),
('BRCaKqEBktVk9ccP893iSJhHoqTiLaBA2Devdqid',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN25SZWRYQXE0QVYwMUxiTlk3YU1ORkhhMHFMOThNOHprTmt6SjFCViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327352),
('BTIKtOd8AaZEbfW9mJfYsrf0XNSJr0LlTZytNYbk',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFBtc2xJVVAzRUVEdVgwS3Q4bk5icXlzSm96QmZhelFZRWh6ZDR2YyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcGRiL2Nlay1zdGF0dXMiO3M6NToicm91dGUiO3M6MTA6InBwZGIuY2hlY2siO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327077),
('buahFxJBOdkTzlZYKfXxTwdWZvX62zN5NLcO9K5g',1,'136.110.244.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaVo1YVQ1RHJsM0pLbVd4M2thUnl2TElsaTgxY0lKRjdmNkc3OE9GYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjBiOTIwYjVkNjQ3YWI3NTY1NjdmYWE3ZGE1YmUxNjdlYTljMWJiMDAzZDBkMGU1ZTQzZDlmODIzNGNjOWNlMGMiO30=',1792327019),
('BuEIdlcmrVsBzbCd0eaKyzDXQW5JyNd0rk6nZvR4',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVUM4MUdzTEJ6NHQ1TkNJV2F1YXNXNGdPUkFKSVhNZmQ3aXlwMWFONCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325964),
('BY6rKHEttUJ6yPdOHaWJn1OomV6bdAfZPvfpoxxu',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiekx5MWFZVjVBSlNSQ2w0N1NBZHNSTVVqYWdTMDR2cWhXWXF4RzlqQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327076),
('ByVL1Nrgw72rKz6Ei92NDNRBIyinlZ4Cnb8tjLO5',NULL,'136.110.244.150','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUpCQXVDTm1GczMyQ2tvNjF6cmhQNjFZQVY4U2t4cDUwblRJcTlMSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325633),
('C2ZKeBaQPJVVPvnkFBqwtrkO5bBp1wypHVhh29Ns',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ21xWmpMeFNWSWJlNUVRb0lyOUlGeFVvZmFHRm5MTHo5RGZISmF3SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326084),
('c5QC728Z8Gi7PS1Jk0x08Sj5Oiyg1eULWiUZYo4e',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMlBNZkJwQzFzQ3hHbzk2eEpLdmhRamtZbU02WHNpMmpnZ3FnZkt6ZSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325893),
('ccKjMf0RrpNmeYCqSMRU9fkKGwWofEsPMx4LeZay',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2sxVDFucUdGVzNzbEg2eGJjdVYwdDBmVmRYSVZLaldCbUhBdEFUTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327353),
('CcPPXZ0cm4mLwx241FM5cLusfme7mmGDEKogIBOo',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVZPUWxDMnU2RTlid0VaVTVCSUp5QmxqS2NONUk2YmFDaUJ2RFlPbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327791),
('Cfy0WM8wVNAsvlVgvuBtBuSLMO2l4rWY7V6a7vtZ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoic09rc29oVWZmR2FPS1hONExVN0FtZ24xeDdJdHBjb1FJZXFvYjNQaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326113),
('cGyiKf1n95Ojvtr6mXsRTGTAUfYn0bsbPrvKuxsj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkZjOEpVZmIyelBoWGZUUE14NUhWT2dCYlBIZTN2dXg0SGhzNjhUWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325257),
('ChqUWEhaXod9pQMsJ4pV3dMcwmRQrqMDIIurNXBA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZZbEVyRFd5UHVmdGFpMU9wb2tKYkt6SjRQYXB4eE96SUlRakI5dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325246),
('CIHc8OAub6fgbhRXf6fB1kRU2I2rsDxriVBP8uCm',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoicExERjY4NXVKZThyQkkzSW1ZcjYyWEN2eU10ODdiS1N5YjdVWm9EWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327076),
('CkQSX39gk7KE0i1OkELnxZ9dEHVxqVW84T3kNcWD',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUJYWjRtbmViN3BRZ21jQldJVWlBaWozRzZZdEIyajhXbVA3c1pOWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327849),
('cMzvSbUdednoGAWtUqkHBZ0W22dNVrHKnYqZzDIW',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnFsOWF0blJ6R2prSDR4OGxRN0U4VzVpY2JWRFpyTm5rclZ5bVRiTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('coqe2pUuwYp4oQOXZOpiHwCKVfsyLTDttlEhLeaj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEFUMWVjbnVObjJZY0RVZGpyOXQ1bGZCWmhUR2RrMUtSSUFlMFN2ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325654),
('cSba3oaAgfPgqyFVpcPw24X1knXudmDonlMf4buv',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY05SdUFFdGZvSnJjWjNqdDUxM3M1YlRXUnY1cjlrT0dkcnl6MkRhRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9zZXR0aW5ncyI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4uc2V0dGluZ3MuZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjBiOTIwYjVkNjQ3YWI3NTY1NjdmYWE3ZGE1YmUxNjdlYTljMWJiMDAzZDBkMGU1ZTQzZDlmODIzNGNjOWNlMGMiO30=',1792327894),
('Ct69UDOnWZpBsjBYzdGPmUbCZPvFZb6RtCbeUN4E',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjE1ZXJmYjFqNWFYUG9CY0JGNFVEQWxQN0pESFQxWFQ4b0tweFhTUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3ElNUIwJTVEPXgiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327969),
('cVJCCrDw96peEamrZePvXkVCSfSDAvDrE1hnrAXJ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkg2RG9XcEpubGx3WlNyM2wxaDliRmRLazh4QVZGOFVRSmNFVkZINSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuL3Rlc3Qtd2EtbWVuZGVzYWstZTAyMDQiO3M6NToicm91dGUiO3M6MTg6ImFubm91bmNlbWVudHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327972),
('CVtxbfGf9ZPpAXFbmTQURLfXA5COBBFR0zKwFUO2',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHRjMVhkNEFZUmVrNEhEWXRJMHdnZ0FLOVBZOVNFR3loRHpqMGVFdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326115),
('CxaJg3JtAWEgpl3J1kZCj9fp5hHuEnqEWp4prbal',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXBHSkdWU1RCM200aDREdHh4Ulhsd3pxS3Zzb0lCNnpCZDNxUTg4NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327348),
('cY7RcjktbICxRPotfjy6Fvq9r9PIhACPOXSSJQoA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2JTYWl4WGdVUE93VGU4eENaQXFub0l3Y3h5QjJETERoTm11eDloTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327366),
('D51e2HwEmp5FxsqtsEH15o4EF7p4G5Fbdy7S6sFR',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2piczNodnlVNjhBekZjYU10VXI1SDk1RFE1MldvWlBCSGRyb0Z2QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwWFNTIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326125),
('D6WdwosxI82M9yQMXRH90n6pa5uRKejEfIWiuQtC',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT00xUWlBaFF3cEIzZmF1MlRocVN2cHNlSVNNaEVIQk9YWEpHNkFtVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('D9mJWSi60i5lYi8cgEpCfdpMFBf47OkYyHw1VB37',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibW9OemhUNU54YnRpZ2pUeTJxSWdQV2xpd1NwUVFIZExHd0IzTjRCMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC14c3MtMWU5ZjU3IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326125),
('damll6TrjKRCQU1nA6UVgFkhbpitWEnnkiqeoPHv',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoicTdjbjVlZGVoOThzazdKOXRDWmRybnQ3MzQ2a3lnMGlOc2RNSEtRNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcmVzdGFzaT90aW5na2F0JTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326226),
('dAW6DoITxkGHVrZpzxJM3dDqdRZTAwpc6aJ5Dmhd',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWs0Mm5mQUZTYU53ZlhlZVJiUnFSU3BRd1VXN25heEU3NEpmU3IyaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326129),
('dfSMrjKZzBWzbjDzREHrmEC5ykak4YUxX2UhA83K',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0ZHUFYwZ0NKcmNWRkdtTXlONzhDZ2tjdWJsNzBSQm1pNUQ5ajBROSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326115),
('dIeMnFLbYxicPXxNHHOrHaJdbBQ3ETA2IYxrsbNn',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXNob2tLRDVyYXp1MmJtNWxCcU9uTmZRcDl0dG9CVVB2VTNkeE9PZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1tYWRyYXNhaCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325249),
('DL5UIcKKa3Hh8WotoiEqwrG0QE0GwGXjRvIYppAz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmZkUmt0eGp5ZnpWV1FVbDFTQ2w4QnA5R2FKdTFHV3cwekltZDNCRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325719),
('dMJFYjihKF0uYJpMBMnh3Y1bX286A0Z3D6mIqZh6',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEdpV2xackx4QjRiTmI2QU80TWV3R1FhQ0ltTWJjellVNmw2YkYyYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327271),
('DpIqr4e68OBCdb30unJ7QpKVsKJQaxitivGgT5Q7',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic3Vud0E0eDZsc0pqWEVQVkI4VnJDeDVJQmlsUFBEVTNLQ3lNdm1RTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327737),
('dSuJLQWKD5mvLJefB6yR9f8kD2kogzj9sZJs0Env',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnBLR3BtaEZwNkQ0eXVxTDUxbnZaQUdONWdnemhBUk11bUJXRnhmZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325720),
('dTsM3Ju01CyRg8XPrI1vrppAralJZXJ0R3Ntls93',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZklXN1JIaXpyRUJwZmlGQUtvVUhjejl4ZGtWR3dHbFpUZmxadmpOMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0xMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327365),
('dXliRE9Dpyi7lPFPnFr1kO6TevPp934cugRyrEFQ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGZOOU1ESkJ2RVVBR3hKU0ZPUWVRZHNGVkVWUkZKRTJ6MDB5UVlFNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmk/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327365),
('dyIoKUD7CSn7ucMmBCmodRSXNDNMTlCYpapnOfRo',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT1oxUU9kVUNaa1NPejZjYXY5QWphckNXSG9HSTlDWlhZRTFTRFJWZSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325665),
('DYnnVe8RLpXtnb1qBXfsjTsWLF9MZdg87wTr3v8q',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGg3VUREQUh2ejE5UFBPZm1wV0Z4UDdjT09WN0VQcGw0MjVHTnBLbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyL3Rlc3QtZWtza3VsLTRkNWQyIjtzOjU6InJvdXRlIjtzOjIxOiJleHRyYWN1cnJpY3VsYXJzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327273),
('DZLlGbSdXmvFRR6Xi5bn5e1XxMVDX37n02GQY2ik',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieWhEOGZhdU4zNmpmVXkxY3M2Y1R5UVdQQTMyNUFIcWNBb3NOUHhGYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1tYWRyYXNhaCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326116),
('E2WYD4IAiERIGNnLOqf9NXE8VfG4yBN8TMUwMRHS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWlXM2NpdXQ3YjZnUlpzR0dTbkplM0FwVlJrZ0Z6dERyM1oxanphQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325246),
('eFmGWuAhokzwydhLZyA9xPEviuDrBzxH7g9gd4vk',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2pZcmZoaFhxWkx6TG1nczJub0RHdWxaZ3hRMm96TjlQRmdQdng2eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325341),
('EG0HDTUmSchbeiJFh9Tqxpz0g9wZ32Q2uM5VlUf3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnRYSTZmNmRPalhLMWM2Y2pJNnVzUGRMbEw3MXZHREhPVVFDc0N2cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS04MDc1OTEiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325717),
('Eg17Nw5wChtViF10gJ4xrGPXgKaT9LiIrnfhqPVn',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiODA5Z1NnU05Tcm5VOHFIMkhRTTVkZEliQ3g0ejRvbTRubGNMSnF4eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXNpbGFidXMiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327268),
('EhHWtqwuZIk0vFGLt8GEF3PT2BisHDPOfL5lddzG',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkNqQmJIR3BJZklVQ0pMRVpWWkFDWng3TzhzeEN6WExSdVBFc3FDYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325250),
('eJmuiOTlItFSSLHM2HKd5eGE68u9h8u4kGPcAVAm',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWhyeTFPbjdqQnZESzFvMzVNcWNiQlNqc1ZvNkVTUzFtYThhY01tMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwQ292ZXIlMjA1NmJkMTMiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326131),
('Em8tsrtDiXOLNtIC00V8AuU4KvAY4ZzQJW5fi0H1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmY5bU5aa2ljcFBZNUlwdThHWXhwQkxsRTB4SUFOTDdLNzZUVlh0ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325722),
('eMNUzX7ZlRc2Mp8RMaagpOKAZ5iIGqTAZq9zgZzh',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUhOdk82emFibjNtRE9SSmhVa05QZkxwbG9tMEpqa2tYbXQyWUVFTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9zdGF0aXN0aWs/dGFodW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326226),
('erCGL7LI95QrD6JUT7htF3trlnAasNW5IOvYqIL4',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicDlxV3J0aGpWQWdEWDhNYW5VWVdGVVRFVkd2SGpPZ0ptRXZuUEg3ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3ElNUIwJTVEPXgiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327269),
('esJC67gqH35Fa79csCQodZfobeRLL7XtE6yUBbgy',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmtEUEQzU3ZISjFZcGNnYjMxY0k1cnZJMFJKa0VGTFN1VUo1MDJWbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325664),
('eT0WJ0esBe1avLne9haJ04ycl5Otpz8heeqYBUjv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid21meHlQVkdJa2pISVBLY000a2ZEM1oyY0ZkN2JzdnhabzNpVWNSZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyL3Rlc3QtZWtza3VsLWI1MzI3IjtzOjU6InJvdXRlIjtzOjIxOiJleHRyYWN1cnJpY3VsYXJzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327974),
('eWFns58fgEAWwZALAcpBvFqmxUtigcrN585Z5noN',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzhTeHR0eFgxVGpxcllqWmJOUzVZSmFDUXJCdWc5ejdCTmJzMm45eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325110),
('eXwdUo9KgZLXr0i6wSKa39O7J1iqZpjsLTLiYKUC',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTZadGg3ODc3alU2Q09VNTdUb2JMV0QyZEZodGk4cHRXOEJwUHI3QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT0yIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327351),
('EXXDPbPFzdkGkGIokhPp2r1TkcCJjjNnhxUKNMFk',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoieVhVYVRaZm5oYWFXa3ZKZlVmSjY2STVmZURJdEliYVhrNUE3RDBBdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325269),
('f0EoTOkfLoVbctbPac0U17kkXgxxKjszBxDjnI4t',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHpTZFVkeDRpbDlHeUlEdm11VWN3ckxOekd5cFBOMTFrS0ZjMkswUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327641),
('F149dgUyRRf3uDKEblAmCgRUx4L3eC9KDlO707uO',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFVHd1B1bHFQTnk2Rkt1TUlMOUgxVmY3ZDBIbURvaWU4aHU3Q3JTNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiL2Nlay1zdGF0dXMiO3M6NToicm91dGUiO3M6MTA6InBwZGIuY2hlY2siO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327835),
('fCyRiuA8bRWX0KdeM1sT2Tbm9eI3lfsJ4afzwa6G',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZGhaMkNFQnMzMDlqeHNVOXNNQnNWSW1VSDZaeUJybkpiM3ozdk5oTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327364),
('FEEV7rMo7DcgXP8CB2Q51v2C8RHze2QN1Jz7tyuA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ozdXhMeU9hbHhFQTlOQVE4Vzgxd3F4UUNxbm95dTI0OU93cVV5UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327350),
('fFFyIfEIhf0rbIOsCVUQ50NlztehhPAUQGwV9vXO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmNzNWJPbU5UV0xkRmh2Y2F2MjBpQ29aMmpMSG9LTjRCT3BKWXpCbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327275),
('fGDwGbO7RDHBROczd1FfbiRxSZWS88puxVKDeixp',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXJLOU14WTVrcUJwS1l5S3RiSmFWc3RQNzdiaHRhQk11UXY0Z040QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cSU1QjAlNUQ9eCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327366),
('FLEEU3IoSp4BlsSs5N1pW6ALHvlSnyxd5Qq2BqKL',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUNuSXlGSDNmdXZHMjNQeElKeHRLMVl0U0pQREpEYmhGNnR5dnlRbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwWFNTIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325258),
('FmqmaMfNEwnZJ2bi2omCpCbh3YbVVkk5VqekjioQ',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXRGSEw3dDNWalNhQkpmdnNCUmRkekhkdEdsaFd2cEtyMW11YmM4aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('fRSTpsAhqifwcF1cTcqdYXVeZR9eVfKi2NrldKb3',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmgwUThPOHpza3BIV1RqbHNoRk1sMlJNcng3ZWE0VVE2VmxSVWlwZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325935),
('fwSj6FFUvrzDNZkyuEDRVVh0zlDK6k7uj4Xmbx42',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjkxWndVU0VHeU1TVW55VVlvYno5RDljY0dvZGUxeTZkYVBweFRubSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDAzJnRhbmdnYWxfbGFoaXI9MjAxMy0xMS0wMyI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327965),
('fWWAApQehr4zvlizRD4itvgEhb04kqOS3GynzTeY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHlxWjhyZ29GN0ZsSkhaUVZsdzN4YWlOZnpQclpTNEs0ZE1QZGVSciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326114),
('fwZQNmzFRzyZ6MNuk6XrgRWLup3w3opofrcpWn3D',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSno2ZWV1NERuaGxqQ25MRjJWRWNCQ0ZkYVFOOUxhRlZrbUhkcDdmWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327350),
('G36bD6XsuehhXBeioeEHba2Gr8O8SkiRjYneGCaX',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzNRWXluYWVmREpCNVlFN0F6bnNUMTd1SXJ1WVF5ZldVa0JqeTV4dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326114),
('G4srpnEQXxCq7E5CASCc0moSUZcoWSYso8apwntO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaURpR0hnVUJONnpCQnBudGxFamlQdUp0THNaeGpkSXdKcGxUMVQwQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327894),
('G5EDz6pfm6dVVhHc2RoJeyFVFjJVL3LL3jh9zhpX',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGpiT3RWVWxMdXRDTzQxcXE5d3kzbFRmeHNPaDJrN24wV00xa0R3ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325284),
('G6AUJIaRDmqJUHe7hnzr1cnPcgnOWfkFAdIU2XcS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU5aaUlRYzBDd3pudlBLRkhrWjRiTlU0eGl2UERsU2gxMjZ1SnJtOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325715),
('GA6QeLc36bvKPg3edGGRMZVVBpLhK8RmHFXqEwrG',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmRuRnF0R0ZaYXpyaEFMUkM3Z21jbGV6ODI5Nmt4cFc3RGJyMHhCWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzk5OTk5OS9kb3dubG9hZCI7czo1OiJyb3V0ZSI7czoxNDoiZG93bmxvYWRzLmZpbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327857),
('gbQIzknx3G4nUJesBV4mx2ZTaoq5UJ6h3y7y6DOu',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVlrZjRRZml5NmY2ZDQ0TllmTWpiRTBUNjRXQTU5Z0MxeGhqTTBRUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cSU1QjAlNUQ9eCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326091),
('GgSaDCExsfSFWl0YtmUfjPWUeW5foIBAS3BtJNjA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2VFYnBvZTVCNzM2aVA3TTNSMGxOZDk5d1RyM2NoeHBwTGZwMmJzSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325653),
('GhAfe372Fyf80JMBIvlazKqLTbJ87LYqlELN4ciJ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicW9UOWlOUHV0RkRLaU11MkdlakJvSzBiaUVIcmMyMmloRjlBZEQ1cCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC14c3MtODUzYmZjIjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327365),
('GkSF71VXnEVHjvdT2tS5gs2v3NYxJNwBJiIyOiwO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnFXMkthOFJHcmtrNGowcUtzN1NWNFNDUlhnR3k5WGgxM0JTcjVrZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325672),
('GKv9jCejRODYjBmtmxaPW20mVLy0JObHCA5Znnua',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzgyaHY2OWMweVR2QnZqMXp6bUU4T1ZSeXJPUmJUaUxGc296NU5SQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3MjoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3BwZGIvNi9kb2t1bWVuL2trIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wcGRiLzYvZG9rdW1lbi9rayI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ucHBkYi5kb2N1bWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327266),
('gN3v9bMKSkb9ZlK9Cj2q57VeM4W6ixjutzqMzFpP',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHJZV0hzZWZKcHZmMXdMRjhPbkM3aWlBRDJpekdVQ1hKZ0cycGRNSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcGRiL2Nlay1zdGF0dXM/bm9tb3I9UFBEQi0yMDI2LTAwMDMmdGFuZ2dhbF9sYWhpcj0yMDEzLTExLTAyIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmNoZWNrIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('gPZxGEwepbQZFnVHyOjGfWXzECTlbqPLbXKqOBNv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMExaMm5NWm0xNU9uRUI2a2hnQU03ZUNCWXI3OU5GaUJoZFhKakE2SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPXBwZGItMjAyNi0wMDA2JnRhbmdnYWxfbGFoaXI9MjAxMy0wNS0wMSI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327267),
('GqvWhj5AKY9AIsnoybv9v0CXXEOjbbu8Q0Yfa23Q',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidlBsMDdjaHZWNk9rSnFGZDRPVHFoS2hDYXJCMERVRXJZYjRvaVpieSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325119),
('grqS2yNls3nWlc2iu8ULOd7S39vhBM20HXAJG4q6',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0cyT3BVWjVrZVVLMEZneUtpOWVoeklINDhGQVlqRXFxWkY2alc5bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327363),
('gsfHzJHxbXg1hDqjW7xJnCCwzQtA5fS5cSZsRP5Z',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWk0bUR6WElZcGJyOHdBMmpoWXh1bTR6NnM3c0ZlbWg3b0dYZW1PbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDA2JnRhbmdnYWxfbGFoaXI9MjAxMy0wNS0wMSI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327267),
('GxhdghX5Mfsk2FMF86ljjylOmXWPfUj2DucxcAFH',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3ZVTHpiOGhxeWd2cWdVbWE1V0NNVzNrWTJGVWdJN2J3OU01dWhkSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327976),
('gyKflrol2FocGLaKgyeandQRzGgzmVRl1tzcnxnH',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXlzVHdLa01uaGszTUo2Zkd1ZktCMkwxQkVxSnM1eHJmYmZhWG9XdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325628),
('GZu6MTrgMvB8B47yGT7Ksi3FLuUVe2RV3ovTy52E',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiczZadkplRlVkYldjWDRPano2b1ZCTmVSUDBySzVaV041MjAxdlNjTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327356),
('H29NSZ9edNMBBc7aDcNzQFcKhi6roBLT9rq8E2Vd',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0ZuUlpWZWtabFJ2bTZpdk1zMFA1SjlYMFRPb3VlZVlwTE5WMXhxdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326133),
('h4JI0snKFL8auRXqZbfu6GINnYXFO86dVRVLa84C',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDE5aVJuQXYybTZnbUZNaFRNSUgwV1RsR01iTmdDZ1lCdVcxelJsMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327263),
('H5S5yF6By1e4ZUMhn4QVN6x8hpJer9fUuUW7FtW6',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGpUc1VUcm1vUVh6UkpJbTkyMnFlT2ZJOHYxdnIyamVZVnBLRENTbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325734),
('h9chXJ5YU2hQEHzqdiI3hfCsynjvxvkjiB7XulXb',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXhyaFlFV3lueFJ6eWo3UlFjZGRHcm1PenNOSlFiTmpJUE9zS2VFTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326226),
('hBWMwF8QBii9QBNXinW3d6gTQQKi9nAIBwv1YKPe',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTBkSGpJNGZPaFVNVHBWT0g2S25EUlpUQ0pPd2x4dnJVN29oclgwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325249),
('hc5YMdAUHRoIpEgAWyNf81UcDeuDZooBUujYJKN3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1JnSkZXMkZoSG1SMGY5bk42TzhpU1JpYm1QUmxrNm9YbHZpbkNZOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325653),
('Hdli9ZZyx7irwMaJw1fkMFYej0fZbDAz3TLbPm0F',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGdXOEVOOUR1bFp1dktlNURtTGl5RllJYUlnbGRsV1VJa21QOTVpSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325663),
('HE9yGQwgLmnkkjOPcefO94S3nKvYTEmH9Wybc5JG',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM29rcXdkejdDbHJ2cExQY1FQQ1hZTG1EWkREaU5DdG1WdEpiTHh2QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC14c3MtZTk4MDQzIjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325673),
('HEPXLiNokkj1jCH7ahLCQPv7VVd114GoSjMjaB23',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE9YbXFZN0tFam1Xd0g4YTVmUGZ0RnJLNjBIb3QxSWRRcnVBbk1PVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327605),
('hGq5HaMLaGUT6CIOom4C17BaYsgv8MU8oIHqv037',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVRmQ1hVMUpvSlQwNXZiMnBjYXphY0hyT3RmNW1na0wyODNjaXZDVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325721),
('howbIQiDIfX09k4DOMbnRiqqi6SahnVpYY5KvT4O',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWhUbzBia0EwWEt6cEwzZU9xd2VSRE5xVEdWaVlGS0pzOUxFZW45QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49MjAyMyUyRjIwMjQiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325664),
('hrhoDcPxbb10nRKNdMjTnVYGz04lvPZWw9mKTpRK',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoibFVCUmNZZEhkNlp2YXBIZFVMSnptRVhxajFCSUlFSXlYVE9GQ3BteiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9hbm5vdW5jZW1lbnRzL2NyZWF0ZSI7czo1OiJyb3V0ZSI7czoyNjoiYWRtaW4uYW5ub3VuY2VtZW50cy5jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327692),
('hRj68q3moTDYsm8zKhHPs8fFjn6OiTXqA3VwKiBc',NULL,'127.0.0.1','curl/7.88.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiekZma2Jpd2d2T0g5TGV1NEFqN20wSE5qd3FDbDNzNHZoeXhQYjI3SSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDozMDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('HtYoy5WCN0z26wHHdx0MqvLLWqFLWfJKXskHoCcj',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWFZydFR6QWpmQWlEMDBTdmRwWTFzYmJST3gzbWFLU21aVGQ4b2FPdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Nzg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9leHRyYWN1cnJpY3VsYXJzL2NyZWF0ZSI7czo1OiJyb3V0ZSI7czoyOToiYWRtaW4uZXh0cmFjdXJyaWN1bGFycy5jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327849),
('Htyq88tL0iw7FqUaVX0L3UvoFdxsGZKsj2ecmPqr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUtNZG5nc2ZJTzZNeFByMkVYTVZnMDV5OGhPWktuZGUxdXNKMGxuayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327355),
('HvSCEEgXWH5bhBNekJqZXQUFaJ1H76et8kzVu1sb',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEwyaGdDeGczMVFCTEFmZ1FsNFpkOGJyTGkxUjJtWVMwUTdPUVlVbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327977),
('I2Spp87LusdKsEsGmmKB6EHoT2CZl1fNky0hBw9G',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjI0WWU1dlZNV0hvRFAwOVRwSHdOTmx6ZTFwTWxaVndZdHpqeURKeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326113),
('i31FICa3r3OftpGqPDpHJBnyqFjj8rXVSdGAhW52',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicDN3UXptQXlxOVppYnhBWFJEU05zbDdNeDFoQ25zYWFodmh4VnMzbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326114),
('I8zj045qq5BiGeoX0e6keDw1abGxmKhNMqiGjpBx',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTJKT0dQOFhKekdOTzFBcjhEaFRGQzFJeGUwRGJ4ajFPQmlQU0tqayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzEyL2Rvd25sb2FkIjtzOjU6InJvdXRlIjtzOjE0OiJkb3dubG9hZHMuZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327970),
('IAyRqTbW242QvQ5HuoaVCFO2GmrkzUuSGV3Yf5jJ',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXdvOVFDM00zN1VpYng3YUlxSXBTQ1I1VllCRG90c3BqbDFZSERXbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGE/cSU1QjAlNUQ9eCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326203),
('ibDAe5KYUtxjRS9bzAnr01JW5xA35mxFDRWzzX2d',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVdDM0NYRE9zbUNiZDIzY0lRcjhjeFBYR0pZc29tT0kxU2pjT3RCVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmk9dGlkYWstYWRhIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326116),
('IC86ZHbCZYHQpDQk90hMikPUNKQ6B6ujH0j3FS6f',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2cxY1FPazgyRHA0V0RBc2VuQkZBTkFBTTlCWHlpZ1JrSWdNbktWUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTA2OiJodHRwOi8vbG9jYWxob3N0OjMwMDAvYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325118),
('iDc7Xrvg9OdvkmNMpJJ3Fsv7mt8gWNR9yunZxLPY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWNpZkZnNVo4MDIzZmdEY0JQcklQOFFzaUJ1c0ltcDR3TzdWZjZKUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327974),
('IFLk3KutJEXGDevY9FRb8tlpAIlN7BmPxwmTciXI',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSU85b1FTaW8zcWQycGJhUFZIMnU1aW9qYUNXc2dtMGFRN3lYR0RQMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792325893),
('IfZqX6JGj8vzQhsVEHZ9PAuuhcOylUhfWMOk4Lyq',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0VWY0UyYVhiUTl0Wmtvd3JJRklYeVR6VG5JWG9GMWpMdlpHSDB6OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327972),
('ik2TQfT8hhjUirBL7kISjf3fBJAuYuLAxRzvqVFS',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoicElhbWZYZmJlVGlTSWxLT1N3MWtwbmJBdDBCalNuQ1BYQXA1WU96OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1LU00iO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325369),
('ImV6ImryHlonLtPbpua8sRC40OCaCrl6PWLjDCeA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM21lRXdLQjlBZWp2bWZiNW5FZUxqUDQ1d1g2enhMS1Jjc281RFlmMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327338),
('iMzaK5baG7BRd9GcdUGIahMV8mKEWflXxmMgoBiU',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiREdLV3ZhYWExM3Z0RVlwVW44SHk3dlNkV2RFSVdscXpJb3k4SExISyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327567),
('IQbVATmHAUyw9IvSGkAyjK099TWsN07ngFtaxDGx',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZklvSDBVejBxYXJOMXhXTlc3MDRIcGlMWDVXelRab29nRzl5UndxeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBjZDE4ODkiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327339),
('IQV2xbK8X9kZEPkKfr42kMRBRA12QJ63SN6ge9gT',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidkN0N2tnemJNb0tkOHBBYkpFb01vem9RR1o2OGxwYmdQNWlvc01BdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325628),
('IqW9i0o9XeoPzk9ZYko4QgmTcNH2nVOYObt1cyO7',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVU4VU1nb1RpOGw4TnZIOUJ3UEM3NmVqMWNSWld1OEZRT3NQSGR4SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGE/a2F0ZWdvcmklNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326203),
('Is6nZsAIB4Y8d2clz1y2pApBsRNst2jt98xeEaZ5',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWl3NWNSU2o1Sm5HckFwUk9PVFdlTUM3RERYSmRYNzUydzlibXFPOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzEyL2Rvd25sb2FkIjtzOjU6InJvdXRlIjtzOjE0OiJkb3dubG9hZHMuZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327971),
('ITUM0Xfto4HBbNABkBkZnsaTPgh0w8w3UKqM3lBg',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmo3THpEc21oNTBXTlR0MzJGSGxrakdBZDVReGRwM0FCa0NacGVGUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGVzdC1jb3Zlci0xMTcyNmMiO3M6NToicm91dGUiO3M6OToibmV3cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327349),
('IYFmi7puE05AoZQTFzpz5atOsZDCvtWHrkbGqjZR',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEJvZTBXWmt1ajBYZHRzZGhoOFM4OFpoWTNRakt6QjcycHJUdEh1ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuL3Rlc3QtdWktbWVuZGVzYWstbGlidXIiO3M6NToicm91dGUiO3M6MTg6ImFubm91bmNlbWVudHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327849),
('IZcNjkjAiipHv4SrFudDkxuuUAzjZrOGqeQH8rtK',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRGVlZjFFanhNWGhTeEE5RnU4Mk93YmllcU8wY3B0dGJ5YXVXcGM1NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325677),
('J5J7ssA2Hvj2KTGQQr8qQSnrtKXmSjYS3kq7e00R',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUV6eGJWN3k5RXVBWnJwczFaNDlnOTkzcVg4WU5BWloxWXI4VHl3UyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDAzJnRhbmdnYWxfbGFoaXI9MjAxMy0xMS0wMiI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327965),
('j6GU4HYOfXCyzj5kSomx0bv0jlBlmKlfAVNKjwqO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0wyR0h4RWFLSzJwM3lQWmlvM0VLWXZoZ1VwWUlHS1Z1d04yQlViUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326116),
('J78nHdtzas1UZhO4OD7IUUluoVFSsiAry6pRSfXi',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0dCQ01YNVJSdlhZQlh5NlBnbDJGSXJLcml2N2poczZxT1RpTG5QNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327977),
('jBJBh2Zd2hvEd1l0k92exQaUgBX8OPsPDZJWFmZN',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVE9YWElRbUE4ZVFVUHZtWkRHTk43cnBDNlFJeUlIc254WGxhWmdYdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9nYWxsZXJpZXMvNy9lZGl0IjtzOjU6InJvdXRlIjtzOjIwOiJhZG1pbi5nYWxsZXJpZXMuZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjBiOTIwYjVkNjQ3YWI3NTY1NjdmYWE3ZGE1YmUxNjdlYTljMWJiMDAzZDBkMGU1ZTQzZDlmODIzNGNjOWNlMGMiO30=',1792325999),
('jEmfLi7znKrrnj0X8T5yTzp6D9j1zgGt2jTYarXU',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEFhRG14dThjZFh3RGRFZ3lraWZ6M21NUzMxUDRxb3dmb2NUaUduOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327803),
('JfuwTFODat0S99HJcrCVsBUiBOyoRLtt4qnN4YkQ',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkJHSmgyTTNFYmZ0aFBheUdhMFJTUzBVQ250Q1FBb0ZFeXp0bXBSQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326203),
('jGaOTj7K2GVDshfNFJDigZ9DobR1hG4cGoG06yIJ',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWXdLempmWDNJTTdCNWRoNkpzWEdYTmNLRGxRSW5Qbm4yeUdMb1NKVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9kb2N1bWVudHMiO3M6NToicm91dGUiO3M6MjE6ImFkbWluLmRvY3VtZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImEwMGI2Y2IwYTc2NmNkMzQxNzIyNjJiY2U5MjNlZDE5ZDYxNDkxOTkzMjA5MGQxMTBiYmJlMThmMDJlZDk1MTkiO30=',1792327339),
('Jqbxmi0Orpkdljc5Zh7UIPwwtQPPVE7HjoxEdtCQ',NULL,'136.110.244.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnZGSTAzRW5JN2U3QWt2VVF0Ymp0RG5aZHB2OThCVFpNaXZneVN5SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327244),
('jS58gUkkZVpTHRFwc8bakvVIUR46OmjBUVpkJcVD',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieXduQkhDbkIyMWZIa0hkdFZoTEVEMXQ4QXlvT3QzVE5JMzd1RE1aOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325715),
('JtgxEuofwSyzg8WcpDSo29TYnnQOl73DKC6d7AK5',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2V1WEhlUVg4VnVUZFFQOE9yekNZSURZdFFUMzFhUHNpVlM1OUZrTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGlkYWstYWRhLXh5eiI7czo1OiJyb3V0ZSI7czo5OiJuZXdzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327350),
('jtwOAwrY7WAJBRmmddmiznlONbthpAiYRmE0UPqI',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVdZdWg5cEZ2RXBFZFU4UVI4Vm1OdDRPYjB5bnFGaXlXdUJEQW1RNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49eHh4eCI7czo1OiJyb3V0ZSI7czoxMDoic3RhdGlzdGljcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325725),
('jZ9xJBobLvV8RaZrFWDy0GbtI9ki5gZ6oNTqnm7k',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNVZwcTc0RGJMbmdXa0I1c1g4RWxGT2tsRnNKc1AzY3ZoVXVRM2t3cyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326116),
('K3Kf8NZJC8nAqMlY7yhKCMbHuOQ5atTJtTP8I08w',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTVtMGZGcm82MG82Wmd0dVZjY0JWTDhCUTg1ZXZ1c2hOZDdkWkpjeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327275),
('k3lrgHMJTJrVxYDq9mx6VqxsaoyxRzxRqPbXHBHq',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHlTTXl1ZUd0MVUyWDBnUzRYM1A4dEd4bk1LbHYzalZnRnBqa0s0ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyL3Rlc3QtZWtza3VsLWI1MzI3IjtzOjU6InJvdXRlIjtzOjIxOiJleHRyYWN1cnJpY3VsYXJzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327974),
('K7bv797DPV8XxzpmTwMxrrgzfXTjzT3fevSQPx8r',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTdWSlc4SWtFMkdBWFB2Y1FrVVhXNlhtbjZ6THpTZWVNc29WVjZMNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS00YmYwMjIiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326132),
('KdVWsqFzKXwL19TQvB4hBPCGSEmKiknr6DzRA9tY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHRGR2RmSEg1SDRYQ2xrZGk4WEJEOGF6akdlUjI4WDNNbUJ6ak5tSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326133),
('KGPuNH6Kpe7eXguhlMRXxE1Ke7f0riFo9j6ZCsNa',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzhyR1MwUExBOU5ZUUJJQzd1WmNid3MzTG43dGdHTDhRNjFzOXBpZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325247),
('kjMFNAnZs3rlt0KtPte4erXvTPvAYyxjh6cCKr7a',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGJWTXZOd0VpeWZycFRwc1VvOXFyOU4ySUlnQzJmZW1NblphMWU4UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325360),
('kLJ5Yg0ZK3OUtXvYV1Z4cdYZhfskbdtSaWmohzFH',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVThpMjhaWUM4bHlDVDVjS1VYQXdzanZ1VVBOMnl5MWNLVUoxdDVMbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmk/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326140),
('kNIZxthRIBDRAzrW75sf11pM1K79RdTewGTpaAMj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzZIVGJhNlJIaXRuSTlhcDQ0Z2JaMmlMV0FoMXZJWnBNeVpXQlF1SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327275),
('kTOfXWCEm02MBIjjg3aB0tNHax1tDWScj3GMxUez',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXh5YXo5TmtnaVQ2NFVBalN3OTVlZ2FmVGdEYmVlanY0Z0VxakFVSiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325249),
('KVqu4yJFCYZzYLCBz7Ds1QgmhPICQLW6fBjbmKws',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmdaQjVmcEQxNmFpaDNvV2U4NkJPNEt5NjdvT1pLMkZHdURSVmx5aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327973),
('KyAsHh0mBpyADLBIO1aT4lhhlUSSHxEDJ7xdyOuR',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE5GTTVscmxIYmRXOUpYTzdsdXM0RHhKOGhYS01PVTl1V3kwdGpGRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiL2Jlcmhhc2lsIjtzOjU6InJvdXRlIjtzOjEyOiJwcGRiLnN1Y2Nlc3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327963),
('kYD62MRD7D4FO1ocKracNCOUoITtHeYVqVS4uepf',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmhHMFQzZjVGaHdmRGIzNm9hY2h2N1A3SjNwemVJcml2clNVVEV0USI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiL2Nlay1zdGF0dXMiO3M6NToicm91dGUiO3M6MTA6InBwZGIuY2hlY2siO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327275),
('L3u97vXJet96eDe9lt69durq3q0odisEjBIzyQof',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoia3NpWHRRc2tQcElha3ZyTTk2QTY5RENGN091azZybkR6VWNiZUNiUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3NToiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3BwZGIvNi9kb2t1bWVuL3JhcG9yIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wcGRiLzYvZG9rdW1lbi9yYXBvciI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ucHBkYi5kb2N1bWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327266),
('l61o8PXxfIGrNfagYoDXKFyNVH9JQJA5flHt7ROK',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDJ2QmhSUktSWllJNXRvWkllQWxveUFSMWtZalZLaTBOZDJubjZzYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PXp6eiI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325725),
('lcxnzTxCpeQNoApKYIO6gsMZthNO3OnnRLMZkwYB',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSExSUXJaUWYyN0dCM2dicndvdkxBbWk5ZDZJVm5kMmJpMGxzbWM1RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325263),
('LKJV8EgDGQT2iXIcWDUxkmsJkzLsvEdLs8EFUzja',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3FKZkRETlNnNUlUSkRFbDYwQnQ4NVlKajBCQWVTVWZPTHM0SVZhciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325118),
('LlyhWLDzJ6ya2xUtkNTjnjonxDJ1nZljJ0YQS8zh',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ByVHB6MnQxcnRLcmEyMHZQNEdxNjJpNkF5dGhtZktDRzJua1lCbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmklNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327366),
('lnnBWaC5D59NNvFzAfwXflFWpdXH6eJ3GseILQLO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTN0U1EyUFAxNTRyeHphWWJpNFhYWUZ1U2R0R2VPWG1pTFBOOHlsRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPWxhaW5ueWEiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327969),
('Lo7zrQPRs65USjdowHLKeFJ7IaZIBQeOg6FglnVH',4,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaERVMzNqdWV1VmR4UFM1MFdsOGFvYXRGOWpjNUYwd2dFbnNjQjBGZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wb3N0cyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucG9zdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJkNjQzOGM1NDc0MDQxMTFlMDg3YzRmYTQ5MWZmODk1MWFlM2ZkMjM5NGY1MzMxNTNkYTc2ZWY0MjAwMDIwZWFjIjt9',1792326138),
('LpML9zcp5iMPcLcpsF6RiUBqvq2MFWoZ7t1YB7U2',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3lYbDJJQTVRaWR1R2hWSm42SWNjSTd6QUlBdHo0blJ4MDZ4d01jcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325627),
('lRcgk8KY29sBBxzHmiueQOsQElbES0q9ehSSSb8r',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVZNVhWZTdFNXVQUkVvV0l2dmgxcElFRnhLcmc2elo4ZDZncmhnZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327354),
('lTao6Cb4iVBvgkTvr9X3oRyNZVxJdGuEZ9j7T5eH',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTAxQ0FhQkc1aUo0R1ZRcVowOFVzNkY3YXd3R01YeWhmZ3JvTzR6ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzExL2Rvd25sb2FkIjtzOjU6InJvdXRlIjtzOjE0OiJkb3dubG9hZHMuZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327340),
('LtzcPvXR4N36mj9bm0rEvFFaHOD4v8SyLgolLjak',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZThRSGJwN2pMSXg2em8yS3FBMUFFR3BiQWQ5ZHJFN0pxbktoc0hqRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325629),
('lyMA3nlEV5SSSHzEF5MOwC9m2HJzimZJfPeDLxCX',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2RHb25nNjdnMGFyTzloS2RzcHdxMHQxZGppc2Y1M0dRdlFmN0pKRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC91bmR1aGFuP2thdGVnb3JpPWZvcm11bGlyIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327077),
('m00wfzyAzec3Ukp24XmcT9ZjwgtHc7yeS1FgQX21',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTNobWl3Y21OTmJ1NWtDbElnT0wzTkw1dzViMnhKdEJGeFdqMHB4diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325246),
('m12dSnDmlpZrLrqNR9i4z004ta7tgE9ikqrZjnPx',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmhSZ2tmNnJNMTFKZlhPclZHSWtFV0NlRExLM0xaUjhpaHZkWkg1MCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325110),
('M3bTj831giM00aizxda9NPnwgICPGfEpV6srSkuu',NULL,'136.110.244.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGZsWTdFeGRNWnNtMWRPWjE3enN6Sm1QaGttbGVzOGd6akpiQVJTUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327004),
('m4ntDgrVvn7nsvW1L1blHZYi7XAIuKA7lgWAaqN8',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQllrR0FjaGpJdGlLd1VaekFlTWFPNkVDVWJtNFNQMUxxOUJvRXo1cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327369),
('m4OSKxqoeFThPF91sH6Z1ZB4XXFVEkHlvzlaEihD',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlB4TWxxaHlSY0o2Z3Q2c1VDR2dqVWJSR3NrUFFDcTJzZDRqbmJtaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbT9wZXJpb2RlPTIwMjUlMkYyMDI2IjtzOjU6InJvdXRlIjtzOjQ6Im9zaW0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327975),
('m8ZemmwsitolGkddInIXo1WqDVMvDAfNu10XaL3r',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1lybTN2aDRwV1I1c1RqSmp4Q3laYmlBRHJ5MU9xTThjQ1B2a1V4eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327611),
('MekFRjzVVZSJePxWbaCCnd9aV4P5Q9ve2ERUqtRS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibGtqR0VBRHZVeFNnNnZnVUVuaG40dnpqSERLTEd1VDFweHJSZWozVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326114),
('MEMRPTiBDch90qjanDFofWAAAMZDH2pJ6YAx7naI',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0ZKdHAxZFppWlQ3WG81NVBqSjJWUzJ4V2I1WFZKd2xTZ2pJenJ5SyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325246),
('mhXHNs9yEKVcKIdz9BgXYOCOKjQegXSNjh2ZMdRI',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlJTanRMU1VWTzEwcHhmSWE3d2d5d0p4ZmtSQzRGb0dpdXBWSzIxVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327964),
('Mkap8BRcRc4BT3cLZidPWrcYXAPbpZxG4knugJQp',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDlPNEpBRkpOYjZsdEFCQWNONmJ0aVZwYzlJU0RsVlJ0SGVJSVZqSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325247),
('mlIfCDXgGt2DQvLwiJ2XzOIIIm7FiVoNfT9RuskJ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicllWT2FSRGw5a1VkREx3VG9BWnpaYkNPb1Q4TXhjNlpscEZEQzhiZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49IjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327365),
('mm1hYtbH7OQzI2gDE6dRzdoJ9KnTPZBbQa9fG4ly',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibnU3VUx5N3VTRHpBaFJPZHRrNm5rMW82bG5RalVJR1ROenczSHQ5QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327963),
('MMqDBRQf5kqZwhN9L2Wvi2CUj41q18Hryro20Psn',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFVMSkppYTZIZUp2aVo3YkNRYVk5UjVSbUljRzZ0SlE2UTY5YWhVYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326084),
('mmV1xFnjXrCop7UlcfZSzaMhDzIzhMZFGOl5IBeJ',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYnd1U01vaWVKdENybDV5U0JTVW9tMGk1eXl6RFhxTnZXNFhESktOcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792326129),
('mmWh8iMTiTHTPpWUA17oxoWoMh23t9df66pS0Sq1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlVMbVd2Z3h2OXJpVUY4SVJwcGNHUTdjczhwMU5oenI4ZUdvVVVrWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326123),
('mOkZn4NYoDp7MLfoQh8NQOhMAOMWmmVwOw0SQuWt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTdUSUY0WTVtNnhmVUpZclk4ajFnZU1ZMTZacEZHOUxtb2llNXlLUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327350),
('MREBNM60kckSUGDMw3tceW9lhxZVxV7puv3VI0ak',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXlnZ1FWTXZraHFaQmRsMW4yRHpKNUhSZjNzSUZhVUJEUWdoSk50TiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325663),
('MsQY2nyNhJt1czgDb564BddpUt1IIbdMdUDuq58g',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHlkQjlIUEhVMjJTU0ZhZ2Q3dW9KalVDZ2hBcmltRWs2dHdwaDdYMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PW5hc2lvbmFsIjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325249),
('mUVc7Mz0Mr3oWms0ljCRNGoyEUo94pKO0aRCaJVv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NZSVRuU1NlZTRyU2VTdEJQdHFKWDRJZkVpcXVQekVaTjhyOWZsUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325663),
('n4EZKckPaV5VPPdthDGnfZ33QB9jnj91vLzoKlIB',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlFhWUhvNnpmVTJjYlk5dUdtZXI4OEowVmo5ZXI5d3pGWWdOWno1NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbT9wZXJpb2RlJTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjQ6Im9zaW0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327976),
('N57UBpyT71m1kZ9VRXAEdvLsCodgvV585XyQaqeE',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmxsODVqVzI4dWM1aUdJN01RbThkQ25rZmtjM1RNRFFoVkFQTWVkUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPWZvcm11bGlyIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327969),
('NbEPSph53PD24PGyekdUCVPdNbMUFICE8ahlxuUY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlRJbjNUaDIzajE0WnhRVUtSU1FHWXMyQTlSdGZzODBlb2d1d3E5TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjE6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT0lMjUiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325725),
('nD2TCyj5KtH0qe945nX48IObtEGeM44S7MGyyIob',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHBLRmU0YlVyTTRpOVpqb29QTUNqeWJ4a0hkaDh2d2ZDR0R2aXZpaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325668),
('NfXMKiyjSnJV3Z7DVpdANk6BaGwlB8JrbnrT0cp3',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzR3NGwxandFT0F3cGVRUnFvWEVuWmVzOVU4RHhTMTdxc2RCMG9teSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327872),
('NhNhMeEnEmLPZryfYyXv34QU53kCdXkxnM5EX8hF',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW55RmxKVWNiN094THpCMmdWQmdBUExCeGU1N2xzVXhvME81bW12ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327350),
('NhPCRGGbMeR5pXqvoDfZqQxPCq7rya8nalRkV8IM',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFpPMjhpN1dBekdTRFRrdExXazNHcGVaNkY2UzE2clZ6TmdRejBIQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325663),
('njTClPsvzPdhCo6hRnGk7Hj8oBqBGU8Ox55hrprk',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiazU1dVlId3dZQXRsVmtRQ2NrQ1hWQ3FEMFM0UDkzNHBSaXUzU3ZEdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792328076),
('nJUNuKudDlrbT4WQAJwSJp1yPRsjnT710uHoekAx',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUV0YzlyS01rMHB1RVBwV3pZVWtsWWw3dmhYaHJsVHRPSEo3bWxsdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325270),
('NlXlyQY25QP1vzkYSYnwkIPk2FOXOprfpsGEyHWH',1,'136.110.244.150','curl/7.88.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ1dRZFhDRkhhaDlNcGp0UHplcWlJcnFBZno3R1E3OTdJY250dEFGUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792325952),
('nM8jipnywAUvVb4Dni8XuJUTLlThyGQXQUeAqaRz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV011MkJDVlVYT3VyT0pJTElJRHp0c2dEZVhTWkRXR3ZCUHVSZUdGWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325253),
('nNAkCx4VQYOiIQMA72nHpiQVFZlBJDnCGQo84LD7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2RJdVVoYmNRWXRmNTVJQlZJRDc3OXhEcGZRM1BMRHhmbTE3OFdKeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiL2Nlay1zdGF0dXMiO3M6NToicm91dGUiO3M6MTA6InBwZGIuY2hlY2siO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327976),
('noERlGokfIXLMsRE7HjFsuvajAnNAXsBfgHkMkig',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoickVNc3lFQVpTaEd6VExsTHRMd01FVDlzdXIzanhydm1IVGliNktQRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325720),
('nttmTXBfQMrR8F5nS1QCOIKXitCBGkiGgPKrJlhS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjJiRzRKd1BzU3AxNW5Pa0FJSjNmOWlZOTNBZXZLTzE0MWJWd2NrSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327349),
('nuQOA1TrNoRJlWrI8stO326xZohUM9csG95teo2p',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWJHcXllc1g3WWpJM0MzdW5WQ2tlRG5Dc3Y2TkdHSm1JVElWdUd3cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325653),
('nxByGG9UVP65QspJkpiFoAXAkxFmwgNcWWQGhel2',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUdqalZLeHRTQ0c3YXFubUExUmFGQjVIakhtbVNLMDg5QTVpdWZYUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGE/cT13aXN1ZGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326226),
('nXma5AWfUP3AXiozUIpilXRNTCWyJmPwhhL1Ks8v',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHZ5QlJHRHpPSDRZWGVQNUYxMldiQm9ITWZPMzNzQXN0aHNEUUxmNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGlkYWstYWRhLXh5eiI7czo1OiJyb3V0ZSI7czo5OiJuZXdzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325663),
('NXMNE7DeWPe2v58oNnRdXhD4o9334b6Ga1rvDeqI',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW5lelg1MTJsMHVsd0lOME5Ldkk4ckZNeVpoSWJuSTBWNGxJdURBciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326130),
('nYNEzvw4VELroeigWH5XKmUAnnGv09YAW6vMq1pc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFoNEhTdEo0ckN3VDhpaENpeUxUbTc2NU8yclNIczBZNGpSMHZYZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmk9dGlkYWstYWRhIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327351),
('nYzgNPw501YGpE8Fer0RVKTahU6yAEev529MBJlA',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3ozUEFXa2NHVFNRd1FPdGVoQkJkZlhIb0hINnRxd0lnam5KdlNSbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PW5hc2lvbmFsIjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325795),
('O0ox4x24kLICRixfVGOp8ARn9baRf0OqrUxzHlC2',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmlnaGtWczVPV2gyYTJqdTdDNURERWhCemtWdHFlZVpMOU51bzlWcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT0yIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325664),
('o3INgPqn2YpdPfsnJeduNUXGidq8mMQqwHR4jwa0',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUhRVzFQU0trczU0ZWhlMlc3V2Q1ZWdmVEg5TWd4SkxWWkFyNHBjcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327352),
('o7WPe0v221VoovA6iEPnZyRp2p1sRTKwXXP3kiCf',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQktzcHpBWFZVRFNCb3Y0Zk0yQUlIVHN6aW5SZTNwOWJYeXFTMmVwaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326136),
('OaFfky5vjQRqXwpsyhNyAq0dCsIkt6NYG0nhRdKz',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoielRDc2tUOXB0dGo1TTI3dVlQTzNrMXBPenhEUE1scHZ4R1RwRFBKaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327688),
('OcGt7m9usaFYLRotboB5M1ASJqouxvJhBagBkkI2',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzJCZFdmUThQMG8wbEYySDhHWFAxRnhIYkJFeXpUQU5YdFpBWTQ5ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325110),
('Od1y05nqdGMRS1IYrAASTZRcjuHdPh3lFdV3470j',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1hTSWxEY09vUlBoakNRd3RGTWVHcHp4MEk3RDdtR2ZKUkYwa3VvUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326134),
('OE4MK5amJrEvSc7pNlrcjVJOrYshQ0Qm4hI9liJi',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzd2Q3ZwenM0anUzU3M5RkRCaG4yWmxzOVNEcm15OWYyVFBXR01HVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326115),
('OiF5hOIW05dIx39CMTV0aaLDy2LbDAp3yVw7Vqau',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjZCaHg2YzltMmtaM3dZaFJpVnZsaTJySE5tWGowdGFNTFc4V0FFNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325653),
('oIswmY2oivCHzvlNDAG2EO0VrKHwRLjHAtQ6tuek',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHBGS2dTSGFOaE5VS1pUdFpYNjVCaDM1a3NqZnJBa0NkVHVsYnFvOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327968),
('OIwYFZV5QB0ussS63uQy2HwUdqb2B3FLkjBqALym',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkFWVFN2NVk4MHRUSTkxY3JRVkJOdGNkY0twMGhQMXV1SnpjSURxdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325943),
('OMASSy8xdCvKESW7S0yI2ECxvoWpPDWSDuS9R10y',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGxLYWtadW9NVXphck85bXl4Q2ZoTjQzVVV3bTMyNjhmMEZjNTNRRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325247),
('oMLMb0awm2I2f0LaRTGH6j8POKjO9xXKRumkzujM',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEx3Mm5nc2ZxMVZBc0VqNWRqWktnN0dkd3owam5VSmdGN3VJQm45WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326114),
('ong47CPl8bsEZN6j3qfIUIteVsw4XnjsiN4L5BdC',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXFhVnpRM2hmVkZlRWpHcjh2RW9JblRPV1hVMHM3a1dtR2NHZG9zcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbT9wZXJpb2RlPTIwMjUlMkYyMDI2IjtzOjU6InJvdXRlIjtzOjQ6Im9zaW0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327274),
('opqBaIbGYmNwvAd7Ue5JWhzfEZ8ZhsBR4EGBNgpD',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoic2thODF5bjBLWFk4a2czS3lWMFhIcE1WMzBwbWRRRVh5dUE1cGg2VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326203),
('OrlH51wYujwZWM9ZVAITjZhBMgHfOoE92PTzqGqj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUtqVFpETnRhWkl5MHExUUxzS2VMbVc4RnZNbGd5bGRxc1l4djJuUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiL2Jlcmhhc2lsIjtzOjU6InJvdXRlIjtzOjEyOiJwcGRiLnN1Y2Nlc3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327263),
('ov00LNOVpoSmyeyLuhITqQA8J9GcJkdnlLd0B3AP',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkRUandKTXZNY25NeE8yVUszTFlxM0twaE5DaThoRXNRdkFxc2lraiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327264),
('OxTmKrXuD14fvr1OI9yKvtog727qwY5Nnc64OpZr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVhJQmdHbGNpV3FQNEZ5NUFtbGUzSGtoaWRSZ2Q5N01hZzNCOGcyOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuL3Rlc3Qtd2EtbWVuZGVzYWstMjgzYzgiO3M6NToicm91dGUiO3M6MTg6ImFubm91bmNlbWVudHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327271),
('oXyYvrUALdPFODatgBYrUF14LMz1cGnI2AtEJxPS',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjc3RDRYSGZ1elJtUjlrWEpUZ0Q1eGRYN2NqRU85ZkZDU0Racm1aMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325247),
('P0RbcG8J5Y1GWdk5JKBcphAA5IE1YyldQvI1PKPt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHhXYmtKN1dDd0swWGI4UTFoaWNTTGtJTkVzMFhxckxWcm9kNjBKVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49IjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326139),
('p5TLHXbdUiQGLZ7PrMAYFckaY6e30riI5438iFa5',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidk9yUlZubXNnaDJqZWdZRlIzMHZVcUxhc0xucEFqalJHdVhZYWNhQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325858),
('P9IMEozr2j7PK8YA5GIppmtVvGMrslRGyk33rM3L',NULL,'136.110.244.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnNzRXhKNmREMFl1WWh5ZGtLc3RLSmttRk1VV3lOdkFnNFZBbXdhRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325120),
('pbLuDvsCuNWoQZx57bdDxuxUaB6yXMF0bPFqylnt',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidnpheHVkTVN3NmRacUdHaE4zam9ibE90UHc4Z3laVTBHdld2RVl4cCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PW5hc2lvbmFsIjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327351),
('pfeLZXNIRqNaFrPdBfDamDpLA9HgNC6Wca2mzTxW',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG0yeER1YVJBdjc0cmNTR25YNTg0V1hkYmdpaFNrNGZzaG5QU2lORiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326226),
('PhxoBglBdCgmzNfQsheESK4lMDzqfMSKhC47zCYi',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzgyak5XNjJIWmNORTB4cTVkajI5QkFhaUlLRFJTU0czbXdYYmh2aiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327077),
('pLIVrOoo0dKVSX333BDwC8EHutepGuAQ0u7bf0wx',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0R6RENXREI5U0FOV2ptZXNjeFlnVDR2bE5vVTRYZVJaQUlrMVRCbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpJTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327269),
('PT6PE8KNiz7e8Vl1EoRoMgN4BmUb1JYn3Jn0igap',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicmVBcndtM2U3TFk2RjVVaGJGa3IyTXNOd3VVOUpSU0U0anFLWDRyZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3BhZ2U9OTk5IjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327969),
('PVUodYroFyQodfli2Qaa0tcu3cOxuEL8mhmXa9Bf',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWxUa3B6T2Q2WkJLRmpUME12UlRBTExRdFRZNmZMSXRVTnA1OVhvWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49eHh4eCI7czo1OiJyb3V0ZSI7czoxMDoic3RhdGlzdGljcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326140),
('PvvodKaIbZNzGiT8dYiPQEB5palgTKhkaDwKNtgA',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidDBVMExoeE5HbmlVS3BLQzFXMnVFcWZVVUdVTE9wN084VklEMlRsQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325652),
('Q18mZVYeqc1vNMhbomSKtZQHbWphZpdTMlrn0DKU',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnVhQU1ZUW5SQ3RLRVRiMnQzam5ONmo4R29RaTdHTFZiYWhvcFFWayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDA2JnRhbmdnYWxfbGFoaXI9MjAxMy0wNS0wMSI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327968),
('Q5qUWCy7Ze55HdzgqBNNyxAopOWtwWWMynCWub4e',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicjJtUVc0MlVMVHlpRnVybGYzUzJtSzdSd0ZBYUVHOVJNRHZWQWw4NSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327349),
('qBfn0Dqt8F1iYAqygvXfxv7mAHHWGkUM7YHRxGPt',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzVHSXM3MjY4dkJCZ0lXY2R2Tnh6eUlkcjFTSVBrTFZHZ2JyQW42TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325110),
('QEklAFQGe8LNqLbUzc84sMvVcLmJp4l4dL5U46lh',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoic2EyTGR3R2hvTVBqUjBEMmxYSWtGUmc3SVdJUVdadWFXU0VQOWdpcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbiI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327276),
('qf8UjdcjMm5nwTQFEBZP6JZd6XlnReYqjzvVHiIV',1,'136.110.244.150','curl/7.88.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWHlLSTB1V2MzOGdBQXRtMUxyT0M5YUFQMVZmNVFXWU9kbVRWdnV2ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dzIjtzOjU6InJvdXRlIjtzOjEwOiJhZG1pbi5sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792326076),
('QiAU2sQfBoogQEKaueiegw4wvS5TS2wSnYq4rfxD',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1kwdzJGSjhxYXFOMkRnVmpyV01tRmZXNlByVnd0aldHdHNuaTVKWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327354),
('qIEaAqFHlxBozdIvaJ1CQUkOBXVoF1rCm6Rxmr09',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicmNLS3VPS0FWOENDN1FRek1VYlQxRVRMR3RCR2lCbTZGVnhaMm1IMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325653),
('QJ3zbYLGAmiDzwtL0yoYJKKcp7FhZV1zm8qUbRiU',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0kxN2N1UlByWlo4MUJnZkc3dmNhUElJR0llMDV3ZHBqckhHT1pPaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325653),
('qJvWTvhy5L3ErHWNeBnjtfNbTemhpDv1AnSsUqkL',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU5VYmNOMmliVVVmUlE1U2xnbVBHbTJ4MVNTUXBWZHF4VER3WExWUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325276),
('QKzKoJPDlAhEXlK0TWjg10H2VgFdYY34uNnAnm8Q',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicnJ1QzB6UHlYUUJXY2NYMFV4dTNYY0oxY0hvb2xtbXR1dElhNUVFVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326113),
('qLzOSb5FenpeTjVAjDGBL8eahL2OEoUFRJpCFqLB',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoicGVFOE9GVjJxNzlwNG8yVE9HOXh1aGVDd0J2ZmRnZXpQNWp0QWdRZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMiI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326084),
('QQyOFMkudqphcW8fvvu3DmDUz5SXc0fMr2BVsojq',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZExMZWN1N25WRHZyWkM2U1AyektwRGhodTJnbmtSUHowNmpKMmh2UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325321),
('QsJL3NHAMGBkZmTygu7LwyLn07GG7Eztj2VH56Wv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk81Y2FGMHdVUVBpclYzYkRJQWxnR1hXY1VLbmVDTnVxdk11SXN0NiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326140),
('qSvRwNAO427bwxFDnoXNBOMmbnjkzSOfREBlomvf',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoieDdRV1ZDb0FUSlUxajkyTU1xQzhpQjN0MVRPZVBDSXM4ZGJyaHI3QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9kb2N1bWVudHMiO3M6NToicm91dGUiO3M6MjE6ImFkbWluLmRvY3VtZW50cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImEwMGI2Y2IwYTc2NmNkMzQxNzIyNjJiY2U5MjNlZDE5ZDYxNDkxOTkzMjA5MGQxMTBiYmJlMThmMDJlZDk1MTkiO30=',1792327270),
('qT220k7acpUs5WK0mQYKab0QJvVz2q6XlCsMByuU',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0xBeExxMFBkMEU4dVFUaFQyNUV3eEtFOE5NZXZWeE96RFJoaVJyOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327508),
('QtwthOPROCAxNL3fN3NSrqAKAbqANeto9jp4Galw',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXR5M3VJc2M3MzFEVk9MQ045d01wZnY5dTZlb2E1bW9CZDRDSlN0RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmk9dGlkYWstYWRhIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325664),
('QWQOntdqbaf3aa4Xdje9wCJWcjt2qDldvxFa9Z8l',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHBPTGo0RWVjcVhmWDAwTmxPbkF2UndsTWhlbnVnWXVrQjNJaEN1TyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuL3Rlc3Qtd2Etbm9ybWFsLTU1MDI2IjtzOjU6InJvdXRlIjtzOjE4OiJhbm5vdW5jZW1lbnRzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327272),
('qz1MkkrgFJR5dNLJE1XELsnBOY0qXVyDUjNK8gFc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUklPVHgxWE5ES1JnSFdQcUcyQUJBaWRqUHVtN204Sm5jTjJLeEhJbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327964),
('r1orUE6H1mP67ln4uhPV1bqjI7KDIOEQmGtfaepO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGVIQ1UwV2t4WUlZWGU2aUJkTExyVzlnZVpUcVlaVGdGV1c2c2w0SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzk5OTk5OS9kb3dubG9hZCI7czo1OiJyb3V0ZSI7czoxNDoiZG93bmxvYWRzLmZpbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327850),
('r27DVL3CW886C0UUgnXa7L2hpbgQZm2Nc5ODCMBN',NULL,'136.110.244.150','curl/7.88.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTVBjVGhDcDlqSDlOdlRaV1h5ZkNydnQ5MXRqSHJBbEd4a3Q2bjJ3RSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3MToiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3Bvc3RzP3ElNUIwJTVEPXgiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo3MToiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3Bvc3RzP3ElNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTc6ImFkbWluLnBvc3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326092),
('R3VPWFYR97FOqjmJgwRMPBznFgD7j1kIENghD2M7',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRUlzZ2F4NFVqVzJBdXFZSFVtbnNpQWZ1VVBnUlBSYVlmMjBwcDkwbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792325935),
('Ra7Ehhv8uQe8J5phLZfeAn1k1YEQGaVDdEUUdfA0',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieWlyZmRFdUlxYmNkYThnaDF6dU1IVFpRcGl3eDcwUVR3UXhYSnFLbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS04MDc1OTEiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325718),
('rGNA8t1acFenrZN3FLcIuaSg6Xu7Q2mitH0o74uD',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk9aeHZOUU5QaUw5N2hYRnVNVmVmbllMWlgwa205c0d5ZFoyekhqRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9a2FsZW5kZXIiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327772),
('rILb5a5ieD0uzMzBhA5R4xIsnshJz6jI0Vy92TEr',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1dsTmtaTW5NbjU3czBndWh0VUZ0UVRjd0hBQWM4dzNidnRtYjVrUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325110),
('RipinGnLBlWknhdUXEGPTZtiQHF82l8DrM0Y9J48',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibGFQMzZySEpSQTV6RHFGdENrb0RhOWh0Y3BRU2ZhdXVlUjJ3ODF6ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDAzJnRhbmdnYWxfbGFoaXI9MjAxMy0xMS0wMiI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327265),
('rIrkHyx7DidJXmLAv14ppt2LM9TkA1PcMNX3x8fi',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNW1mQUdMUmNUUmVKRm9QZVpYMzVTRGthbkFJOGs0NXZUbzF0OEVrbSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325452),
('RkDha5koVbQTf90F1B8b6FEB5tiDgdvkcgtg5Oqa',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUVNWktacmpuRThwcU9sOTZXSHNsTGFlbGJVc1JjVnZnYmljbmZrSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327115),
('Rlqis6EXuk3vZ2su9vut9Bj9AJhCd06E9VE68xwe',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFRUejlLRHFlUHB3T2oyQ0lZeFhLQnNTRUVZZnVnQ0l0VExuZ29ySSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325662),
('rpy5zBV9y5LfJDMkQhouYQmzd5QWV40SUYXiGWZk',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiek8wcEVUNUwwSXJ1eFdwdk0zY01iNWdEbHYyU2ZrVlFXOWIybGZueSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327354),
('RsCMP42dJQHOYOQM6h66j9hYoJIlyhuJWZRl2XCv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnVvZ1dNV1N1OW4zRUVMaDdFdlNGN2o3WlF0NnhMVktMajVUN0VtWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327352),
('RuqiIf6m00oVwf6OoEiRHXt0ULEGOV3NS5Vdt0sy',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWpCT1JrQWRkR0JmSmNISHhNQXh1MVJ6OVEza0xaY01JU3Yzd1B4eCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjA4MTkwOTAiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327971),
('ruWSj9NJQlACDtN3bU5OWdvoadjZCJprXjdynmOw',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU9DcEVLZmdxMW16N0RITWtNT0tpbVA4R24wZEMyNXBkNzZsVzBWUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327618),
('S0tYqlSoYisjPdRKtbpcf2lDIZPzluJQ9QyJdwUH',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTENRWVJOOVJOS2o3dEQwSVJDMHlqQU9FcnZhRVNSTEVGZEwzZjBVayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325416),
('s0Y3IKoHJF36dXusCRtP4t7ITd4wtsSzdp36Rowk',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFJJeDJ2T01uS21laTdiazFKWlhVMWxmRDFsWEw5a0NGOXg4VHI1ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325661),
('S3At7swP5JHe6ZWrEhwPUmsbQtzNDhtUqP9wziv2',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3V4QlZyNVBKRE9NTnM1M2Flak5zdU5Ca0ltZ3BCNFZIWVJZdTZwcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXp6eiI7czo1OiJyb3V0ZSI7czo5OiJkb3dubG9hZHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327969),
('S3wD5ngoK9UzXm2MHypnVDkKsZW2f8tpeboyaaBb',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidWphd1dSbG1WemN2Tkt5RTc1M09kV3R1bk9TZ2Zyd0VEd2h6aXdJRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49MjAyMyUyRjIwMjQiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326115),
('s8ryXb5J4lWj4zHLqFFMlcWGLLt0YSU4vOYv4MBY',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3pnN05IMDlnUGZFOXJhYnFCSjdKanRlWjNDUjk2cmM2c2NWQ21HSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325248),
('sCmlxrunRb7zkEUeteEGgOXYE2TCFMnwIK3ZS0J3',5,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicWp5RmF2SW15YlQ3NmFuNk5zOWhGRDBVcnphMGdLb2tubDU2Uzg0RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wb3N0cyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucG9zdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiI0MGY3YjUyZDBlYWYwYWU0ODU2NGFjMzA4MjhmMzM0OGQ2ZTczY2IwNzE1NzYzMjIyYTIyNDkxZWMwZTQ1NTBjIjt9',1792327364),
('sejfzXgPrv0g1wJ4ayvyIHoCwuND5gYLUPydHvEN',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSExNVFRYNGk0WjNubXNqMUJQaDllUXd6QzlRVXJIa0daUTQ4djNQUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9zdGF0aXN0aWs/dGFodW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326203),
('sFjXUOp0qKH0yFXm6JhBq1A9ZvfnwEXfehFiPxmr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlJ5MURnS3hDbEI3eFU1WGRuT1psMFB4Y0l3bGFQTVUxZ1ZoaGQ3YyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PXp6eiI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326140),
('sGadRQS9IRFIigIxLU5UOIR9t1ndRcaJ8P7H3GHj',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTJNeVRTaFpGZWlWeWFPUE1Ub3M0OFFGQ1p2MGtDVWVUTzE1NlRQNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325627),
('shJ1MDHWg0P1QcKE6yGXpjOikLkFhZhTJcztO3nz',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibnNHSzVyMXNOeUhvcm16VE5reWFOTFd2NzhGRGkweWY4OWtMNGcydiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327973),
('sJBbie6QXg7iGq8AKi2SII16iSCluITLqW0xSTnM',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3o3VVRicThNNkoxT3RXRmg0N0N4Wkc2SFlhTDFSZzhTbzZtbXVJYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327978),
('sKsm1NWm1uzj1jPu1MUQPMEyumQxqbXyKjFi75K7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUw3WlViYTFEbkVyd01GdFo4UU9KUG9BZEJCYllUZEZJcDFEOUg3dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327262),
('SoEVH5bijfUOH1Wuj3LUCNuC4ZhbmWHIz36ibgMr',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0xZSW9lS1E2aXpVektTMW5pNWZqb1dHcUxrMFZLY2xWdFFHZFJNYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTEwOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vcHBkYi9jZWstc3RhdHVzP25vbW9yPVBQREItMjAyNi0wMDA2JnRhbmdnYWxfbGFoaXI9MjAxMy0wNy0wNyI7czo1OiJyb3V0ZSI7czoxMDoicHBkYi5jaGVjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327494),
('sTafNPKhRUm3d2a8LzCYlnvcUQckLdYLPcIbkIzJ',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzNmNGtlbG81R2ZnNW51SmpwY0tsUGUxU3M0ZXQyR2xGMW9xTGFTOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326046),
('SUZkDdR6Jl6lDLjaJErra9w7Nfal4qQY6MKD0Hcw',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEpxcHYzRnVXT0F2cnA1ZVRtMHFMSnNCOTZ0bGN2UG5PMWVEQTBSbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0xMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325269),
('Sw3sXRMxH9CiluQOPsVJMnVSlijyNsdWNh5RaCY7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoib1RBV1pVV0d5Zm10RmZNT3JEZGQ3cnV1ZTJlVzNOQmhkUlNZRDNXWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49eHh4eCI7czo1OiJyb3V0ZSI7czoxMDoic3RhdGlzdGljcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327365),
('SxFT5F5BFeqwPTy9N4woBoBXkML5eLD9oeoYLxI2',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGtRODVqMUt1dkU3Qm9iYTF1ajM2U2thVkxwbGx2TDBEM21qUFo0eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325626),
('SxI7qP5PqakYkBIKAJxCNwTLndtGIBnhs4yZqHgP',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFN4Q2FsejBndUhrMHZTMWo1SnpYeFZiYUo3UlpVYWtvQWdkeWxCRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmklNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326092),
('sxZbY75tMm2UAxJewiEasD4SVoe7uY6DpdR28dVO',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmNUOExxS3B6MTFKQ3JlbWhUM3V5UnlIVlBBbW9OZ0o3SU8wODFiUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325715),
('TbIwchYdxAfY3sj6gKdLpiQyVfjqVgMVLfERE4iX',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlpTMmhac3hSS21uNm5uOXFZMnliR3h3TnprMktzeEdaQmhDRmp5dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325269),
('tFSAsRBSXlzI3ufRdj0BKwRxQNJHXi77TwYTn2PH',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3JPcXJlanlFTk16STdyRE9YR3kxVGhpMGNYa2ZoaHVKbEtwUzdtUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325843),
('tiD99zd2rQNfqxOnblOkWRFmLbkMi5rQ5DOdr8WV',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWdmdUhPdE9rY0QwMkpiamJRZHZ1Z0tPbDRZYnRhZWR2b3BBcDhkYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vb3NpbSI7czo1OiJyb3V0ZSI7czo0OiJvc2ltIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327872),
('tKAHDracfbrPVglfJms1Men93VdiRGJhPYEcJrRS',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGl5cm55ck91eEVVQVJCMWdxUmtQSHFiNlJScmFXUjBkcW1EQVpTRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327551),
('tljIwykwqVQrGnKGotkcpWVGuOhrFOt9kG8UcfhK',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieENiUkg4bEtic0N0a1NBUVc4aDJWTzQxbTNvdk1HSkFyM2VnYnRKeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326134),
('tPZNOAUp1EL9mSPKrQbTtg5wIuYWKlomOjT7vOBN',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGl0VVNlZmUzWUZMRG5xSjdpd2o5ek5BQVM5aTJ6empiYkFWQ293TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327976),
('tqlp4cvCBpXRKw7QQ8Q1mAzDVknAPmRvkDKRQWRj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXdiVVVZeXlHNGNqanlXOFV5THk1ZzVGUzVMNTNwZ1pnU3IzZWVpaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326135),
('TSCFCeKozA6oOeKPELa5d4IR6sg3hqI5ItSrg2VK',NULL,'136.110.244.150','python-requests/2.34.2','YToyOntzOjY6Il90b2tlbiI7czo0MDoibmdWSGhwSDlCYm5GT0lCNDluV3lmWmxiUjBNbFRFT0hQNU01cDFiZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327965),
('tV3Q9RSW8IugDHN2ky0NgTOCyLvCFcUcTVj0yJ2P',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTBIUTRvNXB5UFFaSkkzdWJlcUFsMTMzbmtPNHFtVU91VWJhTHBQZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325652),
('tvNEMKpSwR4h5peLE1ZpTUHPpLMyvd4OYR1ufXRW',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFVDeENYbldnQkJiYVNiRjBZZVlubFlyaHZLaXdHQThocnpPS2lJcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325627),
('Tvwqt7Z8fuODeV46amMWuO05a5LSluo668ODCwTs',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1ITnZyU3IxN0lldG5VMVJwRURMekRjbjJ2bkJ1T1ZTclQzbzhPMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0xMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325725),
('tYCxKCvRySG49QpwZcgB3wR9NlfvL8UfFHY2W4WF',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ2F5eklyWjhFNnlQbFNFVmRsdnUzZ1M3djE3Q01ya05VaXB1QXNGOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9jYXRlZ29yaWVzIjtzOjU6InJvdXRlIjtzOjIyOiJhZG1pbi5jYXRlZ29yaWVzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTAwYjZjYjBhNzY2Y2QzNDE3MjI2MmJjZTkyM2VkMTlkNjE0OTE5OTMyMDkwZDExMGJiYmUxOGYwMmVkOTUxOSI7fQ==',1792326121),
('u1eVv0gypU14HZ3FMhMiOvQ2GpntkC7RjqsTqpI7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjNZdFl1VlFVc09hNjY4MXpSdHNRcnZId09nbXNxUlNzV0VTS041WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvdGlkYWstYWRhLXh5eiI7czo1OiJyb3V0ZSI7czo5OiJuZXdzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325654),
('U37Nnv3zS4dRNyRiFfNwL7NWNFfyhZXaO2Fhkl6J',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDdMT3RMc3F3SW5JczJFRnNKTVdUakRFTnc5Q3RMWXRGZndGMTlEdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW49MjAyMiUyRjIwMjMiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325392),
('u7ABrRK4qq7WnvtwVSEqCzv80u6RP2oEnFrGBDWs',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlRKdHJqd29CdDBZWmwwVjVnWmRYRFFlSTJNZHF5SkZXZkdXM2FlMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wZW5ndW11bWFuL3BlbmRhZnRhcmFuLXBlc2VydGEtZGlkaWstYmFydS1wcGRiLXRhaHVuLXBlbGFqYXJhbi0yMDI2MjAyNyI7czo1OiJyb3V0ZSI7czoxODoiYW5ub3VuY2VtZW50cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325119),
('UAK9THrAshH1xJ8IZDQr5SG9zWpnX5jPQyGY9HNn',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm9iVmc3VnVKa2VRQ0tvVFJwSUlUR1dENWhPbUZFY3d3WmN5M1RsNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327605),
('UdT0w1PKcLsrWZjsS1eUPQD2A0oKZCfYteMonoWc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWJsNWRGVFhSODNuTEFza05NakRWOXJINmhvZldKazB0R1JLczk4YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325652),
('uDv7nbCef0uC8qMhy8spfaiMZ4x6t9itBddlMNO5',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEd0eDNBQW1Jc0dIaEUwOURnWXpITXozY0ZwamtWU3QzcXNpQllCUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325246),
('UelmKAqzzHpU44l3fD4SBSBcwzBtyh8WiOu6ZmCT',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEYzc3hXMWJYUzZMbFltZno1d1hmNTVwZFd0dGh5N2VQNXNtbGt6cyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327577),
('ug1baWJovbS6fM22PZ44LunCGE72F4ErRFmfuUgs',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmZLU3Z0Q3RHU0huc1pTMGRrRFFPUzZCMHM4bE9XRFE4QTV1OWZnZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBkOGY0NzEiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327270),
('uhCdWOo9sZbjA3hMxrGSIlkJV9lsTPm8w75DuOGC',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUNHd1hvdUpEd2JOeGZsMkdZVUNvb25WaUJSYVBWUVF0emhLTjdvZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327358),
('UIRxr2Iuwj9kBGMBbFGlTIIRbDlH7aJMAq0GiIVX',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWTVscDVueERmRTNsTTEwc2U0WEpzUmFCWFlJUHVjQ25yUnFONmp6cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9hbm5vdW5jZW1lbnRzIjtzOjU6InJvdXRlIjtzOjI1OiJhZG1pbi5hbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMGI5MjBiNWQ2NDdhYjc1NjU2N2ZhYTdkYTViZTE2N2VhOWMxYmIwMDNkMGQwZTVlNDNkOWY4MjM0Y2M5Y2UwYyI7fQ==',1792327741),
('ulGljOH4zb7sOiaHlr5s4kyUUDBlnNI0tdsq2gX7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicThmdEZzR09HS1R2QUhRQjRianJUemFFMW5xMkFMNnljdTI0dlRiWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0PW5hc2lvbmFsIjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326115),
('UlsHu5jt1oFtWPQAahugiRnvHHf1YQTWcx5rLwzL',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1Q5dFRCTVl5SXhDWmNuNUJibzlzc0hSa3NQcjZJNjQxcHpPU2dVdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325662),
('uLsJoZQ2w555D6WOo9q6ArxP6qMpGzSsK3vy1vH9',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXhUOGZCVE1LMW9Yb3NLd0NRbjNWOHRsUmRZdFZJcnZpTkd5WmRzZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325990),
('UM4X7R30YERZiUkwiVn2qe9iENmAhL2LSjZtnpyg',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUG1Uek1Wak5zaVBnUURUbWJYeU41Vm54RUJIRHI5Q0JpUnk0VDRVayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBkOGY0NzEiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327270),
('unQduRYCVaA1VgPbrMYnghuwyeEmMq7E2eimXjSl',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjdFY2xWZFNCZ3k5ZHUyZnpWV216SEl4dnFpT2xJNXl2RXViMG5rOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1URVNUJTIwWFNTIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327364),
('Uow8XxnrhQcYjXWSZXjHvH9seNegNlZKj8PWe1zB',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmVNVUJQUWJlaGd0TTlYRVBFY0pNZENjRXhrQ1VrT2tnNzhWbWdtRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325664),
('up1dJJc3IFcrZck44IxX0hdqSeOEJw521Getk2r9',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFVFQkRveXBrN3MzNGpBaU9SWDAwSFRNYUtVdDNaSWhoTkx5d291SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBjZDE4ODkiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327339),
('Ur1N3Bug0hrtfrYcXvLBUNpzDX5S82sCTFoCL7Me',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoidVNBejN0aDd6OHU1cVpiRThtMlRScHREbzVvcUcxSjdrRTRIenR2RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0xMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326084),
('USc0wrzY8cVxY3TsturMsjlcNiWF8xX5QfG5NLMk',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN253U0dyYlpNSFk2NUEyYUdBS093TWV6Mk9udTRxOWFYbW9VT3lSZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327275),
('UwoC7M1jGmIFtcHVaudD4PALRozkKrbo2JomaLvG',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDlUVHpYM2Z4Q1lmemxXbHVSQVB6NnNqMTl5NUJFOGxhNTBZRzFZViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326091),
('uxTWDFusiaqKIYbUmPD4jss85ap4YqJgzYp1vRnM',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiejRsRWR2cEZhb3J1a3VuMHhMQU5MOHNndFM3UkVudlpvT2FsSEN6byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325131),
('UYlInbCLN0JfH3yPAuvAx3liCBleMj10PV8BjPmI',1,'127.0.0.1','curl/7.88.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoicU1NRU44dnE2UVY2U3R6RE9qS2ZwUnRZV0w2eVoxODBYZDQ4RXc3VSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZG1pbi9wYWdlcyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucGFnZXMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327077),
('v9MU4AxXTz0xJR0tEHKGmOm3ooiL9c6QraFpSmVY',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVllUbG1FcE5ONWVHT2NyY2M1dFhXSDFsc3NMdU9tSkU3RVRsb013YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325767),
('VbVawU4XPQfd8IXnKLz68QH40bw8CqlDNYyuMwo1',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiODVIUGxaZ1dmanYwTjlpWkVubUtxQXMyemZsRmhkeDhORXNaSHM0dSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325110),
('VchC94cs3BwHr7ptYYctH0sMZscjUneHUUGjbDtu',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmkwTVd0OW94bEpZQTFQRFVmZkF0Z0RKQ3pFN3p3YmtPRmNCVnlZOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325653),
('VjpDaSlrUyA6SycSyRsj4CgT7bSPT42GzvMQA7eX',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZUhDVjVpNThtMXF4eTZEMUQxY1N0RHBNVkw5bmI0bXJ2NkxLekJhMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792325468),
('Vk5HNeQIDqpSWKXsBbvk1NABI23anQpf2jJZwK3X',1,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR0gyYmVtOHgwMm9USUUzNnJVc0NrakN3N1gwRzBINlRFckFwbGo0OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wYWdlcyI7czo1OiJyb3V0ZSI7czoxNzoiYWRtaW4ucGFnZXMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792327978),
('vpVlZnrvlbg34Vkw6QKf6pCj3Aq5KcprpbB4ea1j',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREphWTJyYmFlQ3hjSWc1VEhvRkNlTWh4ZEdMR0RSanV4UVh5U2JhRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyL3Rlc3QtZWtza3VsLTRkNWQyIjtzOjU6InJvdXRlIjtzOjIxOiJleHRyYWN1cnJpY3VsYXJzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327273),
('VqFMB1tIkBCXB6hDU0jPgi6qEC2VBoneBhVwxPDC',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicGZUaFFEbnNURHVOdDY3T0w2RmhCd1hYZmFGV0NwZDJKT0RGSDNTZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0xMyI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326139),
('vQqNuCpd3hnecYLjA9wakwvSiS33XFcWLauDCGQG',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnRPcEZ2YWYwMGJncWNTTGpUR1dFdFZ0Q1EyOFd4MmVob2tRQXUyMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327350),
('vUdKSoPYjNtNCUwGEiepXQQpXzwtoA3ONVanTYq9',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQUx5cVYzQ0dQVWliSHhuejB6WWl3ZHh3RnczTzNEOE1SMDJrMmpFTiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3NToiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3BwZGIvOC9kb2t1bWVuL3JhcG9yIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wcGRiLzgvZG9rdW1lbi9yYXBvciI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ucHBkYi5kb2N1bWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327967),
('VUevvDGnM9OLCoLi2vJO6lsUOyQUum2hgbDGBWi8',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEJjbkRGbjlOR1NzUVY5cWVsMVR1VkFwU3NzT0pTQ29zc3hsZkE1eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327264),
('vVMtsEXZKTVFwDLONHvNYA54G35wiyGQ64Ew2kWs',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDhDTWJVczZZOWhQT3BwU2dwdVg4WGpYbHBoZ0lrZlJhTkw4dVprUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT0yIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326116),
('vZajoOnQb59T8DtbPr8hNBMrTdSgig4AyKXnBP1N',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieldMcTFEVENWVWNqdzl4SnBPczdwRGpudkJvcXdiV1FRTlN0eW1BaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327275),
('vZXFZcg9SEdSAaChHB1HTClp4PQEC5xiGMQah8aI',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidUhaeG4yckdIYk5yTExzU1lYWTl5QTQ3Qm5wRmhlanplN3lOOUx1TiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/a2F0ZWdvcmk9dGlkYWstYWRhIjtzOjU6InJvdXRlIjtzOjEwOiJuZXdzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325249),
('w1VjkY3gjlS0frGOTS95ZfVk8VzbuXpNlDRyRwEe',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVldGWlhMTkVQM2N6YW1LMURNRjF5akl6SGdMWDJWZkVOTmFSd3BDdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327104),
('w5NmuWL9qmDqATXaWIMNiOo2LlWihfGhiPa46Scp',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkRIdnVNRm1tbndSWHFOakkyclE0NFhjcFlsT3UzUlJ2WWNRbVVwbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325816),
('W5UKJRj00UJ86pOvkUAUO633frL3POZd39lrWsUn',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHVjZ0JvVTd0Q2xqbkNVb29YQnVCbThPc3locnZwUkZEZTRwS0RoeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326114),
('W8ZdGAibT5m4kke5GosN6oG9TcSECISVtGLIrtVD',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2pPOXBBRGRJUUpjd1NQWnBvb244NFdMOTdTa0o2NlVNVEFQdGVoOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326135),
('WAhpOVdYfIfba5JNIM8DX5krKx2n5JPEUO1JYjKF',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoib0VZbjN6eEhSemd0c0liYlBENEtnWWNzN3NFbGNBSTNsQzVHMGFqcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327348),
('WawoG7NoDZXgPo4eCcrOCVA3tMLU9SiGTdgUVBbb',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjV0MklPWEl1S01qYjEzblJuVmhMcjR5a0M0bVo0QW9EUjQ3OTVUWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmk/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTU6ImdhbGxlcmllcy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325725),
('WCRt9mDF0emiDpM2DplA9Qoz4N7PQjpcaspGoj8G',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDB3NTI1OGQzS2FTZHlFNU9tSTdSSGRyQVZaOER1QTZ3Q0Y2bVhKTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyL3RhaGZpei1hbC1xdXJhbiI7czo1OiJyb3V0ZSI7czoyMToiZXh0cmFjdXJyaWN1bGFycy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('WdONXJ2z1Cpm3MD2OYbxr6fa04zDNqDRU6wiFlW7',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2ZlWUlmZ3hRMEJoTndUTE9nQmxndndTOXgxN3c5UG90ZTNJaDliayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZ3VydSI7czo1OiJyb3V0ZSI7czo4OiJ0ZWFjaGVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325718),
('wg4U48TqBZW62kx06qk3H3R8Kq5ZDCEUCPMiuLI1',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVRudTdSWXEwc0RIbXBBVmIxRkZlcHdRc0h3dzFuTFFmVFZZazFxZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('Wg7ZZsMGnLNTG5bgD7L1oAxICgqk7jtgTrFndKtq',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiakRKMjJsY1RHZEhjbk9QUEZoR3RGbGN2UGlHMHJDTFFTblpuV080SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327348),
('WIFnW5Zk9gL1fwOpHB7Sh458sUT1Vtxg3nxTVJM0',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzBINVNkS29iWDRUNXMxOENrUjdUbDRSS2RuZlI4SWpDRURjYjJYQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzEwL2Rvd25sb2FkIjtzOjU6InJvdXRlIjtzOjE0OiJkb3dubG9hZHMuZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327270),
('WnylwtNmA9NrkhRs9bnDvWjReRnsaW8v8X8LA5Tq',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkRZZkF1ZllySG51bHA0ZFpKZ3Z2ZW0za1BpWk9GV3VkczJQV0pTQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWs/dGFodW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326092),
('wQtfUAP7V8XHOucMs30NktevGPFkmYyFaTVlAWGC',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidU1uc2VoeEx0QnRBSGFrRGVPTWZQZExiVG5WbmJmQ0NJNzJUcHpFQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327349),
('wSFyqc6tmlPugpl04e8iFzTKL7bNYIJggdcvD4cp',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT05UQXI2UmMzYzV0TEo3a1I0emo2bmJrTmhUTmhSNVBDU1BvSkoxVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327976),
('wuD2ESaWuaa5rW5aZL6p5BPGnQuESxsFfS0PAeqZ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVklUT0xNMkhMV2swM014dnB2UThGWkN6MnhramtQUHg5VURpMndRMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXJlZ3VsYXNpIjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327268),
('WWn92VEJ8BUasgJ8WKGDin2iZks7mEKKbQGgJIFB',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1lIMnJXcWpyMjdLYWQ1blVWRjZUQTFVVlVycnpTVzdEcjRzUTNtMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuIjtzOjU6InJvdXRlIjtzOjE5OiJhbm5vdW5jZW1lbnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327272),
('X03Snjw0MCT1dCow6y98fmRotk1mahxneemfvOH9',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFF2TGdvZWMwQ3Q4WFRkdW9CNmNwUk9lR2NweTd0OFJzTzdQbUhhOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325719),
('X1sKmidXE79Zid6bGbJa0T2A9EpjsXkBnHv2UnDQ',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFdBd3U2Vm9ic1BzRDBXUmU4MWx1UGREZktTd1R0RlZIN3U4NENPYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpJTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327969),
('x5tD1Is7ShIyXD6tkYtb5JXyZWU15fXhpVGpEXSs',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3hQMVZsWXpwTjVtcjY4eWN2c3NHOEl3TmpVeXhrdlNwalcxazJ3cCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325662),
('x70jLgWGt88Fuplex27i4eylgWsz0AQzxJEVAjqd',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWl0VFRPdGh6WEhaVnhWeHg3Y1ZqTko5c0p0UkdneGt4MUdVUGZTbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325110),
('X83fSlKRLmEXdJZiitTUTQ5lh1DQvpqRsHIbq4yU',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkNYeVNPb2dwN21hc2dGQnZLS2dldHJ1bU9JR3RWdmFkbVFadFBMbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuLzExL2Rvd25sb2FkIjtzOjU6InJvdXRlIjtzOjE0OiJkb3dubG9hZHMuZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327339),
('Xcl8bNRDsUrbhMbpFBpWsqQwOlvWtgCAf5pJ8Ew4',2,'136.110.244.150','python-requests/2.34.2','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR1h1NzAzZjVjVzFpZ2t2cWFrQ3R2UDgzVnZxTFhlcUtnc1p6VzJJdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9vc2ltIjtzOjU6InJvdXRlIjtzOjE2OiJhZG1pbi5vc2ltLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTAwYjZjYjBhNzY2Y2QzNDE3MjI2MmJjZTkyM2VkMTlkNjE0OTE5OTMyMDkwZDExMGJiYmUxOGYwMmVkOTUxOSI7fQ==',1792327849),
('xDvMfxh80s9vp53Jk8SyEiebJTjWmXnKh26Wf8Cn',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWxvNkIwNkhkaXQ0aDc1Q0h5eHowbGFIQzdibEo4a0o3WWo5WFFvdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjA4MTkwOTAiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327970),
('XeIfCmcUgWCjxQmBHCT7NyVX4wivgmWnGj7IE5yx',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmVtWEtZb1M4cHBlMG5salhDYUpoTFhCNE9FMlVZeU9JSUc2bk5hQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326129),
('xJ7F4eVmu16tgVNsVWSxc2Xix5grS4VDMJc2x4Mq',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMzZZaWNHd21CMzBMRTh6bjhpOVBBOTVySThVSnNpZ29RWGV3VGlFRiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NDoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325468),
('XKtckzvODcKUe8u9t32nANH67t94WiBAwEhEQpnd',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzNVYkY4NlRWWE81ZUdGZzZYdnYzWFhmNEVhWWFJeHY2ZE9BSnJVOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326119),
('XmnAbTYRCBQj4yP2qaHlCTZfIGli57hX1hW26YTv',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTI3VXpBY0VhMWk3ekNpRzBveXlhNUdsY3RFUktQcUpKMnhqYnNQYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPWxhaW5ueWEiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327268),
('xMWRMNzqOHbT1QOV0Eog7yh7ujPUqqFFFn48OnUn',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzB5WmV1ZUJ0ZmYwTm13Nm5BcmhoemhiYVVOWHFsdHp4bUdwaFRkUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC91bmR1aGFuLzEvZG93bmxvYWQiO3M6NToicm91dGUiO3M6MTQ6ImRvd25sb2Fkcy5maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327077),
('xnY8VWmL3xGjdpNZsVLjM1kZLqXq2mGulQCTT24i',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVpIZ0hJMndyb2djazM5d2NXTHNYZkZOdHBiN1lqV2l4ZTdIenpXWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9nYWxlcmkvdGVzdC1hbGJ1bS1lY2U1NDAiO3M6NToicm91dGUiO3M6MTQ6ImdhbGxlcmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327351),
('XPWWZKKlnG5qs32u65SzKXdFg3e3PfKWPFlKT53T',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidUdsSkZOS2pwdkxJTWhldklBNDlwT1JVYWFpV2dXQ0txUU1uUVEwRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cT1tYWRyYXNhaCI7czo1OiJyb3V0ZSI7czoxMDoibmV3cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327351),
('xqadLPEk7nZKmgA9EbbQrwlXwXkMHvjWOE1OgNpZ',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWx5NFFxbDgwaW45NGxXZHZ5VjJCZ3lFQnFja3JueThDMUdkeDhyUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9hZ2VuZGE/YnVsYW49YWJjIjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326203),
('XT2S1fJdU6ZlAur9H8fidmOz6s6ckxb3JLKRVpje',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDlNSGg2YWJJQzhKSHk0ajVFbWNXM0NzUTJSbU9Bc3lYSW9Ha0ZBSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wcGRiLzcvZG9rdW1lbi9rayI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ucHBkYi5kb2N1bWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6IjBiOTIwYjVkNjQ3YWI3NTY1NjdmYWE3ZGE1YmUxNjdlYTljMWJiMDAzZDBkMGU1ZTQzZDlmODIzNGNjOWNlMGMiO30=',1792327644),
('xv1BFAYCKxF4sdxw1bZ5IH8UELsfxZzoLjLEd1y5',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZldWc05XQjZxcXhMemVzR3BiY05zV1JKclZ3QTZ2S2h3RnJHZ21LbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325118),
('xwdbWB2J0Hs96CBdD6QkLPFLlhZHsX3nO2etW1kF',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjBtQ0NLNjVvT0t2RVZja25wSkJldTJpMGkxU3dMcEZFQkZjaVRiQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9rZXNpc3dhYW4vZWtzdHJha3VyaWt1bGVyIjtzOjU6InJvdXRlIjtzOjIyOiJleHRyYWN1cnJpY3VsYXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327273),
('XZFNM7mscQKWRFVlPxCkxCzI0WJMt4QPf3va9PKV',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGpIWFYzejA1WHNqbVQ3Q3l6N1FrUG5kNkFsMmx5eEFwV0t0WXAwNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwvZmFzaWxpdGFzIjtzOjU6InJvdXRlIjtzOjEwOiJmYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325627),
('XZS3cV02AopxAZLj6jUqBpnJPpwJAzKfqXQGD2er',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieWhaSjRZVnpJSUlZNnFETXJUeEdYWjZuY2pSTW5kMXRna3huMUhjMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBjZDE4ODkiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327339),
('y14ItWby6ElSd2jPeUVbATvn7GiWWpiPjr9LW9go',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEFTNkhXaW9XVVZLeXZLeGdFRUxsN25FN0lnWEthUTVSODlJeFJXTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327349),
('Y1IYDXVXhBBIWxYn28eiJZPMK390Ind09ShmyZjr',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3BUdTh5aTZ6dHZjcDZmbnJRb1R3N01teDE1ZDNCOVFQUzJqRURDTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcGRiIjtzOjU6InJvdXRlIjtzOjEwOiJwcGRiLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327337),
('Y7IHsQC0lQPrdQCjdkt8KG4daTS6XehL3MeXQ93N',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk43TURFSlZSTHFmYVhoVHpKMjZWNHFqRTBQeVFWVzhwYWhEbjY5eSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49IjtzOjU6InJvdXRlIjtzOjY6ImFnZW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325725),
('y83QTAVwEO2qpuxC9H55IkDvr1LqvasISUkQrSRa',NULL,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ3ZUelFwWXJvbEhEbDNWMVRWS0pxSUhDaDFwY2VBdlRFbjJzMGVXcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjU0OiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYWRtaW4iO319',1792326057),
('yAAbyH5YD9W0fsJLtaTRGrl98H9oD4Lnq5u7EPE1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieURlcGVkazBxOVZuN1NDR1lidVpDbGNMV0RGRkNZT0VpVWNQam1XSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327348),
('yBnlOFnREBy0Y3VihwbtHIekR16wC8ikHXwMSsv5',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVRPb2ZwVzBpTFU0MDk1dzF5NGtEWExwa01PRGVFNUk5VjRaNFZ0cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGEvaW5mby1tdHNuMS1ia3QiO3M6NToicm91dGUiO3M6OToibmV3cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325628),
('yg46qdOSJifbNlI69ba3l4PliWeJyYEi7u3Io9QU',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGtBRGhPdDBQMEJDNTBoZUFMcGxLU1NUeThjQlpaRk41Q3NNekExUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wZW5ndW11bWFuL3Rlc3Qtd2Etbm9ybWFsLTQwNWU0IjtzOjU6InJvdXRlIjtzOjE4OiJhbm5vdW5jZW1lbnRzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327973),
('Ygnv26S8t2FmK1WSYmLZKrw2HCtv6WnesRpxnn3e',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibk1yTVl5bFZiU1hCeWkxRkxmRkVDbmVna0VIVktRUlFZSFVTZDM1VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaT90aW5na2F0JTVCMCU1RD14IjtzOjU6InJvdXRlIjtzOjEyOiJhY2hpZXZlbWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326092),
('YiNulDmO6I2hwqqmLeeCdaB0wOAddMwA1VoYOj0P',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTdMbEZYV2lPSTlRZThIaEhIYU40MnB2Wm5YeG5lVGIxNzlFR2IyVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325654),
('Ylh1UPG6nIFCbc8FjV3ouzfbJIWx2Yci2HOA2cF1',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoidEhyYUN5eUhxWTBKUG5IQldFYjI1RjViUW81WExDMzBRUzM5RkRFaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9iZXJpdGE/cGFnZT05OTkiO3M6NToicm91dGUiO3M6MTA6Im5ld3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325725),
('YoCo84arHB3mcTTV3lOJEWO44jyZh0EASlBrYess',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9xSlMwV0ZtMW5pc1kyRVcwZUJXSjVub056MnZYeWxtZ2F5YlowViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325720),
('yQcC4Jdl1WMF2HasBDSHvHMwipopVvnhzwxKyBuc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoicU16VnlERzV6alZyNkZYdUZDRDNxZ2llRlpTWU5hQVQ0VlhOdzE4RyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792327349),
('yqOAm8Y01Qr98Am0qzOh2eMh29gQXoaWadByXCQ4',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3E2OXVUalh3OFc5RXdhazFnUkIzWmtvRzRXTVRrcjE4dUlRN2M5UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcm9maWwiO3M6NToicm91dGUiO3M6NzoicHJvZmlsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327348),
('yTdHdeypqJvGmgXR0T8BkxYF6T0H2OUoSoqWXMcR',1,'136.110.244.150','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/145.0.7632.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoidmZ2bTc4MExaVERxYUtidXJpZTdtbFlqeW5vczduS2pObDJUcEZhTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwYjkyMGI1ZDY0N2FiNzU2NTY3ZmFhN2RhNWJlMTY3ZWE5YzFiYjAwM2QwZDBlNWU0M2Q5ZjgyMzRjYzljZTBjIjt9',1792325964),
('YUjeV1QHy0qryVy2kBGFPVcmpad8HDocxnujPOMa',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjhXQmdBZk9OclJyMTd2T05jN2VHNzR0OE5VQTd2QW9LT2xoUFQ2QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW49MjAyNi0wMiI7czo1OiJyb3V0ZSI7czo2OiJhZ2VuZGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325628),
('ywR7ArW8R8oHl4csSfY4jY5M9MLytwhpbmhrrVCc',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWJTMDRPVVFHZ21BRWZnWXR3RHk2bFhiMXpSZGplTndudUQ0eWRmdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3BhZ2U9OTk5IjtzOjU6InJvdXRlIjtzOjk6ImRvd25sb2FkcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327269),
('YXfbzSnOS0Hcdz1xcX6JPEkVOIpFCY40GzTOXeI9',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2NtQVRSOHVyVG9DNG9jWFY4Mml1R05KNWJ0cmlBRGNzRWVtME51QSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9sb2dpbiI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792325665),
('Z4meJ6LCzlQtBy06rz5DsVTYcpad2HdLi13y1nV4',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoic0dMZ3owNTU0Q1BoWk5CSjFrNWYzdVIwQzNtZkxVNFJEV2FnY0RDViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9wcmVzdGFzaSI7czo1OiJyb3V0ZSI7czoxMjoiYWNoaWV2ZW1lbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325247),
('ZaDRgDzkCQcJU0dR0ompDh3cdi9NAiHddmuKmWRT',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWtVUU5ET01Yb2FJYXczZ1V6TERCWGFWb2tES2hnaHVoT1d5OGRCMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9fQ==',1792327265),
('zATTcxebi6952w68KXwSIS4dJdmVJV3lOpp3dO9F',NULL,'136.110.244.150','python-requests/2.34.2','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOFVpNmVJVm5jQXdlYnFxQWdYb2xSOHRTWmVVNVhGc0ViSGZuMlpicyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3MjoiaHR0cHM6Ly9pbmZvLW10c24xLWJrdC5wcmV2aWV3LmVtZXJnZW50YWdlbnQuY29tL2FkbWluL3BwZGIvOC9kb2t1bWVuL2trIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZG1pbi9wcGRiLzgvZG9rdW1lbi9rayI7czo1OiJyb3V0ZSI7czoxOToiYWRtaW4ucHBkYi5kb2N1bWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792327966),
('ZdoB0wpKpvs0YQLOielZ2uFXrfoHj4tIivmbZSrZ',NULL,'136.110.244.150','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm1IM2tLTXpDNmlBWE5od1lzWDg1YklRZExNNHpoRmhKTG8zZWlwTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGEiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792325627),
('ZdPz0lulV41bi2Fv32rykq9e2BOL8RfDvizo3VaF',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR21pcWx2cFVWS0tpejJZcHJUTG8yMlFRMWtpZm1BZzBaSHFiZnMxaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9hZ2VuZGE/YnVsYW4lNUIwJTVEPXgiO3M6NToicm91dGUiO3M6NjoiYWdlbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326140),
('zFxEP5j8bkuFhoRA9WQ0VQobruA85kjWB3LCsrYV',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHYyM2ZESTE4M29MNm5lYkFPYk13Y0lMQmNxUWZvVlRMWURBRXdGSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326136),
('ZgX9LkJu67CgoRIFGbZXMVBW4CBNzkiArPR2wMLT',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXYwM093RkJiWUoydmRuTFB4empuQVpvRzE2U1I2RXN5bGpxTnBMcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMC9rb250YWsiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792326203),
('ZHzkroVTAzpvWOQlIykIVZlFlRDWZ6hokdxrNMTj',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1lDcjBoUjJhWTR3YTJrVEplaDNNVnlkOGVBaFJPSzlzQlJVM0NYRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS9zdGF0aXN0aWsiO3M6NToicm91dGUiO3M6MTA6InN0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1792326114),
('ZkjwxW8171F36OGWAu2LKdFltUH9FVByPxJTiljp',NULL,'127.0.0.1','curl/7.88.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUJSVE1kUE9nV1RZTHA4dVFtM1dkZ25vcXE3S0U3ekR4RWJUQ0l1cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6MzAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792326226),
('ZN3VL7HUyrXu4dLCiX55WuujIXFE6M3G2jHvpvnd',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEZjRVVMblBsenVOdEcwNXpQQUl0OUZ2UWFybUlid29ZU2oyR0EwQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTMzOiJodHRwczovL2luZm8tbXRzbjEtYmt0LnByZXZpZXcuZW1lcmdlbnRhZ2VudC5jb20vYmVyaXRhL3Npc3dhLW10c24tMS1idWtpdHRpbmdnaS1yYWloLW1lZGFsaS1lbWFzLWtzbS10aW5na2F0LXByb3ZpbnNpLXN1bWF0ZXJhLWJhcmF0IjtzOjU6InJvdXRlIjtzOjk6Im5ld3Muc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1792325654),
('ZqD7tBTolamDz4rQyQekJvrTAMtj4oyJsp1cRcTi',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTc0UnhsanNtYndDclRVWHRXTFhKWDRNS0J2eERHUm85NFViVW9qbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6ODI6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP3E9VEVTVCUyMERva3VtZW4lMjBkOGY0NzEiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327270),
('zZswzG2ysmQH60sWMyNmZBSM713s4lNmEFulAja0',NULL,'136.110.244.150','python-requests/2.34.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUtCY3BqV0hFRUtVNEFJQXRaSkVYeVFWa2xnYzNkTmZ1TkR2VEk2bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vaW5mby1tdHNuMS1ia3QucHJldmlldy5lbWVyZ2VudGFnZW50LmNvbS91bmR1aGFuP2thdGVnb3JpPXNpbGFidXMiO3M6NToicm91dGUiO3M6OToiZG93bmxvYWRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1792327968);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(80) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'site_name','MTsN 1 Bukittinggi','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'tagline','Madrasah Hebat, Bermartabat — Islami, Berprestasi, Berbudaya','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'hero_title','Mendidik generasi berakhlak karimah di kaki Gunung Marapi.','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'hero_subtitle','Madrasah Tsanawiyah Negeri 1 Bukittinggi memadukan keunggulan akademik, tradisi keilmuan Islam, dan nilai adat Minangkabau \"Adat Basandi Syarak, Syarak Basandi Kitabullah\".','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'npsn','10310836','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'accreditation','A (Unggul)','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,'address','Jl. Raya Kusuma Bhakti KM 1, Kubu Gulai Bancah, Kec. Mandiangin Koto Selayan, Kota Bukittinggi, Sumatera Barat 26122','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,'phone','(0752) 22939','2026-10-18 18:58:37','2026-10-18 19:42:36'),
(9,'email','info@mtsn1bukittinggi.sch.id','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(10,'office_hours','Senin–Jumat, 07.15–16.00 WIB','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(11,'facebook','https://facebook.com/','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(12,'instagram','https://instagram.com/','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(13,'youtube','https://youtube.com/','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(14,'maps_embed','https://maps.google.com/maps?q=MTsN%201%20Bukittinggi&amp;t=&amp;z=16&amp;ie=UTF8&amp;iwloc=&amp;output=embed','2026-10-18 18:58:37','2026-10-18 19:42:35'),
(15,'ppdb_url','https://ppdb.kemenag.go.id/','2026-10-18 18:58:37','2026-10-18 18:58:37'),
(16,'whatsapp','6281234567890','2026-10-18 19:23:20','2026-10-18 19:23:20'),
(17,'ppdb_open','1','2026-10-18 19:37:53','2026-10-18 19:52:44'),
(18,'ppdb_year','2026/2027','2026-10-18 19:37:53','2026-10-18 19:37:53'),
(19,'ppdb_quota','320','2026-10-18 19:37:53','2026-10-18 19:37:53');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_year` varchar(9) NOT NULL,
  `group` enum('siswa','guru','rombel','prestasi','lulusan') NOT NULL,
  `label` varchar(100) NOT NULL,
  `value` int(10) unsigned NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statistics_academic_year_index` (`academic_year`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES
(1,'2022/2023','siswa','Kelas VII',284,0,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'2022/2023','siswa','Kelas VIII',278,1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'2022/2023','siswa','Kelas IX',271,2,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'2022/2023','guru','Guru PNS/PPPK',52,3,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'2022/2023','guru','Guru Honorer',9,4,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'2022/2023','guru','Tenaga Kependidikan',14,5,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,'2022/2023','rombel','Kelas VII',10,6,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,'2022/2023','rombel','Kelas VIII',10,7,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(9,'2022/2023','rombel','Kelas IX',10,8,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(10,'2022/2023','lulusan','Melanjutkan ke MAN/SMA',244,9,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(11,'2022/2023','lulusan','Pondok Pesantren',20,10,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(12,'2022/2023','lulusan','SMK/Lainnya',7,11,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(13,'2023/2024','siswa','Kelas VII',296,0,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(14,'2023/2024','siswa','Kelas VIII',290,1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(15,'2023/2024','siswa','Kelas IX',283,2,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(16,'2023/2024','guru','Guru PNS/PPPK',52,3,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(17,'2023/2024','guru','Guru Honorer',9,4,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(18,'2023/2024','guru','Tenaga Kependidikan',14,5,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(19,'2023/2024','rombel','Kelas VII',10,6,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(20,'2023/2024','rombel','Kelas VIII',10,7,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(21,'2023/2024','rombel','Kelas IX',10,8,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(22,'2023/2024','lulusan','Melanjutkan ke MAN/SMA',255,9,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(23,'2023/2024','lulusan','Pondok Pesantren',21,10,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(24,'2023/2024','lulusan','SMK/Lainnya',8,11,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(25,'2024/2025','siswa','Kelas VII',306,0,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(26,'2024/2025','siswa','Kelas VIII',299,1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(27,'2024/2025','siswa','Kelas IX',292,2,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(28,'2024/2025','guru','Guru PNS/PPPK',52,3,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(29,'2024/2025','guru','Guru Honorer',9,4,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(30,'2024/2025','guru','Tenaga Kependidikan',14,5,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(31,'2024/2025','rombel','Kelas VII',10,6,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(32,'2024/2025','rombel','Kelas VIII',10,7,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(33,'2024/2025','rombel','Kelas IX',10,8,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(34,'2024/2025','lulusan','Melanjutkan ke MAN/SMA',263,9,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(35,'2024/2025','lulusan','Pondok Pesantren',22,10,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(36,'2024/2025','lulusan','SMK/Lainnya',8,11,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(37,'2025/2026','siswa','Kelas VII',312,0,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(38,'2025/2026','siswa','Kelas VIII',305,1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(39,'2025/2026','siswa','Kelas IX',298,2,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(40,'2025/2026','guru','Guru PNS/PPPK',52,3,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(41,'2025/2026','guru','Guru Honorer',9,4,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(42,'2025/2026','guru','Tenaga Kependidikan',14,5,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(43,'2025/2026','rombel','Kelas VII',10,6,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(44,'2025/2026','rombel','Kelas VIII',10,7,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(45,'2025/2026','rombel','Kelas IX',10,8,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(46,'2025/2026','lulusan','Melanjutkan ke MAN/SMA',268,9,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(47,'2025/2026','lulusan','Pondok Pesantren',22,10,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(48,'2025/2026','lulusan','SMK/Lainnya',8,11,'2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `position` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES
(1,'Drs. H. Syafrizal, M.Pd','19761172 201968 2 974','Kepala Madrasah',NULL,NULL,0,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(2,'Hj. Elfi Yanti, S.Ag','19750562 200758 2 931','Wakil Kepala Bidang Kurikulum','Fikih',NULL,1,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(3,'Rahmat Hidayat, S.Pd','19881177 201234 2 939','Wakil Kepala Bidang Kesiswaan','Penjasorkes',NULL,2,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(4,'Yusnimar, S.Pd','19780656 201064 2 851','Wakil Kepala Bidang Sarpras','IPA',NULL,3,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(5,'Fitri Handayani, S.Pd.I','19740859 201465 2 645','Wakil Kepala Bidang Humas','Bahasa Arab',NULL,4,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(6,'Afrizal, S.E','19850203 201519 1 763','Kepala Tata Usaha',NULL,NULL,5,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(7,'Nurhasanah, S.Pd','19751218 201461 2 989','Guru','Matematika',NULL,6,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(8,'Dedi Kurniawan, S.Pd','19860862 202089 1 139','Guru','Bahasa Inggris',NULL,7,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(9,'Silvia Marni, S.Pd','19740259 201210 2 019','Guru','Bahasa Indonesia',NULL,8,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(10,'Ust. Hafizul Ikhwan, Lc','19731098 201181 2 683','Koordinator Tahfiz','Al-Qur\'an Hadis',NULL,9,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(11,'Rini Oktavia, S.Kom','19750757 200757 1 436','Guru','Informatika',NULL,10,'2026-10-18 18:58:37','2026-10-18 18:58:37'),
(12,'Zulkifli, S.Sn','19871094 200720 2 598','Guru','Seni Budaya & BAM',NULL,11,'2026-10-18 18:58:37','2026-10-18 18:58:37');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','editor') NOT NULL DEFAULT 'editor',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Administrator Madrasah','admin@mtsn1bukittinggi.sch.id',NULL,'$2y$12$n/27Q66pmAXYizEXmEQ1o.Ems6Y0tRvkSH.9XiSBOlt5qDGBm3qvG','admin',1,'2026-10-18 19:52:42',NULL,'2026-10-18 18:58:37','2026-10-18 19:52:42'),
(2,'Tim Humas MTsN 1','humas@mtsn1bukittinggi.sch.id',NULL,'$2y$12$ubjgovnG/sLuAd1XkRDycu0fBN3jqVt4Adou7cewGg5/h6gk7ctgi','editor',1,'2026-10-18 19:52:46',NULL,'2026-10-18 18:58:37','2026-10-18 19:52:46');
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

-- Dump completed on 2026-10-18 12:54:50
