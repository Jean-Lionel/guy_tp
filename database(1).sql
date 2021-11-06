-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 nov. 2021 à 20:11
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kessy`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departement_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `departement_id`, `name`) VALUES
(32, 8, '1st Year'),
(33, 9, '2nd Year'),
(35, 10, '3rd Year');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `professeur_id` int NOT NULL,
  `classe_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `name`, `professeur_id`, `classe_id`, `created_at`) VALUES
(9, 'Maths', 9, 12, '2021-11-04 10:24:20'),
(11, 'BIO', 9, 17, '2021-11-04 10:26:25');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculte_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `faculte_id`, `name`, `created_at`) VALUES
(16, 8, 'SCHOOL OF DEVELOPMENT', '2021-11-05 13:04:36'),
(17, 12, 'SCHOOL OF DEVELOPMENT', '2021-11-05 13:04:44'),
(18, 13, 'SCHOOL OF DEVELOPMENT', '2021-11-05 13:04:52'),
(19, 9, 'SCHOOL OF ENGINEERING', '2021-11-05 13:05:00'),
(20, 10, 'SCHOOL OF ENGINEERING', '2021-11-05 13:05:06');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `classe_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id`, `nom`, `prenom`, `classe_id`, `created_at`) VALUES
(36, 'NDUWIMANA', 'Guy', 26, '2021-11-05 12:54:54');

-- --------------------------------------------------------

--
-- Structure de la table `faculte`
--

DROP TABLE IF EXISTS `faculte`;
CREATE TABLE IF NOT EXISTS `faculte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `faculte`
--

INSERT INTO `faculte` (`id`, `name`, `created_at`) VALUES
(8, 'MONITORING AND EVALUATION', '2021-11-04 02:55:07'),
(9, 'IT', '2021-11-04 02:55:21'),
(10, 'ARCHITECTURE', '2021-11-04 02:55:29'),
(12, 'HOSPITALITY AND TOURISM', '2021-11-04 02:55:40'),
(13, 'ENTREPRENEURSHIP', '2021-11-04 02:55:50');

-- --------------------------------------------------------

--
-- Structure de la table `presences`
--

DROP TABLE IF EXISTS `presences`;
CREATE TABLE IF NOT EXISTS `presences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eleve_id` int NOT NULL,
  `professeur_id` int NOT NULL,
  `cours_id` int NOT NULL,
  `present_time` datetime NOT NULL,
  `is_present` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `presences`
--

INSERT INTO `presences` (`id`, `eleve_id`, `professeur_id`, `cours_id`, `present_time`, `is_present`) VALUES
(51, 12, 0, 0, '2021-09-18 16:09:38', 1),
(52, 8, 0, 0, '2021-09-18 16:10:01', 0),
(53, 8, 0, 0, '2021-09-18 16:10:03', 0),
(54, 14, 0, 0, '2021-09-18 16:10:03', 1),
(55, 15, 0, 0, '2021-09-18 16:10:04', 0),
(56, 14, 0, 0, '2021-09-18 16:10:04', 1),
(57, 6, 0, 0, '2021-09-18 16:10:06', 0),
(58, 14, 0, 0, '2021-09-18 16:10:06', 1),
(59, 7, 0, 0, '2021-09-18 16:10:08', 0),
(60, 14, 0, 0, '2021-09-18 16:10:08', 1),
(61, 13, 0, 0, '2021-09-18 16:10:09', 0),
(62, 14, 0, 0, '2021-09-18 16:10:09', 1),
(63, 13, 0, 0, '2021-09-18 16:10:11', 0),
(64, 17, 0, 0, '2021-09-18 16:10:11', 1),
(65, 13, 0, 0, '2021-09-18 16:10:12', 0),
(66, 16, 0, 0, '2021-09-18 16:10:12', 1),
(67, 2, 0, 0, '2021-09-23 04:59:30', 1),
(68, 3, 0, 0, '2021-09-23 04:59:33', 0),
(69, 2, 0, 0, '2021-09-23 04:59:33', 1),
(70, 2, 3, 0, '2021-10-30 15:17:09', 1),
(71, 3, 3, 0, '2021-10-30 15:17:12', 1),
(72, 4, 3, 0, '2021-10-30 15:17:14', 1),
(73, 5, 3, 0, '2021-10-30 15:17:17', 1),
(74, 6, 3, 0, '2021-10-30 15:17:19', 1),
(75, 7, 3, 0, '2021-10-30 15:17:22', 0),
(76, 6, 3, 0, '2021-10-30 15:17:22', 1),
(77, 7, 3, 0, '2021-10-30 15:17:26', 0),
(78, 8, 3, 0, '2021-10-30 15:17:26', 1),
(79, 7, 3, 0, '2021-10-30 15:17:31', 0),
(80, 9, 3, 0, '2021-10-30 15:17:31', 1),
(81, 7, 3, 0, '2021-10-30 15:17:39', 0),
(82, 10, 3, 0, '2021-10-30 15:17:39', 1),
(83, 7, 3, 0, '2021-10-30 15:17:41', 0),
(84, 11, 3, 0, '2021-10-30 15:17:41', 1),
(85, 7, 3, 0, '2021-10-30 15:17:43', 0),
(86, 12, 3, 0, '2021-10-30 15:17:43', 1),
(87, 7, 3, 0, '2021-10-30 15:17:44', 0),
(88, 13, 3, 0, '2021-10-30 15:17:44', 1),
(89, 7, 3, 0, '2021-10-30 15:17:45', 0),
(90, 18, 3, 0, '2021-10-30 15:17:45', 1),
(91, 7, 3, 0, '2021-10-30 15:17:47', 0),
(92, 17, 3, 0, '2021-10-30 15:17:47', 1),
(93, 7, 3, 0, '2021-10-30 15:17:49', 0),
(94, 16, 3, 0, '2021-10-30 15:17:49', 1),
(95, 7, 3, 0, '2021-10-30 15:17:50', 0),
(96, 15, 3, 0, '2021-10-30 15:17:50', 1),
(97, 7, 3, 0, '2021-10-30 15:17:52', 0),
(98, 14, 3, 0, '2021-10-30 15:17:52', 1),
(99, 2, 3, 6, '2021-11-01 05:09:32', 0),
(100, 2, 3, 6, '2021-11-01 05:09:34', 0),
(101, 3, 3, 6, '2021-11-01 05:09:34', 1),
(102, 9, 3, 6, '2021-11-01 05:10:57', 1),
(103, 4, 3, 6, '2021-11-01 05:31:07', 1),
(104, 5, 3, 6, '2021-11-01 05:31:08', 1),
(105, 6, 3, 6, '2021-11-01 05:31:09', 1),
(106, 7, 3, 6, '2021-11-01 05:31:10', 1),
(107, 8, 3, 6, '2021-11-01 05:31:11', 1),
(108, 10, 3, 6, '2021-11-01 05:31:12', 1),
(109, 11, 3, 6, '2021-11-01 05:31:13', 1),
(110, 12, 3, 6, '2021-11-01 05:31:14', 1),
(111, 13, 3, 6, '2021-11-01 05:31:15', 0),
(112, 12, 3, 6, '2021-11-01 05:31:15', 1),
(113, 14, 3, 6, '2021-11-01 05:31:17', 0),
(114, 12, 3, 6, '2021-11-01 05:31:17', 1),
(115, 15, 3, 6, '2021-11-01 05:31:18', 0),
(116, 12, 3, 6, '2021-11-01 05:31:18', 1),
(117, 16, 3, 6, '2021-11-01 05:31:19', 0),
(118, 12, 3, 6, '2021-11-01 05:31:19', 1),
(119, 16, 3, 6, '2021-11-01 05:31:20', 0),
(120, 17, 3, 6, '2021-11-01 05:31:20', 1),
(121, 18, 3, 6, '2021-11-01 05:31:21', 0),
(122, 17, 3, 6, '2021-11-01 05:31:21', 1);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `classe_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `login`, `password`, `classe_id`) VALUES
(9, 'MUTONI', 'Kessy', 'kessy', '5763a7390ec57715bec72431fc6da75afa16279c', 12);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
