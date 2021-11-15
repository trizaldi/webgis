-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2021 at 04:08 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webgis-ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori_hotspot`
--

CREATE TABLE `m_kategori_hotspot` (
  `id_kategori_hotspot` int(11) NOT NULL,
  `kd_kategori_hotspot` varchar(10) DEFAULT 'NULL',
  `nm_kategori_hotspot` varchar(50) NOT NULL,
  `marker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kategori_hotspot`
--

INSERT INTO `m_kategori_hotspot` (`id_kategori_hotspot`, `kd_kategori_hotspot`, `nm_kategori_hotspot`, `marker`) VALUES
(1, '001', 'Ringan', 'ringan.png'),
(2, '002', 'Sedang', 'sedang.png'),
(3, '003', 'Berat/Parah', 'parah.png');

-- --------------------------------------------------------

--
-- Table structure for table `m_kecamatan`
--

CREATE TABLE `m_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) NOT NULL,
  `nm_kecamatan` varchar(30) NOT NULL,
  `geojson_kecamatan` varchar(30) NOT NULL,
  `warna_kecamatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kecamatan`
--

INSERT INTO `m_kecamatan` (`id_kecamatan`, `kd_kecamatan`, `nm_kecamatan`, `geojson_kecamatan`, `warna_kecamatan`) VALUES
(58, '3509010', 'KENCONG', 'idkec_2_3509010.geojson', 'blue'),
(59, '3509020', 'GUMUK MAS', 'idkec_2_3509020.geojson', '#ff0089'),
(60, '3509030', 'PUGER', 'idkec_2_3509030.geojson', '#ff0089'),
(61, '3509040', 'WULUHAN', 'idkec_2_3509040.geojson', '#ff0089'),
(62, '3509050', 'AMBULU', 'idkec_2_3509050.geojson', '#ff0089'),
(63, '3509060', 'TEMPUREJO', 'idkec_2_3509060.geojson', '#ff0089'),
(64, '3509070', 'SILO', 'idkec_2_3509070.geojson', '#ff0089'),
(65, '3509080', 'MAYANG', 'idkec_2_3509080.geojson', '#ff0089'),
(66, '3509090', 'MUMBULSARI', 'idkec_2_3509090.geojson', '#ff0089'),
(67, '3509100', 'JENGGAWAH', 'idkec_2_3509100.geojson', '#ff0089'),
(68, '3509110', 'AJUNG', 'idkec_2_3509110.geojson', '#ff0089'),
(69, '3509120', 'RAMBIPUJI', 'idkec_2_3509120.geojson', '#ff0089'),
(70, '3509130', 'BALUNG', 'idkec_2_3509130.geojson', '#ff0089'),
(71, '3509140', 'UMBULSARI', 'idkec_2_3509140.geojson', '#ff0089'),
(72, '3509150', 'SEMBORO', 'idkec_2_3509150.geojson', '#ff0089'),
(73, '3509160', 'JOMBANG', 'idkec_2_3509160.geojson', '#ff0089'),
(74, '3509170', 'SUMBER BARU', 'idkec_2_3509170.geojson', '#ff0089'),
(75, '3509180', 'TANGGUL', 'idkec_2_3509180.geojson', '#ff0089'),
(76, '3509190', 'BANGSALSARI', 'idkec_2_3509190.geojson', '#ff0089'),
(77, '3509200', 'PANTI', 'idkec_2_3509200.geojson', '#ff0089'),
(78, '3509210', 'SUKORAMBI', 'idkec_2_3509210.geojson', '#ff0089'),
(79, '3509220', 'ARJASA', 'idkec_2_3509220.geojson', '#ff0089'),
(80, '3509230', 'PAKUSARI', 'idkec_2_3509230.geojson', '#ff0089'),
(81, '3509240', 'KALISAT', 'idkec_2_3509240.geojson', '#ff0089'),
(82, '3509250', 'LEDOKOMBO', 'idkec_2_3509250.geojson', '#ff0089'),
(83, '3509260', 'SUMBERJAMBE', 'idkec_2_3509260.geojson', '#ff0089'),
(84, '3509270', 'SUKOWONO', 'idkec_2_3509270.geojson', '#ff0089'),
(85, '3509280', 'JELBUK', 'idkec_2_3509280.geojson', '#ff0089'),
(86, '3509710', 'KALIWATES', 'idkec_2_3509710.geojson', '#ff0089'),
(87, '3509720', 'SUMBERSARI', 'idkec_2_3509720.geojson', '#ff0089'),
(88, '3509730', 'PATRANG', 'idkec_2_3509730.geojson', '#ff0089');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nm_pengguna` varchar(20) NOT NULL,
  `kt_sandi` varchar(150) NOT NULL,
  `level` enum('Admin','User') NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nm_pengguna`, `kt_sandi`, `level`) VALUES
(1, 'admin', '$2y$10$oNX.X8jgLhNclHBeI8ytT.1vODlml8.AN1Ieb.rSIChhCa1e7cS0S', 'Admin'),
(2, 'user', '$2y$10$oNX.X8jgLhNclHBeI8ytT.1vODlml8.AN1Ieb.rSIChhCa1e7cS0S', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tb_alpukat`
--

CREATE TABLE `tb_alpukat` (
  `id_alpukat` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_bawang_merah`
--

CREATE TABLE `tb_bawang_merah` (
  `id_bawang_merah` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cabai_besar`
--

CREATE TABLE `tb_cabai_besar` (
  `id_cabai_besar` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cabai_rawit`
--

CREATE TABLE `tb_cabai_rawit` (
  `id_cabai_rawit` int(11) DEFAULT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_durian`
--

CREATE TABLE `tb_durian` (
  `id_durian` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jeruk`
--

CREATE TABLE `tb_jeruk` (
  `id_jeruk` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kecamatan`
--

CREATE TABLE `tb_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) NOT NULL,
  `nm_kecamatan` varchar(30) NOT NULL,
  `geojson_kecamatan` varchar(30) NOT NULL,
  `warna_kecamatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kecamatan`
--

INSERT INTO `tb_kecamatan` (`id_kecamatan`, `kd_kecamatan`, `nm_kecamatan`, `geojson_kecamatan`, `warna_kecamatan`) VALUES
(2, '3509010', 'KENCONG', 'idkec_2_3509010.geojson', 'blue'),
(3, '3509020', 'GUMUK MAS', 'idkec_2_3509020.geojson', '#ff0089'),
(4, '3509030', 'PUGER', 'idkec_2_3509030.geojson', '#ff0089'),
(5, '3509040', 'WULUHAN', 'idkec_2_3509040.geojson', '#ff0089'),
(6, '3509050', 'AMBULU', 'idkec_2_3509050.geojson', '#ff0089'),
(7, '3509060', 'TEMPUREJO', 'idkec_2_3509060.geojson', '#ff0089'),
(8, '3509070', 'SILO', 'idkec_2_3509070.geojson', '#ff0089'),
(9, '3509080', 'MAYANG', 'idkec_2_3509080.geojson', '#ff0089'),
(10, '3509090', 'MUMBULSARI', 'idkec_2_3509090.geojson', '#ff0089'),
(11, '3509100', 'JENGGAWAH', 'idkec_2_3509100.geojson', '#ff0089'),
(12, '3509110', 'AJUNG', 'idkec_2_3509110.geojson', '#ff0089'),
(13, '3509120', 'RAMBIPUJI', 'idkec_2_3509120.geojson', '#ff0089'),
(14, '3509130', 'BALUNG', 'idkec_2_3509130.geojson', '#ff0089'),
(15, '3509140', 'UMBULSARI', 'idkec_2_3509140.geojson', '#ff0089'),
(16, '3509150', 'SEMBORO', 'idkec_2_3509150.geojson', '#ff0089'),
(17, '3509160', 'JOMBANG', 'idkec_2_3509160.geojson', '#ff0089'),
(18, '3509170', 'SUMBER BARU', 'idkec_2_3509170.geojson', '#ff0089'),
(19, '3509180', 'TANGGUL', 'idkec_2_3509180.geojson', '#ff0089'),
(20, '3509190', 'BANGSALSARI', 'idkec_2_3509190.geojson', '#ff0089'),
(21, '3509200', 'PANTI', 'idkec_2_3509200.geojson', '#ff0089'),
(22, '3509210', 'SUKORAMBI', 'idkec_2_3509210.geojson', '#ff0089'),
(23, '3509220', 'ARJASA', 'idkec_2_3509220.geojson', '#ff0089'),
(24, '3509230', 'PAKUSARI', 'idkec_2_3509230.geojson', '#ff0089'),
(25, '3509240', 'KALISAT', 'idkec_2_3509240.geojson', '#ff0089'),
(26, '3509250', 'LEDOKOMBO', 'idkec_2_3509250.geojson', '#ff0089'),
(27, '3509260', 'SUMBERJAMBE', 'idkec_2_3509260.geojson', '#ff0089'),
(28, '3509270', 'SUKOWONO', 'idkec_2_3509270.geojson', '#ff0089'),
(29, '3509280', 'JELBUK', 'idkec_2_3509280.geojson', '#ff0089'),
(30, '3509710', 'KALIWATES', 'idkec_2_3509710.geojson', '#ff0089'),
(31, '3509720', 'SUMBERSARI', 'idkec_2_3509720.geojson', '#ff0089'),
(32, '3509730', 'PATRANG', 'idkec_2_3509730.geojson', '#ff0089');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mangis`
--

CREATE TABLE `tb_mangis` (
  `id_mangis` int(11) NOT NULL,
  `kd_kecamatan` varchar(10) DEFAULT NULL,
  `tahun` varchar(5) DEFAULT NULL,
  `jumlah` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_hotspot`
--

CREATE TABLE `t_hotspot` (
  `id_hotspot` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `id_kategori_hotspot` int(11) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `lat` float(9,6) NOT NULL,
  `lng` float(9,6) NOT NULL,
  `tanggal` date NOT NULL,
  `polygon` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_hotspot`
--

INSERT INTO `t_hotspot` (`id_hotspot`, `id_kecamatan`, `id_kategori_hotspot`, `lokasi`, `keterangan`, `lat`, `lng`, `tanggal`, `polygon`) VALUES
(69, 8, 3, 'Gunung Makmur, South Kalimantan, Indonesia', 'Kebakaran Parah sekali; tes', -3.888232, 114.650726, '2020-08-01', ''),
(70, 18, 2, 'Telaga Biru, Sungai Jelai, South Kalimantan, Indon', 'Kebakaran Parah sekali', -3.699476, 114.757561, '2020-08-01', ''),
(71, 21, 1, 'Jl. Raya', 'Rusak parah', -3.816000, 114.796997, '2020-08-01', NULL),
(72, 16, 3, 'Martadah Baru, South Kalimantan, Indonesia', 'Rusak parah', -3.614505, 114.808754, '2020-08-01', ''),
(73, 21, 2, 'Jl. Sepeda', '-', -364.101013, 114.675003, '2020-08-01', NULL),
(74, 21, 1, 'Rumah Saiful', '-', -366.101013, 114.775002, '2020-08-01', NULL),
(75, 21, 3, 'Rmah Jakaria', '-', -3.846000, 1.148000, '2020-08-01', NULL),
(76, 21, 2, 'HUtan Rawa Merawa', '-', -376.101013, 114.857002, '2020-08-01', NULL),
(77, 21, 1, 'Gang Jambu', 'Rumah Terbakar', -381.713013, 114.801003, '2020-08-01', NULL),
(78, 19, 3, 'Kurau, South Kalimantan, Indonesia', 'Lantai 4 terbakars', -3.590178, 114.620934, '2020-08-01', ''),
(79, 21, 2, 'Pasar Kaki Lima', '4 Loket terbakar', -36.553001, 114.685997, '2020-08-01', NULL),
(80, 21, 1, 'Jl. Peganggas gas amat', 'tes', -36.553001, 114.775002, '2020-08-01', NULL),
(81, 21, 3, 'South Kalimantan, Indonesia', 'tes', -3.811844, 115.026558, '2020-08-01', ''),
(82, 18, 2, 'RW. 07; Kel. Angsau; Angsau; South Kalimantan; 708', 'dfdf', -3.808418, 114.775429, '2020-08-01', ''),
(83, 21, 1, 'Mushola Nurul Ibadah; Jalan Samudera; RT 10 Desa P', 'tes', -3.803000, 114.762001, '2020-08-01', NULL),
(84, 18, 3, 'Jalan Trans Kalimantan, RT 06, KEL. SARANG HALANG,', 'dfdf', -3.853636, 114.797073, '2020-08-01', ''),
(85, 21, 2, 'Matah; RT 27 Desa Pelaihari; Karang Taruna; South', 'tes', -3.802000, 114.758003, '2020-08-01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_kategori_hotspot`
--
ALTER TABLE `m_kategori_hotspot`
  ADD PRIMARY KEY (`id_kategori_hotspot`);

--
-- Indexes for table `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_alpukat`
--
ALTER TABLE `tb_alpukat`
  ADD PRIMARY KEY (`id_alpukat`);

--
-- Indexes for table `tb_bawang_merah`
--
ALTER TABLE `tb_bawang_merah`
  ADD PRIMARY KEY (`id_bawang_merah`);

--
-- Indexes for table `tb_cabai_besar`
--
ALTER TABLE `tb_cabai_besar`
  ADD PRIMARY KEY (`id_cabai_besar`);

--
-- Indexes for table `tb_durian`
--
ALTER TABLE `tb_durian`
  ADD PRIMARY KEY (`id_durian`);

--
-- Indexes for table `tb_jeruk`
--
ALTER TABLE `tb_jeruk`
  ADD PRIMARY KEY (`id_jeruk`);

--
-- Indexes for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `tb_mangis`
--
ALTER TABLE `tb_mangis`
  ADD PRIMARY KEY (`id_mangis`);

--
-- Indexes for table `t_hotspot`
--
ALTER TABLE `t_hotspot`
  ADD PRIMARY KEY (`id_hotspot`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `m_kategori_hotspot`
--
ALTER TABLE `m_kategori_hotspot`
  MODIFY `id_kategori_hotspot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_alpukat`
--
ALTER TABLE `tb_alpukat`
  MODIFY `id_alpukat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_bawang_merah`
--
ALTER TABLE `tb_bawang_merah`
  MODIFY `id_bawang_merah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_cabai_besar`
--
ALTER TABLE `tb_cabai_besar`
  MODIFY `id_cabai_besar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_durian`
--
ALTER TABLE `tb_durian`
  MODIFY `id_durian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_jeruk`
--
ALTER TABLE `tb_jeruk`
  MODIFY `id_jeruk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_kecamatan`
--
ALTER TABLE `tb_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_mangis`
--
ALTER TABLE `tb_mangis`
  MODIFY `id_mangis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_hotspot`
--
ALTER TABLE `t_hotspot`
  MODIFY `id_hotspot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
