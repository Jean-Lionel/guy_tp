-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 18, 2021 at 04:17 PM
-- Server version: 5.7.35-0ubuntu0.18.04.1
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guy_tp`
--

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`id`, `departement_id`, `name`) VALUES
(3, 3, 'BAC II');

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `faculte_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`id`, `faculte_id`, `name`, `created_at`) VALUES
(2, 2, 'G.L ', '2021-09-10 05:22:23'),
(3, 1, 'RESEAUX', '2021-09-10 08:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `eleve`
--

CREATE TABLE `eleve` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eleve`
--

INSERT INTO `eleve` (`id`, `nom`, `prenom`, `classe_id`, `created_at`) VALUES
(2, 'NININAHAZWE', 'JEAN LIONEL', 3, '2021-09-10 08:08:27'),
(3, 'INEZA', 'ANIE ALIXAS', 3, '2021-09-13 04:54:30'),
(4, 'Magnam doloremque as', 'Sint consequatur M', 3, '2021-09-14 06:53:17'),
(5, 'Est nisi in laudant', 'Id quidem omnis quod', 3, '2021-09-14 06:53:21'),
(6, 'Aspernatur autem pra', 'Reiciendis quo ut qu', 3, '2021-09-14 06:53:24'),
(7, 'Aut a adipisci aut l', 'Ad porro magnam numq', 3, '2021-09-14 06:53:26'),
(8, 'Anim similique elit', 'At sed veritatis lab', 3, '2021-09-14 06:53:29'),
(9, 'Minus id magnam inve', 'Explicabo Animi pe', 3, '2021-09-14 06:53:31'),
(10, 'In labore magna saep', 'Quis natus quidem qu', 3, '2021-09-14 06:53:34'),
(11, 'Dolorum voluptatem o', 'Provident quod mole', 3, '2021-09-14 06:53:38'),
(12, 'Minus deleniti quo a', 'Velit sapiente Nam d', 3, '2021-09-14 06:53:40'),
(13, 'Aliquam modi iure id', 'Ea consequat Quisqu', 3, '2021-09-14 06:53:43'),
(14, 'Ullam eum laborum M', 'Enim repellendus Si', 3, '2021-09-14 06:53:46'),
(15, 'Aut facilis minim vo', 'Dicta facilis quia n', 3, '2021-09-14 06:53:50'),
(16, 'Dolor rem nesciunt ', 'Autem id magna sequi', 3, '2021-09-14 06:53:53'),
(17, 'Id nihil veniam qui', 'Nostrum minim volupt', 3, '2021-09-14 06:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `faculte`
--

CREATE TABLE `faculte` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculte`
--

INSERT INTO `faculte` (`id`, `name`, `created_at`) VALUES
(1, 'INFORAMATIQUE', '2021-09-10 05:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE `presences` (
  `id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `present_time` datetime NOT NULL,
  `is_present` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presences`
--

INSERT INTO `presences` (`id`, `eleve_id`, `professeur_id`, `present_time`, `is_present`) VALUES
(1, 2, 0, '2021-09-18 15:53:26', 0),
(2, 3, 0, '2021-09-18 15:53:29', 0),
(3, 2, 0, '2021-09-18 15:54:39', 0),
(4, 2, 0, '2021-09-18 15:54:40', 0),
(5, 2, 0, '2021-09-18 15:54:40', 1),
(6, 3, 0, '2021-09-18 15:54:41', 0),
(7, 2, 0, '2021-09-18 15:54:41', 1),
(8, 3, 0, '2021-09-18 15:54:41', 0),
(9, 3, 0, '2021-09-18 15:54:41', 1),
(10, 4, 0, '2021-09-18 15:54:43', 0),
(11, 3, 0, '2021-09-18 15:54:43', 1),
(12, 4, 0, '2021-09-18 15:54:44', 0),
(13, 4, 0, '2021-09-18 15:54:44', 1),
(14, 5, 0, '2021-09-18 15:54:44', 0),
(15, 4, 0, '2021-09-18 15:54:45', 1),
(16, 5, 0, '2021-09-18 15:54:45', 0),
(17, 5, 0, '2021-09-18 15:54:45', 1),
(18, 2, 0, '2021-09-18 16:06:21', 0),
(19, 3, 0, '2021-09-18 16:06:24', 0),
(20, 3, 0, '2021-09-18 16:06:26', 0),
(21, 3, 0, '2021-09-18 16:06:26', 1),
(22, 3, 0, '2021-09-18 16:06:27', 0),
(23, 2, 0, '2021-09-18 16:06:27', 1),
(24, 2, 0, '2021-09-18 16:06:28', 0),
(25, 2, 0, '2021-09-18 16:06:28', 1),
(26, 2, 0, '2021-09-18 16:06:31', 0),
(27, 2, 0, '2021-09-18 16:06:31', 1),
(28, 3, 0, '2021-09-18 16:06:32', 0),
(29, 2, 0, '2021-09-18 16:06:32', 1),
(30, 3, 0, '2021-09-18 16:06:33', 0),
(31, 3, 0, '2021-09-18 16:06:33', 1),
(32, 9, 0, '2021-09-18 16:06:35', 0),
(33, 3, 0, '2021-09-18 16:06:35', 1),
(34, 9, 0, '2021-09-18 16:06:37', 0),
(35, 3, 0, '2021-09-18 16:06:37', 1),
(36, 9, 0, '2021-09-18 16:06:39', 0),
(37, 9, 0, '2021-09-18 16:06:39', 1),
(38, 10, 0, '2021-09-18 16:06:41', 0),
(39, 9, 0, '2021-09-18 16:06:41', 1),
(40, 10, 0, '2021-09-18 16:06:43', 0),
(41, 10, 0, '2021-09-18 16:06:43', 1),
(42, 11, 0, '2021-09-18 16:06:44', 0),
(43, 10, 0, '2021-09-18 16:06:45', 1),
(44, 11, 0, '2021-09-18 16:06:47', 0),
(45, 11, 0, '2021-09-18 16:06:47', 1),
(46, 12, 0, '2021-09-18 16:06:48', 0),
(47, 11, 0, '2021-09-18 16:06:48', 1),
(48, 12, 0, '2021-09-18 16:06:50', 0),
(49, 12, 0, '2021-09-18 16:06:50', 1),
(50, 12, 0, '2021-09-18 16:09:38', 0),
(51, 12, 0, '2021-09-18 16:09:38', 1),
(52, 8, 0, '2021-09-18 16:10:01', 0),
(53, 8, 0, '2021-09-18 16:10:03', 0),
(54, 14, 0, '2021-09-18 16:10:03', 1),
(55, 15, 0, '2021-09-18 16:10:04', 0),
(56, 14, 0, '2021-09-18 16:10:04', 1),
(57, 6, 0, '2021-09-18 16:10:06', 0),
(58, 14, 0, '2021-09-18 16:10:06', 1),
(59, 7, 0, '2021-09-18 16:10:08', 0),
(60, 14, 0, '2021-09-18 16:10:08', 1),
(61, 13, 0, '2021-09-18 16:10:09', 0),
(62, 14, 0, '2021-09-18 16:10:09', 1),
(63, 13, 0, '2021-09-18 16:10:11', 0),
(64, 17, 0, '2021-09-18 16:10:11', 1),
(65, 13, 0, '2021-09-18 16:10:12', 0),
(66, 16, 0, '2021-09-18 16:10:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `classe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `login`, `password`, `classe_id`) VALUES
(1, 'Et illo obcaecati et', 'Culpa culpa obcaeca', 'Nisi quia necessitat', 'ac748cb38ff28d1ea98458b16695739d7e90f22d', 3),
(2, 'NININAHAZWE', 'JEAN LIONEL', 'jean', 'eaf14a01af23a2750f52c1b1992232c6adc001c4', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculte`
--
ALTER TABLE `faculte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `faculte`
--
ALTER TABLE `faculte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
