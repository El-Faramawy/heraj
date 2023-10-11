-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2023 at 11:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heraj`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name_ar`, `name_en`, `city_id`, `created_at`, `updated_at`) VALUES
(3, 'منوف', 'menouf', 1, NULL, NULL),
(4, 'البتانون', 'betanoun', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `image`, `created_at`, `updated_at`) VALUES
(3, 'شيبسى', 'shepsi', NULL, NULL, NULL),
(4, 'بيبسى', 'pepsi', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `message_from` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `product_id`, `user_id`, `message`, `message_from`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'test', 'user', NULL, NULL),
(2, 1, 1, 'test', 'seller', NULL, NULL),
(3, 1, 1, 'test', 'user', NULL, NULL),
(4, 1, 1, 'test', 'user', NULL, NULL),
(5, 1, 1, 'test message', 'user', '2023-10-08 18:33:52', '2023-10-08 18:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_ar`, `name_en`, `created_at`, `updated_at`) VALUES
(1, 'المنوفية', 'menofia', NULL, NULL),
(2, 'القاهرة', 'cairo', NULL, NULL);

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
(1, 1, 1, '2023-10-08 18:06:55', '2023-10-08 18:06:55'),
(2, 1, 2, '2023-10-08 18:06:55', '2023-10-08 18:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `follower_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `following_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `product_id`, `follower_user_id`, `following_user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL),
(3, 1, 2, NULL, '2023-10-09 17:43:11', '2023-10-09 17:43:11');

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
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_read` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 'test not', 1, NULL, '2023-10-08 18:03:23'),
(2, 1, 'test', 'test not', 1, NULL, '2023-10-08 18:03:23');

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
-- Table structure for table `phone_token`
--

CREATE TABLE `phone_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('ios','android') DEFAULT 'android',
  `phone_token` varchar(255) NOT NULL,
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
(5, 1, 'android', '12344444444444444', '2023-10-08', '2023-10-08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) DEFAULT 'user',
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `has_ad` tinyint(2) DEFAULT 0,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `user_id`, `area_id`, `city_id`, `category_id`, `sub_category_id`, `type`, `price`, `image`, `has_ad`, `whatsapp`, `phone`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/91061696797484.jpg', 0, '12346', '12234', '12', '34', '2023-10-08 17:38:04', '2023-10-08 17:38:04'),
(2, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/70301696797875.jpg', 1, '12346', '12234', '12', '34', '2023-10-08 17:44:35', '2023-10-08 17:44:35'),
(3, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/29231696797883.jpg', 0, '12346', '12234', '12', '34', '2023-10-08 17:44:43', '2023-10-08 17:44:44'),
(4, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/5631696797893.jpg', 1, '12346', '12234', '12', '34', '2023-10-08 17:44:53', '2023-10-08 17:44:54'),
(5, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/21671696798009.jpg', 0, '12346', '12234', '12', '34', '2023-10-08 17:46:49', '2023-10-08 17:46:49'),
(6, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'uploads/productImage/27841696798125.jpg', 0, '12346', '12234', '12', '34', '2023-10-08 17:48:45', '2023-10-08 17:48:45'),
(7, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'http://localhost/Heraj/public/uploads/productImage/21661696798222.jpg', 0, '12346', '12234', '12', '34', '2023-10-08 17:50:22', '2023-10-08 17:50:23'),
(8, 'شيبسى', 'شيبسى جامبو ب 10 جنيه', 1, 4, 1, 3, 2, 'user', '100', 'http://localhost/Heraj/public/uploads/productImage/61931696798310.png', 0, '12346', '12234', '12', '34', '2023-10-08 17:51:50', '2023-10-08 17:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`id`, `product_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 'منتج جيد جدا', '2023-10-09 17:46:57', '2023-10-09 17:46:57'),
(2, 1, 'منتج جيد جدا', '2023-10-09 17:47:40', '2023-10-09 17:47:40'),
(3, 1, 'منتج جيد جدا', '2023-10-09 17:48:27', '2023-10-09 17:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/productImage/91061696797484.jpg', '2023-10-08 17:38:04', '2023-10-08 17:38:04'),
(2, 2, 'uploads/productImage/70301696797875.jpg', '2023-10-08 17:44:35', '2023-10-08 17:44:35'),
(3, 3, 'uploads/productImage/29231696797883.jpg', '2023-10-08 17:44:43', '2023-10-08 17:44:43'),
(4, 4, 'uploads/productImage/5631696797893.jpg', '2023-10-08 17:44:53', '2023-10-08 17:44:53'),
(5, 5, 'uploads/productImage/21671696798009.jpg', '2023-10-08 17:46:49', '2023-10-08 17:46:49'),
(6, 6, 'uploads/productImage/27841696798125.jpg', '2023-10-08 17:48:45', '2023-10-08 17:48:45'),
(7, 7, 'uploads/productImage/21661696798222.jpg', '2023-10-08 17:50:22', '2023-10-08 17:50:22'),
(8, 8, 'uploads/productImage/61931696798310.png', '2023-10-08 17:51:50', '2023-10-08 17:51:50'),
(9, 8, 'uploads/productImage/91701696798310.png', '2023-10-08 17:51:50', '2023-10-08 17:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_replies`
--

CREATE TABLE `product_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_replies`
--

INSERT INTO `product_replies` (`id`, `comment_id`, `reply`, `created_at`, `updated_at`) VALUES
(1, 3, 'بالفعل جيد جدا', '2023-10-09 17:50:37', '2023-10-09 17:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate1` double NOT NULL DEFAULT 0,
  `rate2` double NOT NULL DEFAULT 0,
  `comment` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `product_id`, `user_id`, `rate1`, `rate2`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 4, 3, 'منتج جيد جدا', '2023-10-09 18:16:18', '2023-10-09 18:16:18'),
(2, 2, 2, 4, 3, 'منتج جيد جدا', '2023-10-09 18:19:22', '2023-10-09 18:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `fav_icon` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `privacy` text DEFAULT NULL,
  `about` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `fav_icon`, `whatsapp`, `phone`, `terms`, `privacy`, `about`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '123', '123', 'test', 'test', 'test', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name_ar`, `name_en`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'شيبسى صغير', 'small shepsi', NULL, 3, NULL, NULL),
(2, 'شيبسى كبير', 'large shepsi', NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_code` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `verified` tinyint(2) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `rate` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_code`, `phone`, `email_verified_at`, `password`, `image`, `type`, `verified`, `views`, `rate`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', '0020', '1004834728', NULL, '$2y$10$5XEPsk4AAeM0/A6QEOb/j.CSjeY65ts.ZOkeEEwVG0tnqnOgz4QzK', 'uploads/user/88291696797621.jpg', NULL, 1, 0, 0, NULL, '2023-10-08 17:40:21', '2023-10-08 17:40:21'),
(2, 'ahmed 2', '0020', '10048347281', NULL, '$2y$10$MASrpT.0JON4E27SjmLXBOo6ZLkbSlEzhF3vni2kzGHKZPS0VJH0u', NULL, NULL, 0, 0, 0, NULL, '2023-10-09 16:50:51', '2023-10-09 16:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `verify_accounts`
--

CREATE TABLE `verify_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_accounts`
--

INSERT INTO `verify_accounts` (`id`, `user_id`, `image1`, `image2`, `created_at`, `updated_at`) VALUES
(2, 2, 'uploads/VerifyAccount/55991696887498.png', 'uploads/VerifyAccount/11621696887498.png', '2023-10-09 18:38:18', '2023-10-09 18:38:18'),
(3, 2, 'uploads/VerifyAccount/87321696887540.png', 'uploads/VerifyAccount/14721696887540.png', '2023-10-09 18:39:00', '2023-10-09 18:39:00'),
(4, 2, 'uploads/VerifyAccount/9601696887568.png', 'uploads/VerifyAccount/65061696887568.png', '2023-10-09 18:39:28', '2023-10-09 18:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `verify_account_images`
--

CREATE TABLE `verify_account_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_account_images`
--

INSERT INTO `verify_account_images` (`id`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 2, 'uploads/VerifyAccountImage/87491696887498.png', '2023-10-09 18:38:18', '2023-10-09 18:38:18'),
(4, 2, 'uploads/VerifyAccountImage/10881696887498.png', '2023-10-09 18:38:18', '2023-10-09 18:38:18'),
(5, 2, 'uploads/VerifyAccountImage/91851696887540.png', '2023-10-09 18:39:00', '2023-10-09 18:39:00'),
(6, 2, 'uploads/VerifyAccountImage/97791696887540.png', '2023-10-09 18:39:00', '2023-10-09 18:39:00'),
(7, 2, 'uploads/VerifyAccountImage/92381696887568.png', '2023-10-09 18:39:28', '2023-10-09 18:39:28'),
(8, 2, 'uploads/VerifyAccountImage/41011696887568.png', '2023-10-09 18:39:28', '2023-10-09 18:39:28');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `cities`
--
ALTER TABLE `cities`
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
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

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
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourates`
--
ALTER TABLE `favourates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_token`
--
ALTER TABLE `phone_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_replies`
--
ALTER TABLE `product_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `verify_accounts`
--
ALTER TABLE `verify_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `verify_account_images`
--
ALTER TABLE `verify_account_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

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
