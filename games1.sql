-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 30 mai 2025 à 18:32
-- Version du serveur : 8.0.41
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `games1`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '2025-05-14 00:33:09', '2025-05-14 00:33:09', 1),
(2, '2025-05-15 12:55:49', '2025-05-15 12:55:49', 2);

-- --------------------------------------------------------

--
-- Structure de la table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` int NOT NULL,
  `game_id` int NOT NULL,
  `user_id` int NOT NULL,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart_item`
--

INSERT INTO `cart_item` (`id`, `game_id`, `user_id`, `quantity`, `cart_id`) VALUES
(38, 6, 2, 1, 2),
(39, 5, 2, 1, 2),
(43, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `developer`
--

CREATE TABLE `developer` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `developer`
--

INSERT INTO `developer` (`id`, `name`, `slug`, `description`, `logo`, `website`) VALUES
(1, 'Rockstar', 'ksgtrnsgrt', 'gta maker', NULL, 'rockstar.com'),
(2, 'mihoyo', 'jnoegrkjqegrtknltrlikntrlnltbnpetrnebr', 'genshin impact maker', NULL, ''),
(3, 'bethesda', 'rejknagejtrhamoentramohnomtahernarhtaeromhtrenh', 'elder scrolls', NULL, 'bethesda.net'),
(4, 'Virtuos', 'opsrbjk,mtjstgngrbsnpornbopnptrbgn,pbn', 'elder scrolls', NULL, NULL),
(5, 'Ubisoft', 'ubisoft-slug', 'Assassin\'s Creed maker', NULL, 'ubisoft.com'),
(6, 'CD Projekt', 'cdprojekt-slug', 'The Witcher and Cyberpunk studio', NULL, 'cdprojekt.com'),
(7, 'Rockstar Games', 'rockstar-slug', 'GTA and Red Dead developer', NULL, 'rockstargames.com'),
(8, 'Bethesda', 'bethesda-slug', 'Elder Scrolls and Fallout studio', NULL, 'bethesda.net'),
(9, 'FromSoftware', '', NULL, NULL, NULL),
(10, 'Guerrilla Games', '', NULL, NULL, NULL),
(11, 'CD Projekt Red', '', NULL, NULL, NULL),
(12, 'Santa Monica Studio', '', NULL, NULL, NULL),
(13, 'FromSoftware', '', NULL, NULL, NULL),
(14, 'Guerrilla Games', '', NULL, NULL, NULL),
(15, 'CD Projekt Red', '', NULL, NULL, NULL),
(16, 'Santa Monica Studio', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250507160047', '2025-05-07 18:01:14', 999),
('DoctrineMigrations\\Version20250508082654', '2025-05-08 10:27:18', 164),
('DoctrineMigrations\\Version20250508083031', '2025-05-08 10:30:36', 99),
('DoctrineMigrations\\Version20250508085703', '2025-05-08 10:57:08', 105),
('DoctrineMigrations\\Version20250508091112', '2025-05-08 11:11:15', 105),
('DoctrineMigrations\\Version20250510145219', '2025-05-10 16:52:22', 641),
('DoctrineMigrations\\Version20250510195859', '2025-05-10 21:59:11', 197),
('DoctrineMigrations\\Version20250511154320', NULL, NULL),
('DoctrineMigrations\\Version20250515113843', '2025-05-15 13:39:50', 126),
('DoctrineMigrations\\Version20250527225522', '2025-05-28 02:03:22', 89),
('DoctrineMigrations\\Version20250529223438', '2025-05-30 02:09:25', 10);

-- --------------------------------------------------------

--
-- Structure de la table `download`
--

CREATE TABLE `download` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `downloaded_at` datetime NOT NULL,
  `progress` double DEFAULT NULL,
  `is_installed` tinyint(1) NOT NULL,
  `hours_played` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `download`
--

INSERT INTO `download` (`id`, `user_id`, `game_id`, `downloaded_at`, `progress`, `is_installed`, `hours_played`) VALUES
(1, 2, 1, '2025-05-10 14:04:06', NULL, 0, 0),
(2, 2, 2, '2025-05-10 14:04:06', NULL, 0, 0),
(3, 2, 3, '2025-05-10 14:04:06', NULL, 0, 0),
(4, 1, 2, '2025-05-10 15:59:01', 100, 1, 0),
(5, 2, 3, '2025-05-10 15:59:01', 75, 0, 0),
(6, 1, 3, '2025-05-08 15:59:01', 100, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `id` int NOT NULL,
  `developer_id` int NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `genre_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `release_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_free` tinyint(1) NOT NULL,
  `free_until` datetime DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_processor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_memory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_graphics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rec_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rec_processor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rec_memory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rec_graphics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rec_storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cart_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `developer_id`, `publisher_id`, `genre_id`, `title`, `slug`, `description`, `short_description`, `price`, `release_date`, `is_free`, `free_until`, `thumbnail`, `min_os`, `min_processor`, `min_memory`, `min_graphics`, `min_storage`, `rec_os`, `rec_processor`, `rec_memory`, `rec_graphics`, `rec_storage`, `updated_at`, `cart_id`) VALUES
(1, 1, 1, 1, 'GTA 6', NULL, 'GTA 6 of the GTA series', 'GTA series game', 40.39, '2025-08-26 10:07:00', 0, NULL, 'telechargement-681c753a4d684776147647.jpg', 'windows 11', '3Ghz', '16GB', 'RTX 4060', '120GB', 'windows 11', '4.5Ghz', '32GB', 'RTX 5060', '180GB', '2025-05-08 11:11:22', NULL),
(2, 2, 2, 2, 'genshin impact', NULL, 'mihoyo studio', 'gach game', 26.11, '2025-05-08 10:34:00', 0, NULL, 'genshin-impact-681c81a963188362543985.jpg', 'windows 10', '1.7Ghz', '8GB', 'RTX 2060', '120GB', 'windows 11', '3.0Ghz', '16GB', 'RTX 3060', '150GB', '2025-05-08 12:04:25', NULL),
(3, 3, 3, 2, 'skyrim', NULL, 'fighting dragons', 'skyrim', 9.99, '2025-05-08 11:17:00', 0, NULL, '1480514877-414-card-681c87f2025ea514154738.jpg', 'windows 10', '1.7Ghz', '6GB', 'RTX 2060', '18GB', 'windows 11', '2.7Ghz', '8GB', 'RTX 3060', '18GB', '2025-05-08 12:31:14', NULL),
(4, 4, 3, 1, 'Oblivion Remastered', NULL, 'Explorez Cyrodiil comme jamais auparavant, grâce à de nouveaux visuels étonnants et un gameplay peaufiné, dans The Elder Scrolls IV: Oblivion™ Remastered.', 'Explorez Cyrodiil comme jamais auparavant, grâce à de nouveaux visuels étonnants et un gameplay peaufiné, dans The Elder Scrolls IV: Oblivion™ Remastered.', 39.99, '2025-04-22 16:00:00', 0, NULL, 'header-681f694e7aa28015902260.jpg', 'windows 10', '1.7Ghz', '16GB', 'RTX 2060', '125GB', 'windows 11', '2.7Ghz', '32GB', 'RTX 3060', '125GB', '2025-05-10 16:57:18', NULL),
(5, 1, 1, 1, 'Assassin\'s Creed Valhalla', 'ac-valhalla', 'Viking adventure', 'Epic Viking saga', 59.99, '2025-11-10 00:00:00', 0, NULL, 'ac-valhalla.jpg', 'Windows 10', '3.5GHz', '8GB', 'GTX 970', '50GB', 'Windows 10', '4.0GHz', '16GB', 'RTX 2070', '50GB', '2025-05-10 15:41:11', NULL),
(6, 2, 2, 1, 'Cyberpunk 2077', 'cyberpunk-2077', 'Futuristic RPG', 'Night City adventure', 59.99, '2025-12-01 00:00:00', 0, NULL, 'cyberpunk2077.jpg', 'Windows 10', '3.0GHz', '8GB', 'GTX 1060', '70GB', 'Windows 10', '4.0GHz', '16GB', 'RTX 3070', '70GB', '2025-05-10 15:41:11', NULL),
(129, 1, 1, 1, 'GTA V', 'grand-theft-auto-v', 'Open world crime game', 'Los Santos adventure', 20.56, '2013-09-17 00:00:00', 0, NULL, 'gta5.jpg', 'Win 10', 'Core 2 Quad', '4GB', '9800 GT', '72GB', 'Win 10', 'i5-3470', '8GB', 'GTX 660', '72GB', NULL, NULL),
(130, 1, 1, 1, 'Red Dead Redemption 2', 'red-dead-redemption-2', 'Western action-adventure', 'Epic wild west story', 14.99, '2018-10-26 00:00:00', 0, NULL, 'rdr2.jpg', 'Win 10', 'i5-2500K', '8GB', 'GTX 770', '150GB', 'Win 10', 'i7-4770K', '12GB', 'GTX 1060', '150GB', NULL, NULL),
(131, 2, 2, 2, 'Honkai: Star Rail', 'honkai-star-rail', 'Space fantasy RPG', 'Turn-based gacha game', 15.00, '2023-04-26 00:00:00', 0, NULL, 'honkai-star-rail.jpg', 'Win 10', 'i5', '8GB', 'GTX 970', '20GB', 'Win 10', 'i7', '16GB', 'GTX 1060', '20GB', NULL, NULL),
(132, 3, 3, 2, 'Elder Scrolls Online', 'elder-scrolls-online', 'MMO in Tamriel world', 'Online Skyrim experience', 49.99, '2014-04-04 00:00:00', 0, NULL, 'eso.jpg', 'Win 7', 'i3', '4GB', 'GTX 460', '85GB', 'Win 10', 'i5', '8GB', 'GTX 750', '85GB', NULL, NULL),
(133, 1, 1, 1, 'Plague Hunter', 'plague-hunter', '', 'Plague Hunter is a dark fantasy platforming game.', 59.64, '2025-05-28 00:51:12', 0, NULL, 'game_91770_aa93dd6fdf0c1dd4c32ba2eb90fe7f06.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(134, 1, 1, 1, 'EverQuest (working title)', 'everquest-(working-title)', '', 'During an investor stream in September 2023, EG7 CEO Ji Ham announced that a new EverQuest MMORPG was in the ideation phase with a target release of 2028.', 6.58, '2025-05-28 00:51:12', 0, NULL, 'game_89869_64f0378b287fce383ce3547b3493011a.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(135, 1, 1, 1, 'ArmA 4', 'arma-4', '', 'ArmA 4', 0.99, '2025-05-28 00:51:12', 0, NULL, 'game_92099_be59cd45fc02fef2c84ad8910216b220.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(136, 1, 1, 1, 'Frostpunk: 1886', 'frostpunk-1886', '', 'A remake of the 2018 original game, with all new features, content, mechanics and rebuilt in UE5.', 47.24, '2025-05-28 00:51:12', 0, NULL, 'game_92910_5738e2fd537fcf568a0e5e909fe8c774.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(137, 1, 1, 1, 'Project Baxter', 'project-baxter', '', 'A co-op multiplayer Dungeons & Dragons game from Starbreeze Entertainment.', 8.75, '2025-05-28 00:51:12', 0, NULL, 'game_90184_a40747311fece918e82dd364274d3de5.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(138, 1, 1, 1, 'Onimusha: Way of the Sword', 'onimusha-way-of-the-sword', '', 'Onimusha: Way of the Sword is the first new mainline game in the franchise in 20 years.', 49.45, '2025-05-28 00:51:12', 0, NULL, 'game_92380_5e85fb26ba88ff568665c0c2b410d8a1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(139, 1, 1, 1, 'Screamer', 'screamer', '', 'Screamer is an anime-inspired racing game and a reboot to an arcade series from the 1990s.', 9.99, '2025-05-28 00:51:12', 0, NULL, 'game_92388_a75a6f6d7f7026cd28cf7b2669d20774.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(140, 1, 1, 1, 'The Boo Croo', 'the-boo-croo', '', 'A 4-player party game developed by Synodic Arc.', 47.96, '2025-05-28 00:51:12', 0, NULL, 'game_91864_011d8b3d04a01fe54d87304e68de6f0f.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(141, 1, 1, 1, 'Undefeated: Genesis', 'undefeated-genesis', '', 'Undefeated\'s second game moves the superhero to an alien planet.', 11.18, '2025-05-28 00:51:12', 0, NULL, 'game_91943_dbfe277769a9c3a0221399a9642346d7.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(142, 1, 1, 1, 'Tenet of the Spark', 'tenet-of-the-spark', '', 'Tenet of the Spark is a story-driven brawler. Will, a boxer, must confront street gangs and the ghosts of his past with the help of his ancestors.', 48.20, '2025-05-28 00:51:12', 0, NULL, 'game_92004_4e82bc4299ec505c85707d040a656ed1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(143, 1, 1, 1, 'Moonlight Peaks', 'moonlight-peaks', '', 'A vampire-themed life simulator.', 46.25, '2025-05-28 00:51:12', 0, NULL, 'game_91687_ca2677d0ce27d745395f6502f512341e.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(144, 1, 1, 1, 'Tako no Himitsu: Ocean of Secrets', 'tako-no-himitsu-ocean-of-secrets', '', 'The upcoming sequel to Save me Mr Tako!, Tako no Himitsu is an action role-playing game with the central theme of turning secrets into shadows in people\'s lives.', 37.75, '2025-05-28 00:51:12', 0, NULL, 'game_78665_965e28c9ed0270a0c6b515fe3174f3d7.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(145, 1, 1, 1, 'Prince of Persia: The Sands of Time Remake', 'prince-of-persia-the-sands-of-time-remake', '', 'A full remake of 2003\'s Prince of Persia: The Sands of Time.', 28.25, '2025-05-28 00:51:12', 0, NULL, 'game_80569_1c6dcc6c618b202727c414a9d6046ee8.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(146, 1, 1, 1, 'Fable', 'fable', '', 'Fable returns, now developed by Playground Games.', 34.99, '2025-05-28 00:51:12', 0, NULL, 'game_79864_f391b06002343e58cef88c3a96d89fd3.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(147, 1, 1, 1, 'DreadOut 3', 'dreadout-3', '', 'DreadOut 3', 47.97, '2025-05-28 00:51:12', 0, NULL, 'game_92970_d35889a6ef475f83f135127e4354ebc7.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(148, 1, 1, 1, 'Warhammer 40,000: Boltgun 2', 'warhammer-40,000-boltgun-2', '', 'Warhammer 40,000: Boltgun 2', 0.65, '2025-05-28 00:51:12', 0, NULL, 'game_93008_08c6788287d17ff3a2b0690a972664d0.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(149, 1, 1, 1, 'Teenage Mutant Ninja Turtles: Empire City', 'teenage-mutant-ninja-turtles-empire-city', '', 'Teenage Mutant Ninja Turtles: Empire City is a virtual reality TMNT action-adventure title.', 45.96, '2025-05-28 00:51:12', 0, NULL, 'game_93041_e0bfa6bb1daf552e997e575e21be5f54.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(150, 1, 1, 1, 'Star Wars Zero Company', 'star-wars-zero-company', '<p>Star Wars Zero Company is a single player, turn-based tactics game that follows a former <a href=\"/galactic-republic/3015-1230/\" data-ref-id=\"3015-1230\">Republic</a> officer named Hawks and his mercenary unit \"Zero Company\" during the tail end of the <a href=\"/clone-wars/3015-1975/\" data-ref-id=\"3015-1975\">Clone Wars</a> era.</p>', 'A strategy game set in the Star Wars universe developed by Respawn and Bit Reactor.', 51.91, '2025-05-28 00:51:12', 0, NULL, 'game_84747_f26a7dc42914f07d2b5f978c94ab1e54.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(151, 1, 1, 1, 'Enter the Gungeon 2', 'enter-the-gungeon-2', '', 'Enter the Gungeon once again; now with a 3D art style.', 11.87, '2025-05-28 00:51:12', 0, NULL, 'game_92819_7d791d94d2903e6cd09cf75d52df70ef.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(152, 1, 1, 1, 'Samurai Pizza Cats: Blast from the Past!', 'samurai-pizza-cats-blast-from-the-past!', '<h2>Overview</h2><p><strong>Samurai Pizza Cats: Blast from the Past!</strong> is an action-RPG platformer developed by<a href=\"/blast-zero/3010-26036/\" data-ref-id=\"3010-26036\"> Blast Zero</a> and published by <a href=\"/red-dunes-games/3010-26037/\" data-ref-id=\"3010-26037\">Red Dunes Games</a>, for <a href=\"/pc/3045-94/\" data-ref-id=\"3045-94\">PC</a> via <a href=\"/steam/3015-718/\" data-ref-id=\"3015-718\">Steam</a> and \"all major platforms\" (specific ones yet-to-be announced). It is based on the <a href=\"/licensed-game/3015-1098/\" data-ref-id=\"3015-1098\">license</a> of the <a href=\"/games-based-on-anime/3015-765/\" data-ref-id=\"3015-765\">early 90s anime</a> <a href=\"/samurai-pizza-cats/3025-6013/\" data-ref-id=\"3025-6013\">Samurai Pizza Cats</a>, and is the second game based on the franchise, after the Japan-only <a href=\"/kyatto-ninden-teyandee/3030-29544/\" data-ref-id=\"3030-29544\">Cat Ninden Teyandē</a> for the <a href=\"/nintendo-entertainment-system/3045-21/\" data-ref-id=\"3045-21\">Famicom</a>.</p><p>The western release of the game looks to emulate the Saban-produced gag dub of the US release of the series.</p>', 'The Samurai Pizza Cats are back in a game that aims to replicate both the art/animation style of the animated series and the irreverent tone of the US dub.', 17.30, '2025-05-28 00:51:12', 0, NULL, 'game_92643_0e4af0b487372171f3807f0c8b3bfab9.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(153, 1, 1, 1, 'Exodus', 'exodus', '', 'A sci-fi action-adventure game starring Matthew McConaughey.', 29.99, '2025-05-28 00:51:12', 0, NULL, 'game_90207_f928178f77edb2c8c2e5665fb7724a02.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(154, 1, 1, 1, 'Slay the Spire II', 'slay-the-spire-ii', '', 'A sequel to the critically acclaimed roguelike deckbuilder', 36.47, '2025-05-28 00:51:12', 0, NULL, 'game_91644_06d7ab877407bdb8ba62590d9aa034d1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(155, 1, 1, 1, 'Fast Break', 'fast-break', '', 'Fast Break is a retro-styled runner game starring the eponymous superhero, a karate instructor with superhuman speed.', 6.99, '2025-05-28 00:51:12', 0, NULL, 'game_54481_074a060b065b16c32065c553153a495b.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(156, 1, 1, 1, 'Tombwater', 'tombwater', '', 'A Souls-Like Western. Explore the accursed Wild West town of Tombwater and lay bare the eldritch horrors that lie beneath. Survive blood-spilling combat in this gruesome 2D action-RPG that might just drive you to madness.', 23.53, '2025-05-28 00:51:12', 0, NULL, 'game_92313_bf77ab0a21d03ac1bcface1442230353.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(157, 1, 1, 1, 'Juufuutei Raden’s Guide for Pixel Museum', 'juufuutei-raden’s-guide-for-pixel-museum', '', 'The nonogram masters at Jupiter Corp. devise a version of their specialty featuring Hololive DEV_IS\' Juufuutei Raden in an art museum.', 40.40, '2025-05-28 00:51:12', 0, NULL, 'game_92318_b90a764b95dfb57245c85739573ebe22.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(158, 1, 1, 1, 'Prolegomena To a Hyperdimensional Interface That Will Be Able to Manifest From Three-Minute Interchanges', 'prolegomena-to-a-hyperdimensional-interface-that-will-be-able-to-manifest-from-three-minute-interchanges', '', 'A visual novel where you only have three minutes to make decisions that decide the flow of the conversation.', 3.90, '2025-05-28 00:51:12', 0, NULL, 'game_92324_3bbc6bd9736caa4587208770643f7b86.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(159, 1, 1, 1, 'Golf With Your Friends 2', 'golf-with-your-friends-2', '', 'Sequel to the 2020 golf party game', 30.67, '2025-05-28 00:51:12', 0, NULL, 'game_92356_a59d7081ccb0f64b5789630d91165cc9.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(160, 1, 1, 1, 'Ultimate Sheep Raccoon', 'ultimate-sheep-raccoon', '', 'Ultimate Sheep Raccoon is the sequel to Ultimate Chicken Horse from Clever Endeavour.', 10.87, '2025-05-28 00:51:12', 0, NULL, 'game_92359_61cc3a8313bdd39ca2a4b84851b5b445.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(161, 1, 1, 1, 'Class of Heroes 3 Remaster', 'class-of-heroes-3-remaster', '', 'It\'s back to school with this fresh reinvigorating of the classic dungeon crawler.', 44.89, '2025-05-28 00:51:12', 0, NULL, 'game_92360_c9f1bd58ab7c8c40dbb13f1da8918c21.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(162, 1, 1, 1, 'One Move Away', 'one-move-away', '', 'One Move Away is a first-person puzzle game based around packing up to move to a new home.', 48.62, '2025-05-28 00:51:12', 0, NULL, 'game_92363_f764588c466bd0ebac1bd10545f47025.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(163, 1, 1, 1, 'Game of Thrones: Kingsroad', 'game-of-thrones-kingsroad', '', 'Game of Thrones: Kingsroad is an RPG for mobile devices.', 0.00, '2025-05-28 00:51:12', 1, NULL, 'game_92383_a1b15d802cb661e2c59cadcd3765597e.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(164, 1, 1, 1, 'Dispatch', 'dispatch', '', 'Dispatch is an adventure game based around a 9-1-1 dispatcher who sends superheros to deal with appropriate incidents.', 19.15, '2025-05-28 00:51:12', 0, NULL, 'game_92387_78ce80d699824c4ac53a23134f2c0690.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(165, 1, 1, 1, 'Splitgate 2', 'splitgate-2', '', 'The sequel to the indie shooter that mixes Halo and Portal.', 0.00, '2025-05-28 00:51:12', 1, NULL, 'game_92397_20c8464bca51c88af9634cd6b1cfaabe.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(166, 1, 1, 1, 'koROBO', 'korobo', '', 'The upcoming Chibi-Robo\'s spiritual successor.', 4.24, '2025-05-28 00:51:12', 0, NULL, 'game_92499_259029fbb0342d0e37777ee4cadd89fa.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(167, 1, 1, 1, 'Mouse: P.I. for Hire', 'mouse-p.i.-for-hire', '', 'Mouse', 34.04, '2025-05-28 00:51:12', 0, NULL, 'game_90244_994aae0a5732ae4d33d09a7e549a3ceb.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(168, 1, 1, 1, 'Usual June', 'usual-june', '', 'Usual June', 4.16, '2025-05-28 00:51:12', 0, NULL, 'game_90203_2a83ff8b1e5473b00c212e54d7d89f11.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(169, 1, 1, 1, 'Big Walk', 'big-walk', '', 'A multiplayer adventure game from the makers of Untitled Goose Game.', 51.31, '2025-05-28 00:51:12', 0, NULL, 'game_90208_725681002b7a584c2fe39e78832568d4.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(170, 1, 1, 1, 'Mecha Break', 'mecha-break', '', 'Mecha Break', 0.00, '2025-05-28 00:51:12', 1, NULL, 'game_90222_9527c612129845050a83f1662656e27c.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(171, 1, 1, 1, 'The Outer Worlds 2', 'the-outer-worlds-2', '', 'The Outer Worlds 2', 31.74, '2025-05-28 00:51:12', 0, NULL, 'game_82984_f0c916a1e0a5815bfc80959580abfb6d.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(172, 1, 1, 1, 'Light of Motiram', 'light-of-motiram', '', 'A open-world survival crafting game from Polaris Quest.', 0.00, '2025-05-28 00:51:12', 1, NULL, 'game_92273_37f353a69b28b79e5f207ddc19bf28ca.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(173, 1, 1, 1, 'Ratatan', 'ratatan', '', 'Ratatan is a spiritual successor to the Patapon trilogy developed by the same creator, Hiroyuki Kotani.', 20.41, '2025-05-28 00:51:12', 0, NULL, 'game_89601_3e7817252892f9d60e64e27d2b056cb5.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(174, 1, 1, 1, 'Showa American Story', 'showa-american-story', '', 'A Post-apocalyptic Action-RPG inspired by 80\'s pop culture and B-movies that follows a teenage girl named Choko on her journey across North America.', 20.20, '2025-05-28 00:51:12', 0, NULL, 'game_84643_3ed729a7088134535febe2b2c2e6e55c.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(175, 1, 1, 1, 'Dragon Quest I & II HD-2D Remake', 'dragon-quest-i-&-ii-hd-2d-remake', '', 'Dragon Quest I & II HD-2D Remake gives the first two games of the franchise into the HD-2D treatment.', 59.99, '2025-05-28 00:51:12', 0, NULL, 'game_91353_cb62e9dd4e4e8f67999622e95d2db365.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(176, 1, 1, 1, 'Double Dragon Revive', 'double-dragon-revive', '', 'A take on the classic brawler from Yuke\'s.', 34.99, '2025-05-28 00:51:12', 0, NULL, 'game_91531_23ecaa17004acb4a7cc45936050c9c32.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(177, 1, 1, 1, 'The Dark Pictures Anthology: Directive 8020', 'the-dark-pictures-anthology-directive-8020', '', 'The season 2 premiere of the Dark Pictures Anthology follows the space ship Cassiopeia on its journey to Tau Ceti f.', 10.54, '2025-05-28 00:51:12', 0, NULL, 'game_87940_25adbd18193d8641e3d229a481e83aaf.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(178, 1, 1, 1, 'Mistfall Hunter', 'mistfall-hunter', '', 'Mistfall Hunter is a PvPvE extraction role-playing game where players can go solo or join teams.', 31.33, '2025-05-28 00:51:12', 0, NULL, 'game_92095_6b1b60e80b54034655ff1b0c7817398f.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(179, 1, 1, 1, 'Mewgenics', 'mewgenics', '<h2>Development</h2><h3>Origins</h3><figure data-align=\"right\" data-size=\"small\" data-img-src=\"https://www.giantbomb.com/a/uploads/original/8/81005/2435329-qdc2yhc.png\" data-ref-id=\"1300-2435329\" data-ratio=\"0.60545454545455\" data-width=\"550\" data-embed-type=\"image\" style=\"width: 550px\"><a class=\"fluid-height\" style=\"padding-bottom:60.5%\" href=\"https://www.giantbomb.com/a/uploads/original/8/81005/2435329-qdc2yhc.png\" data-ref-id=\"1300-2435329\"><img alt=\"Mewgenics originally featured Pokémon-inspired combat.\" src=\"https://www.giantbomb.com/a/uploads/scale_small/8/81005/2435329-qdc2yhc.png\" srcset=\"https://www.giantbomb.com/a/uploads/original/8/81005/2435329-qdc2yhc.png 550w, https://www.giantbomb.com/a/uploads/scale_medium/8/81005/2435329-qdc2yhc.png 480w, https://www.giantbomb.com/a/uploads/scale_small/8/81005/2435329-qdc2yhc.png 320w\" sizes=\"(max-width: 320px) 100vw, 320px\" data-width=\"320\"></a><figcaption>Mewgenics originally featured Pokémon-inspired combat.</figcaption></figure><p><strong><em>Mewgenics</em></strong>, (originally <em><strong>\"Mew-Genics\"</strong></em>), was announced by <a href=\"/team-meat/3010-7230/\" data-ref-id=\"3010-7230\">Team Meat</a> in October 2012 as their follow-up to their critical and commercial hit, <a href=\"/super-meat-boy/3030-25114/\" data-ref-id=\"3030-25114\"><em>Super Meat Boy</em></a>. The game was described as a \"cat lady simulator\", with inspiration drawn from <a href=\"/the-sims/3025-282/\" data-ref-id=\"3025-282\"><em>The Sims</em></a>, <a href=\"/pokemon/3025-452/\" data-ref-id=\"3025-452\"><em>Pokémon</em></a>, <a href=\"/animal-crossing/3025-32/\" data-ref-id=\"3025-32\"><em>Animal Crossing</em></a> and <a href=\"/tamagotchi/3025-2146/\" data-ref-id=\"3025-2146\"><em>Tamagotchi</em></a>. <em>Mewgenics </em>would feature players managing a household of randomly-generated cats, with unique visual aspects, states of being, sizes, animation sets, statistics and personalities. The cats would breed, with their attributes averaging out to create new variants, to compensate for their aging and dying predecessors. The cats would engage in combat, heavily inspired by <em>Pokémon</em>.</p><p>Despite the game being featured in a playable state at conventions such as PAX Prime 2013 and PAX East 2014, <em>Mewgenics </em>was hit with a number of delays, stemming from differences in priorities &amp; interests between Team Meat\'s co-owners, <a href=\"/edmund-charles-mcmillen/3040-66083/\" data-ref-id=\"3040-66083\">Edmund McMillen</a> and <a href=\"/tommy-refenes/3040-89521/\" data-ref-id=\"3040-89521\">Tommy Refenes</a>. Team Meat indefinitely shelved <em>Mewgenics</em> in February 2016, before McMillen departed from the company in 2017.</p><h3>Final design</h3><figure data-align=\"left\" data-size=\"small\" data-img-src=\"https://www.giantbomb.com/a/uploads/scale_super/13/137364/3173280-mewgenics%20work.jpg\" data-ref-id=\"1300-3173280\" data-ratio=\"0.5616224648986\" data-width=\"1923\" data-embed-type=\"image\" style=\"width: 1923px\"><a class=\"fluid-height\" style=\"padding-bottom:56.2%\" href=\"https://www.giantbomb.com/a/uploads/scale_super/13/137364/3173280-mewgenics%20work.jpg\" data-ref-id=\"1300-3173280\"><img alt=\"A pre-alpha preview, touting the turn-based combat of the revamped project.\" src=\"https://www.giantbomb.com/a/uploads/scale_small/13/137364/3173280-mewgenics%20work.jpg\" srcset=\"https://www.giantbomb.com/a/uploads/original/13/137364/3173280-mewgenics%20work.jpg 1923w, https://www.giantbomb.com/a/uploads/scale_super/13/137364/3173280-mewgenics%20work.jpg 960w, https://www.giantbomb.com/a/uploads/scale_medium/13/137364/3173280-mewgenics%20work.jpg 480w, https://www.giantbomb.com/a/uploads/scale_small/13/137364/3173280-mewgenics%20work.jpg 320w\" sizes=\"(max-width: 320px) 100vw, 320px\" data-width=\"320\"></a><figcaption>A pre-alpha preview, touting the turn-based combat of the revamped project.</figcaption></figure><p>In January 2018, McMillen announced that he had acquired the rights to <em>Mewgenics</em> from Team Meat and would be working full-time with his collaborator <a href=\"/tyler-glaiel/3040-103014/\" data-ref-id=\"3040-103014\">Tyler Glaiel</a>, following their work together on <a href=\"/the-end-is-nigh/3030-59825/\" data-ref-id=\"3030-59825\"><em>The End is Nigh</em></a>. Aside from the original soundtrack produced by Ridiculon - a band featuring <a href=\"/matthias-bossi/3040-128100/\" data-ref-id=\"3040-128100\">Matthias Bossi</a> &amp; <a href=\"/jon-evans/3040-128099/\" data-ref-id=\"3040-128099\">Jon Evans</a> - the game would be started completely from scratch. While McMillen was committed to completing a handful of prior projects, Glaiel began full-time work on <em>Mewgenics </em>in May 2019, beginning with the development of a new engine. Several different forms of gameplay were approached, such as real-time strategy, before it was decided that a <a href=\"/turn-based/3015-192/\" data-ref-id=\"3015-192\">turn-based</a>, grid system would be ideal.</p><h2>Characters</h2><ul><li>Dr. Beanies</li><li>Butch</li><li>Baby Jack</li><li>Tink</li><li>Frank</li><li>Tracy</li></ul><h2>External Links</h2><ul><li><a href=\"https://store.steampowered.com/app/686060/Mewgenics/\" data-target=\"true\" target=\"_blank\" rel=\"noopener nofollow\">Steam Page</a></li></ul>', 'Breed and biologically engineer cats, then send them out on epic quests to engage in turn-based tactical combat.', 55.25, '2025-05-28 00:51:12', 0, NULL, 'game_40140_a844c8c8e6116eb6adbf2ad163a1a072.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(180, 1, 1, 1, 'The Legend of Baboo', 'the-legend-of-baboo', '', 'Inspired by Eastern fables, the story of Sepehr and Baboo begins when their idyllic island is invaded by a demonic force commanded by an ancient evil. Together, with the strength of their bond, the boy and his dog set out to save their island, rescue their family, and defeat the darkness behind it all.', 39.28, '2025-05-28 00:51:12', 0, NULL, 'game_92097_6bec9d3019b273e54f7996449e2e46c6.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(181, 1, 1, 1, 'Fantasy Waifu Collector', 'fantasy-waifu-collector', '<h2><strong>Overview</strong></h2><p>\"Fantasy Waifu Collector\" is an original indie game inspired by \"gacha\" style games. Players progress through the game from a humble beginning of having just one character, to building an army in order to overthrow the Demon King. While it supports online service features, it can also be run offline as a single-player experience with only the online multiplayer aspects disabled. Unlike greed-based gacha-game mechanics, this game offers a refreshing approach around a gameplay centered design.</p><p>The game started development in November 2022. In July of 2023 it was released publicly for free in \"Alpha\" state, with development of core mechanics continuing through the end of 2024. At the start of 2025, it entered a \"Beta\" state, being released on Steam, with an estimated release date of Q4 2025.</p>', 'Fantasy Waifu Collector by SyKoHPaTh', 46.19, '2025-05-28 00:51:12', 0, NULL, 'game_92408_c28020d650cd07d112d16e256d6557fb.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(182, 1, 1, 1, 'Heroes of Newerth: Reborn', 'heroes-of-newerth-reborn', '', 'A free-to-play remake of the discontinued MOBA, built with new features and a new engine.', 19.94, '2025-05-28 00:51:12', 0, NULL, 'game_92543_dc666b8d09cc34b019391ded099d7d7f.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(183, 1, 1, 1, 'Styx: Blades of Greed', 'styx-blades-of-greed', '', 'Styx: Blades of Greed is the third entry in a series of stealth action games from Cyanide Studio, which began as an offshoot from Of Orcs and Men.', 10.67, '2025-05-28 00:51:12', 0, NULL, 'game_92705_4517e2a3cc2f931c6ba800f2e1be9c1f.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(184, 1, 1, 1, 'The Eternal Life of Goldman', 'the-eternal-life-of-goldman', '', 'The Eternal Life of Goldman is a story-driven platformer, developed by Weappy Studio.', 31.37, '2025-05-28 00:51:12', 0, NULL, 'game_92791_b880686440b317d81060db178da9a43a.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(185, 1, 1, 1, 'Marvel Cosmic Invasion', 'marvel-cosmic-invasion', '', 'The teams behind Teenage Mutant Ninja Turtles: Shredder\'s Revenge pivot to another comic license for a brawler that\'s out of this galaxy.', 47.45, '2025-05-28 00:51:12', 0, NULL, 'game_92794_2450b58635a8370e8d338d90c91bf7e8.jpeg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(186, 1, 1, 1, 'Vampire: The Masquerade - Bloodlines 2', 'vampire-the-masquerade---bloodlines-2', '<h2>Overview</h2><p>Vampire: The Masquerade - Bloodlines 2 is an upcoming RPG game originally being developed by <a href=\"/hardsuit-labs/3010-18863/\" data-ref-id=\"3010-18863\">Hardsuit Labs</a> and published by <a href=\"/paradox-interactive-ab/3010-1366/\" data-ref-id=\"3010-1366\">Paradox Interactive</a>. Announced on March 21, 2019, Bloodlines 2 is the long-aniticipated sequel to 2004\'s <a href=\"/vampire-the-masquerade-bloodlines/3030-16426/\" data-ref-id=\"3030-16426\">Vampire: The Masquerade - Bloodlines</a> and takes place in the same <a href=\"/world-of-darkness/3015-3617/\" data-ref-id=\"3015-3617\">World of Darkness</a> fictional universe created by White Wolf Publishing (who are now owned by Paradox). The game was set to be released in Q1 2020 for the <a href=\"/pc/3045-94/\" data-ref-id=\"3045-94\">PC</a>, <a href=\"/xbox-one/3045-145/\" data-ref-id=\"3045-145\">Xbox One</a> and <a href=\"/playstation-4/3045-146/\" data-ref-id=\"3045-146\">PS4</a>.</p><p>After multiple delays, in early 2021 Paradox Interactive announced that Harduit Labs had been removed as the developer and delayed the game to an unknown 2022 window before finally admitting that the game would miss its 2023 release window.</p><p>In September 2023 it was announced that <a href=\"/the-chinese-room/3010-7457/\" data-ref-id=\"3010-7457\">The Chinese Room </a>had taken over as the main developer of the game and revealed a \"Fall 2024\" release window.</p><p>The setting of the game has moved north from Los Angeles to that of Seattle, Washington. Game designer and writer of the first game, <a href=\"/brian-mitsoda/3040-25545/\" data-ref-id=\"3040-25545\">Brian Mitsoda</a>, has returned to write an original narrative in the World of Darkness that revolves around a \"Blood War\" between the various vampire factions in the American North-West. Joining him is also esteemed RPG writer and game designer <a href=\"/chris-avellone/3040-12929/\" data-ref-id=\"3040-12929\">Chris Avellone</a> (<a href=\"/planescape-torment/3030-2235/\" data-ref-id=\"3030-2235\">Planescape Torment</a>, <a href=\"/star-wars-knights-of-the-old-republic-ii-the-sith-/3030-8852/\" data-ref-id=\"3030-8852\">KOTOR 2</a>, <a href=\"/icewind-dale/3030-5242/\" data-ref-id=\"3030-5242\">Icewind Dale</a>, <a href=\"/baldurs-gate/3035-116/\" data-ref-id=\"3035-116\">Baldur\'s Gate</a>, and <a href=\"/fallout-new-vegas/3030-25933/\" data-ref-id=\"3030-25933\">Fallout: New Vegas</a>) as well as Cara Ellison, video game critic and game designer (Sacrilege) who is also working on the game.</p><h2>Story</h2><p>You play as a newly turned \"Thin Blood\" created through a \"Mass Embrace\" where a bunch of vampires are created at once. The Thin Bloods are considered to be among the lowest ranking in Vampire society, they are also less vulnerable to sunlight and have an easier time mingling. Much like the first game, through no fault of your own the Vampire Society finds out about the embrace and puts you on trial with the intention of executing you. A Mass Embrace is considered an affront to the Camarilla, and any vampire with any shred of humanity. But it also risks their discovery by the mortals.</p><p>Before judgement can be laid out, the courthouse is engulfed in flames, and the player makes their escape. You\'ll have to find ways to feed your hunger for blood while uncovering a conspiracy.</p>', 'A sequel to 2004\'s cult-classic first-person action cRPG Vampire: The Masquerade - Bloodlines developed by The Chinese Room and published by Paradox Interactive. The sequel will be more focusing on Action aspect', 56.19, '2025-05-28 00:51:12', 0, NULL, 'game_72597_b16400e67812cdba4c89fa30d583f801.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(187, 1, 1, 1, 'Witchbrook', 'witchbrook', '', 'A fantasy life sim game set in the seaside town of Mossport where you play a witch-in-training enrolled at Witchbrook College.', 23.75, '2025-05-28 00:51:12', 0, NULL, 'game_68859_5be3a387c010500091d769558d315988.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(188, 1, 1, 1, 'Sally', 'sally', '', 'A life simulator about a group of kids on an airship.', 2.99, '2025-05-28 00:51:12', 0, NULL, 'game_91199_be2c1e2a8fa20c7ca0251cc9ffb2afbf.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(189, 1, 1, 1, 'Subnautica 2', 'subnautica-2', '', 'Subnautica 2 is the third game in Unknown Worlds\' series of underwater exploration games.', 27.02, '2025-05-28 00:51:12', 0, NULL, 'game_92093_9de964812a651d80b55a7b41b148dfdd.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(190, 1, 1, 1, 'Cronos: The New Dawn', 'cronos-the-new-dawn', '', 'Cronos: The New Dawn is a time traveling survival horror game from Bloober Team.', 33.18, '2025-05-28 00:51:12', 0, NULL, 'game_92091_22b538a0f1a91ed10d29cfa3bfda00b8.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(191, 1, 1, 1, 'Terrifier: The Artcade Game', 'terrifier-the-artcade-game', '', 'A belt-scrolling brawler based on a horror movie series about an evil clown.', 25.93, '2025-05-28 00:51:12', 0, NULL, 'game_92072_7e1fa519894ad6e58456e1fe40587d68.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(192, 1, 1, 1, 'Marathon', 'marathon', '<h2>Overview</h2><p>Marathon, not to be confused with <a href=\"/marathon/3030-20232/\" data-ref-id=\"3030-20232\">the original 1994 game of the same name</a>, is a sci-fi <a href=\"/extraction-shooter/3015-12711/\" data-ref-id=\"3015-12711\">extraction shooter</a> developed by <a href=\"/bungie/3010-476/\" data-ref-id=\"3010-476\">Bungie</a>, with a planned release by Bungie for the <a href=\"/playstation-5/3045-176/\" data-ref-id=\"3045-176\">PlayStation 5</a>, <a href=\"/xbox-series-xs/3045-179/\" data-ref-id=\"3045-179\">Xbox Series X|S</a>, and <a href=\"/pc/3045-94/\" data-ref-id=\"3045-94\">PC</a> on September 23, 2025.</p><p>A <a href=\"/same-name-reboot/3015-6524/\" data-ref-id=\"3015-6524\">same name reboot</a> of <a href=\"/marathon/3025-629/\" data-ref-id=\"3025-629\">the Marathon trilogy</a>, Marathon switches from a traditional first-person shooter to a team-based FPS <a href=\"/extraction-shooter/3015-12711/\" data-ref-id=\"3015-12711\">extraction shooter</a> with a new futuristic art style.</p><p>As <a href=\"/cyborg/3015-950/\" data-ref-id=\"3015-950\">cybernetic</a> mercenaries (known as \"Runners\"), players are tasked by rival factions to scavenge a lost colony on the planet Tau Ceti IV, fighting off rival Runners and the planet\'s hostile environment.</p>', 'Bungie\'s classic Marathon series gets revisited nearly thirty years later as a sci-fi extraction shooter.', 6.45, '2025-05-28 00:51:12', 0, NULL, 'game_89250_f64c78cfa97f283d4d60a31ad5a53de0.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(193, 1, 1, 1, 'Borderlands 4', 'borderlands-4', '', 'Gearbox\'s looter shooter returns with four new vault hunters and billions of new guns on whole new world.', 4.82, '2025-05-28 00:51:12', 0, NULL, 'game_91713_6cbc76f059405cae3bb9542cea1f0bd6.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(194, 1, 1, 1, 'Terminator 2D: No Fate', 'terminator-2d-no-fate', '', 'Terminator 2D: No Fate is a 2D side-scrolling exploratory run-and-gun based on Terminator 2: Judgment Day.', 36.39, '2025-05-28 00:51:12', 0, NULL, 'game_92670_faac332189f10639e72bdbd94cabb8fe.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(195, 1, 1, 1, 'Hell is Us', 'hell-is-us', '', 'A 3rd person action-adventure game from Rogue Factor and Nacon.', 49.99, '2025-05-28 00:51:12', 0, NULL, 'game_85889_db6fd84e26d93d81983eeeac8dfdd2bf.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(196, 1, 1, 1, 'Astrobotanica', 'astrobotanica', '', 'An open-world survival game where the player takes the role of an alien botanist who is stranded on prehistoric Earth.', 43.89, '2025-05-28 00:51:12', 0, NULL, 'game_91762_56d95fa861c58829fff9a0442804068f.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(197, 1, 1, 1, 'Conquest of Eldinar', 'conquest-of-eldinar', '', 'A side-scrolling action RTS featuring sixteen playable factions in campaign or multiplayer.', 49.27, '2025-05-28 00:51:12', 0, NULL, 'game_91877_92a4eb056a6aa0bc63ba338fd4c064d1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(198, 1, 1, 1, 'Origin of Storms', 'origin-of-storms', '', 'An indie medieval-themed fighting game.', 14.90, '2025-05-28 00:51:12', 0, NULL, 'game_80649_167ba7d801d2a75203db1ccd7a819d05.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(199, 1, 1, 1, 'Heroes of Mount Dragon', 'heroes-of-mount-dragon', '', 'A procedurally generated, side-scrolling brawler where up to four players can take control of heroes who wield the power to transform into dragons.', 6.42, '2025-05-28 00:51:12', 0, NULL, 'game_91874_37ef83a1f977fa084e965151bb1505e2.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(200, 1, 1, 1, 'Shinobi: Art of Vengeance', 'shinobi-art-of-vengeance', '', 'A 2D platformer in the Shinobi series.', 26.99, '2025-05-28 00:51:12', 0, NULL, 'game_90228_3b6113e709cedc0a5395937b7429a613.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(201, 1, 1, 1, 'Metal Gear Solid Δ: Snake Eater', 'metal-gear-solid-δ-snake-eater', '<p>It will include the original voice cast, such as <a href=\"/david-hayter/3040-39849/\" data-ref-id=\"3040-39849\">David Hayter</a></p>', 'A full remake of Metal Gear Solid 3: Snake Eater, which was originally released on PlayStation 2 in 2004.', 69.99, '2025-05-28 00:51:12', 0, NULL, 'game_89242_cce4bcb1c8e842909b8f20312518cd9d.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(202, 1, 1, 1, 'Super Robot Wars Y', 'super-robot-wars-y', '', 'Super Robot Wars Y is the follow-up to 2021\'s Super Robot Wars 30.', 59.99, '2025-05-28 00:51:12', 0, NULL, 'game_92798_f81d0af88ede1d5a69966c5d0c20d531.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(203, 1, 1, 1, 'Story of Seasons: Grand Bazaar', 'story-of-seasons-grand-bazaar', '', 'Story of Seasons: Grand Bazaar marries the traditional farming gameplay with the task of maintaining a floundering marketplace. A remake of Harvest Moon DS: Grand Bazaar.', 21.75, '2025-05-28 00:51:12', 0, NULL, 'game_92789_8400a7442f6f998efbbf6a3f4c0eefc1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(204, 1, 1, 1, 'Space Adventure Cobra: The Awakening', 'space-adventure-cobra-the-awakening', '', 'An exploratory platformer based on the manga and anime Cobra.', 32.63, '2025-05-28 00:51:12', 0, NULL, 'game_91903_2eec122369714350f147f235719571aa.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(205, 1, 1, 1, 'Inazuma Eleven: Victory Road', 'inazuma-eleven-victory-road', '<p>A role-playing game focused on schoolchildren who aim to be the best soccer players in Japan.</p><h2>Chronicle Mode</h2><p>An original story mode from the POV of a boy named Victorio Cryptix and his companion Clark von Wonderbear, a super-intelligent teddy bear, as they travel through time and space to relive historical battles throughout the Inazuma Eleven franchise and return with a \"Fighting Spirit\" capable of defeating the evil Mind Eater. As Victorio, the player can acquire over 5200 different players from over 150 teams to create their custom team and take on different opponents.</p><h2>Story Mode</h2><p>A new, original story in the Inazuma Eleven universe where the player takes control of Destin Bellows as he looks to revive his school\'s struggling Football Club. Destin can find various spots around his school and the surrounding town to play soccer, build social links with almost any classmate to convince them to join his Club, and participate in friendlies and 5v5 matches before before taking on full teams to advance the story.</p><h2>Competition Mode</h2><p>Players can simply jump into a match with a preselected team and players, or ones they customized beforehand, either to fight an AI opponent or another Inazuma Eleven player online. Players can use the Action Mode to control their players directly, or use a revamped Commander Mode to act as an invisible coach and focus on strategy and tactics while the AI controls the actions on the ground.</p><h2>Kizuna Station</h2><p>Players can create their own avatar and \"Bond Town\" to roam around in, decorated with items won from other modes, and can challenge visitors to fight with or against them in competitive soccer matches.</p>', 'An Inazuma Eleven title for mobile and console. It is the first release in the series for a non-Nintendo platform.', 69.99, '2025-05-28 00:51:12', 0, NULL, 'game_62256_9c742c5d74083ca67ffb8dd3b9cd404a.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(206, 1, 1, 1, 'Madden NFL 26', 'madden-nfl-26', '', 'Madden NFL 26 is a football simulator for Xbox Series X|S, PlayStation 5, PC, and Nintendo Switch 2.', 69.99, '2025-05-28 00:51:12', 0, NULL, 'game_92911_ca2f143b0dc22f1bf4413c9a1cccead6.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(207, 1, 1, 1, 'Mafia: The Old Country', 'mafia-the-old-country', '<h2>Overview</h2><p>...</p><h2>Development</h2><p>To coincide with the 20th anniversary of the Mafia series in 2022, a new Mafia game was announced by <a href=\"/hangar-13/3010-10593/\" data-ref-id=\"3010-10593\">Hangar 13</a> and <a href=\"/2k-games/3010-360/\" data-ref-id=\"3010-360\">2K Games</a>. According to rumors at the time, the game had been codenamed \"Nero\" and would focus on the rise of the Salieri family from the 1890s to the 1920s.</p><p>The game was officially revealed in August 2024 at Gamescom\'s Opening Night Live, which confirmed that the game would take place in early 1900s <a href=\"/sicily/3035-1989/\" data-ref-id=\"3035-1989\">Sicily</a>.</p>', 'The Mafia series goes to Sicily in the early 1900s.', 49.99, '2025-05-28 00:51:12', 0, NULL, 'game_87203_d3a4e897d1d651167324169a352df967.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(208, 1, 1, 1, 'Operation Night Strikers', 'operation-night-strikers', '<h2>Overview</h2><p><strong>Operation Night Strikers</strong> is a compilation for Windows (via Steam) and Switch. Its name comes from the first two announced (and most prominently advertised games)</p><h3>Included titles</h3><h4>All versions</h4><ul><li><a href=\"/operation-wolf/3030-14869/\" data-ref-id=\"3030-14869\">Operation Wolf</a> (Arcade, Japan and US Standard and \"Easy\" variations)</li><li><a href=\"/night-striker/3030-63149/\" data-ref-id=\"3030-63149\">Night Striker</a> (Arcade, Japan, Europe, and World variations)</li><li><a href=\"/operation-thunderbolt/3030-14088/\" data-ref-id=\"3030-14088\">Operation Thunderbolt</a> (Arcade, Japan and US Standard and \"Easy\" variations, US \"mini\" variation)</li><li><a href=\"/space-gun/3030-15378/\" data-ref-id=\"3030-15378\">Space Gun</a>  (Arcade, Japan and US Standard and \"Easy\" variations)</li></ul><h4>DLC/Switch physical version</h4><ul><li>Operation Wolf (<a href=\"/nintendo-entertainment-system/3045-21/\" data-ref-id=\"3045-21\">Famicom</a>, NES, and <a href=\"/sega-master-system/3045-8/\" data-ref-id=\"3045-8\">Master System</a> versions)</li><li>Night Striker (<a href=\"/sega-cd/3045-29/\" data-ref-id=\"3045-29\">Mega-CD</a> version)</li><li>Operation Thunderbolt (<a href=\"/super-nintendo-entertainment-system/3045-9/\" data-ref-id=\"3045-9\">Super NES</a> version)</li><li>Space Gun (Master System version)</li></ul>', 'A compilation of Taito shooters.', 28.58, '2025-05-28 00:51:12', 0, NULL, 'game_92211_dd69ec9b7ecbf2571baa2a48e9afad7c.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(209, 1, 1, 1, 'Gradius Origins', 'gradius-origins', '<p>Included in this collection</p><ul><li><strong><a href=\"/gradius/3030-15508/\" data-ref-id=\"3030-15508\">Gradius</a></strong> - Japanese ROM version, Japanese \"bubble\" version, North American version (Nemesis), North American prototype (Nemesis), European version (Nemesis)</li><li><strong><a href=\"/life-force/3030-13960/\" data-ref-id=\"3030-13960\">Salamander</a></strong> - Japanese version, North American version (Life Force)</li><li><strong>Life Force</strong> - Japanese version</li><li><a href=\"/gradius-ii/3030-3623/\" data-ref-id=\"3030-3623\"><strong>Gradius II</strong></a> - Japanese (early) version, Japanese (mid) version, Japanese (late) version, North American version (Vulcan Venture)</li><li><a href=\"/gradius-iii/3030-7617/\" data-ref-id=\"3030-7617\"><strong>Gradius III</strong></a> - Japanese (old) version, Japanese (new) version, Asia version, Japanese AM show version</li><li><a href=\"/salamander-2/3030-22409/\" data-ref-id=\"3030-22409\"><strong>Salamander 2</strong> </a>- Japanese version</li><li><strong>Salamander II</strong>I - All-new entry developed for this collection</li></ul>', 'Gradius Origins is a compilation of several titles in the Gradius/Life Force/Salamander meta-series, including a brand-new game, Salamander III.', 58.54, '2025-05-28 00:51:12', 0, NULL, 'game_92792_a8ee4b349642906fa17a720f6c634479.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(210, 1, 1, 1, 'Death the Guitar', 'death-the-guitar', '', 'A 2D action platformer where players take on the role of a vengeful electric guitar.', 14.60, '2025-05-28 00:51:12', 0, NULL, 'game_91689_c212566f734a3b95daa5b69abd8a6f89.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL);
INSERT INTO `game` (`id`, `developer_id`, `publisher_id`, `genre_id`, `title`, `slug`, `description`, `short_description`, `price`, `release_date`, `is_free`, `free_until`, `thumbnail`, `min_os`, `min_processor`, `min_memory`, `min_graphics`, `min_storage`, `rec_os`, `rec_processor`, `rec_memory`, `rec_graphics`, `rec_storage`, `updated_at`, `cart_id`) VALUES
(211, 1, 1, 1, 'RoadCraft', 'roadcraft', '', 'A construction simulator from the creators of SnowRunner. In a natural disaster scenario, you are tasked to rebuild roads and bridges, among other things.', 39.99, '2025-05-28 00:51:12', 0, NULL, 'game_91725_676487b414b8ce1a387ae635ecc7c743.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(212, 1, 1, 1, 'Coffee Talk Tokyo', 'coffee-talk-tokyo', '', 'The third installment of Toge Productions\' coffee shop talking simulator.', 18.42, '2025-05-28 00:51:12', 0, NULL, 'game_91735_50219a68a8b445b734de0d6baa7e767e.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(213, 1, 1, 1, 'Demon Slayer - Kimetsu no Yaiba - The Hinokami Chronicles 2', 'demon-slayer---kimetsu-no-yaiba---the-hinokami-chronicles-2', '', 'A second arena fighter based on the Demon Slayer anime.', 59.99, '2025-05-28 00:51:12', 0, NULL, 'game_92310_c7754b5e5cf52139235c77f71604a9fb.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(214, 1, 1, 1, 'Toy Hunter', 'toy-hunter', '', 'Toy Hunter is a 3D arena fighter with an SD toy aesthetic.', 55.86, '2025-05-28 00:51:12', 0, NULL, 'game_80171_1422bc6d3531711b168edfc487d497b8.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(215, 1, 1, 1, 'Hunger', 'hunger', '', 'A PvPvE extraction shooter from Good Fun Corporation.', 7.99, '2025-05-28 00:51:12', 0, NULL, 'game_91654_5bf99a6f21146a29ba94f65be75bfaf4.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(216, 1, 1, 1, 'Exoborne', 'exoborne', '', 'An open-world extraction shooter from developer Sharkmob.', 6.75, '2025-05-28 00:51:12', 0, NULL, 'game_90225_89403fe63bb27747f1c2703f6a70e0b1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(217, 1, 1, 1, 'Death Trash', 'death-trash', '', 'An action-RPG set in a modern post-apocalyptic world full of cyberpunk science-fiction, grotesque horror, and trash-talk humor.', 19.99, '2025-05-28 00:51:12', 0, NULL, 'game_55394_5b3204988c9e0187eadcdedc52f6a598.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(218, 1, 1, 1, 'Little Nightmares III', 'little-nightmares-iii', '', 'The third game in the series, now developed by Supermassive Games, introduces cooperative play.', 20.72, '2025-05-28 00:51:12', 0, NULL, 'game_89729_5085d6974f62f5d1028fd223358f3c1b.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(219, 1, 1, 1, 'Fuuraiki 5', 'fuuraiki-5', '', 'The fifth installment in the Fuuraiki series, set in the Mie Prefecture of Japan.', 37.01, '2025-05-28 00:51:12', 0, NULL, 'game_92898_593fe51a8497449eecbd8ce546e2e1d7.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(220, 1, 1, 1, 'No Sleep for Kaname Date - From AI: The Somnium File', 'no-sleep-for-kaname-date---from-ai-the-somnium-file', '', 'No Sleep for Kaname Date: AI Somnium Files', 57.77, '2025-05-28 00:51:12', 0, NULL, 'game_92788_5eadbbfd6f1dce94e025a859f5ed40e3.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(221, 1, 1, 1, 'Wuchang: Fallen Feathers', 'wuchang-fallen-feathers', '', 'An action RPG set during the last years of the Ming Dynasty in China.', 49.99, '2025-05-28 00:51:12', 0, NULL, 'game_83940_bec31ebbbb701adaecaa1bb9bb9932ef.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(222, 1, 1, 1, 'Shadow Labyrinth', 'shadow-labyrinth', '', 'Eat or be eaten in Shadow Labyrinth, a Pac-Man game.', 29.99, '2025-05-28 00:51:12', 0, NULL, 'game_92366_f304baaca7e99eb6ce205e095af3a332.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(223, 1, 1, 1, 'Hunter x Hunter: Nen x Impact', 'hunter-x-hunter-nen-x-impact', '', 'A Hunter x Hunter fighting game from Eighting and Bushiroad Games.', 33.57, '2025-05-28 00:51:12', 0, NULL, 'game_90394_b81326cc4858f01337515321f6ca0b00.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(224, 1, 1, 1, 'Edens Zero', 'edens-zero', '', 'Edens Zero is based on the manga and anime of the same name, from the author of Rave Master and Fairy Tail.', 59.99, '2025-05-28 00:51:12', 0, NULL, 'game_92094_83b25bde92b4e30f6e25eb6160582660.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(225, 1, 1, 1, 'Patapon 1+2 Replay', 'patapon-1+2-replay', '', 'A compilation of the first two Patapon games.', 55.52, '2025-05-28 00:51:12', 0, NULL, 'game_92785_edae9e541e3eb499753cf697523f603b.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(226, 1, 1, 1, 'Irem Collection Volume 3', 'irem-collection-volume-3', '<p>Included in this collection:</p><ul><li><a href=\"/mr-heli/3030-1864/\" data-ref-id=\"3030-1864\">Mr. Heli</a> (<a href=\"/arcade/3045-84/\" data-ref-id=\"3045-84\">Arcade</a> JP, Arcade world, <a href=\"/turbografx-16/3045-55/\" data-ref-id=\"3045-55\">PC Engine</a> JP)</li><li><a href=\"/mystic-riders/3030-42625/\" data-ref-id=\"3030-42625\">Mystic Riders</a> (Arcade JP, Arcade world)</li><li><a href=\"/dragon-breed/3030-18464/\" data-ref-id=\"3030-18464\">Dragon Breed</a> (Arcade JP, Arcade world)</li></ul>', 'A third console collection of Irem shoot-\'em-ups.', 31.90, '2025-05-28 00:51:12', 0, NULL, 'game_92775_f58341bc570c78b646c291c77ab6c2a5.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(227, 1, 1, 1, 'Tony Hawk\'s Pro Skater 3+4', 'tony-hawk\'s-pro-skater-3+4', '', 'After the success of THPS 1+2 in 2020, Activision returns with compilation remake of Tony Hawk\'s Pro Skater 3 and Tony Hawk\'s Pro Skater 4.', 49.99, '2025-05-28 00:51:12', 0, NULL, 'game_92645_34a32a366e4a4e72ded2467397111d0e.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(228, 1, 1, 1, 'Missile Command Delta', 'missile-command-delta', '', 'A turn-based strategy game based on the 1980 Atari arcade game Missile Command.', 49.29, '2025-05-28 00:51:12', 0, NULL, 'game_92999_d51df42afcc0925ba0e2cb930a8d666d.png', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(229, 1, 1, 1, 'Ninja Gaiden 4', 'ninja-gaiden-4', '<p>Set several years after the events of <a href=\"/ninja-gaiden-3/3030-32687/\" data-ref-id=\"3030-32687\">Ninja Gaiden 3</a>, the body of the supposedly slain Dark Dragon has risen over Tokyo, and from its remains pours an endless, poisonous rain that has practically turned the city into a wasteland. A young ninja named Yakumo, from the Raven clan, infiltrates the city to ensure the Dark Dragon is truly destroyed and Tokyo can be rebuilt. However, standing in his way is the Divine Dragon Order, an organization that sees it as their duty to guard the Dark Dragon\'s seal, and the return of <a href=\"/ryu-hayabusa/3005-104/\" data-ref-id=\"3005-104\">Ryu Hayabusa</a>, who appears to have his own goal in mind that clashes with Yakumo\'s orders.</p>', 'Ninja Gaiden returns with help from Platinum Games.', 54.82, '2025-05-28 00:51:12', 0, NULL, 'game_92525_58c6b84f773f9d4c69f8aa9552788ef1.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(230, 1, 1, 1, 'ALARA Prime', 'alara-prime', '', 'A free-to-play 4v4v4 tactical FPS developed by Fall Damage and published by Level Infinite.', 0.00, '2025-05-28 00:51:12', 1, NULL, 'game_86789_0e6f4531766b4559149dcf1ea739134a.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL),
(231, 1, 1, 1, 'OnOrbit - Virtual Space Lab', 'onorbit---virtual-space-lab', '', 'A space station simulator and exploration game from Adrian Kougianos.', 21.95, '2025-05-28 00:51:12', 0, NULL, 'game_91875_e7417272dca71497105d939733321279.jpg', 'Windows 10', '2.5 GHz', '8 GB', 'GTX 660', '50 GB', 'Windows 10', '3.5 GHz', '16 GB', 'GTX 1060', '50 GB', NULL, NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `game_average_ratings`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `game_average_ratings` (
`average_rating` decimal(13,8)
,`cart_id` int
,`description` longtext
,`developer_id` int
,`free_until` datetime
,`genre_id` int
,`id` int
,`is_free` tinyint(1)
,`min_graphics` varchar(255)
,`min_memory` varchar(255)
,`min_os` varchar(255)
,`min_processor` varchar(255)
,`min_storage` varchar(255)
,`price` decimal(10,2)
,`publisher_id` int
,`rating_user_count` bigint
,`rec_graphics` varchar(255)
,`rec_memory` varchar(255)
,`rec_os` varchar(255)
,`rec_processor` varchar(255)
,`rec_storage` varchar(255)
,`release_date` datetime
,`short_description` longtext
,`slug` varchar(255)
,`thumbnail` varchar(255)
,`title` varchar(255)
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `game_platform`
--

CREATE TABLE `game_platform` (
  `game_id` int NOT NULL,
  `platform_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `game_platform`
--

INSERT INTO `game_platform` (`game_id`, `platform_id`) VALUES
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`, `slug`) VALUES
(1, 'action', 'qtrbrqber,n bn'),
(2, 'fantasy', 'ecdlknkvfblkmfeb,mlbs,mlbesrfd'),
(3, 'RPG', 'rpg-slug'),
(4, 'Shooter', 'shooter-slug'),
(5, 'Adventure', 'adventure-slug'),
(6, 'Action', 'action-slug');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:51:\\\"Votre paiement pour la commande #7 a été validé.\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"no-reply@monsite.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Confirmation de paiement\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-15 10:54:58', '2025-05-15 10:54:58', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:51:\\\"Votre paiement pour la commande #8 a été validé.\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"no-reply@monsite.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Confirmation de paiement\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-15 11:59:45', '2025-05-15 11:59:45', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:51:\\\"Votre paiement pour la commande #9 a été validé.\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"no-reply@monsite.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Confirmation de paiement\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-15 12:01:04', '2025-05-15 12:01:04', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:28:\\\"Symfony\\\\Component\\\\Mime\\\\Email\\\":6:{i:0;s:52:\\\"Votre paiement pour la commande #10 a été validé.\\\";i:1;s:5:\\\"utf-8\\\";i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:20:\\\"no-reply@monsite.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:24:\\\"Confirmation de paiement\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-15 14:43:25', '2025-05-15 14:43:25', NULL),
(5, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:24:\\\"checkout/email.html.twig\\\";i:1;N;i:2;a:5:{s:5:\\\"order\\\";O:16:\\\"App\\\\Entity\\\\Order\\\":6:{s:20:\\\"\\0App\\\\Entity\\\\Order\\0id\\\";i:16;s:28:\\\"\\0App\\\\Entity\\\\Order\\0totalPrice\\\";d:184.99;s:24:\\\"\\0App\\\\Entity\\\\Order\\0status\\\";s:4:\\\"paid\\\";s:27:\\\"\\0App\\\\Entity\\\\Order\\0orderDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-28 14:12:11.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:27:\\\"\\0App\\\\Entity\\\\Order\\0paymentId\\\";i:0;s:24:\\\"\\0App\\\\Entity\\\\Order\\0userId\\\";i:2;}s:5:\\\"items\\\";a:5:{i:0;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:30;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:6;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:14:\\\"Cyberpunk 2077\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";s:14:\\\"cyberpunk-2077\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:14:\\\"Futuristic RPG\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:20:\\\"Night City adventure\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"70.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-12-01 00:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:17:\\\"cyberpunk2077.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"3.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:8:\\\"GTX 1060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:4:\\\"70GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"4.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 3070\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:4:\\\"70GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:2;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Publisher\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Publisher\\0id\\\";i:2;}s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";O:31:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Genre\\\":1:{s:20:\\\"\\0App\\\\Entity\\\\Genre\\0id\\\";i:1;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-10 15:41:11.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";O:15:\\\"App\\\\Entity\\\\User\\\":18:{s:19:\\\"\\0App\\\\Entity\\\\User\\0id\\\";i:2;s:22:\\\"\\0App\\\\Entity\\\\User\\0email\\\";s:14:\\\"fuser@game.com\\\";s:22:\\\"\\0App\\\\Entity\\\\User\\0roles\\\";a:1:{i:0;s:9:\\\"ROLE_USER\\\";}s:25:\\\"\\0App\\\\Entity\\\\User\\0password\\\";s:60:\\\"$2a$12$Hk5ALHy5qgU5s2OJRJg4YOQ15BUY0BFzVLX1X0PsUofYrTPeif3Z.\\\";s:25:\\\"\\0App\\\\Entity\\\\User\\0username\\\";s:4:\\\"user\\\";s:26:\\\"\\0App\\\\Entity\\\\User\\0firstName\\\";s:6:\\\"Hamadi\\\";s:25:\\\"\\0App\\\\Entity\\\\User\\0lastName\\\";s:10:\\\"Ben Aribia\\\";s:23:\\\"\\0App\\\\Entity\\\\User\\0avatar\\\";N;s:27:\\\"\\0App\\\\Entity\\\\User\\0avatarFile\\\";N;s:20:\\\"\\0App\\\\Entity\\\\User\\0bio\\\";s:15:\\\"Short bio here.\\\";s:22:\\\"\\0App\\\\Entity\\\\User\\0phone\\\";s:9:\\\"123456787\\\";s:26:\\\"\\0App\\\\Entity\\\\User\\0createdAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 17:01:45.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:26:\\\"\\0App\\\\Entity\\\\User\\0lastLogin\\\";N;s:27:\\\"\\0App\\\\Entity\\\\User\\0isVerified\\\";b:0;s:24:\\\"\\0App\\\\Entity\\\\User\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\User\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:25:\\\"\\0App\\\\Entity\\\\User\\0wishlist\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\User\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 17:01:45.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Cart\\\":1:{s:19:\\\"\\0App\\\\Entity\\\\Cart\\0id\\\";i:2;}}i:1;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:31;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:5;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:25:\\\"Assassin\\\'s Creed Valhalla\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";s:11:\\\"ac-valhalla\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:16:\\\"Viking adventure\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:16:\\\"Epic Viking saga\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"60.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-11-10 00:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:15:\\\"ac-valhalla.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"3.5GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:7:\\\"GTX 970\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:4:\\\"50GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"4.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 2070\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:4:\\\"50GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:1;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Publisher\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Publisher\\0id\\\";i:1;}s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";r:55;s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-10 15:41:11.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}i:2;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:32;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:4;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:19:\\\"Oblivion Remastered\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";N;s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:160:\\\"Explorez Cyrodiil comme jamais auparavant, grâce à de nouveaux visuels étonnants et un gameplay peaufiné, dans The Elder Scrolls IV: Oblivion™ Remastered.\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:160:\\\"Explorez Cyrodiil comme jamais auparavant, grâce à de nouveaux visuels étonnants et un gameplay peaufiné, dans The Elder Scrolls IV: Oblivion™ Remastered.\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"35.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-04-22 16:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:33:\\\"header-681f694e7aa28015902260.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"1.7Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:8:\\\"RTX 2060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:5:\\\"125GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"windows 11\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"2.7Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"32GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 3060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:5:\\\"125GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:4;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Publisher\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Publisher\\0id\\\";i:3;}s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";r:55;s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-10 16:57:18.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}i:3;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:33;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:132;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:20:\\\"Elder Scrolls Online\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";s:20:\\\"elder-scrolls-online\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:20:\\\"MMO in Tamriel world\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:24:\\\"Online Skyrim experience\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"19.99\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2014-04-04 00:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:7:\\\"eso.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:5:\\\"Win 7\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:2:\\\"i3\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"4GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:7:\\\"GTX 460\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:4:\\\"85GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:6:\\\"Win 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:2:\\\"i5\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:7:\\\"GTX 750\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:4:\\\"85GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:3;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";r:201;s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";O:31:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Genre\\\":1:{s:20:\\\"\\0App\\\\Entity\\\\Genre\\0id\\\";i:2;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";N;}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}i:4;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:34;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:2;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:2;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:14:\\\"genshin impact\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";N;s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:13:\\\"mihoyo studio\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:9:\\\"gach game\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:4:\\\"0.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-08 10:34:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:1;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:41:\\\"genshin-impact-681c81a963188362543985.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"1.7Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:8:\\\"RTX 2060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:5:\\\"120GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"windows 11\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"3.0Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 3060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:5:\\\"150GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";r:51;s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";r:53;s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";r:258;s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-08 12:04:25.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}}s:5:\\\"total\\\";d:184.99;s:3:\\\"tax\\\";d:18.499000000000002;s:8:\\\"totalTTC\\\";d:203.48900000000003;}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:26:\\\"aya.gaha.noreply@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:35:\\\"🧾 Confirmation de votre commande\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-28 12:12:41', '2025-05-28 12:12:41', NULL);
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(6, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:24:\\\"checkout/email.html.twig\\\";i:1;N;i:2;a:5:{s:5:\\\"order\\\";O:16:\\\"App\\\\Entity\\\\Order\\\":6:{s:20:\\\"\\0App\\\\Entity\\\\Order\\0id\\\";i:17;s:28:\\\"\\0App\\\\Entity\\\\Order\\0totalPrice\\\";d:130;s:24:\\\"\\0App\\\\Entity\\\\Order\\0status\\\";s:4:\\\"paid\\\";s:27:\\\"\\0App\\\\Entity\\\\Order\\0orderDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-28 15:00:56.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:27:\\\"\\0App\\\\Entity\\\\Order\\0paymentId\\\";i:0;s:24:\\\"\\0App\\\\Entity\\\\Order\\0userId\\\";i:2;}s:5:\\\"items\\\";a:3:{i:0;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:35;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:2;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:14:\\\"genshin impact\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";N;s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:13:\\\"mihoyo studio\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:9:\\\"gach game\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:4:\\\"0.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-08 10:34:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:1;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:41:\\\"genshin-impact-681c81a963188362543985.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"1.7Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:8:\\\"RTX 2060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:5:\\\"120GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"windows 11\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"3.0Ghz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 3060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:5:\\\"150GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:2;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Publisher\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Publisher\\0id\\\";i:2;}s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";O:31:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Genre\\\":1:{s:20:\\\"\\0App\\\\Entity\\\\Genre\\0id\\\";i:2;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-08 12:04:25.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";O:15:\\\"App\\\\Entity\\\\User\\\":18:{s:19:\\\"\\0App\\\\Entity\\\\User\\0id\\\";i:2;s:22:\\\"\\0App\\\\Entity\\\\User\\0email\\\";s:14:\\\"fuser@game.com\\\";s:22:\\\"\\0App\\\\Entity\\\\User\\0roles\\\";a:1:{i:0;s:9:\\\"ROLE_USER\\\";}s:25:\\\"\\0App\\\\Entity\\\\User\\0password\\\";s:60:\\\"$2a$12$Hk5ALHy5qgU5s2OJRJg4YOQ15BUY0BFzVLX1X0PsUofYrTPeif3Z.\\\";s:25:\\\"\\0App\\\\Entity\\\\User\\0username\\\";s:4:\\\"user\\\";s:26:\\\"\\0App\\\\Entity\\\\User\\0firstName\\\";s:6:\\\"Hamadi\\\";s:25:\\\"\\0App\\\\Entity\\\\User\\0lastName\\\";s:10:\\\"Ben Aribia\\\";s:23:\\\"\\0App\\\\Entity\\\\User\\0avatar\\\";N;s:27:\\\"\\0App\\\\Entity\\\\User\\0avatarFile\\\";N;s:20:\\\"\\0App\\\\Entity\\\\User\\0bio\\\";s:15:\\\"Short bio here.\\\";s:22:\\\"\\0App\\\\Entity\\\\User\\0phone\\\";s:9:\\\"123456787\\\";s:26:\\\"\\0App\\\\Entity\\\\User\\0createdAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 17:01:45.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:26:\\\"\\0App\\\\Entity\\\\User\\0lastLogin\\\";N;s:27:\\\"\\0App\\\\Entity\\\\User\\0isVerified\\\";b:0;s:24:\\\"\\0App\\\\Entity\\\\User\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\User\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:25:\\\"\\0App\\\\Entity\\\\User\\0wishlist\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\User\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-09 17:01:45.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Cart\\\":1:{s:19:\\\"\\0App\\\\Entity\\\\Cart\\0id\\\";i:2;}}i:1;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:36;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:6;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:14:\\\"Cyberpunk 2077\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";s:14:\\\"cyberpunk-2077\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:14:\\\"Futuristic RPG\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:20:\\\"Night City adventure\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"70.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-12-01 00:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:17:\\\"cyberpunk2077.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"3.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:8:\\\"GTX 1060\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:4:\\\"70GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"4.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 3070\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:4:\\\"70GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";r:51;s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";r:53;s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";O:31:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Genre\\\":1:{s:20:\\\"\\0App\\\\Entity\\\\Genre\\0id\\\";i:1;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-10 15:41:11.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}i:2;O:19:\\\"App\\\\Entity\\\\CartItem\\\":5:{s:23:\\\"\\0App\\\\Entity\\\\CartItem\\0id\\\";i:37;s:29:\\\"\\0App\\\\Entity\\\\CartItem\\0quantity\\\";i:1;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0game\\\";O:30:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Game\\\":30:{s:21:\\\"\\0App\\\\Entity\\\\Game\\0cart\\\";N;s:19:\\\"\\0App\\\\Entity\\\\Game\\0id\\\";i:5;s:22:\\\"\\0App\\\\Entity\\\\Game\\0title\\\";s:25:\\\"Assassin\\\'s Creed Valhalla\\\";s:21:\\\"\\0App\\\\Entity\\\\Game\\0slug\\\";s:11:\\\"ac-valhalla\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0description\\\";s:16:\\\"Viking adventure\\\";s:33:\\\"\\0App\\\\Entity\\\\Game\\0shortDescription\\\";s:16:\\\"Epic Viking saga\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0price\\\";s:5:\\\"60.00\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0releaseDate\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-11-10 00:00:00.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:23:\\\"\\0App\\\\Entity\\\\Game\\0isFree\\\";b:0;s:26:\\\"\\0App\\\\Entity\\\\Game\\0freeUntil\\\";N;s:26:\\\"\\0App\\\\Entity\\\\Game\\0thumbnail\\\";s:15:\\\"ac-valhalla.jpg\\\";s:30:\\\"\\0App\\\\Entity\\\\Game\\0thumbnailFile\\\";N;s:22:\\\"\\0App\\\\Entity\\\\Game\\0minOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0minProcessor\\\";s:6:\\\"3.5GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0minMemory\\\";s:3:\\\"8GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0minGraphics\\\";s:7:\\\"GTX 970\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0minStorage\\\";s:4:\\\"50GB\\\";s:22:\\\"\\0App\\\\Entity\\\\Game\\0recOs\\\";s:10:\\\"Windows 10\\\";s:29:\\\"\\0App\\\\Entity\\\\Game\\0recProcessor\\\";s:6:\\\"4.0GHz\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0recMemory\\\";s:4:\\\"16GB\\\";s:28:\\\"\\0App\\\\Entity\\\\Game\\0recGraphics\\\";s:8:\\\"RTX 2070\\\";s:27:\\\"\\0App\\\\Entity\\\\Game\\0recStorage\\\";s:4:\\\"50GB\\\";s:26:\\\"\\0App\\\\Entity\\\\Game\\0developer\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Developer\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Developer\\0id\\\";i:1;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0publisher\\\";O:35:\\\"Proxies\\\\__CG__\\\\App\\\\Entity\\\\Publisher\\\":1:{s:24:\\\"\\0App\\\\Entity\\\\Publisher\\0id\\\";i:1;}s:22:\\\"\\0App\\\\Entity\\\\Game\\0genre\\\";r:145;s:26:\\\"\\0App\\\\Entity\\\\Game\\0platforms\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:28:\\\"\\0App\\\\Entity\\\\Game\\0screenshots\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:24:\\\"\\0App\\\\Entity\\\\Game\\0reviews\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0downloads\\\";O:33:\\\"Doctrine\\\\ORM\\\\PersistentCollection\\\":2:{s:13:\\\"\\0*\\0collection\\\";O:43:\\\"Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\\":1:{s:53:\\\"\\0Doctrine\\\\Common\\\\Collections\\\\ArrayCollection\\0elements\\\";a:0:{}}s:14:\\\"\\0*\\0initialized\\\";b:0;}s:26:\\\"\\0App\\\\Entity\\\\Game\\0updatedAt\\\";O:8:\\\"DateTime\\\":3:{s:4:\\\"date\\\";s:26:\\\"2025-05-10 15:41:11.000000\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}}s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0user\\\";r:77;s:25:\\\"\\0App\\\\Entity\\\\CartItem\\0cart\\\";r:112;}}s:5:\\\"total\\\";d:130;s:3:\\\"tax\\\";d:13;s:8:\\\"totalTTC\\\";d:143;}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:26:\\\"aya.gaha.noreply@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"fuser@game.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:35:\\\"🧾 Confirmation de votre commande\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2025-05-28 13:01:09', '2025-05-28 13:01:09', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `genre_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id`, `genre_id`, `title`, `slug`, `summary`, `image`, `created_at`, `content`) VALUES
(4, 1, 'New Expansion Released', 'new-expansion-released', 'Discover the latest update in our best-selling game!', 'news_1.jpg', '2025-05-28 12:18:57', 'The new expansion brings exciting features, including new maps, characters, and challenges. Fans are already calling it the best update yet!<p>We’re thrilled to announce the release of <strong>The Shadow Reborn</strong>, the brand-new expansion for our critically acclaimed title <em>Legends of Etherwind</em>.</p>\n\n<p>This expansion brings a massive content drop, including:</p>\n\n<ul>\n  <li>🗺️ A vast new continent to explore with over 50 unique zones</li>\n  <li>🧙‍♂️ 3 new playable classes, including the Arcane Monk and Shadow Druid</li>\n  <li>🏰 A story-driven campaign with branching paths and multiple endings</li>\n  <li>⚔️ Revamped combat system with more dynamic boss mechanics</li>\n  <li>🎵 An all-new original soundtrack composed by award-winning artists</li>\n</ul>\n\n<p>Whether you’re a returning veteran or a new adventurer, <em>The Shadow Reborn</em> promises a fresh and thrilling experience that will redefine your journey in Etherwind.</p>\n\n<p><strong>Available Now</strong> on all platforms. Dive in and uncover the mysteries that lie in the dark corners of the world!</p>'),
(5, 1, 'Top 10 Games in 2025', 'top-10-games-2025', 'Here are the hottest games of the year!', 'news_2.jpg', '2025-05-28 12:18:57', '<p>2025 has been an incredible year for gamers worldwide. From groundbreaking AAA titles to indie masterpieces, this year’s lineup is stacked with unforgettable experiences. Here\'s our curated list of the top 10 must-play games that dominated the charts and hearts in 2025:</p>\n\n<ol>\n  <li>\n    <strong>ChronoForge</strong> – A sci-fi RPG blending time travel with moral consequences. Every choice alters the future.\n  </li>\n  <li>\n    <strong>Valorbound II</strong> – The much-anticipated sequel brings deeper lore, richer combat, and co-op raids.\n  </li>\n  <li>\n    <strong>Skyfall: Dominion</strong> – A next-gen open-world experience where floating islands, dragons, and airships await.\n  </li>\n  <li>\n    <strong>Hollow Dreams</strong> – Indie horror done right. Atmospheric, minimal, and terrifyingly immersive.\n  </li>\n  <li>\n    <strong>Gran Turismo Legacy</strong> – With hyper-realistic graphics and a rebuilt physics engine, it’s the best driving sim yet.\n  </li>\n  <li>\n    <strong>Pixel Quest: Reborn</strong> – Nostalgia meets innovation in this retro-style pixel RPG with procedurally generated dungeons.\n  </li>\n  <li>\n    <strong>Cyber Siege</strong> – A tactical FPS where every bullet and breach decision matters.\n  </li>\n  <li>\n    <strong>WildFronts</strong> – A survival sandbox set in the prehistoric wilderness, complete with tribe building and mammoth hunting.\n  </li>\n  <li>\n    <strong>Spellshatter</strong> – Esports\' next big thing. A wizard-dueling MOBA with incredible spell physics.\n  </li>\n  <li>\n    <strong>Animal Architects</strong> – A wholesome building sim where you help woodland creatures design treehouses, bridges, and cozy towns.\n  </li>\n</ol>\n\n<p>Whether you\'re into story-driven epics, competitive multiplayer, or creative sandbox experiences, 2025 delivered something for everyone. Which game on this list was your favorite? Let us know in the comments!</p>\n'),
(6, 1, 'Exclusive Interview with the Founder of Etherstorm Studios', 'developer-interview', 'Exclusive insights from the game studio founder.', 'news_3.jpg', '2025-05-28 12:18:57', '<p>In an exclusive sit-down, we spoke with <strong>Amira Khellaf</strong>, the visionary founder and creative director of <em>Etherstorm Studios</em>, the team behind this year’s most anticipated RPG, <em>Legends of Etherwind</em>.</p>\n\n<p>During the interview, Amira shared insights into the studio’s journey, development challenges, and what inspired the game’s rich fantasy world.</p>\n\n<h3>Highlights from the Interview:</h3>\n\n<ul>\n  <li>🎮 <strong>On creative vision:</strong> “We wanted players to feel like they were writing their own epic saga, with choices that truly matter.”</li>\n  <li>🛠️ <strong>On development hurdles:</strong> “Balancing an open world with meaningful storytelling was our biggest challenge.”</li>\n  <li>🌍 <strong>On world-building:</strong> “We built a universe with over 200 years of fictional history to make the lore immersive.”</li>\n</ul>\n\n<p>Amira also hinted at future expansions, potential spin-off titles, and the studio’s commitment to community-driven updates.</p>\n\n<p><em>“This is just the beginning. We have so much more in store for our players.”</em></p>'),
(7, 1, 'GameHub Awards 2025 Winners Announced', 'gamehub-awards-2025', 'The best games and studios of the year have been revealed!', 'news_4.jpg', '2025-05-28 12:37:59', '<p>The annual <strong>GameHub Awards 2025</strong> ceremony took place last night, honoring the best games and studios that defined the year. Fans and critics gathered online to celebrate innovation, storytelling, and groundbreaking gameplay.</p>\r\n\r\n<p>Winners included:</p>\r\n<ul>\r\n  <li><em>Game of the Year:</em> <strong>\"Eclipse: Beyond the Stars\"</strong></li>\r\n  <li><em>Best Indie Game:</em> <strong>\"Pixel Quest\"</strong></li>\r\n  <li><em>Best Narrative:</em> <strong>\"Shadows of the Forgotten\"</strong></li>\r\n</ul>\r\n\r\n<p>Organizers praised the diversity and creativity across all genres, highlighting how gaming continues to evolve as a medium for art and entertainment.</p>\r\n\r\n<p>Stay tuned for exclusive interviews and behind-the-scenes content from the winners!</p>'),
(8, 1, 'Upcoming VR Tech Revolutionizes Gameplay', 'upcoming-vr-tech-revolutionizes-gameplay', 'New VR gear promises to immerse players like never before.', 'news_5.jpg', '2025-05-28 12:37:59', '<p>Virtual Reality technology is on the cusp of a major breakthrough, with several companies announcing revolutionary gear that promises to change gameplay forever.</p>\r\n\r\n<p>The new VR systems feature:</p>\r\n<ul>\r\n  <li>Full-body tracking for realistic avatar movement</li>\r\n  <li>Advanced haptic feedback suits that simulate touch and resistance</li>\r\n  <li>Eye-tracking and facial expression recognition</li>\r\n  <li>Lightweight wireless design for greater freedom of movement</li>\r\n</ul>\r\n\r\n<p>Developers are excited to harness these tools to create more immersive worlds where players feel truly present and engaged.</p>\r\n\r\n<p>Early testers have described the experience as \"mind-blowing\" and \"a new era for gaming\". Keep an eye out for upcoming VR game releases designed specifically for this cutting-edge technology.</p>'),
(9, 1, 'Indie Game Spotlight: “Pixel Quest”', 'indie-game-spotlight-pixel-quest', 'Discover the charming world of Pixel Quest, a rising indie hit.', 'news_6.jpg', '2025-05-28 12:37:59', '<p><strong>Pixel Quest</strong> has become a standout hit in the indie game scene, drawing players in with its charming pixel art and clever puzzles.</p>\r\n\r\n<p>The game features:</p>\r\n<ul>\r\n  <li>Over 50 handcrafted levels filled with secrets and challenges</li>\r\n  <li>A heartwarming story about friendship and adventure</li>\r\n  <li>Original chiptune soundtrack by award-winning composer</li>\r\n  <li>Retro-inspired mechanics with modern gameplay twists</li>\r\n</ul>\r\n\r\n<p>Players praise Pixel Quest for its nostalgic feel combined with fresh ideas. Whether you\'re a longtime fan of platformers or new to the genre, this game offers a delightful experience.</p>\r\n\r\n<p>Pixel Quest is available now on PC and consoles. Don’t miss out on this indie gem!</p>'),
(10, 1, 'Esports Scene Heats Up for Summer Championships', 'esports-scene-heats-up-for-summer-championships', 'Teams gear up for the biggest esports tournaments of the year.', 'news_7.jpg', '2025-05-28 12:37:59', '<p>The competitive gaming world is buzzing as the <strong>Summer Championships</strong> approach, promising some of the most intense and exciting matches of the year.</p>\r\n\r\n<p>Top teams from around the globe have been training hard, focusing on strategy, teamwork, and peak performance.</p>\r\n\r\n<p>Key details about the event:</p>\r\n<ul>\r\n  <li>Dates: July 10 - July 25, 2025</li>\r\n  <li>Games featured: <em>Valorant, League of Legends, Dota 2, CS:GO</em></li>\r\n  <li>Prize pool: Over $5 million USD</li>\r\n  <li>Broadcast on major streaming platforms with live commentary</li>\r\n</ul>\r\n\r\n<p>Fans can look forward to thrilling gameplay, unexpected upsets, and legendary moments as players compete for glory.</p>\r\n\r\n<p>Follow the official GameHub esports channels for schedules, highlights, and exclusive content.</p>'),
(11, 1, 'GameHub Launches New Community Features', 'gamehub-launches-new-community-features', 'New tools and forums to enhance player interaction and content sharing.', 'news_8.jpg', '2025-05-28 12:37:59', '<p>GameHub is excited to unveil new community features designed to bring players closer and spark creativity.</p>\r\n\r\n<p>The update includes:</p>\r\n<ul>\r\n  <li><strong>Enhanced forums</strong> with better organization and moderation tools</li>\r\n  <li><strong>User-generated content sharing</strong>, including screenshots, videos, and guides</li>\r\n  <li><strong>Customizable player profiles</strong> to showcase achievements and favorite games</li>\r\n  <li><strong>Live chat rooms</strong> for real-time discussions during game releases and events</li>\r\n</ul>\r\n\r\n<p>These tools aim to foster a welcoming, creative, and supportive environment for gamers of all backgrounds.</p>\r\n\r\n<p>Join the conversation today and be part of the GameHub community like never before!</p>');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `total_price` double NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `total_price`, `status`, `order_date`, `payment_id`, `user_id`) VALUES
(1, 29.99, 'pending', '2024-05-15 12:00:00', 12345, 1),
(2, 105, 'pending', '2025-05-15 02:58:17', 0, 2),
(3, 105, 'pending', '2025-05-15 03:04:31', 0, 2),
(4, 105, 'pending', '2025-05-15 10:31:25', 0, 2),
(5, 105, 'pending', '2025-05-15 10:33:20', 0, 2),
(6, 105, 'paid', '2025-05-15 11:18:24', 0, 2),
(7, 70, 'paid', '2025-05-15 11:32:15', 0, 2),
(8, 189, 'paid', '2025-05-15 13:59:16', 0, 2),
(9, 119.99, 'paid', '2025-05-15 14:01:00', 0, 2),
(10, 124.98, 'paid', '2025-05-15 16:43:03', 0, 2),
(11, 188.99, 'pending', '2025-05-28 00:22:12', 0, 1),
(12, 188.99, 'pending', '2025-05-28 00:30:37', 0, 1),
(13, 188.99, 'pending', '2025-05-28 00:30:49', 0, 1),
(14, 188.99, 'pending', '2025-05-28 11:49:00', 0, 1),
(15, 184.99, 'pending', '2025-05-28 11:51:47', 0, 2),
(16, 184.99, 'paid', '2025-05-28 14:12:11', 0, 2),
(17, 130, 'paid', '2025-05-28 15:00:56', 0, 2),
(18, 130, 'pending', '2025-05-28 18:36:11', 0, 2),
(19, 130, 'pending', '2025-05-28 19:09:49', 0, 2),
(20, 130, 'pending', '2025-05-29 00:33:13', 0, 2),
(21, 130, 'pending', '2025-05-29 00:49:29', 0, 2),
(22, 130, 'pending', '2025-05-29 00:52:22', 0, 2),
(23, 130, 'pending', '2025-05-29 09:55:22', 0, 2),
(24, 130, 'pending', '2025-05-29 11:34:23', 0, 2),
(25, 130, 'pending', '2025-05-29 13:02:06', 0, 2),
(26, 130, 'pending', '2025-05-29 15:01:56', 0, 2),
(27, 130, 'pending', '2025-05-29 15:24:03', 0, 2),
(28, 24, 'pending', '2025-05-30 03:57:58', 0, 1),
(29, 130, 'pending', '2025-05-30 03:58:19', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `order_id`, `user_id`, `amount`, `provider`, `status`, `payment_date`) VALUES
(1, 10, 2, 124.98, 'flouci', 'success', '2025-05-15'),
(2, 16, 2, 184.99, 'flouci', 'success', '2025-05-28'),
(3, 17, 2, 130, 'flouci', 'success', '2025-05-28');

-- --------------------------------------------------------

--
-- Structure de la table `platform`
--

CREATE TABLE `platform` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `platform`
--

INSERT INTO `platform` (`id`, `name`, `slug`, `icon`) VALUES
(1, 'PC', 'eqlmveregrv', NULL),
(2, 'PS5', 'erqvqegrgrl', NULL),
(3, 'XBOX', 'qerlm,qer,lmqegr,', NULL),
(4, 'Nintendo Switch', 'nintendo-switch-slug', NULL),
(5, 'Steam', 'steam-slug', NULL),
(6, 'PlayStation 5', 'ps5-slug', NULL),
(7, 'Xbox Series X', 'xbox-series-x-slug', NULL),
(8, 'Xbox Series X|S', 'xbox-series-x|s', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

CREATE TABLE `publisher` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `slug`) VALUES
(1, 'Rockstar games', 'qegrnbqergnbljqoebnqepZMBNKLMVFQENKPMBNPMNPQERMNPBNPOQEFNO¨PEBNOERNOËRVBNOPQERONPBROPRBENQBËORQNOBËROP¨BRNOPERBPOESTBNOP'),
(2, 'mihoyo', 'lknlkthyklnrntpnpnoano^zgro^pgezrnoâregnoâno^paerbno^paerbnop^n'),
(3, 'bethesda', 'p,omztrztropmb,ntb,tb,ne^,ntâe,n^t^pa,erb,^preb^,baer^p,^bheraerb'),
(4, 'Ubisoft', 'ubisoft-slug'),
(5, 'CD Projekt', 'cdprojekt-slug'),
(6, 'Rockstar Games', 'rockstar-slug'),
(7, 'Bethesda', 'bethesda-slug');

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `rating` smallint NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`id`, `user_id`, `game_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 1, 5, 'Amazing game! Can\'t wait for the release!', '2025-05-10 15:59:01'),
(2, 2, 1, 4, 'Looks promising from the trailers', '2025-05-10 15:59:01'),
(3, 1, 2, 3, 'Good game but too much grinding', '2025-05-10 15:59:01'),
(4, 2, 3, 5, 'Classic RPG that never gets old', '2025-05-10 15:59:01'),
(5, 2, 6, 5, 'nice!!', '2025-05-11 19:59:44'),
(6, 1, 3, 5, NULL, '2025-05-11 18:26:59'),
(7, 1, 3, 4, NULL, '2025-05-11 18:27:10'),
(8, 1, 3, 5, NULL, '2025-05-11 18:30:04'),
(9, 1, 3, 5, NULL, '2025-05-11 18:30:25'),
(10, 1, 3, 5, NULL, '2025-05-11 18:31:48'),
(11, 1, 3, 5, NULL, '2025-05-11 18:32:43'),
(12, 1, 3, 5, NULL, '2025-05-11 18:34:47'),
(13, 1, 3, 5, NULL, '2025-05-11 18:35:20'),
(14, 1, 3, 5, NULL, '2025-05-11 18:37:40'),
(15, 1, 3, 5, NULL, '2025-05-11 18:38:03'),
(16, 1, 3, 5, 'veqlmbqef,dlmbqedf,mqedfb', '2025-05-11 18:40:24'),
(17, 1, 3, 5, 'fen,fremlefqz,dl', '2025-05-11 18:40:36'),
(18, 1, 3, 5, 'erqlmq,erbmldfvb,', '2025-05-11 18:41:44'),
(19, 1, 3, 4, 'slam', '2025-05-30 03:53:09');

-- --------------------------------------------------------

--
-- Structure de la table `screenshot`
--

CREATE TABLE `screenshot` (
  `id` int NOT NULL,
  `game_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `screenshot`
--

INSERT INTO `screenshot` (`id`, `game_id`, `image`, `uploaded_at`) VALUES
(1, 1, 'https://example.com/screenshots/gta6_1.jpg', '2025-05-10 15:59:01'),
(2, 1, 'https://example.com/screenshots/gta6_2.jpg', '2025-05-10 15:59:01'),
(3, 2, 'https://example.com/screenshots/genshin_1.jpg', '2025-05-10 15:59:01'),
(4, 2, 'https://example.com/screenshots/genshin_2.jpg', '2025-05-10 15:59:01'),
(5, 3, 'https://example.com/screenshots/skyrim_1.jpg', '2025-05-10 15:59:01'),
(6, 3, 'https://example.com/screenshots/skyrim_2.jpg', '2025-05-10 15:59:01');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `first_name`, `last_name`, `avatar`, `bio`, `phone`, `created_at`, `last_login`, `is_verified`, `updated_at`) VALUES
(1, 'fadmin@game.com', '[\"ROLE_ADMIN\"]', '$2a$12$5.WznxsC4UoUSL3nAdhvJO6y3tqdRPyo5TwUvjXihgCsf7u287V.2', 'admin', 'John', 'Doe', NULL, 'Short bio here.', '123456789', '2025-05-09 16:57:37', NULL, 0, '2025-05-09 16:57:37'),
(2, 'fuser@game.com', '[\"ROLE_USER\"]', '$2a$12$Hk5ALHy5qgU5s2OJRJg4YOQ15BUY0BFzVLX1X0PsUofYrTPeif3Z.', 'user', 'Hamadi', 'Ben Aribia', NULL, 'Short bio here.', '123456787', '2025-05-09 17:01:45', NULL, 0, '2025-05-09 17:01:45');

-- --------------------------------------------------------

--
-- Structure de la table `user_game`
--

CREATE TABLE `user_game` (
  `user_id` int NOT NULL,
  `game_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_game`
--

INSERT INTO `user_game` (`user_id`, `game_id`) VALUES
(1, 2),
(1, 3),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `game_id` int NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la vue `game_average_ratings`
--
DROP TABLE IF EXISTS `game_average_ratings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `game_average_ratings`  AS SELECT `g`.`id` AS `id`, `g`.`developer_id` AS `developer_id`, `g`.`publisher_id` AS `publisher_id`, `g`.`genre_id` AS `genre_id`, `g`.`title` AS `title`, `g`.`slug` AS `slug`, `g`.`description` AS `description`, `g`.`short_description` AS `short_description`, `g`.`price` AS `price`, `g`.`release_date` AS `release_date`, `g`.`is_free` AS `is_free`, `g`.`free_until` AS `free_until`, `g`.`thumbnail` AS `thumbnail`, `g`.`min_os` AS `min_os`, `g`.`min_processor` AS `min_processor`, `g`.`min_memory` AS `min_memory`, `g`.`min_graphics` AS `min_graphics`, `g`.`min_storage` AS `min_storage`, `g`.`rec_os` AS `rec_os`, `g`.`rec_processor` AS `rec_processor`, `g`.`rec_memory` AS `rec_memory`, `g`.`rec_graphics` AS `rec_graphics`, `g`.`rec_storage` AS `rec_storage`, `g`.`updated_at` AS `updated_at`, `g`.`cart_id` AS `cart_id`, ifnull((select avg(`user_avgs`.`user_avg`) from (select avg(`r2`.`rating`) AS `user_avg` from `review` `r2` where (`r2`.`game_id` = `g`.`id`) group by `r2`.`user_id`) `user_avgs`),0) AS `average_rating`, (select count(distinct `r3`.`user_id`) from `review` `r3` where (`r3`.`game_id` = `g`.`id`)) AS `rating_user_count` FROM `game` AS `g` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F0FE2527E48FD905` (`game_id`),
  ADD KEY `IDX_F0FE2527A76ED395` (`user_id`),
  ADD KEY `IDX_F0FE25271AD5CDBF` (`cart_id`);

--
-- Index pour la table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_781A8270A76ED395` (`user_id`),
  ADD KEY `IDX_781A8270E48FD905` (`game_id`);

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_232B318C989D9B62` (`slug`),
  ADD KEY `IDX_232B318C64DD9267` (`developer_id`),
  ADD KEY `IDX_232B318C40C86FCE` (`publisher_id`),
  ADD KEY `IDX_232B318C4296D31F` (`genre_id`),
  ADD KEY `IDX_232B318C1AD5CDBF` (`cart_id`);

--
-- Index pour la table `game_platform`
--
ALTER TABLE `game_platform`
  ADD PRIMARY KEY (`game_id`,`platform_id`),
  ADD KEY `IDX_92162FEDE48FD905` (`game_id`),
  ADD KEY `IDX_92162FEDFFE6496F` (`platform_id`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6D28840D8D9F6D38` (`order_id`),
  ADD KEY `IDX_6D28840DA76ED395` (`user_id`);

--
-- Index pour la table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6A76ED395` (`user_id`),
  ADD KEY `IDX_794381C6E48FD905` (`game_id`);

--
-- Index pour la table `screenshot`
--
ALTER TABLE `screenshot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_58991E41E48FD905` (`game_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_game`
--
ALTER TABLE `user_game`
  ADD PRIMARY KEY (`user_id`,`game_id`),
  ADD KEY `IDX_59AA7D45A76ED395` (`user_id`),
  ADD KEY `IDX_59AA7D45E48FD905` (`game_id`);

--
-- Index pour la table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9CE12A31A76ED395` (`user_id`),
  ADD KEY `IDX_9CE12A31E48FD905` (`game_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `developer`
--
ALTER TABLE `developer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `download`
--
ALTER TABLE `download`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `platform`
--
ALTER TABLE `platform`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `screenshot`
--
ALTER TABLE `screenshot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK_F0FE25271AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_F0FE2527A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F0FE2527E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Contraintes pour la table `download`
--
ALTER TABLE `download`
  ADD CONSTRAINT `FK_781A8270A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_781A8270E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `FK_232B318C1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_232B318C40C86FCE` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `FK_232B318C4296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_232B318C64DD9267` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`);

--
-- Contraintes pour la table `game_platform`
--
ALTER TABLE `game_platform`
  ADD CONSTRAINT `FK_92162FEDE48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92162FEDFFE6496F` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_6D28840D8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_6D28840DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_794381C6E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Contraintes pour la table `screenshot`
--
ALTER TABLE `screenshot`
  ADD CONSTRAINT `FK_58991E41E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Contraintes pour la table `user_game`
--
ALTER TABLE `user_game`
  ADD CONSTRAINT `FK_59AA7D45A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_59AA7D45E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_9CE12A31A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9CE12A31E48FD905` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
