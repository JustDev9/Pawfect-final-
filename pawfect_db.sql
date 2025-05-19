-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2025 at 03:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pawfect_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the login record',
  `user_id` int(11) DEFAULT NULL COMMENT 'Foreign key referencing users.id (nullable for failed logins)',
  `email` varchar(255) NOT NULL COMMENT 'Email used during login attempt',
  `ip_address` varchar(45) NOT NULL COMMENT 'IP address of the client',
  `user_agent` text DEFAULT NULL COMMENT 'User agent string from the browser/device',
  `status` enum('success','failed') NOT NULL COMMENT 'Result of login attempt',
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Login attempt timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tracks user login attempts and history';

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `user_id`, `email`, `ip_address`, `user_agent`, `status`, `attempt_time`) VALUES
(1, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:21:29'),
(2, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:25:49'),
(3, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:28:29'),
(4, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:32:17'),
(5, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:33:54'),
(6, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:37:53'),
(7, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:38:06'),
(8, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:39:45'),
(9, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:41:08'),
(10, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:46:32'),
(11, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:46:43'),
(12, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:52:39'),
(13, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:53:02'),
(14, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:53:03'),
(15, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:53:04'),
(16, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:53:05'),
(17, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:54:42'),
(18, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 10:56:58'),
(19, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 11:02:46'),
(20, 2, 'JohnDoe@email.com', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'success', '2025-05-19 11:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the user',
  `name` varchar(100) NOT NULL COMMENT 'Full name of the user',
  `email` varchar(255) NOT NULL COMMENT 'Email address, must be unique',
  `password` varchar(255) NOT NULL COMMENT 'Hashed user password',
  `role` enum('user','admin','staff') DEFAULT 'user' COMMENT 'Role of the user in the system',
  `status` enum('active','inactive','suspended') DEFAULT 'active' COMMENT 'Current account status',
  `email_verified` tinyint(1) DEFAULT 0 COMMENT 'Email verification status',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'User creation timestamp',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'User last update timestamp',
  `last_login` timestamp NULL DEFAULT NULL COMMENT 'Timestamp of last login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores user account information';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `email_verified`, `created_at`, `updated_at`, `last_login`) VALUES
(1, 'Admin User', 'admin@pawfect.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active', 1, '2025-05-19 09:27:09', '2025-05-19 09:27:09', NULL),
(2, 'Jhon Doe', 'JohnDoe@email.com', '$2y$10$74pYRyZRHwlK/Krngc/D/eKRJNv4n7XDU/SJ0lHdMDvnYEThwC72K', 'user', 'active', 0, '2025-05-19 10:15:14', '2025-05-19 11:03:52', '2025-05-19 11:03:52'),
(3, 'Justin Del Rosario', 'justin@email.com', '$2y$10$U/aTVqIOZy3pg2lyss7c1uAoQen0QwTyPBpZSqVZwn6YNSuQuqAXG', 'user', 'active', 0, '2025-05-19 10:18:55', '2025-05-19 10:18:55', NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_user_insert_all` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO user_preferences (user_id) VALUES (NEW.id);
    INSERT INTO user_profiles (user_id) VALUES (NEW.id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL COMMENT 'Primary key for preferences',
  `user_id` int(11) NOT NULL COMMENT 'One-to-one link to users.id',
  `notification_enabled` tinyint(1) DEFAULT 1 COMMENT 'Enable or disable notifications',
  `email_notifications` tinyint(1) DEFAULT 1 COMMENT 'Email notification setting',
  `theme` varchar(20) DEFAULT 'light' COMMENT 'User-selected theme',
  `language` varchar(10) DEFAULT 'en' COMMENT 'Language preference',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Preferences creation timestamp',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Preferences last updated timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores user preferences and settings';

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `notification_enabled`, `email_notifications`, `theme`, `language`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 'light', 'en', '2025-05-19 10:15:14', '2025-05-19 10:15:14'),
(2, 3, 1, 1, 'light', 'en', '2025-05-19 10:18:55', '2025-05-19 10:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the user profile',
  `user_id` int(11) NOT NULL COMMENT 'Foreign key referencing users.id',
  `phone_number` varchar(20) DEFAULT NULL COMMENT 'User phone number',
  `address` text DEFAULT NULL COMMENT 'User address',
  `city` varchar(100) DEFAULT NULL COMMENT 'User city',
  `state` varchar(100) DEFAULT NULL COMMENT 'User state',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Postal code',
  `country` varchar(100) DEFAULT 'Philippines' COMMENT 'User country',
  `profile_picture` varchar(255) DEFAULT NULL COMMENT 'URL to profile picture',
  `bio` text DEFAULT NULL COMMENT 'Short biography or description',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Profile creation timestamp',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Profile last update timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores additional user profile information';

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `profile_picture`, `bio`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, 'Philippines', NULL, NULL, '2025-05-19 10:15:14', '2025-05-19 10:15:14'),
(2, 3, NULL, NULL, NULL, NULL, NULL, 'Philippines', NULL, NULL, '2025-05-19 10:18:55', '2025-05-19 10:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL COMMENT 'Primary key for the token',
  `user_id` int(11) NOT NULL COMMENT 'Foreign key referencing users.id',
  `token` varchar(64) NOT NULL COMMENT 'Unique token string',
  `token_type` enum('auth','password_reset','email_verification') NOT NULL COMMENT 'Type of token',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Token creation time',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Token expiration time (nullable to avoid default error)',
  `is_used` tinyint(1) DEFAULT 0 COMMENT 'Flag if the token has been used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Stores authentication and verification tokens';

--
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `token`, `token_type`, `created_at`, `expires_at`, `is_used`) VALUES
(1, 2, '6155aee2b669306f801d78bf41c6065d03b5171713f80463586936b2b443567d', 'email_verification', '2025-05-19 10:15:14', '2025-05-20 10:15:14', 0),
(2, 3, 'ab581f7abfb81de9bd6b0b0a3942766769fe2bc0bc40f7dc172a72b4d5cab365', 'email_verification', '2025-05-19 10:18:55', '2025-05-20 10:18:55', 0),
(3, 2, '0a83b9f408c2d95d2128242f45a0dd43fd83781e0f4de27572fe3d8abec277b4', 'auth', '2025-05-19 10:21:29', '2025-05-20 10:21:29', 0),
(4, 2, '88ce39d2e48864aa35a044e20ef97567fa59ca6e5c65152d0cba728a332e75c7', 'auth', '2025-05-19 10:25:49', '2025-05-20 10:25:49', 0),
(5, 2, 'b029c98371c23628003927f68b9386a924365d073247dfc7ec37be57b6e1add0', 'auth', '2025-05-19 10:28:29', '2025-05-20 10:28:29', 0),
(6, 2, '9f8a78ebf8fac24ae1052d5ceae058d2b3ad1cc60ed689bc112b6398cdd08264', 'auth', '2025-05-19 10:32:17', '2025-05-20 10:32:17', 0),
(7, 2, '02675a40132d9b6ff26479ffaad2c5c9a1f0bd919c8bb919bc721aff8d0ac64a', 'auth', '2025-05-19 10:33:54', '2025-05-20 10:33:54', 0),
(8, 2, '53d5a93af721441ad7949c607404ae03047bd03ee0161d880c3145dab773c4a4', 'auth', '2025-05-19 10:37:53', '2025-05-20 10:37:53', 0),
(9, 2, '0f0cfbaa9aeb77987129184225d716a1763ccc755792c67648a3548be0885ef0', 'auth', '2025-05-19 10:38:06', '2025-05-20 10:38:06', 0),
(10, 2, '47a7805343e95ffff085dcca4ec5c5920b4090015668cbdf3474377fa310570d', 'auth', '2025-05-19 10:39:45', '2025-05-20 10:39:45', 0),
(11, 2, '269837e0ec6c360a55553cdc95c77036090ca73e4313f793fbbceda1954ac6ce', 'auth', '2025-05-19 10:41:08', '2025-05-20 10:41:08', 0),
(12, 2, 'f7f0a9c380eacd4dd8c5c6843b5963a3c2c97540917fd79a0f89724a658a2ad4', 'auth', '2025-05-19 10:46:32', '2025-05-20 10:46:32', 0),
(13, 2, '0975eb138bce05d1d0073dc0600a8a966e1649791fb0af7f30fe6e96cc90e4b3', 'auth', '2025-05-19 10:46:43', '2025-05-20 10:46:43', 0),
(14, 2, 'a4507414dc9c62d7545854903e15a1581d00588c45801c88e7dc124dd4b53ee1', 'auth', '2025-05-19 10:52:39', '2025-05-20 10:52:39', 0),
(15, 2, '8caa1083341d3ea33dff67fc7bc66543fad672e61f1600f32e9456c01aea8de6', 'auth', '2025-05-19 10:53:02', '2025-05-20 10:53:02', 0),
(16, 2, 'a681d846a965a405243b5164dd757e355938cdfe23104a4ab1c1866261888dbc', 'auth', '2025-05-19 10:53:03', '2025-05-20 10:53:03', 0),
(17, 2, 'b17d89690c5bf89f11d43b2e0f6a68cb12512d89f0109c2f9884a4ca64d11f47', 'auth', '2025-05-19 10:53:04', '2025-05-20 10:53:04', 0),
(18, 2, '3abe3ce0b7669709d2808b61f8c5c7a0d21f33d16f6d9b4b520a7ebfc2efc25c', 'auth', '2025-05-19 10:53:05', '2025-05-20 10:53:05', 0),
(19, 2, 'a6886eb768472d90d11d5fc8afbea4a63fa3033b9377673f6a9b87f5ae0ab9fa', 'auth', '2025-05-19 10:54:42', '2025-05-20 10:54:42', 0),
(20, 2, '004bdc6e696396b967cca7344539f4f51003e60f94352be4a86cb4dbcc819f01', 'auth', '2025-05-19 10:56:58', '2025-05-20 10:56:58', 0),
(21, 2, 'a7e76e2bf6750edac23b23eea2e2f1f473e504bc3e5c080e2fdc88afe3889812', 'auth', '2025-05-19 11:02:46', '2025-05-20 11:02:46', 0),
(22, 2, '4316888bb23d2a53617d037b39febe9263a4b28ec2b77b47591b695caf9d97ad', 'auth', '2025-05-19 11:03:52', '2025-05-20 11:03:52', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_login_attempt` (`attempt_time`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_user_created` (`created_at`),
  ADD KEY `idx_user_updated` (`updated_at`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_token_type` (`token_type`),
  ADD KEY `idx_token_expires` (`expires_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the login record', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the user', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for preferences', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the user profile', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for the token', AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
