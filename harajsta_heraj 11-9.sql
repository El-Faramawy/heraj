-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2023 at 01:10 PM
-- Server version: 5.7.44
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `harajsta_heraj`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password_reset` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `image`, `phone`, `email_verified_at`, `password_reset`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed Samir', 'admin@admin.com', 'storage/admin/WUFpF8IHpZgjUSvnAIOQK2s8eRcLum8e6l9eGSJO.png', '01026638997', NULL, NULL, '$2y$10$6x3eDqY3JQZp2fF5JdCgHOg0FBCjoebFoo7xfaKg38QilIUvv.1me', NULL, NULL, '2023-05-19 14:37:26'),
(6, 'admin', 'admin2@admin.com', 'storage/admin/WUFpF8IHpZgjUSvnAIOQK2s8eRcLum8e6l9eGSJO.png', '01026638997', NULL, NULL, '$2y$10$/W9CrlJEyDd9K.9YBNqFVuWcH/XiKfDNoKq2qvPi6akwNWt4QP38.', NULL, NULL, '2022-10-29 18:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `permission_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, NULL, NULL),
(2, 2, 6, NULL, NULL),
(3, 3, 6, NULL, NULL),
(4, 4, 6, NULL, NULL),
(55, 1, 1, '2023-05-19 14:37:26', '2023-05-19 14:37:26'),
(56, 2, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(57, 3, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(58, 4, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(59, 5, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(60, 7, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(61, 9, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(62, 10, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(63, 11, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(64, 13, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(65, 16, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(66, 80, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(67, 81, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(68, 82, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(69, 83, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(70, 84, 1, '2023-05-19 14:37:27', '2023-05-19 14:37:27'),
(71, 19, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(72, 20, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(73, 21, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(74, 22, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(75, 85, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(76, 86, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(77, 39, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(78, 40, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(79, 41, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(80, 42, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(81, 23, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(82, 24, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(83, 25, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(84, 26, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(85, 51, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(86, 60, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(87, 61, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(88, 62, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(89, 63, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(90, 64, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(91, 65, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(92, 66, 1, '2023-05-19 14:37:28', '2023-05-19 14:37:28'),
(93, 67, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(94, 68, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(95, 69, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(96, 70, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(97, 71, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(98, 72, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(99, 73, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(100, 74, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(101, 75, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(102, 76, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(103, 77, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(104, 78, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29'),
(105, 79, 1, '2023-05-19 14:37:29', '2023-05-19 14:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name_ar`, `name_en`, `city_id`, `created_at`, `updated_at`) VALUES
(3, 'سوق الرياض', 'rydah souq', 1, NULL, NULL),
(4, 'شارع المدارس', 'school street', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `image`, `created_at`, `updated_at`) VALUES
(6, 'حراج محطات', 'حراج محطات', 'uploads/Category/12811699934524.png', '2023-10-14 12:21:47', '2023-11-14 01:02:04'),
(7, 'مسلتزمات المحطات', 'مسلتزمات المحطات', 'uploads/Category/79851699934517.jpg', '2023-10-14 12:23:19', '2023-11-14 01:01:57'),
(8, 'مراكز الخدمات', 'مراكز الخدمات', 'uploads/Category/35261699934510.jpg', '2023-10-14 12:24:39', '2023-11-14 01:01:50'),
(9, 'تاهيل المحطات', 'تاهيل المحطات', 'uploads/Category/7411699934503.jpg', '2023-10-14 12:25:47', '2023-11-14 01:01:43'),
(10, 'الشركات', 'الشركات', 'uploads/Category/62461699934434.jpg', '2023-10-14 12:26:20', '2023-11-14 01:00:34'),
(11, 'نقليات الوقود', 'نقليات الوقود', 'uploads/Category/7981699934381.png', '2023-10-14 12:26:32', '2023-11-14 00:59:41'),
(12, 'المكاتب الهندسية', 'المكاتب الهندسية', 'uploads/Category/62941699933449.jpg', '2023-10-14 12:26:44', '2023-11-14 00:44:09'),
(13, 'مقاولات عامة', 'مقاولات عامة', 'uploads/Category/20461699933391.jpg', '2023-10-14 12:27:00', '2023-11-14 00:43:11'),
(14, 'توظيف وخدمات', 'توظيف وخدمات', 'uploads/Category/27061699933359.jpg', '2023-10-14 12:28:36', '2023-11-14 00:42:39'),
(15, 'اخرى', 'اخرى', 'uploads/Category/98081699933320.jpg', '2023-10-14 12:28:46', '2023-11-14 00:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `room_id`, `product_id`, `user_id`, `to_user_id`, `message`, `message_from`, `created_at`, `updated_at`) VALUES
(27, 2, NULL, NULL, NULL, 'test message', 'buyer', '2023-10-14 11:58:19', '2023-10-14 11:58:19'),
(28, 2, NULL, NULL, NULL, 'test message', 'buyer', '2023-10-14 12:12:40', '2023-10-14 12:12:40'),
(29, 3, NULL, NULL, NULL, 'test', 'buyer', '2023-10-14 12:15:32', '2023-10-14 12:15:32'),
(30, 4, NULL, NULL, NULL, 'test', 'buyer', '2023-10-14 12:17:19', '2023-10-14 12:17:19'),
(31, 4, NULL, NULL, NULL, 'dfgdfg', 'buyer', '2023-10-14 12:20:20', '2023-10-14 12:20:20'),
(32, 5, NULL, NULL, NULL, 'test message', 'buyer', '2023-10-14 13:33:21', '2023-10-14 13:33:21'),
(33, 6, NULL, NULL, NULL, 'test message', 'buyer', '2023-10-14 13:37:33', '2023-10-14 13:37:33'),
(34, 7, NULL, NULL, NULL, 'test', 'buyer', '2023-10-14 14:29:52', '2023-10-14 14:29:52'),
(35, 8, NULL, NULL, NULL, 'test', 'buyer', '2023-10-14 14:36:08', '2023-10-14 14:36:08'),
(36, 9, NULL, NULL, NULL, 'هلأ', 'buyer', '2023-11-14 18:14:46', '2023-11-14 18:14:46'),
(37, 10, NULL, NULL, NULL, 'هلأ', 'buyer', '2023-11-14 18:15:06', '2023-11-14 18:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `product_id`, `seller_id`, `buyer_id`, `created_at`, `updated_at`) VALUES
(2, 10, 2, 10, '2023-10-14 11:58:19', '2023-10-14 11:58:19'),
(3, 12, 7, 10, '2023-10-14 12:15:32', '2023-10-14 12:15:32'),
(4, 3, 1, 10, '2023-10-14 12:17:19', '2023-10-14 12:17:19'),
(5, 16, 10, 1, '2023-10-14 13:33:21', '2023-10-14 13:33:21'),
(6, 16, 10, 11, '2023-10-14 13:37:33', '2023-10-14 13:37:33'),
(7, 18, 11, 7, '2023-10-14 14:29:52', '2023-10-14 14:29:52'),
(8, 16, 10, 7, '2023-10-14 14:36:08', '2023-10-14 14:36:08'),
(9, 35, 9, 9, '2023-11-14 18:14:46', '2023-11-14 18:14:46'),
(10, 32, 10, 9, '2023-11-14 18:15:06', '2023-11-14 18:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_ar`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 'الرياض', 'Rydah', NULL, NULL),
(2, 'جده', 'Gada', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `mail` varchar(191) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `name`, `mail`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ahmeeeed', 'a@a.com', 'test contact', 'test contact message', '2023-10-12 19:16:14', '2023-10-12 19:16:14'),
(2, NULL, 'te', 'te', 'te', 'te', '2023-10-13 22:24:20', '2023-10-13 22:24:20'),
(3, NULL, 'ahme rady', 'ahmedrady@gmail.com', 'test', 'test', '2023-10-14 06:50:45', '2023-10-14 06:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourates`
--

CREATE TABLE `favourates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favourates`
--

INSERT INTO `favourates` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 32, 9, '2023-11-17 12:55:22', '2023-11-17 12:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `follower_user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'me as user',
  `following_user_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'other user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `product_id`, `follower_user_id`, `following_user_id`, `created_at`, `updated_at`) VALUES
(13, 32, 9, NULL, '2023-11-14 18:52:04', '2023-11-14 18:52:04'),
(14, NULL, 9, 10, '2023-11-16 05:20:11', '2023-11-16 05:20:11'),
(15, 32, 11, NULL, '2023-11-19 00:16:04', '2023-11-19 00:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2023_10_07_175050_create_settings_table', 1),
(6, '2023_10_07_175314_create_categories_table', 1),
(7, '2023_10_07_175428_create_sub_categories_table', 1),
(8, '2023_10_07_175554_create_cities_table', 1),
(9, '2023_10_07_175600_create_areas_table', 1),
(10, '2023_10_07_180302_create_products_table', 1),
(11, '2023_10_07_180514_create_product_images_table', 1),
(12, '2023_10_07_180530_create_product_comments_table', 1),
(13, '2023_10_07_180543_create_product_replies_table', 1),
(14, '2023_10_07_180700_create_favourates_table', 1),
(15, '2023_10_07_180749_create_rates_table', 1),
(16, '2023_10_07_182119_create_followings_table', 1),
(17, '2023_10_07_192047_create_chats_table', 1),
(18, '2023_10_07_192515_create_notifications_table', 1),
(19, '2023_10_07_193210_create_verify_accounts_table', 1),
(20, '2023_10_07_194106_create_verify_account_images_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(9, 9, 'test message', 'test message body', 1, '2023-10-15 12:39:48', '2023-11-17 13:19:59'),
(10, 10, 'test message', 'test message body', 1, '2023-10-15 12:39:48', '2023-11-17 13:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `daily_ads` int(11) DEFAULT NULL,
  `panner_ads` int(11) DEFAULT NULL,
  `close_chat` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `price`, `period`, `daily_ads`, `panner_ads`, `close_chat`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 2, 2, 1, NULL, NULL),
(2, 20, 2, 2, 2, 1, NULL, NULL),
(3, 30, 3, 2, 2, 1, NULL, NULL),
(4, 40, 4, 2, 2, 1, NULL, NULL),
(5, 50, 5, 2, 2, 1, NULL, NULL),
(6, 60, 6, 2, 2, 1, NULL, NULL),
(7, 70, 7, 2, 2, 1, NULL, '2023-11-04 21:18:35'),
(8, 80, 8, 2, 2, 1, NULL, NULL),
(9, 90, 9, 100, 100, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `section_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'عرض', NULL, NULL),
(2, 1, 'تعديل', NULL, NULL),
(3, 1, 'حذف', NULL, NULL),
(4, 1, 'اضافة', NULL, NULL),
(5, 2, 'عرض', NULL, NULL),
(7, 2, 'حذف', NULL, NULL),
(9, 2, 'تغيير الحالة', NULL, NULL),
(10, 2, 'حظر', NULL, NULL),
(11, 3, 'عرض', NULL, NULL),
(13, 3, 'حذف', NULL, NULL),
(16, 3, 'حظر', NULL, NULL),
(19, 5, 'عرض', NULL, NULL),
(20, 5, 'حظر', NULL, NULL),
(21, 5, 'حذف', NULL, NULL),
(22, 6, 'تعديل', NULL, NULL),
(23, 14, 'عرض', NULL, NULL),
(24, 14, 'تعديل', NULL, NULL),
(25, 14, 'حذف', NULL, NULL),
(26, 14, 'اضافة', NULL, NULL),
(39, 11, 'عرض', NULL, NULL),
(40, 11, 'حذف', NULL, NULL),
(41, 11, 'تغيير الحالة', NULL, NULL),
(42, 12, 'اضافة', NULL, NULL),
(51, 15, 'عرض', NULL, NULL),
(60, 17, 'عرض', NULL, NULL),
(61, 17, 'تعديل', NULL, NULL),
(62, 17, 'حذف', NULL, NULL),
(63, 17, 'اضافة', NULL, NULL),
(64, 18, 'عرض', NULL, NULL),
(65, 18, 'تعديل', NULL, NULL),
(66, 18, 'حذف', NULL, NULL),
(67, 18, 'اضافة', NULL, NULL),
(68, 19, 'عرض', NULL, NULL),
(69, 19, 'تعديل', NULL, NULL),
(70, 19, 'حذف', NULL, NULL),
(71, 19, 'اضافة', NULL, NULL),
(72, 20, 'عرض', NULL, NULL),
(73, 20, 'تعديل', NULL, NULL),
(74, 20, 'حذف', NULL, NULL),
(75, 20, 'اضافة', NULL, NULL),
(76, 21, 'عرض', NULL, NULL),
(77, 21, 'تعديل', NULL, NULL),
(78, 21, 'حذف', NULL, NULL),
(79, 21, 'اضافة', NULL, NULL),
(80, 4, 'عرض', NULL, NULL),
(81, 4, 'تعديل', NULL, NULL),
(82, 4, 'حذف', NULL, NULL),
(83, 4, 'اضافة', NULL, NULL),
(84, 4, 'حظر', NULL, NULL),
(85, 7, 'عرض', NULL, NULL),
(86, 7, 'حذف', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_sections`
--

CREATE TABLE `permission_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permission_sections`
--

INSERT INTO `permission_sections` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'المشرفين', NULL, NULL),
(2, 'المستخدمين', NULL, NULL),
(3, 'المندوبين', NULL, NULL),
(4, 'المطاعم', NULL, NULL),
(5, 'رسائل التواصل', NULL, NULL),
(6, 'الاعدادات', NULL, NULL),
(7, 'المساعدة والدعم', NULL, NULL),
(11, 'الطلبات', NULL, NULL),
(12, 'الاشعارات', NULL, NULL),
(14, 'المنتجات', NULL, NULL),
(15, 'احصائيات الرئيسية', NULL, NULL),
(17, 'الاقسام', NULL, NULL),
(18, 'اقسام الاضافات', NULL, NULL),
(19, 'الاضافات', NULL, NULL),
(20, 'صور العرض', NULL, NULL),
(21, 'الكوبونات', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_token`
--

CREATE TABLE `phone_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('ios','android') COLLATE utf8mb4_unicode_ci DEFAULT 'android',
  `phone_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_token`
--

INSERT INTO `phone_token` (`id`, `user_id`, `type`, `phone_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'android', '11', '2023-10-08', '2023-10-08'),
(2, 2, 'android', '11', '2023-10-08', '2023-10-08'),
(4, 2, 'android', '12344444444444444', '2023-10-08', '2023-10-08'),
(5, 1, 'android', '12344444444444444', '2023-10-08', '2023-10-08'),
(7, 5, 'android', '11', '2023-10-13', '2023-10-13'),
(8, 6, 'android', '11', '2023-10-13', '2023-10-13'),
(9, 7, 'android', 'cCtrBt9jTGW9M2B_vXGGXP:APA91bHZdpISJatVepM50eMuBFyQmoch2O1Vo5fTf_15qXNJMHikvOBUnd4FC0ibbhilm3oPxUpKle9ZGP25u33RGDjgkVpjETmiLhWA5kFaZ2oL0ub2Iw7y3YUpY8pxYH6M1Z2EYRGG', '2023-10-13', '2023-10-13'),
(10, 7, 'android', '12344444444444444', '2023-10-13', '2023-10-13'),
(14, 10, 'android', 'ebjitig3R3a3LxFV6aam3m:APA91bGkBw08UN9V8684VV5VAkuhcwiy92JhxglEzcEHjlAypTJQJSa4LJU3LdXqMQyOOwnO9_zC245a9ZPUUEM_AXvowR9v6hJVxnRL58kFPyStIohGi95Jvanv1yDKxSiLmn4Sqook', '2023-10-14', '2023-10-14'),
(18, 10, 'android', '12344444444444444', '2023-10-14', '2023-10-14'),
(19, 10, 'android', 'fztpKwvTQ46fMpzFFJvJOu:APA91bGOleCLk0N3yhmN76WVCr2ZV5b4-RH29FlzqwKpiPw1vF19_Y_Ki_pqexh0Ocsl_5WSsFiLiv9U0UUqGqyUI_p0bceXj3gHRM65hJ7_hbWWhVZV5XQsh7-R95PQxE0IASoGsfir', '2023-10-14', '2023-10-14'),
(20, 5, 'android', '12344444444444444', '2023-10-14', '2023-10-14'),
(22, 10, 'android', 'efOTUegdR0GVDXwCdSthNK:APA91bEBBKQWy7Zx2G8yuMs2tAKdNbdpsDopIfUSPNRdekPeDo9_HnN6OQHT5RBXd5K7FuGXGOi9rw17njaTHtbkmzvAfrAghRITz9wBR318qYKZhdI_tiBfkUUnJd5s2mFZ_R_cs-T8', '2023-10-14', '2023-10-14'),
(24, 11, 'android', '12344444444444444', '2023-10-14', '2023-10-14'),
(25, 10, 'android', 'dZ6aozJuTaiWHqYG8fbN2T:APA91bHcbLru6_-eL9gdGH9FIJHDP9QvGVpv7K60BttB3el0mUMjl4_IRCI-XHwB-oXABE9ez3TY23NPH7PiUPB97neAaHdbVh_6RnzHqx7J-lEGViiMFaeNp3OsPq8IADojqt0VBqao', '2023-10-14', '2023-10-14'),
(28, 10, 'android', '12', '2023-10-14', '2023-10-14'),
(29, 10, 'android', 'c5zGMNgUQCqMSHSMGrQho1:APA91bEHWQJXW04cUooxyFy2GdMx0PznKY1cbzVyCsSQOEGHDuG67b34-Q1hKgjWMtf0OsPEty-qnLbeQEzT0BYw1SKql3QTGpHRK4GJxJBuzNQdt9mIAi6N-Q-T6d1ojx1FaS07fLpB', '2023-10-14', '2023-10-14'),
(30, 10, 'android', 'cwzmtAqKSne2IO03qjdgI9:APA91bFRq3mGB3OK0qSpvRL2kyph0INrZehTiVFaftQ9NM2dO8KYewY-TocPp-0fZQmnZpVEccU1MyZ50Hs8sbLvQXX7dzFtUGgrVyD6Qls0HvI9Wad0VSfB8t1vgZN4uijuTr5HoKsE', '2023-10-14', '2023-10-14'),
(31, 10, 'android', 'ee-U3VKFQlOEMV--XAkjk5:APA91bE0sgtN-2zDFFB4AAAg59jp-94RdGUytwIpw_qpa1KcmoNbWomgkd_9LIq6HfeICni4I7p8U6n8SKdkq_wVU-M887dO3JmCQLoCmdO4uMVYRzAkkRVWUi1de3BPTjF5sQBO1bUC', '2023-10-14', '2023-10-14'),
(32, 10, 'android', 'dBEFO9KCRRag-ckPL8O9dH:APA91bEavaE0NcR81wIeW-oJgTPM_t0tA51OED6ZHPtfkRzHJYudXBGQcmxIE4_OzB6BS0BtSoU-SdYW-8ot4z0GpTI8gYzWeSA2T0Hc7k3LYZJGVw80VS3K4Nvrsdq0XJk7xnZhOpuQ', '2023-10-16', '2023-10-16'),
(34, 10, 'android', 'dkX13yhMTaCEPC1Y_9DH0G:APA91bEG9nCq5sOQPj9toaexeoR_x5VKLNaI4bGgfyB_lXEfiOXS5gGdSx0a7z9a7mwEn7guNhk2-bWUqsXN4xPuJFCWiJlxaV8RoC7h4_CdyRw9iVqY8YA7wVsBeOozkFleLX7N8GVD', '2023-10-18', '2023-10-18'),
(37, 10, 'android', 'f6ZWXbKpRfuvfy3fu515yU:APA91bGUlAT1cPDRuNPXIiTZqxFp1oZxcxit_VaY6YqpMPWsgyPZ2n8XGo576cm_8bZutgZ-VA3ZGRRHDshJzgIv9zhyEwm0HjRnL-eFbij4xSsCbZcxR5hZJzKylDkTGH2aL7vdzoIN', '2023-10-22', '2023-10-22'),
(42, 9, 'android', 'cXMzR5uxQGSf8NOWK75diK:APA91bEYM1KxzcllzX3OC7L8QZ7ZAa8GCnTpiCjKdiPTNnnwOFFMwdexTjvh5iHimSbdBSxBVOwrrW9zpbSMFGGmQxNIqWEgo72HUqWRTxNx9QuElyQdMIMoaxfl7chjE5Dcp7mdCk0Z', '2023-11-14', '2023-11-14'),
(43, 9, 'android', '12', '2023-11-14', '2023-11-14'),
(44, 9, 'android', 'cwzmtAqKSne2IO03qjdgI9:APA91bFRq3mGB3OK0qSpvRL2kyph0INrZehTiVFaftQ9NM2dO8KYewY-TocPp-0fZQmnZpVEccU1MyZ50Hs8sbLvQXX7dzFtUGgrVyD6Qls0HvI9Wad0VSfB8t1vgZN4uijuTr5HoKsE', '2023-11-14', '2023-11-14'),
(47, 9, 'android', 'fzXFsjjkQSC3Yl0NRnQQ8o:APA91bFSt2m4IIzQX2JCNMj2KEjkmUwXNBtHg-BH-R_9Uf58F4yEvmaXtLjwqnPfhq9uXyuISvFeHRGygfJ2cG3MmEJtPYQL-6SvVu7QwdvRnljV42zdF8UFIkAgQ7JUvBkeENOgELQR', '2023-11-14', '2023-11-14'),
(48, 9, 'android', 'fn50yzclSEG6wmUEv6Y6jA:APA91bE3v8K32IMTW8hVLW_JQ2Qke4u22WehgpDGCAb99xn0CJtAkO5BRYPwe6tXB-cw5_SVHud3AIkqdOXFkbfbsvL6WxXP9Tl83Mnfk_kf-iNxiwVqkxzEOJK8R9SJyshllyidVYlh', '2023-11-14', '2023-11-14'),
(49, 9, 'android', 'ci9GdginTk6Ukjej335xd-:APA91bHQH3WLW5ZgEmUkXcxUbmmGQwWbQVeSZJo1KaOuz0Yz0CWKpZUCaMIdc2QKErrrzNfqLggE-tnDJadcKnIhAHeRpHneU9y9CJq_ag4XCScw7QoGMSwh3sgp09P4pxIUYtjG3p3a', '2023-11-14', '2023-11-14'),
(52, 9, 'android', 'fTaAcDvmQFa53gfDTaYzX-:APA91bHgSqZDeElwkOWWtLokySWS5NcG-aJQtgmeKkFwsIIf6oet3jz1BmeZr_xSZWnwrajQE0xkZ213MT34fhjtYnKZO2EpmZN5lcEC384w8aMyVWHrI7iSuANUEy1xULKQEam0haQy', '2023-11-16', '2023-11-16'),
(56, 11, 'android', 'ee2oWjbzRzGVdgWF25Sm5d:APA91bGI8N3YX6GzX6clxNkvdL8v2LAeL0fpjegV7vowHRPjy5mTu0IcmoHEtJBoDjRX04mT-seKW5RgfIRnwksfpaEZRxFW7smZieR_cGoLyVyFbkjDSiBkV9rSURDm5UblNTuL-jXT', '2023-11-19', '2023-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_price` tinyint(2) DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_ad` tinyint(2) DEFAULT '0',
  `is_chat` tinyint(2) DEFAULT '0',
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `station_size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lenght` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `islands_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_95` tinyint(2) DEFAULT '0',
  `is_diesel` tinyint(2) DEFAULT '0',
  `age` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oil_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oil_size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bencher_size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grocery_size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stalls_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `electric_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civil_defense_license` tinyint(2) DEFAULT '0',
  `municipal_license` tinyint(2) DEFAULT '0',
  `tank_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tank_size` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `important_point` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licence_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_width` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pumb_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `for_rent` tinyint(2) NOT NULL DEFAULT '0',
  `developed` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `user_id`, `area_id`, `city_id`, `category_id`, `sub_category_id`, `type`, `price`, `show_price`, `image`, `has_ad`, `is_chat`, `whatsapp`, `phone`, `latitude`, `longitude`, `street`, `station_size`, `lenght`, `islands_no`, `is_95`, `is_diesel`, `age`, `oil_no`, `oil_size`, `bencher_size`, `grocery_size`, `stalls_no`, `others`, `room_no`, `electric_no`, `civil_defense_license`, `municipal_license`, `tank_no`, `tank_size`, `time_period`, `important_point`, `limit`, `video`, `video_cover`, `publisher_type`, `street_type`, `direction`, `licence_number`, `plan_id`, `area_number`, `street_width`, `pumb_number`, `for_rent`, `developed`, `created_at`, `updated_at`) VALUES
(32, 'محطة للايجار', 'محطة متكاملة من كل الاركان', 10, 3, 1, 6, 6, 'user', '0', 0, 'https://harajstations.com/uploads/productImage/41411699926528.png', 1, 1, '738383', '8373737', NULL, NULL, '5836', '5836', '5836', '5836', 1, 1, '5836', '5836', '5836', '5836', '5836', '5836', 'الاكشاك الدرايف ثروصرافهبنشر', '5836', '5836', 0, 0, '5836', '5836', '5836', '5836', '5836', NULL, NULL, 'مكتب عقار', 'تجاري', 'الشمال', '5836', '5836', '5836', '5836', '5836', 0, 0, '2023-11-13 22:48:48', '2023-11-13 22:49:09'),
(35, 'محطة القطار', 'محطة القطار بالقرب من شارع العليا\nمحطة القطار', 9, 4, 1, 7, 11, 'user', '200', 1, 'https://harajstations.com/uploads/productImage/97281700123722.png', 0, 1, NULL, NULL, '0.0', '0.0', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-11-14 11:28:58', '2023-11-16 05:35:22'),
(40, 'محطة الدريس', 'محطة الدريس بالقرب من شارع العليا\n\nمحطة الدريس للخدمات\n\nمحطة الدريس بها مميزات كثيرة منها\n\n1 اربعة ترومبات\n2 ثلاث خزانات\n3 بنشر\n4 مغسلة\n5 تموينات', 9, 3, 1, 6, 6, 'user', '10000000', 1, 'https://harajstations.com/uploads/productImage/29151700123474.png', 0, 1, '0546349264', '546349264', '24.68240598620842', '46.68950568884611', 'العليا', '950متر', '950متر', NULL, 0, 0, '950متر', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '950متر', NULL, NULL, NULL, NULL, 'مالك', NULL, NULL, NULL, NULL, NULL, NULL, '950متر', 1, 1, '2023-11-16 05:31:14', '2023-11-16 05:31:14'),
(42, 'te', 'tew', 10, 4, 1, 6, 6, 'user', '50', 1, 'https://harajstations.com/uploads/productImage/69181700237677.png', 0, 1, NULL, NULL, '37.4226711', '-122.0849872', 'te', 'te', 'te', NULL, 0, 0, 'te', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 'te', NULL, NULL, NULL, NULL, 'مالك', NULL, NULL, NULL, NULL, NULL, NULL, 'te', 1, 1, '2023-11-17 13:14:36', '2023-11-17 13:14:37'),
(43, 'te', 'tes', 11, 3, 1, 7, 11, 'user', '50', 1, 'https://harajstations.com/uploads/productImage/40001700352931.png', 0, 1, NULL, NULL, '37.42155724467433', '-122.084018625319', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-11-19 00:15:31', '2023-11-19 00:15:31'),
(44, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 11, 4, 1, 8, 16, 'user', '100', 1, NULL, 0, 1, '12346', '12234', '12', '34', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-11-19 09:25:02', '2023-11-19 09:25:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(14, 32, 10, 'المحطة تعمل بشكل جيد جدا', '2023-11-13 22:49:40', '2023-11-13 22:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(33, 32, 'uploads/productImage/41411699926528.png', '2023-11-13 22:48:48', '2023-11-13 22:48:48'),
(43, 40, 'uploads/productImage/29151700123474.png', '2023-11-16 05:31:14', '2023-11-16 05:31:14'),
(44, 35, 'uploads/productImage/97281700123722.png', '2023-11-16 05:35:22', '2023-11-16 05:35:22'),
(45, 35, 'uploads/productImage/41831700123722.png', '2023-11-16 05:35:22', '2023-11-16 05:35:22'),
(47, 42, 'uploads/productImage/69181700237677.png', '2023-11-17 13:14:37', '2023-11-17 13:14:37'),
(48, 43, 'uploads/productImage/40001700352931.png', '2023-11-19 00:15:31', '2023-11-19 00:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_replies`
--

CREATE TABLE `product_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_replies`
--

INSERT INTO `product_replies` (`id`, `user_id`, `comment_id`, `reply`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 'بالفعل جيد جدا', '2023-10-13 19:01:18', '2023-10-13 19:01:18');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate1` double NOT NULL DEFAULT '0',
  `rate2` double NOT NULL DEFAULT '0',
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `product_id`, `user_id`, `rate1`, `rate2`, `comment`, `created_at`, `updated_at`) VALUES
(1, 32, 10, 4, 5, 'جيدة جدا', NULL, NULL),
(2, 35, 10, 5, 5, 'ممتاز', '2023-11-16 02:55:25', '2023-11-16 02:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fav_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci,
  `privacy` text COLLATE utf8mb4_unicode_ci,
  `about` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `fav_icon`, `whatsapp`, `phone`, `terms`, `privacy`, `about`, `created_at`, `updated_at`) VALUES
(1, 'uploads/setting/6471700088100.png', 'uploads/setting/7921700088100.png', '1004834728', '1004834728', '<p>شروك و احكام <em><strong><span style=\"color:#c0392b\">حراج للسيارات</span></strong></em></p>\r\n\r\n<div id=\"gtx-trans\" style=\"left:456px; position:absolute; top:37.6667px\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', '<p>سياسة و خصوصية&nbsp;<em><strong><span style=\"color:#c0392b\">حراج للسيارات</span></strong></em></p>\r\n\r\n<div id=\"gtx-trans\" style=\"left:1069px; position:absolute; top:-5.77778px\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>', '<p><em><strong><span style=\"color:#c0392b\">حراج للسيارات&nbsp;</span></strong></em>شركة متخصصة فى الاعلانات&nbsp;</p>', NULL, '2023-11-15 19:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name_ar`, `name_en`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(5, 'محطات للبيع', 'محطات للبيع', NULL, 6, '2023-10-14 12:22:12', '2023-10-14 12:22:12'),
(6, 'محطات للاجار', 'محطات للاجار', NULL, 6, '2023-10-14 12:22:22', '2023-10-14 12:22:22'),
(7, 'اراضي مرخصة', 'اراضي مرخصة', NULL, 6, '2023-10-14 12:22:33', '2023-10-14 12:22:33'),
(8, 'اراضي تجارية', 'اراضي تجارية', NULL, 6, '2023-10-14 12:22:47', '2023-10-14 12:22:47'),
(9, 'اراضي استثمار', 'اراضي استثمار', NULL, 6, '2023-10-14 12:22:57', '2023-10-14 12:22:57'),
(10, 'طرمبات', 'طرمبات', NULL, 7, '2023-10-14 12:23:36', '2023-10-14 12:23:36'),
(11, 'قطع غيار', 'قطع غيار', NULL, 7, '2023-10-14 12:23:51', '2023-10-14 12:23:51'),
(12, 'اجهزة تمديدات', 'اجهزة تمديدات', NULL, 7, '2023-10-14 12:24:01', '2023-10-14 12:24:01'),
(13, 'ادوات سلامة', 'ادوات سلامة', NULL, 7, '2023-10-14 12:24:13', '2023-10-14 12:24:13'),
(14, 'اخرى', 'اخرى', NULL, 7, '2023-10-14 12:24:22', '2023-10-14 12:24:22'),
(15, 'بنشر', 'بنشر', NULL, 8, '2023-10-14 12:24:55', '2023-10-14 12:24:55'),
(16, 'غسيل سيارات', 'غسيل سيارات', NULL, 8, '2023-10-14 12:25:08', '2023-10-14 12:25:08'),
(17, 'غيار الزيت', 'غيار الزيت', NULL, 8, '2023-10-14 12:25:18', '2023-10-14 12:25:18'),
(18, 'ورش', 'ورش', NULL, 8, '2023-10-14 12:25:28', '2023-10-14 12:25:28'),
(19, 'تاهيل تطوير وصيانة', 'تاهيل تطوير وصيانة', NULL, 9, '2023-10-14 12:26:10', '2023-10-14 12:26:10'),
(20, 'بناء الكلادنج', 'بناء الكلادنج', NULL, 13, '2023-10-14 12:27:15', '2023-10-14 12:27:15'),
(21, 'سباكة', 'سباكة', NULL, 13, '2023-10-14 12:27:24', '2023-10-14 12:27:24'),
(22, 'كهرباء', 'كهرباء', NULL, 13, '2023-10-14 12:27:49', '2023-10-14 12:27:49'),
(23, 'تلياس', 'تلياس', NULL, 13, '2023-10-14 12:27:55', '2023-10-14 12:27:55'),
(24, 'بلاط', 'بلاط', NULL, 13, '2023-10-14 12:28:06', '2023-10-14 12:28:06'),
(25, 'صيانة', 'صيانة', NULL, 13, '2023-10-14 12:28:15', '2023-10-14 12:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(2) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_panner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_latitude` double DEFAULT NULL,
  `company_longitude` double DEFAULT NULL,
  `company_description` text COLLATE utf8mb4_unicode_ci,
  `company_whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_insta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_tiktok` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_code`, `phone`, `email_verified_at`, `password`, `email`, `image`, `type`, `verified`, `views`, `rate`, `company_name`, `company_username`, `company_image`, `company_panner`, `company_latitude`, `company_longitude`, `company_description`, `company_whatsapp`, `company_phone`, `company_insta`, `company_facebook`, `company_tiktok`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'احمد', '966', '546349264', NULL, '$2y$10$cizzflmmbChXPaCM2QMFTO1CZGwG5D9FEEX91wdOAFAuRn2JN5TOG', NULL, 'uploads/user/5741697269667.png', NULL, 1, 47, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-14 04:47:47', '2023-11-17 13:20:39'),
(10, 'Ahmed2', '966', '570429894', NULL, '$2y$10$TYc186QVQ/2dqrsaoLuagO2kAgq4KxkfKT9Uul9bn1T1gCXMSvj7u', NULL, 'uploads/user/68861697294036.png', 'user', 0, 174, 0, 'Ahmed', '@ahmed_ahmed', '/tmp/phpSCDPxl', '/tmp/phpxJCW9q', 37.42326402630814, -122.08565443754196, 'test', NULL, NULL, NULL, NULL, 'tiktok link', NULL, '2023-10-14 05:11:18', '2023-11-19 00:16:02'),
(11, 'Station', '966', '123456789', NULL, '$2y$10$gxUR00YQnHALdY6b4fZsxuAjpEfXZRnhaWTUo.augQwJqhVpEDv4m', 'hamza@hamza.com', 'uploads/user/56851700352887.png', 'user', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-19 00:14:47', '2023-11-19 00:14:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_packages`
--

CREATE TABLE `user_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_packages`
--

INSERT INTO `user_packages` (`id`, `package_id`, `start_date`, `end_date`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-10-13', '2023-11-13', 2, '2023-10-13 19:56:02', '2023-10-13 19:56:02'),
(3, 9, '2023-10-13', '2023-11-13', 7, '2023-10-13 19:56:02', '2023-10-13 19:56:02'),
(7, 5, '2023-10-14', '2024-03-14', 10, '2023-10-14 13:51:11', '2023-10-14 13:51:11'),
(8, 7, '2023-10-21', '2024-05-21', 10, '2023-10-21 10:45:57', '2023-10-21 10:45:57'),
(9, 1, '2023-10-23', '2023-11-23', 10, '2023-10-23 06:46:40', '2023-10-23 06:46:40'),
(10, 1, '2023-11-13', '2023-12-13', 11, '2023-11-13 18:38:19', '2023-11-13 18:38:19'),
(11, 2, '2023-11-13', '2024-01-13', 11, '2023-11-13 19:59:39', '2023-11-13 19:59:39'),
(12, 9, '2023-11-13', '2024-08-13', 10, '2023-11-13 20:02:32', '2023-11-13 20:02:32'),
(13, 1, '2023-11-14', '2023-12-14', 10, '2023-11-13 22:34:58', '2023-11-13 22:34:58'),
(14, 1, '2023-11-14', '2023-12-14', 10, '2023-11-13 22:36:08', '2023-11-13 22:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_rates`
--

CREATE TABLE `user_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rated_user_id` bigint(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_rates`
--

INSERT INTO `user_rates` (`id`, `user_id`, `rated_user_id`, `rate`, `comment`, `created_at`, `updated_at`) VALUES
(4, 10, 9, 4, 'منتج جيد جدا', '2023-10-12 18:31:49', '2023-10-12 18:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `verify_accounts`
--

CREATE TABLE `verify_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verify_account_images`
--

CREATE TABLE `verify_account_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_Per_per` (`permission_id`),
  ADD KEY `ad_per_admin_ID16` (`admin_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_foreign` (`city_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_product_id_foreign` (`product_id`),
  ADD KEY `chats_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourates`
--
ALTER TABLE `favourates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourates_product_id_foreign` (`product_id`),
  ADD KEY `favourates_user_id_foreign` (`user_id`);

--
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followings_product_id_foreign` (`product_id`),
  ADD KEY `followings_follower_user_id_foreign` (`follower_user_id`),
  ADD KEY `followings_following_user_id_foreign` (`following_user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `per_sec_id` (`section_id`);

--
-- Indexes for table `permission_sections`
--
ALTER TABLE `permission_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_token`
--
ALTER TABLE `phone_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client45494_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_area_id_foreign` (`area_id`),
  ADD KEY `products_city_id_foreign` (`city_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_replies`
--
ALTER TABLE `product_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_replies_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rates_product_id_foreign` (`product_id`),
  ADD KEY `rates_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rates`
--
ALTER TABLE `user_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_accounts`
--
ALTER TABLE `verify_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `verify_account_images`
--
ALTER TABLE `verify_account_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_account_images_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourates`
--
ALTER TABLE `favourates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `permission_sections`
--
ALTER TABLE `permission_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_token`
--
ALTER TABLE `phone_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_replies`
--
ALTER TABLE `product_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_rates`
--
ALTER TABLE `user_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `verify_accounts`
--
ALTER TABLE `verify_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verify_account_images`
--
ALTER TABLE `verify_account_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD CONSTRAINT `ad_Per_per` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ad_per_admin_ID16` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favourates`
--
ALTER TABLE `favourates`
  ADD CONSTRAINT `favourates_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followings`
--
ALTER TABLE `followings`
  ADD CONSTRAINT `followings_follower_user_id_foreign` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followings_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `per_sec_id` FOREIGN KEY (`section_id`) REFERENCES `permission_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD CONSTRAINT `product_comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_replies`
--
ALTER TABLE `product_replies`
  ADD CONSTRAINT `product_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `product_comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verify_accounts`
--
ALTER TABLE `verify_accounts`
  ADD CONSTRAINT `verify_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verify_account_images`
--
ALTER TABLE `verify_account_images`
  ADD CONSTRAINT `verify_account_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
