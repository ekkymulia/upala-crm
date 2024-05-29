-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 27 Bulan Mei 2024 pada 08.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upala-crm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_bills`
--

CREATE TABLE `customer_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelanggan_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customer_bills`
--

INSERT INTO `customer_bills` (`id`, `pelanggan_id`, `employee_id`, `created_at`, `updated_at`) VALUES
(4, 2, 2, '2024-05-08 21:33:23', '2024-05-08 21:33:23'),
(5, 2, 2, '2024-05-08 21:34:14', '2024-05-08 21:34:14'),
(6, 2, 2, '2024-05-08 22:16:06', '2024-05-08 22:16:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_orders`
--

CREATE TABLE `customer_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customer_orders`
--

INSERT INTO `customer_orders` (`id`, `bill_id`, `produk_id`, `qty`, `condition`, `level`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 2, '1', '1', '2024-05-08 21:33:23', '2024-05-08 22:14:09'),
(2, 5, 2, 1, '2', '2', '2024-05-08 21:34:14', '2024-05-08 22:14:40'),
(3, 5, 2, 1, '1', '2', '2024-05-08 21:34:14', '2024-05-08 21:34:14'),
(4, 5, 2, 1, '2', '2', '2024-05-08 21:34:14', '2024-05-08 21:34:14'),
(5, 6, 2, 4, '1', '1', '2024-05-08 22:16:06', '2024-05-08 22:44:58'),
(6, 6, 2, 3, '1', '2', '2024-05-08 22:38:59', '2024-05-08 22:44:58'),
(7, 6, 2, 1, '2', '2', '2024-05-08 22:44:58', '2024-05-08 22:44:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_pelanggan`
--

CREATE TABLE `master_pelanggan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `registered_by` varchar(255) NOT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `master_pelanggan`
--

INSERT INTO `master_pelanggan` (`id`, `nama`, `email`, `no_telp`, `registered_by`, `registered_at`, `created_at`, `updated_at`) VALUES
(2, 'Rahmat', 'muhammaryadi@gmail.com', '08788312222', '1', '2024-05-22 07:07:11', '2024-05-08 01:05:05', '2024-05-22 00:07:11'),
(3, 'Saniyyah', 'saniyyah2106@gmail.com', '087788844717', '1', '2024-05-22 00:09:39', '2024-05-22 00:09:39', '2024-05-22 00:09:39'),
(4, 'Akil ganteng', 'ibnuaqil2004@gmail.com', '089654902861', '1', '2024-05-22 00:10:37', '2024-05-22 00:10:37', '2024-05-22 00:10:37'),
(5, 'alya', 'alyaptrs12@gmail.com', '085591252522', '1', '2024-05-24 23:10:46', '2024-05-24 23:10:46', '2024-05-24 23:10:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_produk`
--

CREATE TABLE `master_produk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `master_produk`
--

INSERT INTO `master_produk` (`id`, `nama`, `deskripsi`, `tipe`, `file`, `created_at`, `updated_at`) VALUES
(2, 'Coffee Latte', '<p>cofee latte</p>', '1', '1715152559.jpg', '2024-05-08 00:15:59', '2024-05-08 00:15:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification_target_histories`
--

CREATE TABLE `notification_target_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` bigint(20) UNSIGNED NOT NULL,
  `cust_id` bigint(20) UNSIGNED NOT NULL,
  `via_wa` int(11) NOT NULL DEFAULT 0,
  `via_email` int(11) NOT NULL DEFAULT 0,
  `is_success` tinyint(1) NOT NULL,
  `sent_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notification_target_histories`
--

INSERT INTO `notification_target_histories` (`id`, `notification_id`, `cust_id`, `via_wa`, `via_email`, `is_success`, `sent_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, 1, 1, '2024-04-22 12:06:15', '2024-05-21 02:47:52', '2024-05-21 02:47:52'),
(5, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:19:22', '2024-05-21 03:19:22'),
(6, 1, 2, 0, 1, 1, '2024-04-22 12:06:15', '2024-05-21 03:24:32', '2024-05-21 03:24:32'),
(7, 1, 2, 0, 1, 1, '2024-04-22 12:06:15', '2024-05-21 03:25:27', '2024-05-21 03:25:27'),
(8, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:26:01', '2024-05-21 03:26:01'),
(9, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:27:31', '2024-05-21 03:27:31'),
(10, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:33:07', '2024-05-21 03:33:07'),
(11, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:36:16', '2024-05-21 03:36:16'),
(12, 1, 2, 0, 1, 0, '2024-04-22 12:06:15', '2024-05-21 03:40:12', '2024-05-21 03:40:12'),
(14, 1, 2, 0, 1, 1, '2024-04-22 12:06:15', '2024-05-21 03:44:02', '2024-05-21 03:44:08'),
(15, 1, 2, 0, 0, 0, '2024-05-22 07:01:51', '2024-05-22 00:01:51', '2024-05-22 00:01:51'),
(16, 1, 2, 0, 0, 0, '2024-05-22 07:02:47', '2024-05-22 00:02:47', '2024-05-22 00:02:47'),
(17, 1, 2, 0, 1, 0, '2024-05-22 07:05:33', '2024-05-22 00:05:33', '2024-05-22 00:05:33'),
(18, 2, 2, 0, 1, 1, '2024-05-22 07:19:32', '2024-05-22 00:19:32', '2024-05-22 00:19:40'),
(19, 2, 3, 0, 1, 1, '2024-05-22 07:19:32', '2024-05-22 00:19:40', '2024-05-22 00:19:43'),
(20, 2, 4, 0, 1, 1, '2024-05-22 07:19:32', '2024-05-22 00:19:43', '2024-05-22 00:19:45'),
(21, 2, 4, 0, 1, 0, '2024-05-22 07:42:41', '2024-05-22 00:42:41', '2024-05-22 00:42:41'),
(22, 2, 4, 0, 1, 0, '2024-05-22 07:43:41', '2024-05-22 00:43:41', '2024-05-22 00:43:41'),
(23, 2, 4, 0, 1, 1, '2024-05-22 07:48:01', '2024-05-22 00:48:01', '2024-05-22 00:48:07'),
(24, 1, 4, 0, 1, 1, '2024-05-22 08:08:48', '2024-05-22 01:08:48', '2024-05-22 01:08:55'),
(25, 2, 2, 0, 1, 1, '2024-05-25 06:15:56', '2024-05-24 23:15:56', '2024-05-24 23:15:59'),
(26, 2, 3, 0, 1, 1, '2024-05-25 06:15:56', '2024-05-24 23:15:59', '2024-05-24 23:16:00'),
(27, 2, 4, 0, 1, 1, '2024-05-25 06:15:56', '2024-05-24 23:16:00', '2024-05-24 23:16:02'),
(28, 2, 5, 0, 1, 1, '2024-05-25 06:15:56', '2024-05-24 23:16:02', '2024-05-24 23:16:03'),
(29, 1, 2, 0, 1, 1, '2024-05-25 06:17:16', '2024-05-24 23:17:16', '2024-05-24 23:17:20'),
(30, 1, 3, 0, 1, 1, '2024-05-25 06:17:16', '2024-05-24 23:17:20', '2024-05-24 23:17:23'),
(31, 1, 4, 0, 1, 1, '2024-05-25 06:17:16', '2024-05-24 23:17:23', '2024-05-24 23:17:25'),
(32, 1, 5, 0, 1, 1, '2024-05-25 06:17:16', '2024-05-24 23:17:25', '2024-05-24 23:17:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `notification_type` varchar(255) NOT NULL,
  `media_attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `push_notifications`
--

INSERT INTO `push_notifications` (`id`, `title`, `message`, `notification_type`, `media_attachment`, `created_at`, `updated_at`) VALUES
(1, 'Test Notifikasi', '<p>🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩</p><p><strong>ASEKK</strong></p><p>Testttttttt</p>', '1', '1715224599.jpg', '2024-05-08 20:16:39', '2024-05-22 01:08:24'),
(2, 'Promotion New Product Upala', '<p>Perkenalkan Promo baru dari Upala Cafe, Koffe Luwak Hazelnut</p><p><br></p>', '1', '1716361968.jpeg', '2024-05-22 00:12:49', '2024-05-22 01:00:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Owner', NULL, NULL),
(2, 'Manager', NULL, NULL),
(3, 'Bar', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Rahmat', 'muhammaryadi@gmail.com', 1, NULL, '$2y$12$mgRaZMVY9U69vKK7.vszKevA0J2iSdJNOOQQaeQj8N53nvXh6Q4EO', NULL, '2024-05-08 02:07:22', '2024-05-22 03:19:28'),
(3, 'Akil', 'ibnuaqil2004@gmail.com', 2, NULL, '$2y$12$46vWDB327XtRKRsPZ6InMOKnoyF1q3P67clMyyxK2GOjQcNA9XE7W', NULL, '2024-05-22 03:19:21', '2024-05-22 03:19:21'),
(4, 'Ekky', 'ekky.mulialasardi@gmail.com', 3, NULL, '$2y$12$ocujB5ffbsf3GB2ak4hJX.P4VSZn7VcLRtYErlASIKbeihUnqAGy6', NULL, '2024-05-22 03:19:40', '2024-05-22 03:19:40');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer_bills`
--
ALTER TABLE `customer_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indeks untuk tabel `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `master_pelanggan`
--
ALTER TABLE `master_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notification_target_histories`
--
ALTER TABLE `notification_target_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer_bills`
--
ALTER TABLE `customer_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `master_pelanggan`
--
ALTER TABLE `master_pelanggan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `notification_target_histories`
--
ALTER TABLE `notification_target_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customer_bills`
--
ALTER TABLE `customer_bills`
  ADD CONSTRAINT `customer_bills_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `master_pelanggan` (`id`),
  ADD CONSTRAINT `customer_bills_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD CONSTRAINT `customer_orders_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `customer_bills` (`id`),
  ADD CONSTRAINT `customer_orders_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `master_produk` (`id`);

--
-- Ketidakleluasaan untuk tabel `notification_target_histories`
--
ALTER TABLE `notification_target_histories`
  ADD CONSTRAINT `notification_target_histories_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `push_notifications` (`id`),
  ADD CONSTRAINT `notification_target_histories_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `master_pelanggan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
