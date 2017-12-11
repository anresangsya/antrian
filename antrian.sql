-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2017 at 10:50 AM
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
  `jk` varchar(90) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_poli` varchar(10) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `jk`, `tgl_lahir`, `email`, `id_poli`, `foto`, `created_at`, `updated_at`) VALUES
('DO001', 'dr. Arief Wijaya Rosli, Sp.A', 'Laki laki', '1975-10-30', 'rosliarief35@gmail.com', 'PO001', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-11-20 00:02:28', '2017-12-11 03:50:05'),
('DO002', 'dr. Aniek Hartiwi, Sp.M', 'Perempuan', '1980-01-15', 'hartiwaniek_@gmail.com', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-11-20 00:05:11', '2017-12-11 03:48:59'),
('DO003', 'dr. Rulik Rufiati, Sp.Ok', 'Perempuan', '1970-12-05', 'rulikRF_10@gmail.com', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-11-20 00:05:11', '2017-12-11 03:49:13'),
('DO004', 'dr. Abdul Rochim, Sp.M', 'Laki laki', '1967-11-12', 'abdulrochim@gmail.com', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-11-20 00:06:40', '2017-12-11 03:50:04'),
('DO005', 'dr. Akhmad Akuf, Sp.THT-KL', 'Laki laki', '1975-02-01', 'akhmadakuf@gmail.com', 'PO005', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-11-20 00:06:40', '2017-12-11 03:50:01'),
('DO006', 'dr.Hana Pratiwi, SP.THT-KL', 'Perempuan', '1986-12-05', 'hanapratiwi@gmail.com', 'PO005', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 02:47:35', '2017-12-11 03:49:08'),
('DO007', 'dr.Andre Himawan, Sp.THT-KL', 'Laki laki', '2017-11-15', 'andreisme@gmail.com', 'PO005', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-11-27 03:17:40', '2017-12-11 03:50:00'),
('DO008', 'dr.Ali Rodhi, Sp.PM', 'Laki-laki', '1987-03-07', 'alirodhi123@gmail.com', 'PO002', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:42:26', '2017-12-11 03:49:58'),
('DO009', 'dr.Afdolash Nur, Sp.M', 'Laki Laki', '1976-12-09', 'afdolashnur@yahoo.co.id', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:50:35', '2017-12-11 03:49:57'),
('DO010', 'dr.Bima Sakti, Sp.KGA', 'Laki laki', '1968-10-11', 'bimasakti@gmail.com', 'PO002', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:51:36', '2017-12-11 03:49:55'),
('DO011', 'dr.Viola Olarisa, Sp.M', 'Perempuan', '1976-12-09', 'violarisa12@gmail.com', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 02:51:36', '2017-12-11 03:49:15'),
('DO012', 'dr.Intan Tanjung, Sp.MK', 'Perempuan', '1970-02-09', 'intaanjung@yahoo.co.d', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 02:54:49', '2017-12-11 03:49:18'),
('DO013', 'dr.Muhammad Cahyono, Sp.Ok', 'Laki laki', '1978-02-06', 'muhcahyono_ar@yahoo.co.id', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:54:49', '2017-12-11 03:49:53'),
('DO014', 'dr.Rahmawati Putri, Sp.Ok', 'Perempuan', '2071-02-09', 'rahmawatiputri@gmail.com', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 02:59:15', '2017-12-11 03:49:21'),
('DO015', 'dr.Faturrohman Ali, Sp.M', 'Laki laki', '1990-04-21', 'faturrohman_al@gmail.com', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:59:15', '2017-12-11 03:49:50'),
('DO016', 'dr.Sakti Aurora, Sp.KGA', 'Laki laki', '1968-10-11', 'sakti_aurora@yahoo.co.id', 'PO002', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 02:50:35', '2017-12-11 03:49:49'),
('DO017', 'dr.Wijaya Guna, Sp.M', 'Laki laki', '1977-05-19', 'wijayaguna01@gmail.com', 'PO004', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 03:13:51', '2017-12-11 03:49:46'),
('DO018', 'dr.Ahmad Darius, Sp.A', 'Laki laki', '1989-02-08', 'darius_ahmad01@yahoo.co.id', 'PO001', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 03:16:13', '2017-12-11 03:49:45'),
('DO019', 'dr.Putri Riza, Sp.A', 'Perempuan', '1987-03-05', 'riza_putri@gmail.com', 'PO001', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 03:18:10', '2017-12-11 03:49:22'),
('DO020', 'dr.Elin Farzensius, Sp.A', 'Perempuan', '1978-04-15', 'farzensius124@yahoo.co.id', 'PO001', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 03:18:10', '2017-12-11 03:49:25'),
('DO021', 'dr.Maya Kasih, Sp.PM', 'Perempuan', '1977-06-08', 'maya_kasih16@yahoo.co.id', 'PO002', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 03:22:59', '2017-12-11 03:49:27'),
('DO022', 'dr.Handayani Ira Sp.OT', 'Perempuan', '1976-12-13', 'IraHand16@gmail.com', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO002.jpg', '2017-12-06 03:30:12', '2017-12-11 03:49:32'),
('DO023', 'dr.Wahyu Prakasa Sp.A', 'Laki laki', '1989-12-02', 'wahyupras14@gmail.com', 'PO001', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 03:30:12', '2017-12-11 03:49:44'),
('DO024', 'dr.Suhartono Yahya Sp.PM', 'Laki laki', '1988-12-04', 'tonoyahya_@yahoo.co.id', 'PO002', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 03:32:45', '2017-12-11 03:49:41'),
('DO025', 'dr.Salsabila Gina Sp.OT', 'Perempuan', '1986-08-05', 'gina_salsabila@gmail.com', 'PO003', 'http://192.168.0.3:3000/images/dokter/DO001.jpg', '2017-12-06 03:32:45', '2017-12-11 03:49:39'),
('DO026', 'dr.Dahlila Pohan Sp.THT-KL', 'Perempuan', '1977-09-04', 'dahlila_pohanar@yahoo.co.id', 'PO005', '', '2017-12-06 03:37:55', '2017-12-06 07:13:11'),
('DO027', 'dr.Bimbim Malik Sp.M', 'Laki laki', '1987-10-16', 'bimbimalik@gmail.com', 'PO004', '', '2017-12-06 03:37:55', '2017-12-06 07:13:47'),
('DO028', 'dr.Ciara Lee Sp.M', 'Perempuan', '1987-01-12', 'ciaralee17@gmail.com', 'PO004', '', '2017-12-06 03:41:13', '2017-12-06 07:15:20'),
('DO029', 'dr.Utari Hustitia Sp.OT', 'Perempuan', '1987-10-04', 'utarihustitia@yahoo.co.id', 'PO003', '', '2017-12-06 03:41:13', '2017-12-06 07:16:26'),
('DO030', 'dr.Ahyuli Rahmawati Sp.M', 'Perempuan', '1991-11-04', 'ahyulirah234@yahoo.co.id', 'PO004', '', '2017-12-06 03:43:45', '2017-12-06 07:17:01'),
('DO031', 'dr.Rizal Maulana Sp.PM', 'Laki Laki', '1992-09-10', 'zalmaulana@yahoo.co.id', 'PO002', '', '2017-12-06 03:43:45', '2017-12-06 07:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `jam_praktek`
--

CREATE TABLE `jam_praktek` (
  `id` int(11) NOT NULL,
  `id_dokter` varchar(10) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_berakhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam_praktek`
--

INSERT INTO `jam_praktek` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_berakhir`) VALUES
(6, 'DO001', 'Senin', '00:00:00', '08:00:00'),
(7, 'DO013', 'Senin', '00:00:00', '08:00:00'),
(8, 'DO002', 'Senin', '08:00:00', '16:00:00'),
(9, 'DO014', 'Senin', '08:00:00', '16:00:00'),
(10, 'DO003', 'Senin', '16:00:00', '00:00:00'),
(11, 'DO015', 'Senin', '16:00:00', '00:00:00'),
(12, 'DO001', 'Selasa', '00:00:00', '08:00:00'),
(13, 'DO002', 'Selasa', '08:00:00', '16:00:00'),
(14, 'DO003', 'Selasa', '16:00:00', '00:00:00'),
(15, 'DO004', 'Rabu', '00:00:00', '08:00:00'),
(16, 'DO005', 'Rabu', '08:00:00', '16:00:00'),
(17, 'DO006', 'Rabu', '16:00:00', '00:00:00'),
(18, 'DO004', 'Kamis', '00:00:00', '08:00:00'),
(19, 'DO005', 'Kamis', '08:00:00', '16:00:00'),
(20, 'DO006', 'Kamis', '16:00:00', '00:00:00'),
(21, 'DO007', 'Jumat', '00:00:00', '08:00:00'),
(22, 'DO008', 'Jumat', '08:00:00', '16:00:00'),
(23, 'DO009', 'Jumat', '16:00:00', '00:00:00'),
(24, 'DO007', 'Sabtu', '00:00:00', '08:00:00'),
(25, 'DO008', 'Sabtu', '08:00:00', '16:00:00'),
(26, 'DO009', 'Sabtu', '16:00:00', '00:00:00'),
(27, 'DO010', 'Minggu', '00:00:00', '08:00:00'),
(28, 'DO011', 'Minggu', '08:00:00', '16:00:00'),
(29, 'DO012', 'Minggu', '16:00:00', '00:00:00');

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
  `email` varchar(100) NOT NULL,
  `bpjs` int(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tgl_lahir`, `jk`, `telepon`, `alamat`, `email`, `bpjs`, `updated_at`, `created_at`) VALUES
('PA001', 'Rully Siahaan', '2000-05-17', 'L', '089273582691', 'Jl. Laksdya M Nasir No. 56, Surabaya\r\n', 'rully@gmail.com', 0, '2017-12-11 03:43:33', '0000-00-00 00:00:00'),
('PA002', 'Waras Susanto', '1960-06-23', 'L', '081735729618', 'Jl. Moro Krembangan, Surabaya\r\n', '', 1, '2017-11-20 00:15:38', '0000-00-00 00:00:00'),
('PA003', 'User INI', '2017-12-12', 'L', '8028028', 'ajdhajkdh', 'user@gmail.com', 1, '2017-12-06 03:44:22', '2017-12-06 03:44:22');

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `updated_at`, `created_at`) VALUES
(1, 'user@gmail.com', '12345678', 4, '2017-12-06 03:18:21', '2017-12-06 03:18:21'),
(2, 'rully@gmail.com', 'rully', 4, '2017-12-11 03:43:49', '2017-12-11 03:43:49');

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
-- Indexes for table `jam_praktek`
--
ALTER TABLE `jam_praktek`
  ADD PRIMARY KEY (`id`);

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

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jam_praktek`
--
ALTER TABLE `jam_praktek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
