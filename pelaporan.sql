-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Agu 2019 pada 05.11
-- Versi server: 10.3.15-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelaporan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity`
--

CREATE TABLE `activity` (
  `id_activity` int(20) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `status` enum('Belum Dikerjakan','Sedang Dikerjakan','Selesai Dikerjakan','Laporan Selesai') NOT NULL DEFAULT 'Belum Dikerjakan',
  `id_karyawan` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `nama_teknisi` varchar(255) DEFAULT NULL,
  `detail` text NOT NULL,
  `tgl_activity` datetime NOT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `activity`
--

INSERT INTO `activity` (`id_activity`, `id_barang`, `status`, `id_karyawan`, `id_user`, `nama_teknisi`, `detail`, `tgl_activity`, `tgl_selesai`, `keterangan`) VALUES
(245, 5, 'Laporan Selesai', 13, 13, 'Primus Teknisi', 'rusak', '2019-08-13 14:34:47', '2019-08-13 14:57:26', 'done'),
(246, 3, 'Selesai Dikerjakan', 13, 13, 'Primus Teknisi', 'mati', '2019-08-13 16:24:28', '2019-08-13 16:50:16', 'done');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(20) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kategori_barang` enum('Hardware','Software','Jaringan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori_barang`) VALUES
(1, 'Monitor', 'Hardware'),
(2, 'Windows', 'Software'),
(3, 'Router', 'Jaringan'),
(4, 'Mouse', 'Hardware'),
(5, 'Office', 'Software');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `id_activity` int(20) NOT NULL,
  `waktu` datetime NOT NULL,
  `status` enum('Belum Dikerjakan','Sedang Dikerjakan','Selesai Dikerjakan','Laporan Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id_history`, `id_activity`, `waktu`, `status`) VALUES
(114, 245, '2019-08-13 14:34:47', 'Belum Dikerjakan'),
(115, 245, '2019-08-13 14:36:24', 'Sedang Dikerjakan'),
(116, 245, '2019-08-13 14:57:26', 'Selesai Dikerjakan'),
(118, 245, '2019-08-13 15:36:30', 'Laporan Selesai'),
(119, 246, '2019-08-13 16:24:28', 'Belum Dikerjakan'),
(120, 246, '2019-08-13 16:26:05', 'Sedang Dikerjakan'),
(121, 246, '2019-08-13 16:50:16', 'Selesai Dikerjakan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `id_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `email`, `password`, `nama`, `jenis_kelamin`, `no_telepon`, `id_level`) VALUES
(9, 'karyawan@smktelkom-mlg.sch.id', 'b4a9205c35e6ba1b125e9e6cf1fe281f971ff5dd', 'Primus Nathan', 'Laki-laki', '08123123', 1),
(10, 'teknisi@smktelkom-mlg.sch.id', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Sibromulis Nanda', 'Laki-laki', '', 2),
(11, 'manajer@smktelkom-mlg.sch.id', '33e2fc82e80b764f4316989537710b6d07593a8e', 'Agoes', 'Laki-laki', '456132', 3),
(12, 'nathan.primus77@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Primus Teknisi', 'Laki-laki', '', 2),
(13, 'primus_nathan_26rpl@student.smktelkom-mlg.sch.id', 'b4a9205c35e6ba1b125e9e6cf1fe281f971ff5dd', 'Primus Karyawan', 'Laki-laki', '8465132', 1),
(14, 'sibromulisnandakarima@gmail.com', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Sibro Karyawan', 'Laki-laki', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id_level`, `nama_level`) VALUES
(1, 'Karyawan'),
(2, 'Teknisi'),
(3, 'Manajer IT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `link_relasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `link_relasi`) VALUES
(1, '<i class=\"fas fa-flag\"></i>Komplain', 'Komplain/index'),
(2, '<i class=\"fas fa-clipboard\"></i>Laporan', 'laporan/index/'),
(4, '<i class=\"fas fa-home\"></i>Dashboard', 'Dashboard/index'),
(5, '<i class=\"fas fa-clipboard\"></i>Laporan', 'laporan_karyawan/index'),
(6, '<i class=\"fas fa-tasks\"></i>Tugas Anda', 'laporan_teknisi/index'),
(7, '<i class=\"fas fa-users\"></i>User', 'User/index'),
(8, '<i class=\"fas fa-boxes\"></i>Barang', 'Barang/index'),
(9, '<i class=\"fas fa-history\"></i> History', 'History/index'),
(10, '<i class=\"fas fa-history\"></i> History', 'History_karyawan/index'),
(11, '<i class=\"fas fa-history\"></i> History', 'History_teknisi/index');

-- --------------------------------------------------------

--
-- Struktur dari tabel `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_level`, `id_menu`) VALUES
(3, 3, 4),
(4, 3, 7),
(5, 3, 8),
(8, 2, 4),
(9, 2, 2),
(10, 2, 6),
(12, 1, 4),
(13, 1, 1),
(14, 1, 5),
(15, 3, 1),
(17, 3, 2),
(18, 3, 9),
(19, 1, 10),
(20, 2, 11);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id_activity`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `nama_teknisi` (`nama_teknisi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `nama_barang` (`nama_barang`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_activity` (`id_activity`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nama` (`nama`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `jenis_kelamin` (`jenis_kelamin`),
  ADD KEY `no_telepon` (`no_telepon`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity`
--
ALTER TABLE `activity`
  MODIFY `id_activity` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `activity_ibfk_4` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `activity_ibfk_5` FOREIGN KEY (`nama_teknisi`) REFERENCES `karyawan` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id_activity`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);

--
-- Ketidakleluasaan untuk tabel `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`),
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
