-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 17 août 2017 à 22:50
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `essentialmode`
--
CREATE DATABASE IF NOT EXISTS `essentialmode` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `essentialmode`;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(1, 'society_police', 'Police', 1),
(2, 'society_ambulance', 'Ambulance', 1),
(3, 'society_taxi', 'Taxi', 1),
(4, 'society_banker', 'Banque', 1),
(5, 'bank_savings', 'Livret Bleu', 0),
(6, 'society_mecano', 'Mécano', 1),
(7, 'caution', 'Caution', 0),
(8, 'property_black_money', 'Argent Sale Propriété', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_police', 0, NULL),
(2, 'society_ambulance', 0, NULL),
(3, 'society_taxi', 0, NULL),
(4, 'society_banker', 0, NULL),
(5, 'society_mecano', 200, NULL),
(6, 'bank_savings', 0, 'steam:11000010fe01cf0'),
(7, 'property_black_money', 100000, 'steam:11000010fe01cf0'),
(8, 'caution', 0, 'steam:11000010fe01cf0'),
(9, 'bank_savings', 0, 'steam:11000010f7ee687'),
(10, 'caution', 0, 'steam:11000010f7ee687'),
(11, 'property_black_money', 0, 'steam:11000010f7ee687'),
(12, 'bank_savings', 0, 'steam:110000106247f6e'),
(13, 'caution', 0, 'steam:110000106247f6e'),
(14, 'property_black_money', 0, 'steam:110000106247f6e'),
(15, 'bank_savings', 0, 'steam:1100001015e828c'),
(16, 'caution', 0, 'steam:1100001015e828c'),
(17, 'property_black_money', 0, 'steam:1100001015e828c'),
(18, 'bank_savings', 0, 'steam:11000010e8ac2df'),
(19, 'property_black_money', 0, 'steam:11000010e8ac2df'),
(20, 'caution', 0, 'steam:11000010e8ac2df'),
(21, 'caution', 0, 'steam:11000010a6c0398'),
(22, 'property_black_money', 0, 'steam:11000010a6c0398'),
(23, 'bank_savings', 0, 'steam:11000010a6c0398');

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(1, 'property', 'Propriété', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `billing`
--

INSERT INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES
(3, 'steam:11000010fe01cf0', 'steam:11000010a6c0398', 'society', 'society_mecano', 'Mecano', 50);

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`id`, `name`, `label`, `shared`) VALUES
(1, 'society_police', 'Police', 1),
(2, 'property', 'Propriété', 0),
(3, 'user_mask', 'Masque', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'property', 'steam:11000010fe01cf0', '{\"dressing\":[{\"label\":\"Chilling\",\"skin\":{\"eyebrows_3\":0,\"decals_1\":0,\"hair_color_1\":0,\"glasses_1\":0,\"chain_2\":0,\"makeup_1\":0,\"makeup_4\":0,\"helmet_2\":0,\"beard_4\":0,\"beard_2\":0,\"lipstick_1\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"tshirt_2\":2,\"decals_2\":0,\"lipstick_4\":0,\"ears_1\":0,\"chain_1\":0,\"beard_3\":0,\"bags_2\":0,\"glasses_2\":0,\"age_2\":0,\"pants_1\":0,\"eyebrows_2\":0,\"torso_1\":3,\"hair_2\":0,\"tshirt_1\":10,\"skin\":0,\"mask_1\":0,\"age_1\":0,\"beard_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"torso_2\":0,\"hair_1\":0,\"makeup_3\":0,\"eyebrows_4\":0,\"arms\":0,\"hair_color_2\":0,\"face\":0,\"sex\":0,\"shoes_2\":0,\"bproof_1\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"mask_2\":0,\"ears_2\":0,\"bags_1\":0,\"shoes_1\":0,\"pants_2\":0}}]}'),
(3, 'user_mask', 'steam:11000010fe01cf0', '{\"hasMask\":true,\"skin\":{\"mask_1\":0,\"mask_2\":3}}'),
(4, 'property', 'steam:11000010f7ee687', '{}'),
(5, 'user_mask', 'steam:11000010f7ee687', '{}'),
(6, 'property', 'steam:110000106247f6e', '{}'),
(7, 'user_mask', 'steam:110000106247f6e', '{}'),
(8, 'property', 'steam:1100001015e828c', '{\"dressing\":[[]]}'),
(9, 'user_mask', 'steam:1100001015e828c', '{}'),
(10, 'property', 'steam:11000010e8ac2df', '{}'),
(11, 'user_mask', 'steam:11000010e8ac2df', '{}'),
(12, 'property', 'steam:11000010a6c0398', '{}'),
(13, 'user_mask', 'steam:11000010a6c0398', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `name`, `label`, `limit`) VALUES
(1, 'weed', 'Weed', -1),
(2, 'weed_pooch', 'Pochon de weed', -1),
(3, 'coke', 'Coke', -1),
(4, 'coke_pooch', 'Pochon de coke', -1),
(5, 'meth', 'Meth', -1),
(6, 'meth_pooch', 'Pochon de meth', -1),
(7, 'bread', 'Pain', -1),
(8, 'water', 'Eau', -1),
(9, 'gazbottle', 'bouteille de gaz', -1),
(10, 'fixtool', 'outils réparation', -1),
(11, 'carotool', 'outils carosserie', -1),
(12, 'blowpipe', 'Chalumeaux', -1),
(13, 'fixkit', 'Kit réparation', -1),
(14, 'carokit', 'Kit carosserie', -1),
(15, 'alive_chicken', 'Poulet vivant', -1),
(16, 'slaughtered_chicken', 'Poulet abattu', -1),
(17, 'packaged_chicken', 'Poulet en barquette', -1),
(18, 'fish', 'Poisson', -1),
(19, 'stone', 'Pierre', -1),
(20, 'washed_stone', 'Pierre Lavée', -1),
(21, 'copper', 'Cuivre', -1),
(22, 'iron', 'Fer', -1),
(23, 'gold', 'Or', -1),
(24, 'diamond', 'Diamant', -1),
(25, 'wood', 'Bois', -1),
(26, 'cutted_wood', 'Bois coupÃ©', -1),
(27, 'packaged_plank', 'Paquet de planches', -1),
(28, 'petrol', 'PÃ©trole', -1),
(29, 'petrol_raffin', 'PÃ©trole RaffinÃ©', -1),
(30, 'essence', 'Essence', -1),
(31, 'whool', 'Laine', -1),
(32, 'fabric', 'Tissu', -1),
(33, 'clothe', 'VÃªtement', -1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'rsa', 'RSA', 200, '{}', '{}'),
(2, 'police', 0, 'recruit', 'Recrue', 20, '{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}', '{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
(3, 'police', 1, 'sergeant', 'Sergent', 40, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":0,\"decals_1\":8,\"torso_2\":0,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"hair_color_1\":5,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":14,\"pants_1\":34,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"shoes\":24,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"face\":21,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"hair_color_1\":10,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(4, 'police', 2, 'lieutenant', 'Lieutenant', 65, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":2,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"glasses\":0,\"decals_1\":8,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"torso_2\":0,\"arms\":41,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"hair_2\":3,\"decals_2\":2,\"hair_color_2\":0,\"hair_color_1\":10,\"helmet_2\":0,\"face\":21,\"shoes\":24,\"torso_2\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"decals_1\":7,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(5, 'police', 3, 'boss', 'Commandant', 80, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(6, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(7, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(8, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(9, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(10, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(11, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(12, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(13, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(14, 'taxi', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(15, 'taxi', 1, 'novice', 'Novice', 24, '{}', '{}'),
(16, 'taxi', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(17, 'taxi', 3, 'uber', 'Uber', 48, '{}', '{}'),
(18, 'taxi', 4, 'boss', 'Patron', 0, '{}', '{}'),
(19, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(20, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(21, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(22, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(23, 'banker', 0, 'advisor', 'Conseiller', 10, '{}', '{}'),
(24, 'banker', 1, 'banker', 'Banquier', 20, '{}', '{}'),
(25, 'banker', 2, 'business_banker', 'Banquier daffaire', 30, '{}', '{}'),
(26, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
(27, 'banker', 4, 'boss', 'Patron', 0, '{}', '{}'),
(28, 'mecano', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(29, 'mecano', 1, 'novice', 'Novice', 24, '{}', '{}'),
(30, 'mecano', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(31, 'mecano', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(32, 'mecano', 4, 'boss', 'Patron', 0, '{}', '{}'),
(33, 'lumberjack', 0, 'interim', 'IntÃ©rimaire', 0, '{}', '{}'),
(34, 'fisherman', 0, 'interim', 'Intérimaire', 0, '{}', '{}'),
(35, 'fuel', 0, 'interim', 'IntÃ©rimaire', 0, '{}', '{}'),
(36, 'reporter', 0, 'employee', 'IntÃ©rimaire', 0, '{}', '{}'),
(37, 'textil', 0, 'interim', 'IntÃ©rimaire', 0, '{}', '{}'),
(38, 'miner', 0, 'interim', 'IntÃ©rimaire', 0, '{}', '{}'),
(39, 'slaughterer', 0, 'interim', 'IntÃ©rimaire', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `label`) VALUES
(1, 'unemployed', 'Chomeur'),
(2, 'police', 'LSPD'),
(3, 'ambulance', 'Ambulance'),
(4, 'ambulance', 'Ambulance'),
(5, 'taxi', 'Taxi'),
(6, 'cardealer', 'Concessionnaire'),
(7, 'banker', 'Banquier'),
(8, 'mecano', 'Mécano'),
(9, 'slaughterer', 'Abatteur'),
(10, 'fisherman', 'Pêcheur'),
(11, 'miner', 'Mineur'),
(12, 'lumberjack', 'Bûcheron'),
(13, 'fuel', 'Raffineur'),
(14, 'reporter', 'Journaliste'),
(15, 'textil', 'Couturier');

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `owned_properties`
--

INSERT INTO `owned_properties` (`id`, `name`, `price`, `rented`, `owner`) VALUES
(1, 'TinselTowersApt12', 8500, 1, 'steam:11000010fe01cf0');

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`id`, `vehicle`, `owner`) VALUES
(1, '{\"modEngine\":-1,\"color1\":33,\"wheelColor\":156,\"neonColor\":[255,0,255],\"modGrille\":-1,\"modRearBumper\":-1,\"modTurbo\":false,\"modArmor\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"dirtLevel\":13.0,\"modSideSkirt\":-1,\"modRoof\":-1,\"pearlescentColor\":38,\"color2\":5,\"modFrontWheels\":-1,\"modXenon\":false,\"modSuspension\":-1,\"model\":-1523428744,\"plateIndex\":0,\"modHorns\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modTransmission\":-1,\"modHood\":-1,\"health\":1000,\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"wheels\":6,\"plate\":\"22TUS479\",\"neonEnabled\":[false,false,false,false],\"modRightFender\":-1,\"modBrakes\":-1,\"tyreSmokeColor\":[255,255,255]}', 'steam:11000010e8ac2df'),
(2, '{\"modEngine\":-1,\"color1\":64,\"modFrontBumper\":-1,\"neonColor\":[255,0,255],\"modGrille\":-1,\"modRearBumper\":-1,\"modTurbo\":false,\"modArmor\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"dirtLevel\":5.0,\"modSideSkirt\":-1,\"modRoof\":-1,\"pearlescentColor\":70,\"color2\":64,\"modFrontWheels\":-1,\"modXenon\":false,\"modSuspension\":-1,\"model\":-295689028,\"plateIndex\":0,\"modHorns\":-1,\"modBackWheels\":-1,\"modFender\":-1,\"modTransmission\":-1,\"tyreSmokeColor\":[255,255,255],\"health\":1000,\"modSmokeEnabled\":false,\"modHood\":-1,\"windowTint\":-1,\"modSpoilers\":-1,\"wheels\":0,\"modRightFender\":-1,\"wheelColor\":158,\"plate\":\"03FRL912\",\"neonEnabled\":[false,false,false,false],\"modBrakes\":-1}', 'steam:11000010e8ac2df');

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000);

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `shops`
--

INSERT INTO `shops` (`id`, `name`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15);

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:11000010fe01cf0', 'black_money', 0),
(2, 'steam:11000010f7ee687', 'black_money', 10000000),
(3, 'steam:110000106247f6e', 'black_money', 10000000),
(4, 'steam:1100001015e828c', 'black_money', 10000000),
(5, 'steam:11000010e8ac2df', 'black_money', 0),
(6, 'steam:11000010a6c0398', 'black_money', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `identifier`, `name`, `number`) VALUES
(1, 'steam:11000010fe01cf0', 'Steph', 53187),
(2, 'steam:1100001015e828c', 'James', 27396);

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(1, 'steam:11000010fe01cf0', 'fixtool', 0),
(2, 'steam:11000010fe01cf0', 'coke_pooch', 0),
(3, 'steam:11000010fe01cf0', 'carokit', 0),
(4, 'steam:11000010fe01cf0', 'petrol_raffin', 0),
(5, 'steam:11000010fe01cf0', 'clothe', 0),
(6, 'steam:11000010fe01cf0', 'water', 0),
(7, 'steam:11000010fe01cf0', 'meth_pooch', 0),
(8, 'steam:11000010fe01cf0', 'packaged_chicken', 0),
(9, 'steam:11000010fe01cf0', 'weed', 0),
(10, 'steam:11000010fe01cf0', 'petrol', 0),
(11, 'steam:11000010fe01cf0', 'iron', 0),
(12, 'steam:11000010fe01cf0', 'cutted_wood', 0),
(13, 'steam:11000010fe01cf0', 'gazbottle', 0),
(14, 'steam:11000010fe01cf0', 'slaughtered_chicken', 0),
(15, 'steam:11000010fe01cf0', 'blowpipe', 0),
(16, 'steam:11000010fe01cf0', 'carotool', 0),
(17, 'steam:11000010fe01cf0', 'washed_stone', 0),
(18, 'steam:11000010fe01cf0', 'copper', 0),
(19, 'steam:11000010fe01cf0', 'essence', 0),
(20, 'steam:11000010fe01cf0', 'wood', 0),
(21, 'steam:11000010fe01cf0', 'weed_pooch', 0),
(22, 'steam:11000010fe01cf0', 'alive_chicken', 0),
(23, 'steam:11000010fe01cf0', 'stone', 0),
(24, 'steam:11000010fe01cf0', 'whool', 0),
(25, 'steam:11000010fe01cf0', 'bread', 0),
(26, 'steam:11000010fe01cf0', 'packaged_plank', 0),
(27, 'steam:11000010fe01cf0', 'fixkit', 0),
(28, 'steam:11000010fe01cf0', 'fabric', 0),
(29, 'steam:11000010fe01cf0', 'coke', 0),
(30, 'steam:11000010fe01cf0', 'meth', 0),
(31, 'steam:11000010fe01cf0', 'fish', 0),
(32, 'steam:11000010fe01cf0', 'gold', 0),
(33, 'steam:11000010fe01cf0', 'diamond', 0),
(34, 'steam:11000010f7ee687', 'stone', 0),
(35, 'steam:11000010f7ee687', 'alive_chicken', 0),
(36, 'steam:11000010f7ee687', 'meth_pooch', 0),
(37, 'steam:11000010f7ee687', 'petrol_raffin', 0),
(38, 'steam:11000010f7ee687', 'coke_pooch', 0),
(39, 'steam:11000010f7ee687', 'washed_stone', 0),
(40, 'steam:11000010f7ee687', 'water', 0),
(41, 'steam:11000010f7ee687', 'cutted_wood', 0),
(42, 'steam:11000010f7ee687', 'clothe', 0),
(43, 'steam:11000010f7ee687', 'copper', 0),
(44, 'steam:11000010f7ee687', 'petrol', 0),
(45, 'steam:11000010f7ee687', 'carotool', 0),
(46, 'steam:11000010f7ee687', 'gazbottle', 0),
(47, 'steam:11000010f7ee687', 'fixkit', 0),
(48, 'steam:11000010f7ee687', 'fabric', 0),
(49, 'steam:11000010f7ee687', 'essence', 0),
(50, 'steam:11000010f7ee687', 'bread', 0),
(51, 'steam:11000010f7ee687', 'gold', 0),
(52, 'steam:11000010f7ee687', 'fixtool', 0),
(53, 'steam:11000010f7ee687', 'carokit', 0),
(54, 'steam:11000010f7ee687', 'coke', 0),
(55, 'steam:11000010f7ee687', 'packaged_plank', 0),
(56, 'steam:11000010f7ee687', 'blowpipe', 0),
(57, 'steam:11000010f7ee687', 'iron', 0),
(58, 'steam:11000010f7ee687', 'whool', 0),
(59, 'steam:11000010f7ee687', 'packaged_chicken', 0),
(60, 'steam:11000010f7ee687', 'meth', 0),
(61, 'steam:11000010f7ee687', 'weed_pooch', 0),
(62, 'steam:11000010f7ee687', 'diamond', 0),
(63, 'steam:11000010f7ee687', 'weed', 0),
(64, 'steam:11000010f7ee687', 'wood', 0),
(65, 'steam:11000010f7ee687', 'fish', 0),
(66, 'steam:11000010f7ee687', 'slaughtered_chicken', 0),
(67, 'steam:110000106247f6e', 'fish', 0),
(68, 'steam:110000106247f6e', 'packaged_chicken', 0),
(69, 'steam:110000106247f6e', 'water', 0),
(70, 'steam:110000106247f6e', 'essence', 0),
(71, 'steam:110000106247f6e', 'cutted_wood', 0),
(72, 'steam:110000106247f6e', 'copper', 0),
(73, 'steam:110000106247f6e', 'slaughtered_chicken', 0),
(74, 'steam:110000106247f6e', 'fixkit', 0),
(75, 'steam:110000106247f6e', 'fabric', 0),
(76, 'steam:110000106247f6e', 'bread', 0),
(77, 'steam:110000106247f6e', 'carokit', 0),
(78, 'steam:110000106247f6e', 'carotool', 0),
(79, 'steam:110000106247f6e', 'alive_chicken', 0),
(80, 'steam:110000106247f6e', 'iron', 0),
(81, 'steam:110000106247f6e', 'gold', 0),
(82, 'steam:110000106247f6e', 'coke_pooch', 0),
(83, 'steam:110000106247f6e', 'weed_pooch', 0),
(84, 'steam:110000106247f6e', 'clothe', 0),
(85, 'steam:110000106247f6e', 'weed', 0),
(86, 'steam:110000106247f6e', 'whool', 0),
(87, 'steam:110000106247f6e', 'stone', 0),
(88, 'steam:110000106247f6e', 'petrol', 0),
(89, 'steam:110000106247f6e', 'petrol_raffin', 0),
(90, 'steam:110000106247f6e', 'meth_pooch', 0),
(91, 'steam:110000106247f6e', 'meth', 0),
(92, 'steam:110000106247f6e', 'diamond', 0),
(93, 'steam:110000106247f6e', 'packaged_plank', 0),
(94, 'steam:110000106247f6e', 'coke', 0),
(95, 'steam:110000106247f6e', 'wood', 0),
(96, 'steam:110000106247f6e', 'washed_stone', 0),
(97, 'steam:110000106247f6e', 'gazbottle', 0),
(98, 'steam:110000106247f6e', 'blowpipe', 0),
(99, 'steam:110000106247f6e', 'fixtool', 0),
(100, 'steam:1100001015e828c', 'fabric', 0),
(101, 'steam:1100001015e828c', 'fish', 0),
(102, 'steam:1100001015e828c', 'packaged_chicken', 0),
(103, 'steam:1100001015e828c', 'diamond', 0),
(104, 'steam:1100001015e828c', 'iron', 0),
(105, 'steam:1100001015e828c', 'whool', 0),
(106, 'steam:1100001015e828c', 'blowpipe', 0),
(107, 'steam:1100001015e828c', 'gazbottle', 0),
(108, 'steam:1100001015e828c', 'wood', 0),
(109, 'steam:1100001015e828c', 'water', 5),
(110, 'steam:1100001015e828c', 'fixtool', 0),
(111, 'steam:1100001015e828c', 'essence', 0),
(112, 'steam:1100001015e828c', 'washed_stone', 0),
(113, 'steam:1100001015e828c', 'copper', 0),
(114, 'steam:1100001015e828c', 'cutted_wood', 0),
(115, 'steam:1100001015e828c', 'fixkit', 0),
(116, 'steam:1100001015e828c', 'slaughtered_chicken', 0),
(117, 'steam:1100001015e828c', 'bread', 6),
(118, 'steam:1100001015e828c', 'carokit', 0),
(119, 'steam:1100001015e828c', 'carotool', 0),
(120, 'steam:1100001015e828c', 'alive_chicken', 0),
(121, 'steam:1100001015e828c', 'gold', 0),
(122, 'steam:1100001015e828c', 'coke_pooch', 0),
(123, 'steam:1100001015e828c', 'weed_pooch', 0),
(124, 'steam:1100001015e828c', 'clothe', 0),
(125, 'steam:1100001015e828c', 'weed', 0),
(126, 'steam:1100001015e828c', 'stone', 0),
(127, 'steam:1100001015e828c', 'petrol', 0),
(128, 'steam:1100001015e828c', 'petrol_raffin', 0),
(129, 'steam:1100001015e828c', 'meth', 0),
(130, 'steam:1100001015e828c', 'meth_pooch', 0),
(131, 'steam:1100001015e828c', 'packaged_plank', 0),
(132, 'steam:1100001015e828c', 'coke', 0),
(133, 'steam:11000010e8ac2df', 'bread', 12),
(134, 'steam:11000010e8ac2df', 'packaged_chicken', 0),
(135, 'steam:11000010e8ac2df', 'fixtool', 0),
(136, 'steam:11000010e8ac2df', 'clothe', 0),
(137, 'steam:11000010e8ac2df', 'packaged_plank', 0),
(138, 'steam:11000010e8ac2df', 'cutted_wood', 0),
(139, 'steam:11000010e8ac2df', 'diamond', 0),
(140, 'steam:11000010e8ac2df', 'petrol', 0),
(141, 'steam:11000010e8ac2df', 'carokit', 0),
(142, 'steam:11000010e8ac2df', 'carotool', 0),
(143, 'steam:11000010e8ac2df', 'fish', 0),
(144, 'steam:11000010e8ac2df', 'meth_pooch', 0),
(145, 'steam:11000010e8ac2df', 'washed_stone', 0),
(146, 'steam:11000010e8ac2df', 'blowpipe', 0),
(147, 'steam:11000010e8ac2df', 'gazbottle', 0),
(148, 'steam:11000010e8ac2df', 'petrol_raffin', 0),
(149, 'steam:11000010e8ac2df', 'copper', 0),
(150, 'steam:11000010e8ac2df', 'alive_chicken', 0),
(151, 'steam:11000010e8ac2df', 'water', 36),
(152, 'steam:11000010e8ac2df', 'weed', 0),
(153, 'steam:11000010e8ac2df', 'fabric', 0),
(154, 'steam:11000010e8ac2df', 'coke_pooch', 0),
(155, 'steam:11000010e8ac2df', 'iron', 0),
(156, 'steam:11000010e8ac2df', 'whool', 0),
(157, 'steam:11000010e8ac2df', 'essence', 0),
(158, 'steam:11000010e8ac2df', 'wood', 0),
(159, 'steam:11000010e8ac2df', 'weed_pooch', 0),
(160, 'steam:11000010e8ac2df', 'gold', 0),
(161, 'steam:11000010e8ac2df', 'stone', 0),
(162, 'steam:11000010e8ac2df', 'slaughtered_chicken', 0),
(163, 'steam:11000010e8ac2df', 'coke', 0),
(164, 'steam:11000010e8ac2df', 'fixkit', 0),
(165, 'steam:11000010e8ac2df', 'meth', 0),
(166, 'steam:11000010a6c0398', 'weed', 0),
(167, 'steam:11000010a6c0398', 'stone', 0),
(168, 'steam:11000010a6c0398', 'carokit', 0),
(169, 'steam:11000010a6c0398', 'fixkit', 0),
(170, 'steam:11000010a6c0398', 'alive_chicken', 0),
(171, 'steam:11000010a6c0398', 'coke', 0),
(172, 'steam:11000010a6c0398', 'carotool', 0),
(173, 'steam:11000010a6c0398', 'packaged_plank', 0),
(174, 'steam:11000010a6c0398', 'coke_pooch', 0),
(175, 'steam:11000010a6c0398', 'clothe', 0),
(176, 'steam:11000010a6c0398', 'gazbottle', 0),
(177, 'steam:11000010a6c0398', 'slaughtered_chicken', 0),
(178, 'steam:11000010a6c0398', 'water', 2),
(179, 'steam:11000010a6c0398', 'meth_pooch', 0),
(180, 'steam:11000010a6c0398', 'gold', 0),
(181, 'steam:11000010a6c0398', 'bread', 3),
(182, 'steam:11000010a6c0398', 'copper', 0),
(183, 'steam:11000010a6c0398', 'petrol', 0),
(184, 'steam:11000010a6c0398', 'cutted_wood', 0),
(185, 'steam:11000010a6c0398', 'whool', 0),
(186, 'steam:11000010a6c0398', 'petrol_raffin', 0),
(187, 'steam:11000010a6c0398', 'fabric', 0),
(188, 'steam:11000010a6c0398', 'blowpipe', 0),
(189, 'steam:11000010a6c0398', 'fixtool', 0),
(190, 'steam:11000010a6c0398', 'iron', 0),
(191, 'steam:11000010a6c0398', 'wood', 0),
(192, 'steam:11000010a6c0398', 'meth', 0),
(193, 'steam:11000010a6c0398', 'packaged_chicken', 0),
(194, 'steam:11000010a6c0398', 'weed_pooch', 0),
(195, 'steam:11000010a6c0398', 'essence', 0),
(196, 'steam:11000010a6c0398', 'fish', 0),
(197, 'steam:11000010a6c0398', 'diamond', 0),
(198, 'steam:11000010a6c0398', 'washed_stone', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `garage` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `phone_number` int(11) DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `status`, `phone_number`, `last_property`) VALUES
('steam:1100001015e828c', 485744, 'Steph Jay', '{\"chain_1\":0,\"ears_2\":0,\"decals_2\":0,\"makeup_2\":0,\"eyebrows_4\":0,\"hair_1\":0,\"beard_1\":0,\"eyebrows_3\":0,\"torso_2\":1,\"skin\":0,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_1\":0,\"bags_2\":0,\"pants_2\":0,\"lipstick_2\":0,\"bags_1\":0,\"makeup_3\":0,\"tshirt_2\":0,\"torso_1\":22,\"beard_3\":0,\"hair_color_1\":0,\"age_2\":0,\"hair_color_2\":0,\"shoes_1\":0,\"lipstick_4\":0,\"age_1\":0,\"bproof_2\":0,\"face\":9,\"mask_1\":0,\"shoes_2\":0,\"ears_1\":0,\"helmet_1\":-1,\"beard_4\":0,\"chain_2\":0,\"decals_1\":0,\"beard_2\":0,\"pants_1\":0,\"hair_2\":0,\"lipstick_3\":0,\"arms\":0,\"eyebrows_2\":0,\"glasses_2\":0,\"mask_2\":0,\"makeup_1\":0,\"tshirt_1\":0,\"bproof_1\":0,\"helmet_2\":0,\"sex\":0,\"makeup_4\":0}', 'ambulance', 1, '[{\"label\":\"Couteau\",\"name\":\"WEAPON_KNIFE\",\"ammo\":0},{\"label\":\"Matraque\",\"name\":\"WEAPON_NIGHTSTICK\",\"ammo\":0},{\"label\":\"Marteau\",\"name\":\"WEAPON_HAMMER\",\"ammo\":0},{\"label\":\"Bat\",\"name\":\"WEAPON_BAT\",\"ammo\":0},{\"label\":\"Club de golfe\",\"name\":\"WEAPON_GOLFCLUB\",\"ammo\":0},{\"label\":\"Pied de biche\",\"name\":\"WEAPON_CROWBAR\",\"ammo\":0},{\"label\":\"Pistolet\",\"name\":\"WEAPON_PISTOL\",\"ammo\":250},{\"label\":\"Pistolet de combat\",\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":250},{\"label\":\"Pistolet automatique\",\"name\":\"WEAPON_APPISTOL\",\"ammo\":250},{\"label\":\"Pistolet calibre 50\",\"name\":\"WEAPON_PISTOL50\",\"ammo\":250},{\"label\":\"Micro smg\",\"name\":\"WEAPON_MICROSMG\",\"ammo\":250},{\"label\":\"Smg\",\"name\":\"WEAPON_SMG\",\"ammo\":250},{\"label\":\"Smg d\'assaut\",\"name\":\"WEAPON_ASSAULTSMG\",\"ammo\":250},{\"label\":\"Fusil d\'assaut\",\"name\":\"WEAPON_ASSAULTRIFLE\",\"ammo\":210},{\"label\":\"Carabine d\'assaut\",\"name\":\"WEAPON_CARBINERIFLE\",\"ammo\":210},{\"label\":\"Fusil avancé\",\"name\":\"WEAPON_ADVANCEDRIFLE\",\"ammo\":210},{\"label\":\"Mitrailleuse\",\"name\":\"WEAPON_MG\",\"ammo\":250},{\"label\":\"Mitrailleuse de combat\",\"name\":\"WEAPON_COMBATMG\",\"ammo\":250},{\"label\":\"Fusil à pompe\",\"name\":\"WEAPON_PUMPSHOTGUN\",\"ammo\":247},{\"label\":\"Carabine à canon scié\",\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"ammo\":247},{\"label\":\"Carabine d\'assaut\",\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"ammo\":247},{\"label\":\"Carabine bullpup\",\"name\":\"WEAPON_BULLPUPSHOTGUN\",\"ammo\":247},{\"label\":\"Tazer\",\"name\":\"WEAPON_STUNGUN\",\"ammo\":250},{\"label\":\"Fusil de sniper\",\"name\":\"WEAPON_SNIPERRIFLE\",\"ammo\":250},{\"label\":\"Fusil de sniper lourd\",\"name\":\"WEAPON_HEAVYSNIPER\",\"ammo\":250},{\"label\":\"Lance-grenade\",\"name\":\"WEAPON_GRENADELAUNCHER\",\"ammo\":8},{\"label\":\"Lance-rocket\",\"name\":\"WEAPON_RPG\",\"ammo\":1},{\"label\":\"Lance-missile stinger\",\"name\":\"WEAPON_STINGER\",\"ammo\":0},{\"label\":\"Minigun\",\"name\":\"WEAPON_MINIGUN\",\"ammo\":250},{\"label\":\"Grenade\",\"name\":\"WEAPON_GRENADE\",\"ammo\":1},{\"label\":\"Bombe collante\",\"name\":\"WEAPON_STICKYBOMB\",\"ammo\":1},{\"label\":\"Grenade fumigène\",\"name\":\"WEAPON_SMOKEGRENADE\",\"ammo\":1},{\"label\":\"Grenade à gaz bz\",\"name\":\"WEAPON_BZGAS\",\"ammo\":1},{\"label\":\"Cocktail molotov\",\"name\":\"WEAPON_MOLOTOV\",\"ammo\":1},{\"label\":\"Extincteur\",\"name\":\"WEAPON_FIREEXTINGUISHER\",\"ammo\":2000},{\"label\":\"Jerrican d\'essence\",\"name\":\"WEAPON_PETROLCAN\",\"ammo\":4500},{\"label\":\"Pistolet sns\",\"name\":\"WEAPON_SNSPISTOL\",\"ammo\":250},{\"label\":\"Bouteille\",\"name\":\"WEAPON_BOTTLE\",\"ammo\":0},{\"label\":\"Balayeuse gusenberg\",\"name\":\"WEAPON_GUSENBERG\",\"ammo\":250},{\"label\":\"Carabine spéciale\",\"name\":\"WEAPON_SPECIALCARBINE\",\"ammo\":210},{\"label\":\"Pistolet lourd\",\"name\":\"WEAPON_HEAVYPISTOL\",\"ammo\":250},{\"label\":\"Fusil bullpup\",\"name\":\"WEAPON_BULLPUPRIFLE\",\"ammo\":210},{\"label\":\"Poignard\",\"name\":\"WEAPON_DAGGER\",\"ammo\":0},{\"label\":\"Pistolet vintage\",\"name\":\"WEAPON_VINTAGEPISTOL\",\"ammo\":250},{\"label\":\"Feu d\'artifice\",\"name\":\"WEAPON_FIREWORK\",\"ammo\":1},{\"label\":\"Mousquet\",\"name\":\"WEAPON_MUSKET\",\"ammo\":247},{\"label\":\"Fusil à pompe lourd\",\"name\":\"WEAPON_HEAVYSHOTGUN\",\"ammo\":247},{\"label\":\"Fusil marksman\",\"name\":\"WEAPON_MARKSMANRIFLE\",\"ammo\":250},{\"label\":\"Lance tête-chercheuse\",\"name\":\"WEAPON_HOMINGLAUNCHER\",\"ammo\":1},{\"label\":\"Mine de proximité\",\"name\":\"WEAPON_PROXMINE\",\"ammo\":1},{\"label\":\"Boule de neige\",\"name\":\"WEAPON_SNOWBALL\",\"ammo\":1},{\"label\":\"Lance fusée de détresse\",\"name\":\"WEAPON_FLAREGUN\",\"ammo\":1},{\"label\":\"Arme de défense personnelle\",\"name\":\"WEAPON_COMBATPDW\",\"ammo\":250},{\"label\":\"Pistolet marksman\",\"name\":\"WEAPON_MARKSMANPISTOL\",\"ammo\":250},{\"label\":\"Poing américain\",\"name\":\"WEAPON_KNUCKLE\",\"ammo\":0},{\"label\":\"Hachette\",\"name\":\"WEAPON_HATCHET\",\"ammo\":0},{\"label\":\"Canon éléctrique\",\"name\":\"WEAPON_RAILGUN\",\"ammo\":1},{\"label\":\"Machetta\",\"name\":\"WEAPON_MACHETE\",\"ammo\":0},{\"label\":\"Pistolet mitrailleur\",\"name\":\"WEAPON_MACHINEPISTOL\",\"ammo\":250},{\"label\":\"Couteau à cran d\'arrêt\",\"name\":\"WEAPON_SWITCHBLADE\",\"ammo\":0},{\"label\":\"Revolver\",\"name\":\"WEAPON_REVOLVER\",\"ammo\":250},{\"label\":\"Fusil à pompe double canon\",\"name\":\"WEAPON_DBSHOTGUN\",\"ammo\":247},{\"label\":\"Fusil compact\",\"name\":\"WEAPON_COMPACTRIFLE\",\"ammo\":210},{\"label\":\"Lampe torche\",\"name\":\"WEAPON_FLASHLIGHT\",\"ammo\":0}]', '{\"y\":-1346.5208740234,\"x\":258.34686279297,\"z\":24.5378074646}', 600, 0, 'user', '[{\"name\":\"hunger\",\"val\":819200},{\"name\":\"thirst\",\"val\":824000}]', 53187, NULL),
('steam:110000106247f6e', 200, 'John Miller', '{\"decals_2\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"age_1\":0,\"beard_4\":0,\"eyebrows_3\":0,\"beard_1\":0,\"ears_2\":0,\"mask_2\":0,\"glasses_2\":0,\"beard_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"bags_1\":0,\"beard_3\":0,\"ears_1\":1,\"makeup_1\":0,\"chain_1\":0,\"hair_color_1\":3,\"lipstick_3\":0,\"lipstick_1\":0,\"shoes_1\":0,\"tshirt_1\":0,\"pants_1\":0,\"mask_1\":0,\"glasses_1\":0,\"makeup_2\":0,\"hair_2\":0,\"skin\":0,\"torso_2\":0,\"bproof_2\":0,\"decals_1\":0,\"eyebrows_2\":9,\"hair_color_2\":0,\"sex\":0,\"age_2\":0,\"tshirt_2\":0,\"eyebrows_1\":9,\"shoes_2\":0,\"face\":0,\"helmet_2\":0,\"arms\":0,\"makeup_3\":0,\"pants_2\":0,\"hair_1\":19,\"eyebrows_4\":0,\"torso_1\":0,\"chain_2\":0,\"lipstick_4\":0,\"bags_2\":0}', 'unemployed', 0, '[]', '{\"z\":57.697570800781,\"x\":-1715.4284667969,\"y\":-197.68785095215}', 0, 0, 'user', '[{\"name\":\"hunger\",\"val\":889600},{\"name\":\"thirst\",\"val\":862000}]', 62649, NULL),
('steam:11000010a6c0398', 233, 'Sam Rick', NULL, 'mecano', 1, '[]', '{\"z\":35.957256317139,\"x\":-393.78820800781,\"y\":-213.88035583496}', 0, 0, 'user', '[{\"name\":\"hunger\",\"val\":444800},{\"name\":\"thirst\",\"val\":506000}]', 90634, NULL),
('steam:11000010e8ac2df', 468324, 'Kendrick Jebbia', '{\"decals_2\":0,\"lipstick_2\":0,\"bags_1\":44,\"age_1\":0,\"beard_4\":0,\"arms\":0,\"lipstick_3\":0,\"chain_2\":5,\"mask_2\":1,\"glasses_2\":0,\"eyebrows_2\":10,\"ears_2\":0,\"bags_2\":0,\"makeup_1\":0,\"beard_3\":0,\"ears_1\":23,\"age_2\":0,\"sex\":0,\"hair_color_1\":0,\"beard_2\":10,\"lipstick_1\":0,\"shoes_1\":24,\"pants_2\":0,\"beard_1\":6,\"eyebrows_4\":0,\"shoes_2\":0,\"eyebrows_3\":0,\"hair_2\":0,\"makeup_3\":0,\"torso_2\":0,\"bproof_2\":0,\"decals_1\":0,\"skin\":3,\"hair_color_2\":0,\"lipstick_4\":0,\"hair_1\":50,\"tshirt_2\":0,\"eyebrows_1\":16,\"helmet_1\":5,\"chain_1\":6,\"glasses_1\":0,\"helmet_2\":0,\"makeup_2\":0,\"face\":2,\"bproof_1\":0,\"tshirt_1\":54,\"torso_1\":0,\"makeup_4\":0,\"pants_1\":31,\"mask_1\":51}', 'police', 1, '[{\"name\":\"WEAPON_KNIFE\",\"label\":\"Couteau\",\"ammo\":0},{\"name\":\"WEAPON_NIGHTSTICK\",\"label\":\"Matraque\",\"ammo\":0},{\"name\":\"WEAPON_HAMMER\",\"label\":\"Marteau\",\"ammo\":0},{\"name\":\"WEAPON_BAT\",\"label\":\"Bat\",\"ammo\":0},{\"name\":\"WEAPON_GOLFCLUB\",\"label\":\"Club de golfe\",\"ammo\":0},{\"name\":\"WEAPON_CROWBAR\",\"label\":\"Pied de biche\",\"ammo\":0},{\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":227},{\"name\":\"WEAPON_COMBATPISTOL\",\"label\":\"Pistolet de combat\",\"ammo\":227},{\"name\":\"WEAPON_APPISTOL\",\"label\":\"Pistolet automatique\",\"ammo\":227},{\"name\":\"WEAPON_PISTOL50\",\"label\":\"Pistolet calibre 50\",\"ammo\":227},{\"name\":\"WEAPON_MICROSMG\",\"label\":\"Micro smg\",\"ammo\":250},{\"name\":\"WEAPON_SMG\",\"label\":\"Smg\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTSMG\",\"label\":\"Smg d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"label\":\"Fusil d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_CARBINERIFLE\",\"label\":\"Carabine d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"label\":\"Fusil avancé\",\"ammo\":250},{\"name\":\"WEAPON_MG\",\"label\":\"Mitrailleuse\",\"ammo\":250},{\"name\":\"WEAPON_COMBATMG\",\"label\":\"Mitrailleuse de combat\",\"ammo\":250},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"label\":\"Fusil à pompe\",\"ammo\":250},{\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"label\":\"Carabine à canon scié\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"label\":\"Carabine d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_BULLPUPSHOTGUN\",\"label\":\"Carabine bullpup\",\"ammo\":250},{\"name\":\"WEAPON_STUNGUN\",\"label\":\"Tazer\",\"ammo\":-1},{\"name\":\"WEAPON_SNIPERRIFLE\",\"label\":\"Fusil de sniper\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYSNIPER\",\"label\":\"Fusil de sniper lourd\",\"ammo\":250},{\"name\":\"WEAPON_GRENADELAUNCHER\",\"label\":\"Lance-grenade\",\"ammo\":20},{\"name\":\"WEAPON_RPG\",\"label\":\"Lance-rocket\",\"ammo\":4},{\"name\":\"WEAPON_STINGER\",\"label\":\"Lance-missile stinger\",\"ammo\":4},{\"name\":\"WEAPON_MINIGUN\",\"label\":\"Minigun\",\"ammo\":250},{\"name\":\"WEAPON_GRENADE\",\"label\":\"Grenade\",\"ammo\":4},{\"name\":\"WEAPON_STICKYBOMB\",\"label\":\"Bombe collante\",\"ammo\":-1},{\"name\":\"WEAPON_SMOKEGRENADE\",\"label\":\"Grenade fumigène\",\"ammo\":4},{\"name\":\"WEAPON_BZGAS\",\"label\":\"Grenade à gaz bz\",\"ammo\":4},{\"name\":\"WEAPON_MOLOTOV\",\"label\":\"Cocktail molotov\",\"ammo\":4},{\"name\":\"WEAPON_FIREEXTINGUISHER\",\"label\":\"Extincteur\",\"ammo\":-1},{\"name\":\"WEAPON_PETROLCAN\",\"label\":\"Jerrican d\'essence\",\"ammo\":4500},{\"name\":\"WEAPON_BALL\",\"label\":\"Balle\",\"ammo\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":227},{\"name\":\"WEAPON_BOTTLE\",\"label\":\"Bouteille\",\"ammo\":0},{\"name\":\"WEAPON_GUSENBERG\",\"label\":\"Balayeuse gusenberg\",\"ammo\":250},{\"name\":\"WEAPON_SPECIALCARBINE\",\"label\":\"Carabine spéciale\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"label\":\"Pistolet lourd\",\"ammo\":227},{\"name\":\"WEAPON_BULLPUPRIFLE\",\"label\":\"Fusil bullpup\",\"ammo\":250},{\"name\":\"WEAPON_DAGGER\",\"label\":\"Poignard\",\"ammo\":0},{\"name\":\"WEAPON_VINTAGEPISTOL\",\"label\":\"Pistolet vintage\",\"ammo\":227},{\"name\":\"WEAPON_FIREWORK\",\"label\":\"Feu d\'artifice\",\"ammo\":4},{\"name\":\"WEAPON_MUSKET\",\"label\":\"Mousquet\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYSHOTGUN\",\"label\":\"Fusil à pompe lourd\",\"ammo\":250},{\"name\":\"WEAPON_MARKSMANRIFLE\",\"label\":\"Fusil marksman\",\"ammo\":250},{\"name\":\"WEAPON_HOMINGLAUNCHER\",\"label\":\"Lance tête-chercheuse\",\"ammo\":4},{\"name\":\"WEAPON_PROXMINE\",\"label\":\"Mine de proximité\",\"ammo\":4},{\"name\":\"WEAPON_SNOWBALL\",\"label\":\"Boule de neige\",\"ammo\":4},{\"name\":\"WEAPON_FLAREGUN\",\"label\":\"Lance fusée de détresse\",\"ammo\":4},{\"name\":\"WEAPON_COMBATPDW\",\"label\":\"Arme de défense personnelle\",\"ammo\":250},{\"name\":\"WEAPON_MARKSMANPISTOL\",\"label\":\"Pistolet marksman\",\"ammo\":227},{\"name\":\"WEAPON_KNUCKLE\",\"label\":\"Poing américain\",\"ammo\":0},{\"name\":\"WEAPON_HATCHET\",\"label\":\"Hachette\",\"ammo\":0},{\"name\":\"WEAPON_RAILGUN\",\"label\":\"Canon éléctrique\",\"ammo\":4},{\"name\":\"WEAPON_MACHETE\",\"label\":\"Machetta\",\"ammo\":0},{\"name\":\"WEAPON_MACHINEPISTOL\",\"label\":\"Pistolet mitrailleur\",\"ammo\":250},{\"name\":\"WEAPON_SWITCHBLADE\",\"label\":\"Couteau à cran d\'arrêt\",\"ammo\":0},{\"name\":\"WEAPON_REVOLVER\",\"label\":\"Revolver\",\"ammo\":227},{\"name\":\"WEAPON_DBSHOTGUN\",\"label\":\"Fusil à pompe double canon\",\"ammo\":250},{\"name\":\"WEAPON_COMPACTRIFLE\",\"label\":\"Fusil compact\",\"ammo\":250},{\"name\":\"WEAPON_FLASHLIGHT\",\"label\":\"Lampe torche\",\"ammo\":0},{\"name\":\"GADGET_PARACHUTE\",\"label\":\"Parachute\",\"ammo\":0}]', '{\"z\":38.060878753662,\"x\":-360.45489501953,\"y\":-132.72468566895}', 0, 0, 'user', '[{\"name\":\"hunger\",\"val\":790200},{\"name\":\"thirst\",\"val\":762750}]', 41525, NULL),
('steam:11000010f7ee687', 0, 'Krusty', NULL, 'unemployed', 0, '[]', '{\"x\":3000.8156738281,\"y\":5293.0668945313,\"z\":112.04779052734}', 0, 0, 'user', '[{\"val\":975800,\"name\":\"hunger\"},{\"val\":969750,\"name\":\"thirst\"}]', 82784, NULL),
('steam:11000010fe01cf0', 441740, 'James Jebbia hellcase.com', '{\"chain_1\":0,\"ears_2\":8,\"ears_1\":6,\"makeup_2\":10,\"eyebrows_4\":2,\"hair_1\":2,\"beard_2\":10,\"eyebrows_3\":3,\"torso_2\":0,\"skin\":0,\"lipstick_1\":8,\"eyebrows_1\":10,\"helmet_2\":0,\"bags_2\":0,\"pants_2\":0,\"lipstick_2\":10,\"bags_1\":0,\"makeup_3\":4,\"tshirt_2\":2,\"torso_1\":3,\"decals_1\":0,\"hair_color_1\":3,\"tshirt_1\":10,\"hair_color_2\":1,\"shoes_1\":0,\"glasses_1\":0,\"beard_3\":8,\"bproof_2\":0,\"face\":0,\"beard_4\":9,\"age_2\":0,\"makeup_4\":2,\"helmet_1\":-1,\"bproof_1\":0,\"decals_2\":0,\"chain_2\":0,\"age_1\":0,\"pants_1\":0,\"hair_2\":0,\"lipstick_3\":3,\"arms\":0,\"eyebrows_2\":4,\"glasses_2\":0,\"mask_2\":0,\"makeup_1\":6,\"mask_1\":0,\"beard_1\":10,\"sex\":0,\"shoes_2\":0,\"lipstick_4\":0}', 'ambulance', 1, '[{\"name\":\"WEAPON_KNIFE\",\"label\":\"Couteau\",\"ammo\":0},{\"name\":\"WEAPON_NIGHTSTICK\",\"label\":\"Matraque\",\"ammo\":0},{\"name\":\"WEAPON_HAMMER\",\"label\":\"Marteau\",\"ammo\":0},{\"name\":\"WEAPON_BAT\",\"label\":\"Bat\",\"ammo\":0},{\"name\":\"WEAPON_GOLFCLUB\",\"label\":\"Club de golfe\",\"ammo\":0},{\"name\":\"WEAPON_CROWBAR\",\"label\":\"Pied de biche\",\"ammo\":0},{\"name\":\"WEAPON_PISTOL\",\"label\":\"Pistolet\",\"ammo\":250},{\"name\":\"WEAPON_COMBATPISTOL\",\"label\":\"Pistolet de combat\",\"ammo\":250},{\"name\":\"WEAPON_APPISTOL\",\"label\":\"Pistolet automatique\",\"ammo\":250},{\"name\":\"WEAPON_PISTOL50\",\"label\":\"Pistolet calibre 50\",\"ammo\":250},{\"name\":\"WEAPON_MICROSMG\",\"label\":\"Micro smg\",\"ammo\":250},{\"name\":\"WEAPON_SMG\",\"label\":\"Smg\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTSMG\",\"label\":\"Smg d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"label\":\"Fusil d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_CARBINERIFLE\",\"label\":\"Carabine d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_ADVANCEDRIFLE\",\"label\":\"Fusil avancé\",\"ammo\":250},{\"name\":\"WEAPON_MG\",\"label\":\"Mitrailleuse\",\"ammo\":250},{\"name\":\"WEAPON_COMBATMG\",\"label\":\"Mitrailleuse de combat\",\"ammo\":250},{\"name\":\"WEAPON_PUMPSHOTGUN\",\"label\":\"Fusil à pompe\",\"ammo\":250},{\"name\":\"WEAPON_SAWNOFFSHOTGUN\",\"label\":\"Carabine à canon scié\",\"ammo\":250},{\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"label\":\"Carabine d\'assaut\",\"ammo\":250},{\"name\":\"WEAPON_BULLPUPSHOTGUN\",\"label\":\"Carabine bullpup\",\"ammo\":250},{\"name\":\"WEAPON_STUNGUN\",\"label\":\"Tazer\",\"ammo\":250},{\"name\":\"WEAPON_SNIPERRIFLE\",\"label\":\"Fusil de sniper\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYSNIPER\",\"label\":\"Fusil de sniper lourd\",\"ammo\":250},{\"name\":\"WEAPON_GRENADELAUNCHER\",\"label\":\"Lance-grenade\",\"ammo\":20},{\"name\":\"WEAPON_RPG\",\"label\":\"Lance-rocket\",\"ammo\":20},{\"name\":\"WEAPON_STINGER\",\"label\":\"Lance-missile stinger\",\"ammo\":20},{\"name\":\"WEAPON_MINIGUN\",\"label\":\"Minigun\",\"ammo\":250},{\"name\":\"WEAPON_GRENADE\",\"label\":\"Grenade\",\"ammo\":25},{\"name\":\"WEAPON_STICKYBOMB\",\"label\":\"Bombe collante\",\"ammo\":25},{\"name\":\"WEAPON_SMOKEGRENADE\",\"label\":\"Grenade fumigène\",\"ammo\":25},{\"name\":\"WEAPON_BZGAS\",\"label\":\"Grenade à gaz bz\",\"ammo\":25},{\"name\":\"WEAPON_MOLOTOV\",\"label\":\"Cocktail molotov\",\"ammo\":25},{\"name\":\"WEAPON_FIREEXTINGUISHER\",\"label\":\"Extincteur\",\"ammo\":2000},{\"name\":\"WEAPON_PETROLCAN\",\"label\":\"Jerrican d\'essence\",\"ammo\":4500},{\"name\":\"WEAPON_BALL\",\"label\":\"Balle\",\"ammo\":1},{\"name\":\"WEAPON_SNSPISTOL\",\"label\":\"Pistolet sns\",\"ammo\":250},{\"name\":\"WEAPON_BOTTLE\",\"label\":\"Bouteille\",\"ammo\":0},{\"name\":\"WEAPON_GUSENBERG\",\"label\":\"Balayeuse gusenberg\",\"ammo\":250},{\"name\":\"WEAPON_SPECIALCARBINE\",\"label\":\"Carabine spéciale\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYPISTOL\",\"label\":\"Pistolet lourd\",\"ammo\":250},{\"name\":\"WEAPON_BULLPUPRIFLE\",\"label\":\"Fusil bullpup\",\"ammo\":250},{\"name\":\"WEAPON_DAGGER\",\"label\":\"Poignard\",\"ammo\":0},{\"name\":\"WEAPON_VINTAGEPISTOL\",\"label\":\"Pistolet vintage\",\"ammo\":250},{\"name\":\"WEAPON_FIREWORK\",\"label\":\"Feu d\'artifice\",\"ammo\":20},{\"name\":\"WEAPON_MUSKET\",\"label\":\"Mousquet\",\"ammo\":250},{\"name\":\"WEAPON_HEAVYSHOTGUN\",\"label\":\"Fusil à pompe lourd\",\"ammo\":250},{\"name\":\"WEAPON_MARKSMANRIFLE\",\"label\":\"Fusil marksman\",\"ammo\":250},{\"name\":\"WEAPON_HOMINGLAUNCHER\",\"label\":\"Lance tête-chercheuse\",\"ammo\":10},{\"name\":\"WEAPON_PROXMINE\",\"label\":\"Mine de proximité\",\"ammo\":5},{\"name\":\"WEAPON_SNOWBALL\",\"label\":\"Boule de neige\",\"ammo\":10},{\"name\":\"WEAPON_FLAREGUN\",\"label\":\"Lance fusée de détresse\",\"ammo\":20},{\"name\":\"WEAPON_COMBATPDW\",\"label\":\"Arme de défense personnelle\",\"ammo\":250},{\"name\":\"WEAPON_MARKSMANPISTOL\",\"label\":\"Pistolet marksman\",\"ammo\":250},{\"name\":\"WEAPON_KNUCKLE\",\"label\":\"Poing américain\",\"ammo\":0},{\"name\":\"WEAPON_HATCHET\",\"label\":\"Hachette\",\"ammo\":0},{\"name\":\"WEAPON_RAILGUN\",\"label\":\"Canon éléctrique\",\"ammo\":20},{\"name\":\"WEAPON_MACHETE\",\"label\":\"Machetta\",\"ammo\":0},{\"name\":\"WEAPON_MACHINEPISTOL\",\"label\":\"Pistolet mitrailleur\",\"ammo\":250},{\"name\":\"WEAPON_SWITCHBLADE\",\"label\":\"Couteau à cran d\'arrêt\",\"ammo\":0},{\"name\":\"WEAPON_REVOLVER\",\"label\":\"Revolver\",\"ammo\":250},{\"name\":\"WEAPON_DBSHOTGUN\",\"label\":\"Fusil à pompe double canon\",\"ammo\":250},{\"name\":\"WEAPON_COMPACTRIFLE\",\"label\":\"Fusil compact\",\"ammo\":250},{\"name\":\"WEAPON_FLASHLIGHT\",\"label\":\"Lampe torche\",\"ammo\":0},{\"name\":\"GADGET_PARACHUTE\",\"label\":\"Parachute\",\"ammo\":0}]', '{\"z\":38.68510055542,\"x\":-371.00823974609,\"y\":-134.32118225098}', 0, 4, 'superadmin', '[{\"name\":\"hunger\",\"val\":250200},{\"name\":\"thirst\",\"val\":176750}]', 27396, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`id`, `name`, `label`) VALUES
(1, 'compacts', 'Compacts'),
(2, 'coupes', 'Coupés'),
(3, 'sedans', 'Sedans'),
(4, 'sports', 'Sports'),
(5, 'sportsclassics', 'Sports Classics'),
(6, 'super', 'Super'),
(7, 'muscle', 'Muscle'),
(8, 'offroad', 'Off Road'),
(9, 'suvs', 'SUVs'),
(10, 'vans', 'Vans'),
(11, 'sedans', 'Sedans'),
(12, 'motorcycles', 'Motos');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `model`, `price`, `category`) VALUES
(1, 'Blade', 'blade', 15000, 'muscle'),
(2, 'Buccaneer', 'buccaneer', 18000, 'muscle'),
(3, 'Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
(4, 'Chino', 'chino', 15000, 'muscle'),
(5, 'Chino Luxe', 'chino2', 19000, 'muscle'),
(6, 'Coquette BlackFin', 'coquette3', 55000, 'muscle'),
(7, 'Dominator', 'dominator', 35000, 'muscle'),
(8, 'Dukes', 'dukes', 28000, 'muscle'),
(9, 'Gauntlet', 'gauntlet', 30000, 'muscle'),
(10, 'Hotknife', 'hotknife', 125000, 'muscle'),
(11, 'Faction', 'faction', 20000, 'muscle'),
(12, 'Faction Rider', 'faction2', 30000, 'muscle'),
(13, 'Faction XL', 'faction3', 40000, 'muscle'),
(14, 'Nightshade', 'nightshade', 65000, 'muscle'),
(15, 'Phoenix', 'phoenix', 12500, 'muscle'),
(16, 'Picador', 'picador', 18000, 'muscle'),
(17, 'Sabre Turbo', 'sabregt', 20000, 'muscle'),
(18, 'Sabre GT', 'sabregt2', 25000, 'muscle'),
(19, 'Slam Van', 'slamvan3', 11500, 'muscle'),
(20, 'Tampa', 'tampa', 16000, 'muscle'),
(21, 'Virgo', 'virgo', 14000, 'muscle'),
(22, 'Vigero', 'vigero', 12500, 'muscle'),
(23, 'Voodoo', 'voodoo', 7200, 'muscle'),
(24, 'Blista', 'blista', 8000, 'compacts'),
(25, 'Brioso R/A', 'brioso', 18000, 'compacts'),
(26, 'Issi', 'issi2', 10000, 'compacts'),
(27, 'Panto', 'panto', 10000, 'compacts'),
(28, 'Prairie', 'prairie', 12000, 'compacts'),
(29, 'Bison', 'bison', 45000, 'vans'),
(30, 'Bobcat XL', 'bobcatxl', 32000, 'vans'),
(31, 'Burrito', 'burrito3', 19000, 'vans'),
(32, 'Burrito', 'gburrito2', 29000, 'vans'),
(33, 'Camper', 'camper', 42000, 'vans'),
(34, 'Gang Burrito', 'gburrito', 45000, 'vans'),
(35, 'Journey', 'journey', 6500, 'vans'),
(36, 'Minivan', 'minivan', 13000, 'vans'),
(37, 'Moonbeam', 'moonbeam', 18000, 'vans'),
(38, 'Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
(39, 'Paradise', 'paradise', 19000, 'vans'),
(40, 'Rumpo', 'rumpo', 15000, 'vans'),
(41, 'Rumpo Trail', 'rumpo3', 19500, 'vans'),
(42, 'Surfer', 'surfer', 12000, 'vans'),
(43, 'Youga', 'youga', 10800, 'vans'),
(44, 'Youga Luxuary', 'youga2', 14500, 'vans'),
(45, 'Asea', 'asea', 5500, 'sedans'),
(46, 'Cognoscenti', 'cognoscenti', 55000, 'sedans'),
(47, 'Emperor', 'emperor', 8500, 'sedans'),
(48, 'Fugitive', 'fugitive', 12000, 'sedans'),
(49, 'Glendale', 'glendale', 6500, 'sedans'),
(50, 'Intruder', 'intruder', 7500, 'sedans'),
(51, 'Premier', 'premier', 8000, 'sedans'),
(52, 'Primo Custom', 'primo2', 14000, 'sedans'),
(53, 'Regina', 'regina', 5000, 'sedans'),
(54, 'Schafter', 'schafter2', 25000, 'sedans'),
(55, 'Stretch', 'stretch', 90000, 'sedans'),
(56, 'Super Diamond', 'superd', 130000, 'sedans'),
(57, 'Tailgater', 'tailgater', 30000, 'sedans'),
(58, 'Warrener', 'warrener', 4000, 'sedans'),
(59, 'Washington', 'washington', 9000, 'sedans'),
(60, 'Baller', 'baller2', 40000, 'suvs'),
(61, 'Baller Sport', 'baller3', 60000, 'suvs'),
(62, 'Cavalcade', 'cavalcade2', 55000, 'suvs'),
(63, 'Contender', 'contender', 70000, 'suvs'),
(64, 'Dubsta', 'dubsta', 45000, 'suvs'),
(65, 'Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
(66, 'Fhantom', 'fq2', 17000, 'suvs'),
(67, 'Grabger', 'granger', 50000, 'suvs'),
(68, 'Gresley', 'gresley', 47500, 'suvs'),
(69, 'Huntley S', 'huntley', 40000, 'suvs'),
(70, 'Landstalker', 'landstalker', 35000, 'suvs'),
(71, 'Mesa', 'mesa', 16000, 'suvs'),
(72, 'Mesa Trail', 'mesa3', 40000, 'suvs'),
(73, 'Patriot', 'patriot', 55000, 'suvs'),
(74, 'Radius', 'radi', 29000, 'suvs'),
(75, 'Rocoto', 'rocoto', 45000, 'suvs'),
(76, 'Seminole', 'seminole', 25000, 'suvs'),
(77, 'XLS', 'xls', 32000, 'suvs'),
(78, 'Btype', 'btype', 62000, 'sportsclassics'),
(79, 'Btype Luxe', 'btype3', 85000, 'sportsclassics'),
(80, 'Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
(81, 'Casco', 'casco', 30000, 'sportsclassics'),
(82, 'Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
(83, 'Manana', 'manana', 12800, 'sportsclassics'),
(84, 'Monroe', 'monroe', 55000, 'sportsclassics'),
(85, 'Pigalle', 'pigalle', 20000, 'sportsclassics'),
(86, 'Stinger', 'stinger', 80000, 'sportsclassics'),
(87, 'Stinger GT', 'stingergt', 75000, 'sportsclassics'),
(88, 'Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
(89, 'Z-Type', 'ztype', 220000, 'sportsclassics'),
(90, 'Bifta', 'bifta', 12000, 'offroad'),
(91, 'Bf Injection', 'bfinjection', 16000, 'offroad'),
(92, 'Blazer', 'blazer', 6500, 'offroad'),
(93, 'Blazer Sport', 'blazer4', 8500, 'offroad'),
(94, 'Brawler', 'brawler', 45000, 'offroad'),
(95, 'Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
(96, 'Dune Buggy', 'dune', 8000, 'offroad'),
(97, 'Guardian', 'guardian', 45000, 'offroad'),
(98, 'Rebel', 'rebel2', 35000, 'offroad'),
(99, 'Sandking', 'sandking', 55000, 'offroad'),
(100, 'The Liberator', 'monster', 210000, 'offroad'),
(101, 'Trophy Truck', 'trophytruck', 60000, 'offroad'),
(102, 'Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
(103, 'Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
(104, 'Exemplar', 'exemplar', 32000, 'coupes'),
(105, 'F620', 'f620', 40000, 'coupes'),
(106, 'Felon', 'felon', 42000, 'coupes'),
(107, 'Felon GT', 'felon2', 55000, 'coupes'),
(108, 'Jackal', 'jackal', 38000, 'coupes'),
(109, 'Oracle XS', 'oracle2', 35000, 'coupes'),
(110, 'Sentinel', 'sentinel', 32000, 'coupes'),
(111, 'Sentinel XS', 'sentinel2', 40000, 'coupes'),
(112, 'Windsor', 'windsor', 95000, 'coupes'),
(113, 'Windsor Drop', 'windsor2', 125000, 'coupes'),
(114, 'Zion', 'zion', 36000, 'coupes'),
(115, 'Zion Cabrio', 'zion2', 45000, 'coupes'),
(116, '9F', 'ninef', 65000, 'sports'),
(117, '9F Cabrio', 'ninef2', 80000, 'sports'),
(118, 'Alpha', 'alpha', 60000, 'sports'),
(119, 'Banshee', 'banshee', 70000, 'sports'),
(120, 'Bestia GTS', 'bestiagts', 55000, 'sports'),
(121, 'Buffalo', 'buffalo', 12000, 'sports'),
(122, 'Buffalo S', 'buffalo2', 20000, 'sports'),
(123, 'Carbonizzare', 'carbonizzare', 75000, 'sports'),
(124, 'Comet', 'comet2', 65000, 'sports'),
(125, 'Coquette', 'coquette', 65000, 'sports'),
(126, 'Drift Tampa', 'tampa2', 80000, 'sports'),
(127, 'Elegy', 'elegy2', 38500, 'sports'),
(128, 'Feltzer', 'feltzer2', 55000, 'sports'),
(129, 'Furore GT', 'furoregt', 45000, 'sports'),
(130, 'Fusilade', 'fusilade', 40000, 'sports'),
(131, 'Jester', 'jester', 65000, 'sports'),
(132, 'Jester(Racecar)', 'jester2', 135000, 'sports'),
(133, 'Khamelion', 'khamelion', 38000, 'sports'),
(134, 'Kuruma', 'kuruma', 30000, 'sports'),
(135, 'Lynx', 'lynx', 40000, 'sports'),
(136, 'Mamba', 'mamba', 70000, 'sports'),
(137, 'Massacro', 'massacro', 65000, 'sports'),
(138, 'Massacro(Racecar)', 'massacro2', 130000, 'sports'),
(139, 'Omnis', 'omnis', 35000, 'sports'),
(140, 'Penumbra', 'penumbra', 28000, 'sports'),
(141, 'Rapid GT', 'rapidgt', 35000, 'sports'),
(142, 'Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
(143, 'Schafter V12', 'schafter3', 50000, 'sports'),
(144, 'Seven 70', 'seven70', 39500, 'sports'),
(145, 'Sultan', 'sultan', 15000, 'sports'),
(146, 'Surano', 'surano', 50000, 'sports'),
(147, 'Tropos', 'tropos', 40000, 'sports'),
(148, 'Verlierer', 'verlierer2', 70000, 'sports'),
(149, 'Adder', 'adder', 900000, 'super'),
(150, 'Banshee 900R', 'banshee2', 255000, 'super'),
(151, 'Bullet', 'bullet', 90000, 'super'),
(152, 'Cheetah', 'cheetah', 375000, 'super'),
(153, 'Entity XF', 'entityxf', 425000, 'super'),
(154, 'ETR1', 'sheava', 220000, 'super'),
(155, 'FMJ', 'fmj', 185000, 'super'),
(156, 'Infernus', 'infernus', 180000, 'super'),
(157, 'Osiris', 'osiris', 160000, 'super'),
(158, 'Pfister', 'pfister811', 85000, 'super'),
(159, 'RE-7B', 'le7b', 325000, 'super'),
(160, 'Reaper', 'reaper', 150000, 'super'),
(161, 'Sultan RS', 'sultanrs', 65000, 'super'),
(162, 'T20', 't20', 300000, 'super'),
(163, 'Turismo R', 'turismor', 350000, 'super'),
(164, 'Tyrus', 'tyrus', 600000, 'super'),
(165, 'Vacca', 'vacca', 120000, 'super'),
(166, 'Voltic', 'voltic', 90000, 'super'),
(167, 'X80 Proto', 'prototipo', 2500000, 'super'),
(168, 'Zentorno', 'zentorno', 1500000, 'super'),
(169, 'Akuma', 'AKUMA', 7500, 'motorcycles'),
(170, 'Avarus', 'avarus', 18000, 'motorcycles'),
(171, 'Bagger', 'bagger', 13500, 'motorcycles'),
(172, 'Bati 801', 'bati', 12000, 'motorcycles'),
(173, 'Bati 801RR', 'bati2', 19000, 'motorcycles'),
(174, 'BF400', 'bf400', 6500, 'motorcycles'),
(175, 'BMX (velo)', 'bmx', 160, 'motorcycles'),
(176, 'Carbon RS', 'carbonrs', 18000, 'motorcycles'),
(177, 'Chimera', 'chimera', 38000, 'motorcycles'),
(178, 'Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
(179, 'Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
(180, 'Daemon', 'daemon', 11500, 'motorcycles'),
(181, 'Daemon High', 'daemon2', 13500, 'motorcycles'),
(182, 'Defiler', 'defiler', 9800, 'motorcycles'),
(183, 'Double T', 'double', 28000, 'motorcycles'),
(184, 'Enduro', 'enduro', 5500, 'motorcycles'),
(185, 'Esskey', 'esskey', 4200, 'motorcycles'),
(186, 'Faggio', 'faggio', 1900, 'motorcycles'),
(187, 'Vespa', 'faggio2', 2800, 'motorcycles'),
(188, 'Fixter (velo)', 'fixter', 225, 'motorcycles'),
(189, 'Gargoyle', 'gargoyle', 16500, 'motorcycles'),
(190, 'Hakuchou', 'hakuchou', 31000, 'motorcycles'),
(191, 'Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
(192, 'Hexer', 'hexer', 12000, 'motorcycles'),
(193, 'Innovation', 'innovation', 23500, 'motorcycles'),
(194, 'Manchez', 'manchez', 5300, 'motorcycles'),
(195, 'Nemesis', 'nemesis', 5800, 'motorcycles'),
(196, 'Nightblade', 'nightblade', 35000, 'motorcycles'),
(197, 'PCJ-600', 'pcj', 6200, 'motorcycles'),
(198, 'Ruffian', 'ruffian', 6800, 'motorcycles'),
(199, 'Sanchez', 'sanchez', 5300, 'motorcycles'),
(200, 'Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
(201, 'Sanctus', 'sanctus', 25000, 'motorcycles'),
(202, 'Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
(203, 'Sovereign', 'sovereign', 22000, 'motorcycles'),
(204, 'Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
(205, 'Thrust', 'thrust', 24000, 'motorcycles'),
(206, 'Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
(207, 'Vader', 'vader', 7200, 'motorcycles'),
(208, 'Vortex', 'vortex', 9800, 'motorcycles'),
(209, 'Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
(210, 'Zombie', 'zombiea', 9500, 'motorcycles'),
(211, 'Zombie Luxuary', 'zombieb', 12000, 'motorcycles');

-- --------------------------------------------------------

--
-- Structure de la table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `weashops`
--

INSERT INTO `weashops` (`id`, `name`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500);

-- --------------------------------------------------------

--
-- Structure de la table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `whitelist`
--

INSERT INTO `whitelist` (`identifier`) VALUES
('steam:1100001015e828c'),
('steam:110000106247f6e'),
('steam:11000010a6c0398'),
('steam:11000010e8ac2df'),
('steam:11000010fe01cf0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account`
--
ALTER TABLE `addon_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `datastore`
--
ALTER TABLE `datastore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT pour la table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Base de données :  `gta5_gamemode_essential`
--
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gta5_gamemode_essential`;

-- --------------------------------------------------------

--
-- Structure de la table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `banned` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `banner` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `reason` varchar(150) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coffre`
--

CREATE TABLE `coffre` (
  `id` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `x` varchar(25) NOT NULL,
  `y` varchar(25) NOT NULL,
  `z` varchar(25) NOT NULL,
  `solde` varchar(25) NOT NULL,
  `solde_sale` varchar(25) NOT NULL,
  `lasttransfert` varchar(25) NOT NULL,
  `identifier` varchar(25) NOT NULL,
  `job` varchar(25) DEFAULT NULL,
  `job2` varchar(25) DEFAULT NULL,
  `job3` varchar(25) DEFAULT NULL,
  `job4` varchar(25) DEFAULT NULL,
  `job5` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `coffre`
--

INSERT INTO `coffre` (`id`, `nom`, `x`, `y`, `z`, `solde`, `solde_sale`, `lasttransfert`, `identifier`, `job`, `job2`, `job3`, `job4`, `job5`) VALUES
('1', 'LSPD', '452.953', '-973.321', '30.15', '0', '0', '5', 'steam:11000010fe01cf0', '10', '8', '100', '100', '100'),
('2', 'Pecheur', '3817.11', '4440.94', '2.450', '50015', '1', '1', 'steam:11000010fe01cf0', '14', '100', '100', '100', '100'),
('3', 'Depanneur', '479.629', '-1326.28', '28.450', '0', '0', '0', '0', '16', '100', '100', '100', '100'),
('4', 'Taxi', '886.599', '-173.171', '77.1102', '0', '0', '0', '0', '5', '100', '100', '100', '100'),
('5', 'Brinks', '262.497', '220.629', '100.780', '-1', '0', '1', 'steam:11000010fe01cf0', '15', '100', '100', '100', '100');

-- --------------------------------------------------------

--
-- Structure de la table `coffre_items`
--

CREATE TABLE `coffre_items` (
  `id_coffre` varchar(50) NOT NULL,
  `id_item` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `coffre_items`
--

INSERT INTO `coffre_items` (`id_coffre`, `id_item`, `quantite`) VALUES
('1', '1', 5);

-- --------------------------------------------------------

--
-- Structure de la table `coordinates`
--

CREATE TABLE `coordinates` (
  `identifier` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `coordinates`
--

INSERT INTO `coordinates` (`identifier`, `x`, `y`, `z`) VALUES
('steam:1100001015e828c', 247.75863647460938, -1371.768310546875, 39.534385681152344),
('steam:110000103606e04', -850.27880859375, -2601.09228515625, 13.441924095153809),
('steam:110000106247f6e', 297.17767333984375, -1431.9306640625, -23.287508010864258),
('steam:11000010881fdbb', 254.8240203857422, 218.2005157470703, 106.28682708740234),
('steam:11000010a6c0398', 349.535888671875, -1341.9346923828125, 31.619043350219727),
('steam:11000010a7ff44b', -347.7336120605469, -35.908504486083984, 47.489925384521484),
('steam:11000010cabc803', -791.8617553710938, -1638.2421875, 15.619486808776855),
('steam:11000010fe01cf0', 277.50897216796875, -1420.50244140625, 11.039400100708008),
('steam:1100001109f4ca8', -1037.9271240234375, -2738.060546875, 20.16922950744629),
('steam:1100001177d08b1', -617.8307495117188, -168.09152221679688, 37.366878509521484);

-- --------------------------------------------------------

--
-- Structure de la table `depanneur`
--

CREATE TABLE `depanneur` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise_compte`
--

CREATE TABLE `entreprise_compte` (
  `id` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `solde` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `entreprise_compte`
--

INSERT INTO `entreprise_compte` (`id`, `nom`, `solde`) VALUES
('1', 'Compte LSPD', '0'),
('2', 'Compte Depanneur', '0'),
('3', 'Compte taxi', '0'),
('4', 'Compte Pecheur', '0'),
('5', 'Compte Brinks', '0');

-- --------------------------------------------------------

--
-- Structure de la table `fbi`
--

CREATE TABLE `fbi` (
  `identifier` varchar(50) NOT NULL,
  `rank` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `libelle`, `value`, `type`) VALUES
(1, 'Bouteille d\'eau', 20, 1),
(2, 'Sandwich', 20, 2),
(3, 'Filet Mignon', 20, 2),
(4, 'Cannabis', 0, 0),
(5, 'Cannabis roulé', 0, 0),
(6, 'Feuille Coka', 0, 0),
(7, 'Coka', 0, 0),
(8, 'Coka', 0, 0),
(9, 'Ephedrine ', 0, 0),
(10, 'Matière illégale', 0, 0),
(11, 'Matière illégale', 0, 0),
(12, 'Meth', 0, 0),
(13, 'Organe', 0, 0),
(14, 'Organe emballé', 0, 0),
(15, 'Organe analysé', 0, 0),
(16, 'Organe livrable', 0, 0),
(17, 'Cuivre', 0, 0),
(18, 'Fer', 0, 0),
(19, 'Diamants', 0, 0),
(20, 'Cuivre traité', 0, 0),
(21, 'Fer traité', 0, 0),
(22, 'Diamants traité', 0, 0),
(23, 'Roche', 0, 0),
(24, 'Roche traitée', 0, 0),
(25, 'Poisson', 5, 2),
(26, 'Corps', 0, 0),
(27, 'Corps traité', 0, 0),
(28, 'Poisson propre', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Sans Emploi', 0),
(2, 'Nettoyeur de piscine', 0),
(3, 'Éboueur', 0),
(4, 'Mineur', 0),
(5, 'Chauffeur de taxi', 50),
(6, 'Livreur de bois', 0),
(7, 'Livreur de citerne', 0),
(8, 'Livreur de conteneur', 0),
(9, 'Livreur de médicament', 0),
(10, 'Policier', 0),
(11, 'Fossoyeur', 0),
(12, 'Préposé à la morgue', 0),
(13, 'Ambulancier', 50),
(14, 'Pecheur', 50),
(15, 'Brinks', 500),
(16, 'Depanneur', 500),
(17, 'Pompiste', 500),
(18, 'FBI', 500),
(19, 'Gouverneur', 500);

-- --------------------------------------------------------

--
-- Structure de la table `outfits`
--

CREATE TABLE `outfits` (
  `identifier` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0',
  `three` int(11) NOT NULL DEFAULT '0',
  `three_text` int(11) NOT NULL DEFAULT '0',
  `seven` int(11) NOT NULL DEFAULT '0',
  `seven_text` int(11) NOT NULL DEFAULT '0',
  `haircolor` int(11) NOT NULL DEFAULT '0',
  `haircolor_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `outfits`
--

INSERT INTO `outfits` (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`, `three`, `three_text`, `seven`, `seven_text`, `haircolor`, `haircolor_text`) VALUES
('steam:1100001015e828c', 'mp_m_freemode_01', 0, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:110000103606e04', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2, 0, 0),
('steam:110000106247f6e', 'mp_m_freemode_01', 0, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:11000010881fdbb', 'mp_m_freemode_01', 0, 0, -1, -1, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 0, 0),
('steam:11000010a6c0398', 'mp_m_freemode_01', 0, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:11000010a7ff44b', 'mp_m_freemode_01', 0, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:11000010cabc803', 'mp_m_freemode_01', 4, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:11000010fe01cf0', 'mp_m_freemode_01', 0, 0, 4, 0, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0),
('steam:1100001109f4ca8', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2, 0, 0),
('steam:1100001177d08b1', 'mp_m_freemode_01', 0, 0, 4, 3, 7, 15, 1, 1, 7, 1, 1, 0, 6, 0, 0, 0, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `permis`
--

CREATE TABLE `permis` (
  `id` varchar(5) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `display` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL,
  `pidentifier` varchar(30) CHARACTER SET utf8mb4 DEFAULT '',
  `phonenumber` varchar(30) CHARACTER SET utf8mb4 DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `police_id` int(11) NOT NULL,
  `police_name` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `police`
--

INSERT INTO `police` (`police_id`, `police_name`, `salary`) VALUES
(1, 'Cadet', 500),
(2, 'Officier', 500),
(3, 'Sergent', 500),
(4, 'Lieutenant', 500),
(5, 'Capitaine', 500),
(6, 'Commandant', 500),
(7, 'Colonel', 500),
(8, 'Rien', 0),
(9, 'FBI', 500);

-- --------------------------------------------------------

--
-- Structure de la table `user_beard`
--

CREATE TABLE `user_beard` (
  `identifier` varchar(25) NOT NULL,
  `beard` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_beard`
--

INSERT INTO `user_beard` (`identifier`, `beard`) VALUES
('steam:11000010fe01cf0', '-1'),
('steam:11000010a6c0398', '-1'),
('steam:1100001109f4ca8', '-1'),
('steam:11000010a7ff44b', '-1'),
('steam:11000010cabc803', '-1'),
('steam:110000103606e04', '-1'),
('steam:1100001177d08b1', '-1'),
('steam:11000010881fdbb', '-1'),
('steam:110000106247f6e', '-1'),
('steam:1100001015e828c', '-1');

-- --------------------------------------------------------

--
-- Structure de la table `user_chefentreprise`
--

CREATE TABLE `user_chefentreprise` (
  `identifier` varchar(25) NOT NULL,
  `value` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user_chefentreprise`
--

INSERT INTO `user_chefentreprise` (`identifier`, `value`) VALUES
('steam:11000010fe01cf0', '1'),
('steam:11000010881fdbb', '1');

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('steam:1100001015e828c', 1, 0),
('steam:1100001015e828c', 2, 0),
('steam:1100001015e828c', 3, 0),
('steam:1100001015e828c', 4, 1),
('steam:1100001015e828c', 5, 0),
('steam:1100001015e828c', 6, 0),
('steam:1100001015e828c', 7, 0),
('steam:1100001015e828c', 8, 0),
('steam:1100001015e828c', 9, 0),
('steam:1100001015e828c', 10, 0),
('steam:1100001015e828c', 11, 0),
('steam:1100001015e828c', 12, 0),
('steam:1100001015e828c', 13, 0),
('steam:1100001015e828c', 14, 0),
('steam:1100001015e828c', 15, 0),
('steam:1100001015e828c', 16, 0),
('steam:1100001015e828c', 17, 0),
('steam:1100001015e828c', 18, 0),
('steam:1100001015e828c', 19, 0),
('steam:1100001015e828c', 20, 0),
('steam:1100001015e828c', 21, 0),
('steam:1100001015e828c', 22, 0),
('steam:1100001015e828c', 23, 0),
('steam:1100001015e828c', 24, 0),
('steam:1100001015e828c', 25, 0),
('steam:1100001015e828c', 26, 0),
('steam:1100001015e828c', 27, 0),
('steam:1100001015e828c', 28, 0),
('steam:110000103606e04', 1, 0),
('steam:110000103606e04', 2, 0),
('steam:110000103606e04', 3, 0),
('steam:110000103606e04', 4, 0),
('steam:110000103606e04', 5, 0),
('steam:110000103606e04', 6, 0),
('steam:110000103606e04', 7, 0),
('steam:110000103606e04', 8, 0),
('steam:110000103606e04', 9, 0),
('steam:110000103606e04', 10, 0),
('steam:110000103606e04', 11, 0),
('steam:110000103606e04', 12, 0),
('steam:110000103606e04', 13, 0),
('steam:110000103606e04', 14, 0),
('steam:110000103606e04', 15, 0),
('steam:110000103606e04', 16, 0),
('steam:110000103606e04', 17, 0),
('steam:110000103606e04', 18, 0),
('steam:110000103606e04', 19, 0),
('steam:110000103606e04', 20, 0),
('steam:110000103606e04', 21, 0),
('steam:110000103606e04', 22, 0),
('steam:110000103606e04', 23, 0),
('steam:110000103606e04', 24, 0),
('steam:110000103606e04', 25, 0),
('steam:110000103606e04', 26, 0),
('steam:110000103606e04', 27, 0),
('steam:110000103606e04', 28, 0),
('steam:110000106247f6e', 1, 0),
('steam:110000106247f6e', 2, 0),
('steam:110000106247f6e', 3, 0),
('steam:110000106247f6e', 4, 0),
('steam:110000106247f6e', 5, 0),
('steam:110000106247f6e', 6, 0),
('steam:110000106247f6e', 7, 0),
('steam:110000106247f6e', 8, 0),
('steam:110000106247f6e', 9, 0),
('steam:110000106247f6e', 10, 0),
('steam:110000106247f6e', 11, 0),
('steam:110000106247f6e', 12, 0),
('steam:110000106247f6e', 13, 0),
('steam:110000106247f6e', 14, 0),
('steam:110000106247f6e', 15, 0),
('steam:110000106247f6e', 16, 0),
('steam:110000106247f6e', 17, 0),
('steam:110000106247f6e', 18, 0),
('steam:110000106247f6e', 19, 0),
('steam:110000106247f6e', 20, 0),
('steam:110000106247f6e', 21, 0),
('steam:110000106247f6e', 22, 0),
('steam:110000106247f6e', 23, 0),
('steam:110000106247f6e', 24, 0),
('steam:110000106247f6e', 25, 0),
('steam:110000106247f6e', 26, 0),
('steam:110000106247f6e', 27, 0),
('steam:110000106247f6e', 28, 0),
('steam:11000010881fdbb', 1, 0),
('steam:11000010881fdbb', 2, 0),
('steam:11000010881fdbb', 3, 0),
('steam:11000010881fdbb', 4, 0),
('steam:11000010881fdbb', 5, 0),
('steam:11000010881fdbb', 6, 0),
('steam:11000010881fdbb', 7, 0),
('steam:11000010881fdbb', 8, 0),
('steam:11000010881fdbb', 9, 0),
('steam:11000010881fdbb', 10, 0),
('steam:11000010881fdbb', 11, 0),
('steam:11000010881fdbb', 12, 0),
('steam:11000010881fdbb', 13, 0),
('steam:11000010881fdbb', 14, 0),
('steam:11000010881fdbb', 15, 0),
('steam:11000010881fdbb', 16, 0),
('steam:11000010881fdbb', 17, 0),
('steam:11000010881fdbb', 18, 0),
('steam:11000010881fdbb', 19, 0),
('steam:11000010881fdbb', 20, 0),
('steam:11000010881fdbb', 21, 0),
('steam:11000010881fdbb', 22, 0),
('steam:11000010881fdbb', 23, 0),
('steam:11000010881fdbb', 24, 0),
('steam:11000010881fdbb', 25, 0),
('steam:11000010881fdbb', 26, 0),
('steam:11000010881fdbb', 27, 0),
('steam:11000010881fdbb', 28, 0),
('steam:11000010a6c0398', 1, 0),
('steam:11000010a6c0398', 2, 0),
('steam:11000010a6c0398', 3, 0),
('steam:11000010a6c0398', 4, 0),
('steam:11000010a6c0398', 5, 0),
('steam:11000010a6c0398', 6, 0),
('steam:11000010a6c0398', 7, 0),
('steam:11000010a6c0398', 8, 0),
('steam:11000010a6c0398', 9, 0),
('steam:11000010a6c0398', 10, 0),
('steam:11000010a6c0398', 11, 0),
('steam:11000010a6c0398', 12, 0),
('steam:11000010a6c0398', 13, 0),
('steam:11000010a6c0398', 14, 0),
('steam:11000010a6c0398', 15, 0),
('steam:11000010a6c0398', 16, 0),
('steam:11000010a6c0398', 17, 0),
('steam:11000010a6c0398', 18, 0),
('steam:11000010a6c0398', 19, 0),
('steam:11000010a6c0398', 20, 0),
('steam:11000010a6c0398', 21, 0),
('steam:11000010a6c0398', 22, 0),
('steam:11000010a6c0398', 23, 0),
('steam:11000010a6c0398', 24, 0),
('steam:11000010a6c0398', 25, 0),
('steam:11000010a6c0398', 26, 0),
('steam:11000010a6c0398', 27, 0),
('steam:11000010a6c0398', 28, 0),
('steam:11000010a7ff44b', 1, 0),
('steam:11000010a7ff44b', 2, 0),
('steam:11000010a7ff44b', 3, 0),
('steam:11000010a7ff44b', 4, 0),
('steam:11000010a7ff44b', 5, 0),
('steam:11000010a7ff44b', 6, 0),
('steam:11000010a7ff44b', 7, 0),
('steam:11000010a7ff44b', 8, 0),
('steam:11000010a7ff44b', 9, 0),
('steam:11000010a7ff44b', 10, 0),
('steam:11000010a7ff44b', 11, 0),
('steam:11000010a7ff44b', 12, 0),
('steam:11000010a7ff44b', 13, 0),
('steam:11000010a7ff44b', 14, 0),
('steam:11000010a7ff44b', 15, 0),
('steam:11000010a7ff44b', 16, 0),
('steam:11000010a7ff44b', 17, 0),
('steam:11000010a7ff44b', 18, 0),
('steam:11000010a7ff44b', 19, 0),
('steam:11000010a7ff44b', 20, 0),
('steam:11000010a7ff44b', 21, 0),
('steam:11000010a7ff44b', 22, 0),
('steam:11000010a7ff44b', 23, 0),
('steam:11000010a7ff44b', 24, 0),
('steam:11000010a7ff44b', 25, 0),
('steam:11000010a7ff44b', 26, 0),
('steam:11000010a7ff44b', 27, 0),
('steam:11000010a7ff44b', 28, 0),
('steam:11000010cabc803', 1, 0),
('steam:11000010cabc803', 2, 0),
('steam:11000010cabc803', 3, 0),
('steam:11000010cabc803', 4, 0),
('steam:11000010cabc803', 5, 0),
('steam:11000010cabc803', 6, 0),
('steam:11000010cabc803', 7, 0),
('steam:11000010cabc803', 8, 0),
('steam:11000010cabc803', 9, 0),
('steam:11000010cabc803', 10, 0),
('steam:11000010cabc803', 11, 0),
('steam:11000010cabc803', 12, 0),
('steam:11000010cabc803', 13, 0),
('steam:11000010cabc803', 14, 0),
('steam:11000010cabc803', 15, 0),
('steam:11000010cabc803', 16, 0),
('steam:11000010cabc803', 17, 0),
('steam:11000010cabc803', 18, 0),
('steam:11000010cabc803', 19, 0),
('steam:11000010cabc803', 20, 0),
('steam:11000010cabc803', 21, 0),
('steam:11000010cabc803', 22, 0),
('steam:11000010cabc803', 23, 0),
('steam:11000010cabc803', 24, 0),
('steam:11000010cabc803', 25, 0),
('steam:11000010cabc803', 26, 0),
('steam:11000010cabc803', 27, 0),
('steam:11000010cabc803', 28, 0),
('steam:11000010fe01cf0', 1, 0),
('steam:11000010fe01cf0', 2, 0),
('steam:11000010fe01cf0', 3, 0),
('steam:11000010fe01cf0', 4, 0),
('steam:11000010fe01cf0', 5, 0),
('steam:11000010fe01cf0', 6, 0),
('steam:11000010fe01cf0', 7, 0),
('steam:11000010fe01cf0', 8, 0),
('steam:11000010fe01cf0', 9, 0),
('steam:11000010fe01cf0', 10, 0),
('steam:11000010fe01cf0', 11, 0),
('steam:11000010fe01cf0', 12, 0),
('steam:11000010fe01cf0', 13, 0),
('steam:11000010fe01cf0', 14, 0),
('steam:11000010fe01cf0', 15, 0),
('steam:11000010fe01cf0', 16, 0),
('steam:11000010fe01cf0', 17, 0),
('steam:11000010fe01cf0', 18, 0),
('steam:11000010fe01cf0', 19, 0),
('steam:11000010fe01cf0', 20, 0),
('steam:11000010fe01cf0', 21, 0),
('steam:11000010fe01cf0', 22, 0),
('steam:11000010fe01cf0', 23, 0),
('steam:11000010fe01cf0', 24, 0),
('steam:11000010fe01cf0', 25, 0),
('steam:11000010fe01cf0', 26, 0),
('steam:11000010fe01cf0', 27, 0),
('steam:11000010fe01cf0', 28, 0),
('steam:1100001109f4ca8', 1, 0),
('steam:1100001109f4ca8', 2, 0),
('steam:1100001109f4ca8', 3, 0),
('steam:1100001109f4ca8', 4, 0),
('steam:1100001109f4ca8', 5, 0),
('steam:1100001109f4ca8', 6, 0),
('steam:1100001109f4ca8', 7, 0),
('steam:1100001109f4ca8', 8, 0),
('steam:1100001109f4ca8', 9, 0),
('steam:1100001109f4ca8', 10, 0),
('steam:1100001109f4ca8', 11, 0),
('steam:1100001109f4ca8', 12, 0),
('steam:1100001109f4ca8', 13, 0),
('steam:1100001109f4ca8', 14, 0),
('steam:1100001109f4ca8', 15, 0),
('steam:1100001109f4ca8', 16, 0),
('steam:1100001109f4ca8', 17, 0),
('steam:1100001109f4ca8', 18, 0),
('steam:1100001109f4ca8', 19, 0),
('steam:1100001109f4ca8', 20, 0),
('steam:1100001109f4ca8', 21, 0),
('steam:1100001109f4ca8', 22, 0),
('steam:1100001109f4ca8', 23, 0),
('steam:1100001109f4ca8', 24, 0),
('steam:1100001109f4ca8', 25, 0),
('steam:1100001109f4ca8', 26, 0),
('steam:1100001109f4ca8', 27, 0),
('steam:1100001109f4ca8', 28, 0),
('steam:1100001177d08b1', 1, 0),
('steam:1100001177d08b1', 2, 0),
('steam:1100001177d08b1', 3, 0),
('steam:1100001177d08b1', 4, 0),
('steam:1100001177d08b1', 5, 0),
('steam:1100001177d08b1', 6, 0),
('steam:1100001177d08b1', 7, 0),
('steam:1100001177d08b1', 8, 0),
('steam:1100001177d08b1', 9, 0),
('steam:1100001177d08b1', 10, 0),
('steam:1100001177d08b1', 11, 0),
('steam:1100001177d08b1', 12, 0),
('steam:1100001177d08b1', 13, 0),
('steam:1100001177d08b1', 14, 0),
('steam:1100001177d08b1', 15, 0),
('steam:1100001177d08b1', 16, 0),
('steam:1100001177d08b1', 17, 0),
('steam:1100001177d08b1', 18, 0),
('steam:1100001177d08b1', 19, 0),
('steam:1100001177d08b1', 20, 0),
('steam:1100001177d08b1', 21, 0),
('steam:1100001177d08b1', 22, 0),
('steam:1100001177d08b1', 23, 0),
('steam:1100001177d08b1', 24, 0),
('steam:1100001177d08b1', 25, 0),
('steam:1100001177d08b1', 26, 0),
('steam:1100001177d08b1', 27, 0),
('steam:1100001177d08b1', 28, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_message`
--

CREATE TABLE `user_message` (
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_permis`
--

CREATE TABLE `user_permis` (
  `id_permis` varchar(50) NOT NULL,
  `identifier` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `vehicle_name` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_model` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_state` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `vehicle_wheelcolor` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `vehicle_cartegrise` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_vehicle`
--

INSERT INTO `user_vehicle` (`ID`, `identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`, `vehicle_cartegrise`) VALUES
(1, 'steam:11000010fe01cf0', 'Faggio', 'faggio', 4000, 'CTZN1CF0', 'Rentré', '4', '0', '111', '156', NULL),
(2, 'steam:11000010a6c0398', 'Faggio', 'faggio', 4000, 'CTZN0398', 'Rentré', '4', '0', '111', '156', NULL),
(3, 'steam:1100001109f4ca8', 'Faggio', 'faggio', 4000, 'CTZN4CA8', 'Rentré', '4', '0', '111', '156', NULL),
(4, 'steam:11000010a7ff44b', 'Faggio', 'faggio', 4000, 'CTZNF44B', 'Rentré', '4', '0', '111', '156', NULL),
(5, 'steam:11000010cabc803', 'Faggio', 'faggio', 4000, 'CTZNC803', 'Rentré', '4', '0', '111', '156', NULL),
(6, 'steam:110000103606e04', 'Faggio', 'faggio', 4000, 'CTZN6E04', 'Rentré', '4', '0', '111', '156', NULL),
(7, 'steam:11000010fe01cf0', 'Sanctus', 'sanctus', 66666, 'CTZN3509', 'Rentré', '0', '120', '2', '1', NULL),
(8, 'steam:1100001177d08b1', 'Faggio', 'faggio', 4000, 'CTZN08B1', 'Rentré', '4', '0', '111', '156', NULL),
(9, 'steam:11000010fe01cf0', 'Faggio', 'faggio', 4000, 'CTZN1CF0', 'Rentré', '4', '0', '111', '156', NULL),
(10, 'steam:11000010881fdbb', 'Faggio', 'faggio', 4000, 'CTZNFDBB', 'Rentré', '4', '0', '111', '156', NULL),
(11, 'steam:110000106247f6e', 'Faggio', 'faggio', 4000, 'CTZN7F6E', 'Rentré', '4', '0', '111', '156', NULL),
(12, 'steam:1100001015e828c', 'Faggio', 'faggio', 4000, 'CTZN828C', 'Rentré', '4', '0', '111', '156', NULL),
(13, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(14, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(15, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(16, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(17, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(18, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(19, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(20, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL),
(21, 'steam:11000010fe01cf0', 'Kalahari', 'kalahari', 4000, 'CTZN', 'Rentré', '4', '0', '111', '156', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_vehmods`
--

CREATE TABLE `user_vehmods` (
  `id` int(11) NOT NULL,
  `plate` varchar(45) NOT NULL,
  `boosted` varchar(25) NOT NULL,
  `primary_color` varchar(85) NOT NULL,
  `second_color` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `weapon_model` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_whitelist`
--

CREATE TABLE `user_whitelist` (
  `identifier` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_whitelist`
--

INSERT INTO `user_whitelist` (`identifier`, `whitelisted`) VALUES
('steam:11000010fe01cf0e', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `identifier` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `job` int(11) DEFAULT '1',
  `police` int(11) DEFAULT '0',
  `enService` int(11) DEFAULT '0',
  `dirtymoney` double(11,0) NOT NULL DEFAULT '0',
  `isFirstConnection` int(11) DEFAULT '1',
  `nom` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `prenom` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `telephone` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `permis` int(11) DEFAULT '0',
  `permisArme` int(11) DEFAULT '0',
  `permisBateau` int(11) DEFAULT '0',
  `permisPilote` int(11) DEFAULT '0',
  `session_id` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`ID`, `identifier`, `group`, `permission_level`, `money`, `bankbalance`, `job`, `police`, `enService`, `dirtymoney`, `isFirstConnection`, `nom`, `prenom`, `telephone`, `permis`, `permisArme`, `permisBateau`, `permisPilote`, `session_id`) VALUES
(1, 'steam:11000010fe01cf0', 'admin', 0, 595000, 595000, 10, 7, 0, 0, 1, 'test', 'test', '010-0100', 0, 0, 0, 0, 4),
(2, 'steam:11000010a6c0398', 'user', 0, 3000, 0, 1, 0, 0, 0, 1, 'Rick', 'Sam', '893-0601', 0, 0, 0, 0, 0),
(3, 'steam:1100001109f4ca8', 'user', 0, 3000, 0, 1, 0, 0, 0, 1, 'Citizen', 'Citizen', '849-0110', 0, 0, 0, 0, 0),
(4, 'steam:11000010a7ff44b', 'user', 0, 3000, 0, 1, 0, 0, 0, 1, 'Terrieur', 'Alain', '447-0100', 0, 0, 0, 0, 0),
(5, 'steam:11000010cabc803', 'user', 0, 3000, 0, 1, 0, 0, 0, 1, 'Dupont', 'Rayan', '308-0100', 0, 0, 0, 0, 0),
(6, 'steam:110000103606e04', 'user', 0, 3000, 0, 1, 0, 0, 0, 1, 'Citizen', 'Citizen', '406-0630', 0, 0, 0, 0, 0),
(7, 'steam:1100001177d08b1', 'user', 0, 3000, 0, 4, 0, 0, 0, 1, 'Rico', 'John', '180-7711', 0, 0, 0, 0, 0),
(9, 'steam:11000010881fdbb', 'user', 0, 500, 0, 15, 0, 0, 0, 1, 'sasas', 'adsasas', '188-0100', 0, 0, 0, 0, 0),
(10, 'steam:110000106247f6e', 'user', 0, 0, 0, 1, 0, 0, 0, 1, 'Miller', 'John', '674-2601', 0, 0, 0, 0, 0),
(11, 'steam:1100001015e828c', 'admin', 0, 0, 0, 13, 0, 0, 0, 1, 'Jay', 'Steph', '828-5101', 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_chapo`
--

CREATE TABLE `users_chapo` (
  `identifier` varchar(25) NOT NULL,
  `chapo` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_chapo`
--

INSERT INTO `users_chapo` (`identifier`, `chapo`) VALUES
('steam:11000010fe01cf0', '0'),
('steam:11000010a6c0398', '0'),
('steam:1100001109f4ca8', '0'),
('steam:11000010a7ff44b', '0'),
('steam:11000010cabc803', '0'),
('steam:110000103606e04', '0'),
('steam:1100001177d08b1', '0'),
('steam:11000010881fdbb', '0'),
('steam:110000106247f6e', '0'),
('steam:1100001015e828c', '0');

-- --------------------------------------------------------

--
-- Structure de la table `users_mask`
--

CREATE TABLE `users_mask` (
  `identifier` varchar(100) NOT NULL,
  `mask` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_mask`
--

INSERT INTO `users_mask` (`identifier`, `mask`) VALUES
('steam:11000010fe01cf0', '0'),
('steam:11000010a6c0398', '0'),
('steam:1100001109f4ca8', '0'),
('steam:11000010a7ff44b', '0'),
('steam:11000010cabc803', '0'),
('steam:110000103606e04', '0'),
('steam:1100001177d08b1', '0'),
('steam:11000010881fdbb', '0'),
('steam:110000106247f6e', '0'),
('steam:1100001015e828c', '0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffre`
--
ALTER TABLE `coffre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffre_items`
--
ALTER TABLE `coffre_items`
  ADD PRIMARY KEY (`id_coffre`,`id_item`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `depanneur`
--
ALTER TABLE `depanneur`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `entreprise_compte`
--
ALTER TABLE `entreprise_compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fbi`
--
ALTER TABLE `fbi`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `outfits`
--
ALTER TABLE `outfits`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `permis`
--
ALTER TABLE `permis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`police_id`);

--
-- Index pour la table `user_beard`
--
ALTER TABLE `user_beard`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_chefentreprise`
--
ALTER TABLE `user_chefentreprise`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `user_permis`
--
ALTER TABLE `user_permis`
  ADD PRIMARY KEY (`id_permis`,`identifier`);

--
-- Index pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_vehmods`
--
ALTER TABLE `user_vehmods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate_UNIQUE` (`plate`);

--
-- Index pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_whitelist`
--
ALTER TABLE `user_whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `users_chapo`
--
ALTER TABLE `users_chapo`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `users_mask`
--
ALTER TABLE `users_mask`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `police`
--
ALTER TABLE `police`
  MODIFY `police_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `user_vehmods`
--
ALTER TABLE `user_vehmods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
