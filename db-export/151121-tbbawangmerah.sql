-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table dblanduse.tb_bawang_merah
DROP TABLE IF EXISTS `tb_bawang_merah`;
CREATE TABLE IF NOT EXISTS `tb_bawang_merah` (
  `id_bawang_merah` int(11) NOT NULL AUTO_INCREMENT,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL,
  PRIMARY KEY (`id_bawang_merah`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dblanduse.tb_bawang_merah: ~63 rows (approximately)
/*!40000 ALTER TABLE `tb_bawang_merah` DISABLE KEYS */;
INSERT IGNORE INTO `tb_bawang_merah` (`id_bawang_merah`, `kd_kecamatan`, `tahun`, `jumlah`) VALUES
	(2, '3509010', '2019', 5),
	(3, '3509020', '2019', 0),
	(4, '3509030', '2019', 0),
	(5, '3509040', '2019', 0),
	(6, '3509050', '2019', 170),
	(7, '3509060', '2019', 0),
	(8, '3509070', '2019', 0),
	(9, '3509080', '2019', 0),
	(10, '3509090', '2019', 0),
	(11, '3509100', '2019', 0),
	(12, '3509110', '2019', 0),
	(13, '3509120', '2019', 0),
	(14, '3509130', '2019', 0),
	(15, '3509140', '2019', 0),
	(16, '3509150', '2019', 0),
	(17, '3509160', '2019', 0),
	(18, '3509170', '2019', 0),
	(19, '3509180', '2019', 0),
	(20, '3509190', '2019', 0),
	(21, '3509200', '2019', 48),
	(22, '3509210', '2019', 0),
	(23, '3509220', '2019', 0),
	(24, '3509230', '2019', 0),
	(25, '3509240', '2019', 0),
	(26, '3509250', '2019', 0),
	(27, '3509260', '2019', 0),
	(28, '3509270', '2019', 0),
	(29, '3509280', '2019', 0),
	(30, '3509710', '2019', 0),
	(31, '3509720', '2019', 0),
	(32, '3509730', '2019', 0),
	(33, '3509010', '2020', 55),
	(34, '3509020', '2020', 0),
	(35, '3509030', '2020', 0),
	(36, '3509040', '2020', 150),
	(37, '3509050', '2020', 0),
	(38, '3509060', '2020', 0),
	(39, '3509070', '2020', 0),
	(40, '3509080', '2020', 0),
	(41, '3509090', '2020', 0),
	(42, '3509100', '2020', 0),
	(43, '3509110', '2020', 0),
	(44, '3509120', '2020', 0),
	(45, '3509130', '2020', 0),
	(46, '3509140', '2020', 0),
	(47, '3509150', '2020', 0),
	(48, '3509160', '2020', 0),
	(49, '3509170', '2020', 0),
	(50, '3509180', '2020', 0),
	(51, '3509190', '2020', 0),
	(52, '3509200', '2020', 0),
	(53, '3509210', '2020', 0),
	(54, '3509220', '2020', 0),
	(55, '3509230', '2020', 0),
	(56, '3509240', '2020', 0),
	(57, '3509250', '2020', 0),
	(58, '3509260', '2020', 0),
	(59, '3509270', '2020', 0),
	(60, '3509280', '2020', 0),
	(61, '3509710', '2020', 0),
	(62, '3509720', '2020', 0),
	(63, '3509730', '2020', 0);
/*!40000 ALTER TABLE `tb_bawang_merah` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
