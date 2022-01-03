-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jul 2021 pada 09.19
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'tokoku.com', 'tokoku.com', 'tokoku winduaji');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Dekor dinding'),
(2, 'Aksesoris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(3, 'jakarta', 25000),
(4, 'bandung', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(5, 'ela@gmail.com', 'ela', 'nurlaela', '085712334773', 'winduaji'),
(6, 'tiara@gmail.com', 'tiara', 'tiara dwi', '085712335678', 'winduaji'),
(7, 'khodijah@gmail.com', 'khodijah', 'khodijahh', '085712331234', 'winduaji'),
(8, 'pakyuda@gmail.com', 'yuda', 'Tresna yuda', '081122334455', 'Bumiayu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(9, 32, 'Nurlaela', 'BRI', 125000, '2021-07-18', '202107181645027b70799fff6971d0982a05d2337bcb91.jpg'),
(10, 33, 'Tiara', 'BCA', 65000, '2021-07-19', '20210719043502STRUK 2.jpg'),
(11, 34, 'khodijah', 'MANDIRI', 70000, '2021-07-19', '20210719071213STRUK 4.jpg'),
(12, 35, 'ela cantik', 'BRI', 120000, '2021-07-20', '20210720083058STRUK 3.jpg'),
(13, 36, 'ekaa', 'BRI', 40000, '2021-07-20', '20210720091303STRUK 2.jpg'),
(14, 37, 'dijeh yelow', 'mandiri', 175000, '2021-07-20', '20210720153209STRUK 3.jpg'),
(15, 38, 'elaaaaaaaaa', 'BRI', 520000, '2021-07-21', '20210721062632STRUK 2.jpg'),
(16, 39, 'NURLAELA ELA', 'BTN', 40000, '2021-07-27', '20210727171332STRUK 4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(32, 5, 3, '2021-07-18', 125000, 'jakarta', 25000, 'winduaji', 'batal', 'abc123'),
(33, 6, 3, '2021-07-19', 65000, 'jakarta', 25000, 'paguyangan', 'barang dikirim', '1234ABCD'),
(34, 7, 4, '2021-07-19', 70000, 'bandung', 20000, 'keduagung waduk penjalin', 'barang dikirim', '123456789'),
(35, 5, 4, '2021-07-20', 120000, 'bandung', 20000, 'tuguran', 'barang dikirim', '1717171717'),
(36, 5, 4, '2021-07-20', 40000, 'bandung', 20000, 'ajibarang', 'barang dikirim', '22222'),
(37, 7, 3, '2021-07-20', 175000, 'jakarta', 25000, 'waduk penjalin', 'lunas', '00000000000000000'),
(38, 5, 4, '2021-07-21', 520000, 'bandung', 20000, 'waduk', 'barang dikirim', '888888888888888888'),
(39, 5, 4, '2021-07-27', 40000, 'bandung', 20000, 'Winduaji, Patuguran', 'sudah kirim pembayaran', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(43, 32, 10, 2, '', 50000, 30, 0, 100000),
(44, 33, 3, 2, '', 20000, 15, 0, 40000),
(45, 34, 15, 5, '', 10000, 5, 0, 50000),
(46, 35, 18, 2, '', 50000, 40, 0, 100000),
(47, 36, 15, 2, '', 10000, 5, 0, 20000),
(48, 37, 27, 10, '', 15000, 5, 0, 150000),
(49, 38, 28, 5, '', 100000, 50, 0, 500000),
(50, 39, 3, 1, '', 20000, 20, 0, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(3, 2, 'macrame daun Natural', 20000, 20, 'foto 7.jpg', 'gemesinnnn\r\n		', 201),
(7, 2, 'Macrame Spiral', 10000, 15, 'foto 3.jpg', 'untuk souvenir pernikahan kamu nih cocok abizzzzz	\r\n		', 500),
(8, 2, 'Macrame Pelangi', 10000, 10, 'foto 2.jpg', 'Ganci ini cocok untuk hadiah ulang tahun		', 3),
(10, 1, 'macrame dream', 50000, 30, 'foto 12.jpg', 'mcrame penghantar mimpi tidur kamu', 3),
(16, 1, 'Macrame Circular', 50000, 40, 'foto 9.jpg', 'Cocok untuk hiasan dinding di ruang tamu\r\n		', 5),
(24, 1, 'Macrame ambalan 02', 90000, 50, 'Macrame ambalan 02.jpg', 'cocok banget buat penyimpanan barang kamu dirumah	', 20),
(26, 1, 'Macrame ambalan 01', 150000, 50, 'Macrame ambalan 01.jpg', 'cantik men', 20),
(27, 1, 'macrame kaktus', 15000, 5, 'Macrame kaktus 01.jpg', 'cocok buat ganci tas kamu nih', 40),
(28, 1, 'macrame wall hanging', 100000, 50, 'Macrame wall hanging circular 03.jpg', 'cantik bangetttt\r\n		', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(7, 22, 'Macrame wall hanging ring 02.jpg'),
(8, 24, 'Macrame ambalan 02.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
