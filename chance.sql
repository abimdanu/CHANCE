-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 10:42 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chance`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_01_074520_create_rooms_table', 1),
(6, '2023_06_01_074545_create_seats_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `capacity`, `created_at`, `updated_at`) VALUES
(1, 'Ruangan Kerja Bersama (F2.11)', 15, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(2, 'Ruang Baca FILKOM (F2.10)', 15, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(3, 'Gedung Kreativitas Mahasiswa Lt.3', 15, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(4, 'Smoking Area FILKOM', 15, '2023-06-01 03:09:58', '2023-06-01 03:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'empty',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `room_id`, `code`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'M23', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:48:43'),
(2, 1, 'E91', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:55:55'),
(3, 1, 'S86', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:04:46'),
(4, 1, 'F26', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(5, 1, 'X12', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:40:57'),
(6, 1, 'H60', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(7, 1, 'X43', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(8, 1, 'G85', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(9, 1, 'C15', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(10, 1, 'Z20', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(11, 1, 'U51', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(12, 1, 'R56', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(13, 1, 'Z15', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:56:04'),
(14, 1, 'Z23', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(15, 1, 'J20', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(16, 2, 'Y06', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:49:06'),
(17, 2, 'Y15', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(18, 2, 'R86', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(19, 2, 'D80', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(20, 2, 'W21', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:46:09'),
(21, 2, 'Z99', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:18:14'),
(22, 2, 'U48', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(23, 2, 'G45', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(24, 2, 'M85', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(25, 2, 'C13', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(26, 2, 'Y72', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(27, 2, 'M41', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(28, 2, 'K90', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(29, 2, 'P04', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(30, 2, 'S10', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(31, 3, 'H03', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:49:10'),
(32, 3, 'O16', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:42:23'),
(33, 3, 'U98', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(34, 3, 'I45', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:42:21'),
(35, 3, 'S88', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(36, 3, 'B54', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(37, 3, 'P64', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(38, 3, 'N04', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(39, 3, 'E86', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(40, 3, 'F87', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:42:37'),
(41, 3, 'G35', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(42, 3, 'J99', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(43, 3, 'E39', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(44, 3, 'K38', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(45, 3, 'Z43', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(46, 4, 'I15', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:43:14'),
(47, 4, 'P71', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(48, 4, 'A80', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(49, 4, 'U96', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(50, 4, 'E85', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(51, 4, 'W14', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:43:06'),
(52, 4, 'S70', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(53, 4, 'T43', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(54, 4, 'H65', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(55, 4, 'A79', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(56, 4, 'O52', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 04:43:09'),
(57, 4, 'C56', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(58, 4, 'X87', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(59, 4, 'L38', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58'),
(60, 4, 'L43', 'empty', NULL, '2023-06-01 03:09:58', '2023-06-01 03:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `isAdmin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$8oraSj/a7JqcQLRgu26PZO/LTRlMPudd8JARYo0kyO76..D6etV7i', 1, NULL, '2023-06-01 03:10:14', '2023-06-01 03:10:14'),
(2, 'Abimanyu Danu', 'abimdanu@example.com', NULL, '$2y$10$LWtF4Vu6yuV2Yl9unwoy.ueoWC1c1uPAvl6kNhGsTJzxavdHSIbTG', 0, NULL, '2023-06-01 03:10:24', '2023-06-01 03:10:24'),
(3, 'Nura', 'difanurr@example.com', NULL, '$2y$10$lSKxtgFeeXI9Vv0ngguwL.Bhu9P978zQ70rHZYfVS91AIgHKKWBwG', 0, NULL, '2023-06-01 04:44:11', '2023-06-01 04:44:11'),
(4, 'Wonn', 'wonn@example.com', NULL, '$2y$10$QuLAAkd5teL5Nk4XYE9gduQE0swXoIEjqFMs/X15dRy.uZCT1s.By', 0, NULL, '2023-06-01 04:44:23', '2023-06-01 04:44:23'),
(6, 'Mas Andre', 'andre@example.com', NULL, '$2y$10$aN9hqd/MLGaASHBe0igosOkI1WDxx8bqDBotORhMr8yPvo6tOhDuG', 0, NULL, '2023-06-17 06:50:30', '2023-06-17 06:50:30'),
(7, 'Difanurr', 'nura@nura.com', NULL, '$2y$10$UHGdjlum0DWRvFV7phV4PuhD/plyz3CH8ROMMFNDNxRnubp/xCWsa', 0, NULL, '2023-06-22 01:35:30', '2023-06-22 01:35:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats_room_id_foreign` (`room_id`),
  ADD KEY `seats_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `seats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
