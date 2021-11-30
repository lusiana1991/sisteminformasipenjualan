-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2021 at 06:40 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kedaiharian`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `KodeBrg` char(10) NOT NULL,
  `NamaBrg` varchar(100) NOT NULL,
  `Beli` int(20) NOT NULL,
  `Jual` int(20) NOT NULL,
  `stok` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`KodeBrg`, `NamaBrg`, `Beli`, `Jual`, `stok`) VALUES
('B001', 'Sabun', 2500, 3500, 96),
('B002', 'Minyak Goreng', 14000, 15000, 3),
('B003', 'Mie Goreng', 2000, 3000, 89),
('B004', 'Molto Pewangi', 3000, 5000, 175);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(5) NOT NULL,
  `akses` varchar(50) NOT NULL,
  `username` char(10) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `akses`, `username`, `pass`) VALUES
(1, 'Pemilik', 'Fitri', 'permata'),
(2, 'Kasir', 'Lusi', 'putri'),
(3, 'Gudang', 'Riki', 'fehendra'),
(4, 'Kasir', 'Febi', 'okedeh');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `NoFaktur` char(10) NOT NULL,
  `JmlBrg` int(20) NOT NULL,
  `TotalJual` int(20) NOT NULL,
  `TotalDisc` int(20) NOT NULL,
  `TotalByr` int(20) NOT NULL,
  `JmlByr` int(20) NOT NULL,
  `kembali` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`NoFaktur`, `JmlBrg`, `TotalJual`, `TotalDisc`, `TotalByr`, `JmlByr`, `kembali`) VALUES
('F001', 4, 36000, 0, 36000, 50000, 14000);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `NoNota` char(10) NOT NULL,
  `TglBeli` date NOT NULL,
  `KodeBrg` char(10) NOT NULL,
  `KodeSup` char(10) NOT NULL,
  `JmlBeli` int(20) NOT NULL,
  `HargaBeli` int(20) NOT NULL,
  `Disc` int(20) NOT NULL,
  `TotalBeli` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`NoNota`, `TglBeli`, `KodeBrg`, `KodeSup`, `JmlBeli`, `HargaBeli`, `Disc`, `TotalBeli`) VALUES
('N001', '2020-12-09', 'B002', 'S002', 2, 14000, 0, 28000),
('N002', '2020-12-10', 'B003', 'S003', 3, 2000, 0, 6000),
('N003', '2021-02-06', 'B003', 'S002', 100, 2000, 0, 200000),
('N004', '2021-02-05', 'B001', 'S002', 100, 2500, 0, 250000),
('N005', '2021-02-03', 'B004', 'S003', 200, 3000, 0, 600000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `NoFaktur` char(10) NOT NULL,
  `TglJual` date NOT NULL,
  `KodeBrg` char(10) NOT NULL,
  `JmlJual` int(20) NOT NULL,
  `HargaJual` int(20) NOT NULL,
  `Disc` int(20) NOT NULL,
  `TotalJual` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`NoFaktur`, `TglJual`, `KodeBrg`, `JmlJual`, `HargaJual`, `Disc`, `TotalJual`) VALUES
('F001', '2020-12-10', 'B002', 2, 15000, 0, 30000),
('F002', '2020-12-11', 'B001', 1, 3500, 0, 3500),
('F003', '2020-12-09', 'B003', 3, 3000, 0, 9000),
('F001', '2020-12-10', 'B003', 2, 3000, 0, 6000),
('F004', '2021-02-06', 'B001', 5, 3500, 0, 17500),
('F004', '2021-02-06', 'B002', 3, 15000, 0, 45000),
('F004', '2021-02-06', 'B003', 12, 3000, 0, 36000),
('F004', '2021-02-06', 'B004', 35, 5000, 0, 175000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `KodeSup` char(10) NOT NULL,
  `NamaSup` varchar(100) NOT NULL,
  `Alamat` varchar(200) NOT NULL,
  `HP` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`KodeSup`, `NamaSup`, `Alamat`, `HP`) VALUES
('S001', 'Maju Jaya', 'Payakumbuh', 12345678),
('S002', 'PT. ABC', 'Payakumbuh', 87654321),
('S003', 'PT. Anugerah', 'Payakumbuh', 13245678);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`KodeBrg`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`NoFaktur`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD KEY `KodeBrg` (`KodeBrg`),
  ADD KEY `KodeSup` (`KodeSup`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD KEY `KodeBrg` (`KodeBrg`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`KodeSup`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`KodeBrg`) REFERENCES `barang` (`KodeBrg`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`KodeSup`) REFERENCES `supplier` (`KodeSup`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`KodeBrg`) REFERENCES `barang` (`KodeBrg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
