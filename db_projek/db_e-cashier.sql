-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2021 at 04:16 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_e-cashier`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` char(6) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_beli` int(6) NOT NULL,
  `harga_jual` int(6) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga_beli`, `harga_jual`, `jumlah`, `kategori`) VALUES
('bara1', 'Minyak Fortuner', 10000, 12000, 18, 'Sembako'),
('bara2', 'Sabun Life boi', 5000, 6000, -9, 'Alat mandi'),
('bara3', 'Beras Dua Anak', 13000, 15000, 38, 'Alat tulis'),
('bara4', 'Nextar 3080 Ti', 3500, 4000, 17, 'Snack'),
('bara5', 'Telur 1 KG', 19000, 22000, 31, 'Sembako');

-- --------------------------------------------------------

--
-- Table structure for table `detil_transaksi`
--

CREATE TABLE `detil_transaksi` (
  `id_detil` varchar(7) NOT NULL,
  `no_trans` int(4) NOT NULL,
  `kode_barang` char(6) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_jual` int(6) NOT NULL,
  `kuantitas` int(3) NOT NULL,
  `total_belanja` int(8) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detil_transaksi`
--

INSERT INTO `detil_transaksi` (`id_detil`, `no_trans`, `kode_barang`, `nama_barang`, `harga_jual`, `kuantitas`, `total_belanja`, `tanggal`) VALUES
('detil1', 1, 'bara1', 'Minyak Fortuner', 12000, 1, 12000, '2021-07-18'),
('detil2', 8, 'bara5', 'Telur 1 KG', 22000, 1, 22000, '2021-07-19'),
('detil3', 9, 'bara4', 'Nextar 3080 Ti', 20000, 5, 20000, '2021-07-19'),
('detil4', 10, 'bara1', 'Minyak Fortuner', 36000, 3, 36000, '2021-07-19'),
('detil5', 12, 'bara1', 'Minyak Fortuner', 24000, 2, 54000, '2021-07-19'),
('detil6', 12, 'bara2', 'Sabun Life boi', 30000, 5, 54000, '2021-07-19');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kode_kategori` char(6) NOT NULL,
  `nama_kategori` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kode_kategori`, `nama_kategori`) VALUES
('kate01', 'Sembako'),
('kate02', 'Alat mandi'),
('kate03', 'Alat tulis'),
('kate04', 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(6) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password_petugas` varchar(20) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password_petugas`, `nama_petugas`) VALUES
('petu1', 'Gitaran', 'Admin', 'Fikri ');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_trans` int(4) NOT NULL,
  `total_belanja` int(8) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_trans`, `total_belanja`, `tanggal`) VALUES
(1, 12000, '2021-07-18'),
(8, 22000, '2021-07-19'),
(9, 20000, '2021-07-19'),
(10, 36000, '2021-07-19'),
(11, 18000, '2021-07-19'),
(12, 54000, '2021-07-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD PRIMARY KEY (`id_detil`),
  ADD KEY `no_trans` (`no_trans`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_trans`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_trans` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD CONSTRAINT `detil_transaksi_ibfk_1` FOREIGN KEY (`no_trans`) REFERENCES `transaksi` (`no_trans`) ON DELETE CASCADE,
  ADD CONSTRAINT `detil_transaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
