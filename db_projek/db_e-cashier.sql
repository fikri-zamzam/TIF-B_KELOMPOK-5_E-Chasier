-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2021 at 04:32 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

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
  `nama_barang` varchar(100) NOT NULL,
  `harga_beli` int(6) NOT NULL,
  `harga_jual` int(6) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` int(3) NOT NULL,
  `kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga_beli`, `harga_jual`, `jumlah`, `diskon`, `kategori`) VALUES
('bara01', 'MINYAK FORTUNER', 10000, 12000, 40, 10, 'Sembako'),
('bara02', 'Sabun Life boi', 5000, 6000, 30, 10, 'Alat mandi'),
('bara03', 'Beras Dua Anak', 13000, 15000, 42, 10, 'Alat tulis'),
('bara04', 'Nextar 3080 Ti', 3500, 4000, 52, 5, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `detil_transaksi`
--

CREATE TABLE `detil_transaksi` (
  `id_detil` char(8) NOT NULL,
  `no_trans` char(7) NOT NULL,
  `id_petugas` char(6) NOT NULL,
  `kode_barang` char(6) NOT NULL,
  `kuantitas` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detil_transaksi`
--

INSERT INTO `detil_transaksi` (`id_detil`, `no_trans`, `id_petugas`, `kode_barang`, `kuantitas`) VALUES
('detil001', 'notra01', 'petu01', 'bara04', 1),
('detil002', 'notra02', 'petu01', 'bara01', 2),
('detil003', 'notra03', 'petu01', 'bara02', 1),
('detil004', 'notra03', 'petu01', 'bara04', 1);

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
-- Table structure for table `kumpulan_query`
--

CREATE TABLE `kumpulan_query` (
  `nama` varchar(30) NOT NULL,
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(6) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_depan`, `nama_belakang`) VALUES
('petu01', 'petugas1', 'petugas2', 'Tehyoung', 'jongkuk park');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_trans` char(7) NOT NULL,
  `total_belanja` int(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_trans`, `total_belanja`, `tanggal`) VALUES
('notra01', 4000, '2021-06-02'),
('notra02', 24000, '2021-06-08'),
('notra03', 10000, '2021-06-09');

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
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `no_trans` (`no_trans`);

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
-- Constraints for dumped tables
--

--
-- Constraints for table `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD CONSTRAINT `detil_transaksi_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detil_transaksi_ibfk_3` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detil_transaksi_ibfk_4` FOREIGN KEY (`no_trans`) REFERENCES `transaksi` (`no_trans`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
