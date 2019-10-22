-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2019 at 05:00 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Admin', '2019-10-21 17:25:33', '2019-10-21 17:25:33'),
(2, 'Editor', '2019-10-21 17:25:47', '2019-10-21 17:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(55) UNSIGNED NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(255) UNSIGNED DEFAULT NULL,
  `active` int(55) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role_id`, `active`, `created`, `modified`) VALUES
(1, '123', '$2y$10$r32W1pfzE3VRBvl8Jru/pOJcZgrJmkhpQ1k4iMArdo5bpXgsgFfm2', 2, 1, '2019-10-21 11:59:06', '2019-10-21 17:32:08'),
(3, 'ashish', '$2y$10$EPu2xgz9lbY2AWPKLx4TaemK.t37LsFdR7fz6eows48Uj4HMfh6Xy', 1, 1, '2019-10-21 12:43:57', '2019-10-21 17:32:16'),
(5, 'xyz', '$2y$10$qj0c13vC6YxF2E6IefRNAOMeST11QTwE9hWgjfCHZXVyfF/LdEpnW', 1, 1, '2019-10-21 18:11:10', '2019-10-21 18:11:10'),
(8, 'aaa', '$2y$10$2zj0GRrhG8trXWzzlcWdLO5l./0huZhSf3i./Qm/M9kn3K.MH2T8y', 1, 1, '2019-10-22 06:29:12', '2019-10-22 06:29:12'),
(10, 'zzz', '$2y$10$WAoqMPJzLprhn9UNuIUNVu08mSlc4UB2PTC5RU2Aft97pVV9gAgT6', 1, 1, '2019-10-22 06:38:27', '2019-10-22 06:39:50'),
(11, 'www', '$2y$10$3D9RrDoeSyqeNX5AqUJGrO3vhdyOVgd5cW8Z6xB.Q4EIVPcZ23NXq', 1, 1, '2019-10-22 06:49:55', '2019-10-22 06:49:55'),
(12, 'ooo', '$2y$10$UAeFRdklnyyuqhNPB6vY5eMTWnQ2NVYr.8QTzHK.gbKreZ24kQyIq', 2, 1, '2019-10-22 11:16:46', '2019-10-22 11:16:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(55) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
