-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 01 Novembre 2021 à 09:03
-- Version du serveur :  5.7.36-0ubuntu0.18.04.1
-- Version de PHP :  7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `guy_tp`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`id`, `departement_id`, `name`) VALUES
(3, 3, 'BAC II'),
(4, 6, 'Rahim Cole'),
(5, 4, 'Ralph Rush'),
(6, 2, 'Kirestin Warren'),
(7, 2, 'Tanisha Bauer'),
(8, 4, 'Sebastian Davenport'),
(9, 4, 'Alec Mccall'),
(10, 3, 'Hanna Palmer');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cours`
--

INSERT INTO `cours` (`id`, `name`, `professeur_id`, `classe_id`, `created_at`) VALUES
(1, 'Voluptatem Ex quo v', 4, 3, '2021-11-01 02:35:23'),
(2, 'Rerum inventore sint', 2, 4, '2021-11-01 02:39:18'),
(3, 'Cupiditate blanditii', 3, 4, '2021-11-01 02:39:25'),
(5, 'Officia asperiores i', 4, 3, '2021-11-01 02:50:34'),
(6, 'Voluptate voluptatem', 3, 3, '2021-11-01 02:50:47'),
(7, 'Perspiciatis rem mi', 6, 7, '2021-11-01 02:51:41'),
(8, 'Dignissimos rerum fu', 3, 9, '2021-11-01 02:51:45');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `faculte_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`id`, `faculte_id`, `name`, `created_at`) VALUES
(2, 2, 'G.L ', '2021-09-10 05:22:23'),
(3, 1, 'RESEAUX', '2021-09-10 08:07:36'),
(4, 2, 'BIOLOGIE', '2021-09-24 04:33:21'),
(5, 2, 'LIONEL', '2021-09-24 04:43:21'),
(6, 3, 'YES', '2021-09-24 04:59:56'),
(7, 1, 'Elton Orr', '2021-10-30 15:20:05');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `eleve`
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
(17, 'Id nihil veniam qui', 'Nostrum minim volupt', 3, '2021-09-14 06:53:57'),
(18, 'Minus ullam velit pa', 'Quia ipsum doloribus', 3, '2021-09-24 05:12:03');

-- --------------------------------------------------------

--
-- Structure de la table `faculte`
--

CREATE TABLE `faculte` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `faculte`
--

INSERT INTO `faculte` (`id`, `name`, `created_at`) VALUES
(1, 'INFORAMATIQUE', '2021-09-10 05:17:02'),
(2, 'APPLICATION', '2021-09-24 04:33:04'),
(3, 'BONJOUR', '2021-09-24 04:59:44'),
(4, 'Rana Vaughn', '2021-10-30 15:19:00');

-- --------------------------------------------------------

--
-- Structure de la table `presences`
--

CREATE TABLE `presences` (
  `id` int(11) NOT NULL,
  `eleve_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `present_time` datetime NOT NULL,
  `is_present` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `presences`
--

INSERT INTO `presences` (`id`, `eleve_id`, `professeur_id`, `cours_id`, `present_time`, `is_present`) VALUES
(1, 2, 0, 0, '2021-09-18 15:53:26', 0),
(2, 3, 0, 0, '2021-09-18 15:53:29', 0),
(3, 2, 0, 0, '2021-09-18 15:54:39', 0),
(4, 2, 0, 0, '2021-09-18 15:54:40', 0),
(5, 2, 0, 0, '2021-09-18 15:54:40', 1),
(6, 3, 0, 0, '2021-09-18 15:54:41', 0),
(7, 2, 0, 0, '2021-09-18 15:54:41', 1),
(8, 3, 0, 0, '2021-09-18 15:54:41', 0),
(9, 3, 0, 0, '2021-09-18 15:54:41', 1),
(10, 4, 0, 0, '2021-09-18 15:54:43', 0),
(11, 3, 0, 0, '2021-09-18 15:54:43', 1),
(12, 4, 0, 0, '2021-09-18 15:54:44', 0),
(13, 4, 0, 0, '2021-09-18 15:54:44', 1),
(14, 5, 0, 0, '2021-09-18 15:54:44', 0),
(15, 4, 0, 0, '2021-09-18 15:54:45', 1),
(16, 5, 0, 0, '2021-09-18 15:54:45', 0),
(17, 5, 0, 0, '2021-09-18 15:54:45', 1),
(18, 2, 0, 0, '2021-09-18 16:06:21', 0),
(19, 3, 0, 0, '2021-09-18 16:06:24', 0),
(20, 3, 0, 0, '2021-09-18 16:06:26', 0),
(21, 3, 0, 0, '2021-09-18 16:06:26', 1),
(22, 3, 0, 0, '2021-09-18 16:06:27', 0),
(23, 2, 0, 0, '2021-09-18 16:06:27', 1),
(24, 2, 0, 0, '2021-09-18 16:06:28', 0),
(25, 2, 0, 0, '2021-09-18 16:06:28', 1),
(26, 2, 0, 0, '2021-09-18 16:06:31', 0),
(27, 2, 0, 0, '2021-09-18 16:06:31', 1),
(28, 3, 0, 0, '2021-09-18 16:06:32', 0),
(29, 2, 0, 0, '2021-09-18 16:06:32', 1),
(30, 3, 0, 0, '2021-09-18 16:06:33', 0),
(31, 3, 0, 0, '2021-09-18 16:06:33', 1),
(32, 9, 0, 0, '2021-09-18 16:06:35', 0),
(33, 3, 0, 0, '2021-09-18 16:06:35', 1),
(34, 9, 0, 0, '2021-09-18 16:06:37', 0),
(35, 3, 0, 0, '2021-09-18 16:06:37', 1),
(36, 9, 0, 0, '2021-09-18 16:06:39', 0),
(37, 9, 0, 0, '2021-09-18 16:06:39', 1),
(38, 10, 0, 0, '2021-09-18 16:06:41', 0),
(39, 9, 0, 0, '2021-09-18 16:06:41', 1),
(40, 10, 0, 0, '2021-09-18 16:06:43', 0),
(41, 10, 0, 0, '2021-09-18 16:06:43', 1),
(42, 11, 0, 0, '2021-09-18 16:06:44', 0),
(43, 10, 0, 0, '2021-09-18 16:06:45', 1),
(44, 11, 0, 0, '2021-09-18 16:06:47', 0),
(45, 11, 0, 0, '2021-09-18 16:06:47', 1),
(46, 12, 0, 0, '2021-09-18 16:06:48', 0),
(47, 11, 0, 0, '2021-09-18 16:06:48', 1),
(48, 12, 0, 0, '2021-09-18 16:06:50', 0),
(49, 12, 0, 0, '2021-09-18 16:06:50', 1),
(50, 12, 0, 0, '2021-09-18 16:09:38', 0),
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

CREATE TABLE `professeur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `classe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `login`, `password`, `classe_id`) VALUES
(1, 'Et illo obcaecati et', 'Culpa culpa obcaeca', 'Nisi quia necessitat', 'ac748cb38ff28d1ea98458b16695739d7e90f22d', 3),
(2, 'NININAHAZWE', 'JEAN LIONEL', 'jean', 'eaf14a01af23a2750f52c1b1992232c6adc001c4', 3),
(3, 'NININAHAZWE', 'JEAN LEO', 'nijeanlionel@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 3),
(4, 'NIYONKURU', 'Alexis', 'alexis', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 3),
(5, 'Temporibus odio inci', 'Consequatur corporis', 'Nisi praesentium arc', 'ac748cb38ff28d1ea98458b16695739d7e90f22d', 4),
(6, 'Ut aut dolores culpa', 'Sequi similique fugi', 'At perspiciatis non', 'ac748cb38ff28d1ea98458b16695739d7e90f22d', 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `faculte`
--
ALTER TABLE `faculte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `faculte`
--
ALTER TABLE `faculte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
