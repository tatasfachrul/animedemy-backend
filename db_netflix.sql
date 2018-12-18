-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2018 pada 06.09
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_netflix`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(15, '1503248427885_user', 1, '2018-12-16 08:28:18'),
(16, '1503248427886_token', 1, '2018-12-16 08:28:19'),
(17, '1544934195586_database_schema', 1, '2018-12-16 08:28:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Action', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(2, 'Adventure', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(3, 'Comedy', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(4, 'Drama', '2018-12-16 00:00:00', '2018-12-16 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `series`
--

CREATE TABLE `series` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `series`
--

INSERT INTO `series` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Naruto', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(2, 'Konosuba', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(3, 'Fairy Tail', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(4, 'One Piece', '2018-12-16 00:00:00', '2018-12-16 00:00:00'),
(5, 'Boruto', '2018-12-16 00:00:00', '2018-12-16 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `type`, `is_revoked`, `created_at`, `updated_at`) VALUES
(1, 7, '8650cd15-ce1b-4fd4-9d32-5e1bc4754bec', 'jwt_refresh_token', 0, '2018-12-16 16:54:27', '2018-12-16 16:54:27'),
(2, 7, '736fdc42-ae74-4dcb-b61b-8c764753fb5a', 'jwt_refresh_token', 0, '2018-12-16 16:56:24', '2018-12-16 16:56:24'),
(3, 4, 'c2c8f8fd-f28f-487b-af74-7460d477123f', 'jwt_refresh_token', 0, '2018-12-16 16:58:23', '2018-12-16 16:58:23'),
(4, 4, '27b70a19-3a5c-4f41-9068-f8238762acb0', 'jwt_refresh_token', 0, '2018-12-16 17:19:57', '2018-12-16 17:19:57'),
(5, 4, '7c1e738b-ce45-4c4e-a3d5-c564ebe8da27', 'jwt_refresh_token', 0, '2018-12-16 17:20:34', '2018-12-16 17:20:34'),
(6, 4, '0f508422-96e4-44fe-8f2c-8290ff6de99d', 'jwt_refresh_token', 0, '2018-12-16 17:23:14', '2018-12-16 17:23:14'),
(7, 4, '25f151f7-329e-4695-864e-19777169a006', 'jwt_refresh_token', 0, '2018-12-16 17:26:05', '2018-12-16 17:26:05'),
(8, 4, 'd8410dca-d862-4781-ad59-0d521ef74f4d', 'jwt_refresh_token', 0, '2018-12-16 17:30:12', '2018-12-16 17:30:12'),
(9, 8, '57fc8bae-cf54-44e6-9410-1244be6ef068', 'jwt_refresh_token', 0, '2018-12-17 12:26:00', '2018-12-17 12:26:00'),
(10, 8, '0e2a9013-11d6-438c-8fd7-4ec94e33cde3', 'jwt_refresh_token', 0, '2018-12-17 12:27:04', '2018-12-17 12:27:04'),
(11, 9, '0cbba71a-f8d9-4128-bf5d-6cb83850632c', 'jwt_refresh_token', 0, '2018-12-17 12:44:39', '2018-12-17 12:44:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `name`, `password`, `created_at`, `updated_at`) VALUES
(4, 'admin111', 'admin@admin.com', 'admin123', '$2a$10$YaUEr16Ho3UgCwycUQ4ME.VRlPwPxfgPQY9YpYOrptZCU1B9DtnGa', '2018-12-16 15:36:39', '2018-12-16 15:36:39'),
(7, 'admin', 'admin@adminadmin.com', 'admin', '$2a$10$LQ3cIUz4rr7BKQu9Ky/1meic.3spwlpRE9x81LNcFDz3MdC4Hutoy', '2018-12-16 15:38:51', '2018-12-16 15:38:51'),
(8, 'admin123123', 'admin123123@admin.com', 'admin123123', '$2a$10$w.OSRfFxFamaoofZI8mk.e6U26Gi6Hgrv1L8jMWrW5jT579d80.Uq', '2018-12-17 12:25:16', '2018-12-17 12:25:16'),
(9, 'tatas', 'tatas@gmail.com', 'tatas', '$2a$10$NKLjUi5y.B7WUAwMWENNCOlnsXk6RcCHVTly37.gHhJ9pisGe1dza', '2018-12-17 12:44:13', '2018-12-17 12:44:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `episode` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `starring` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `age_restriction` int(11) NOT NULL,
  `imdb_score` int(11) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `is_trending` tinyint(1) DEFAULT '0',
  `is_popular` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `videos`
--

INSERT INTO `videos` (`id`, `episode`, `series_id`, `title`, `image_url`, `description`, `starring`, `category_id`, `age_restriction`, `imdb_score`, `video_url`, `is_trending`, `is_popular`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Naruto Eps 1', 'naruto1.jpg', 'none', 'naruto, jiraiya, kakashi, iruka, sasuke, sakura', 1, 15, 8, 'naruto_eps1.mp4', 1, 0, '2018-12-16 17:43:42', '2018-12-16 17:43:42'),
(2, 2, 1, 'Naruto Eps 2', 'naruto2.jpg', 'none', 'naruto, jiraiya, kakashi, iruka, sasuke, sakura', 1, 15, 8, 'naruto2.mp4', 0, 0, '2018-12-16 17:43:42', '2018-12-16 17:43:42'),
(3, 1, 2, 'Konosuba Eps 1', 'konosuba1.jpg', 'none', 'kazuma, aqua, megumin, darkness', 3, 17, 9, 'konosuba1.mp4', 1, 1, '2018-12-16 19:19:25', '2018-12-16 19:19:25'),
(4, 1, 2, 'Konosuba Eps 2', 'konosuba2.jpg', 'none', 'kazuma, aqua, megumin, darkness', 3, 17, 9, 'konosuba2.mp4', 1, 1, '2018-12-16 19:23:04', '2018-12-16 19:23:04'),
(5, 1, 2, 'Konosuba Eps 3', 'konosuba3.jpg', 'none', 'kazuma, aqua, megumin, darkness', 3, 17, 9, 'konosuba3.mp4', 1, 1, '2018-12-16 19:23:19', '2018-12-16 19:23:19'),
(6, 1, 2, 'Konosuba Eps 4', 'konosuba4.jpg', 'none', 'kazuma, aqua, megumin, darkness', 3, 17, 9, 'konosuba4.mp4', 1, 1, '2018-12-16 19:23:31', '2018-12-16 19:23:31'),
(7, 1, 2, 'Konosuba Eps 5', 'konosuba5.jpg', 'none', 'kazuma, aqua, megumin, darkness', 3, 17, 9, 'konosuba5.mp4', 1, 1, '2018-12-16 19:24:14', '2018-12-16 19:24:14'),
(8, 1, 4, 'One Piece Eps 1', 'onepiece1.jpg', 'none', 'luffy, nami, zoro, sanji, choper, usop, brook, franky', 2, 17, 9, 'onepiece1.mp4', 1, 1, '2018-12-16 19:24:57', '2018-12-16 19:24:57'),
(10, 2, 4, 'One Piece Eps 2', 'onepiece2.jpg', 'none', 'luffy, nami, zoro, sanji, choper, usop, brook, franky', 2, 17, 9, 'onepiece2.mp4', 1, 1, '2018-12-16 19:25:31', '2018-12-16 19:25:31'),
(11, 1, 5, 'boruto', 'boruto.jpg', 'none', 'boruto, metal lee, sarada', 1, 17, 9, 'boruto.mp4', 1, 1, '2018-12-16 19:34:33', '2018-12-16 19:34:33'),
(12, 2, 5, 'boruto', 'boruto2.jpg', 'none', 'boruto, metal lee, sarada', 1, 17, 9, 'boruto2.mp4', 1, 1, '2018-12-16 19:34:48', '2018-12-16 19:34:48'),
(13, 3, 5, 'boruto', 'boruto3.jpg', 'none', 'boruto, metal lee, sarada', 1, 17, 9, 'boruto3.mp4', 1, 1, '2018-12-16 19:35:03', '2018-12-16 19:35:03'),
(14, 4, 5, 'boruto', 'boruto4.jpg', 'none', 'boruto, metal lee, sarada', 1, 17, 9, 'boruto4.mp4', 1, 1, '2018-12-16 19:35:10', '2018-12-16 19:35:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_name_unique` (`name`);

--
-- Indeks untuk tabel `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `videos_image_url_unique` (`image_url`),
  ADD UNIQUE KEY `videos_video_url_unique` (`video_url`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `series`
--
ALTER TABLE `series`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
