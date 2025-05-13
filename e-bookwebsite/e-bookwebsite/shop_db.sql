-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Apr 2024 pada 02.49
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(100,3) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(129, 14, 16, 'lavendor rose', 13.000, 1, 'lavendor rose.jpg'),
(130, 14, 18, 'red tulipa', 11.000, 1, 'red tulipa.jpg'),
(131, 14, 15, 'cottage rose', 15.000, 1, 'cottage rose.jpg'),
(132, 15, 13, 'pink rose', 10.000, 1, 'pink roses.jpg'),
(133, 15, 15, 'cottage rose', 15.000, 1, 'cottage rose.jpg'),
(134, 15, 16, 'lavendor rose', 13.000, 3, 'lavendor rose.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(13, 14, 'shaikh anas', 'shaikh@gmail.com', '0987654321', 'hi, how are you?');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` double(100,3) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(17, 14, 'shaikh anas', '0987654321', 'shaikh@gmail.com', 'credit card', 'flat no. 321, jogeshwari, mumbai, india - 654321', ', cottage rose (3) , pink bouquet (1) , yellow queen rose (1) ', 80.000, '11-Mar-2022', 'pending'),
(18, 14, 'shaikh anas', '1234567899', 'shaikh@gmail.com', 'paypal', 'flat no. 321, jogeshwari, mumbai, india - 654321', ', yellow queen rose (1) , pink rose (2) ', 40.000, '11-Mar-2022', 'completed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` double(100,3) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image`) VALUES
(13, 'pink rose', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque error earum quasi facere optio tenetur.', 12.000, 'pink roses.jpg'),
(15, 'cottage rose', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque error earum quasi facere optio tenetur.', 15.000, 'cottage rose.jpg'),
(16, 'lavendor rose', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Rem, nobis tenetur voluptatibus officiis odit minus fugit dolore accusantium fuga ipsa!', 13.000, 'lavendor rose.jpg'),
(17, 'yellow tulipa', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque error earum quasi facere optio tenetur.', 14.000, 'yellow tulipa.jpg'),
(18, 'red tulipa', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Rem, nobis tenetur voluptatibus officiis odit minus fugit dolore accusantium fuga ipsa!', 11.000, 'red tulipa.jpg'),
(19, 'pink bouquet', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque error earum quasi facere optio tenetur.', 15.000, 'pink bouquet.jpg'),
(20, 'pink queen rose', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque error earum quasi facere optio tenetur.', 24.000, 'pink queen rose.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(10, 'admin A', 'admin01@gmail.com', '698d51a19d8a121ce581499d7b701668', 'admin'),
(14, 'user A', 'user01@gmail.com', '698d51a19d8a121ce581499d7b701668', 'user'),
(15, 'user B', 'user02@gmail.com', '698d51a19d8a121ce581499d7b701668', 'user'),
(16, 'alvin', 'al@gmail.com', '202cb962ac59075b964b07152d234b70', 'user'),
(17, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(100,3) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(60, 14, 19, 'pink bouquet', 15.000, 'pink bouquet.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
