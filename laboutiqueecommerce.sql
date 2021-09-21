-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 21 sep. 2021 à 10:50
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `laboutiqueecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Manteaux'),
(2, 'Bonnets'),
(3, 'T-shirts'),
(4, 'Echarpes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210616204004', '2021-06-16 20:44:06', 1117),
('DoctrineMigrations\\Version20210619150720', '2021-06-19 15:11:17', 1376),
('DoctrineMigrations\\Version20210914143314', '2021-09-14 14:34:56', 1639),
('DoctrineMigrations\\Version20210914151736', '2021-09-14 15:19:00', 1785),
('DoctrineMigrations\\Version20210917005917', '2021-09-17 01:05:20', 2496),
('DoctrineMigrations\\Version20210917012800', '2021-09-17 01:29:16', 2149);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`) VALUES
(2, 2, 'bonnet rouge', 'bonnet-rouge', '940bbea8ab738434460211b8058d80b503abb1d1.[entension]', 'Le bonnet parfait pour l\'hiver', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 900),
(3, 2, 'Le bonnet du skieur', 'le-bonnet-du-skieur', '9af6dac35bb9f5f25b358d6fb0ace544d54e6838.[entension]', 'Le bonnet parfait pour le ski', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 1200),
(4, 4, 'L\'écharpe du lover', 'lecharpe-du-lover', 'f5747b7970cabc217d34d3c36bf3013e83e82e51.[entension]', 'L\'écharpe parfait pour vos soirée romantique', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 1900),
(5, 4, 'L\'écharpe du samedi soir', 'lecharpe-du-samedi-soir', 'e9d5afd7e92337c74bdac53e4f3b27db057f51f2.[entension]', 'L\'écharpe parfait pour vos weekend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 1400),
(6, 1, 'le manteau de soirée', 'le-manteau-de-soiree', '6815d4d50b4c1c994a13243b858b2fbf6875bfe7.[entension]', 'Le manteau français pour vos soirée', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing', 6900),
(7, 1, 'Le manteau famille', 'le-manteau-famille', 'b8026715fd6dd53bd3c9ffee5a115fa3db32e18a.[entension]', 'Le manteau pour vos soirées en famille', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages', 7900),
(8, 3, 'Le t-shirt manche longue', 'le-t-shirt-manche-longue', '6a717ad27b2cb76e116d87fd704a4cdca2da1a58.[entension]', 'Le t-shirt taillé pour les hommes', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1400),
(9, 3, 'Le t-shirt basic', 'le-t-shirt-basic', '924eb49ae1d44c6f9891e1530d97d0a6f00b523e.[entension]', 'Le basic pour les hommes', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 990);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'lamine@cisse.com', '[]', '1234e', 'lamine', 'cisse'),
(4, 'lass@less.com', '[]', '123', 'lass', 'less'),
(5, 'tiba@gmail.com', '[]', '123', 'soti', 'tiba'),
(6, 'sotiba67@gmail.com', '[]', '$2y$13$LqjfR4RFQg.xMNCSE5jc/.Bqm52lzoJfhtuboKSc0KKhjfQ5A9u52', 'lamine', 'cisse'),
(7, 'sotiba66@gmail.com', '[]', '$2y$13$4rz3M.8g1w4LoXFDXbD4M.EnixyhgySumcUwiBQSxFpULnccRKPt.', 'lamine', 'cisse'),
(9, 'sotiba65@gmail.com', '[]', '$2y$13$fzZX.liry9OQqeq1rf7T/OoUnd708QDWobPka9KoqDzUn5R7QC8MS', 'lb', 'cisse'),
(11, 'sotiba64@gmail.com', '[]', '$2y$13$pXi/ogiwoE3eSjR.eHDTh.myArscEZejIpMolMtNYPe2YW3VA3Nye', 'llkjjjjmmmmnvghcfhkgj,vbnklnx,ckvvklmhjq<k!lbndwmhb!n', 'cisse'),
(12, 'lam@gmail.com', '[]', '$2y$13$a90oyAz.e/.CAKUZtTFmfue87kOxGsumKjQkSMEFp7GYo3OEMqAgq', 'lam', 'ciss');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
