-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2017 at 11:29 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antrian`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian_apoteker`
--

CREATE TABLE `antrian_apoteker` (
  `id_antrian` varchar(10) NOT NULL,
  `id_antrian_dokter` varchar(10) NOT NULL,
  `id_apoteker` varchar(10) NOT NULL,
  `no_antrian` int(5) NOT NULL,
  `status` int(5) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `antrian_berjalan_apoteker`
--

CREATE TABLE `antrian_berjalan_apoteker` (
  `id_apoteker` varchar(10) NOT NULL,
  `no_antrian` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian_berjalan_apoteker`
--

INSERT INTO `antrian_berjalan_apoteker` (`id_apoteker`, `no_antrian`) VALUES
('AP001', 1),
('AP002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `antrian_berjalan_dokter`
--

CREATE TABLE `antrian_berjalan_dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `no_antrian` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian_berjalan_dokter`
--

INSERT INTO `antrian_berjalan_dokter` (`id_dokter`, `no_antrian`) VALUES
('DO001', 1),
('DO002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `antrian_dokter`
--

CREATE TABLE `antrian_dokter` (
  `id_antrian` varchar(10) NOT NULL,
  `id_dokter` varchar(10) NOT NULL,
  `id_pasien` varchar(10) NOT NULL,
  `no_antrian` int(5) NOT NULL,
  `status` int(1) NOT NULL,
  `diagnosa` text NOT NULL,
  `resep` text NOT NULL,
  `no_antrian_reminder` int(5) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apoteker`
--

CREATE TABLE `apoteker` (
  `id_apoteker` varchar(10) NOT NULL,
  `nama_apoteker` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apoteker`
--

INSERT INTO `apoteker` (`id_apoteker`, `nama_apoteker`, `updated_at`, `created_at`) VALUES
('AP001', 'Sri Wahyumo', '2017-11-20 00:40:26', '2017-11-20 00:40:26'),
('AP002', 'Eko Prasetyo', '2017-11-20 00:40:26', '2017-11-20 00:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `jk` varchar(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `id_poli` varchar(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `jk`, `tgl_lahir`, `id_poli`, `updated_at`, `created_at`) VALUES
('DO001', 'dr. Arief Wijaya Rosli, Sp.A', 'L', '1975-10-30', 'PO001', '2017-11-20 00:02:28', '2017-11-20 00:02:28'),
('DO002', 'dr. Aniek Hartiwi, Sp.A', 'P', '1980-01-15', 'PO002', '2017-11-20 00:05:11', '2017-11-20 00:05:11'),
('DO003', 'dr. Rulik Rufiati, Sp.A', 'P', '1970-12-05', 'PO003', '2017-11-20 00:05:11', '2017-11-20 00:05:11'),
('DO004', 'dr. Abdul Rochim, Sp.A', 'L', '1967-11-12', 'PO004', '2017-11-20 00:06:40', '2017-11-20 00:06:40'),
('DO005', 'dr. Akhmad Akuf, Sp.A', 'L', '1975-02-01', 'PO005', '2017-11-20 00:06:40', '2017-11-20 00:06:40'),
('DO007', 'akdjadkaafafadjad', 'L', '2017-11-15', 'PO002', '2017-12-05 15:55:37', '2017-11-27 03:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `jam_praktek`
--

CREATE TABLE `jam_praktek` (
  `id_dokter` varchar(10) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_berakhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam_praktek`
--

INSERT INTO `jam_praktek` (`id_dokter`, `hari`, `jam_mulai`, `jam_berakhir`) VALUES
('DO001', 'Senin', '08:00:00', '15:00:00'),
('DO001', 'Selasa', '08:00:00', '15:00:00'),
('DO001', 'Rabu', '13:00:00', '16:00:00'),
('DO002', 'Senin', '08:00:00', '15:00:00'),
('DO002', 'Selasa', '08:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(1) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `bpjs` int(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tgl_lahir`, `jk`, `telepon`, `alamat`, `bpjs`, `updated_at`, `created_at`) VALUES
('PA001', 'Rully Siahaan', '2000-05-17', 'L', '089273582691', 'Jl. Laksdya M Nasir No. 56, Surabaya\r\n', 0, '2017-11-20 00:15:00', '0000-00-00 00:00:00'),
('PA002', 'Waras Susanto', '1960-06-23', 'L', '081735729618', 'Jl. Moro Krembangan, Surabaya\r\n', 1, '2017-11-20 00:15:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` varchar(10) NOT NULL,
  `nama_poli` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `icon`, `updated_at`, `created_at`) VALUES
('PO001', 'Umum', 'http://192.168.0.3:3000/icon/umum.png', '2017-11-20 00:17:31', '2017-12-05 15:33:54'),
('PO002', 'THT', 'http://192.168.0.3:3000/icon/tht.png', '2017-11-20 00:17:31', '2017-12-05 15:34:10'),
('PO003', 'Mata', 'http://192.168.0.3:3000/icon/mata.png', '2017-11-20 00:17:52', '2017-12-05 15:34:26'),
('PO004', 'Gigi', 'http://192.168.0.3:3000/icon/gigi.png', '2017-11-20 00:17:52', '2017-12-05 15:34:37'),
('PO005', 'Kandungan', 'http://192.168.0.3:3000/icon/kandungan.png', '2017-11-20 00:18:01', '2017-12-05 15:34:50'),
('PO006', 'Anak', 'http://192.168.0.3:3000/icon/anak.png', '2017-12-05 15:35:28', '2017-12-05 15:35:28'),
('PO007', 'Paru-paru', 'http://192.168.0.3:3000/icon/paru.png', '2017-12-05 15:35:28', '2017-12-05 15:35:28'),
('PO008', 'Jantung', 'http://192.168.0.3:3000/icon/jantung.png', '2017-12-05 15:35:50', '2017-12-05 15:35:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian_apoteker`
--
ALTER TABLE `antrian_apoteker`
  ADD PRIMARY KEY (`id_antrian`);

--
-- Indexes for table `antrian_berjalan_apoteker`
--
ALTER TABLE `antrian_berjalan_apoteker`
  ADD PRIMARY KEY (`id_apoteker`);

--
-- Indexes for table `antrian_berjalan_dokter`
--
ALTER TABLE `antrian_berjalan_dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`id_apoteker`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
