-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 25 avr. 2024 à 21:07
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cars`
--

-- --------------------------------------------------------

--
-- Structure de la table `bodytypes`
--

CREATE TABLE `bodytypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `type_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bodytypes`
--

INSERT INTO `bodytypes` (`id`, `car_type`, `type_image`, `created_at`, `updated_at`) VALUES
(2, 'Hatchback', 'http://res.cloudinary.com/esps/image/upload/v1713829122/images/47065.jpg.jpg', '2024-04-24 11:50:17', '2024-04-24 12:00:40'),
(3, 'Convertible', 'http://res.cloudinary.com/esps/image/upload/v1713967196/images/images%20%286%29.jpg.jpg', '2024-04-24 11:59:57', '2024-04-24 11:59:57'),
(4, 'Sedan', 'http://res.cloudinary.com/esps/image/upload/v1713967303/images/2017_Toyota_Camry_%28ASV70R%29_SX_sedan_%282018-11-02%29_01.jpg.jpg', '2024-04-24 12:01:45', '2024-04-24 12:01:45'),
(5, 'Crossover', 'http://res.cloudinary.com/esps/image/upload/v1713967350/images/images%20%288%29.jpg.jpg', '2024-04-24 12:02:51', '2024-04-24 12:02:51'),
(6, 'Minivan', 'http://res.cloudinary.com/esps/image/upload/v1713967420/images/images%20%289%29.jpg.jpg', '2024-04-24 12:04:23', '2024-04-24 12:04:23'),
(7, 'Coupe', 'http://res.cloudinary.com/esps/image/upload/v1713967480/images/images%20%2810%29.jpg.jpg', '2024-04-24 12:04:42', '2024-04-24 12:04:42'),
(8, 'SUV', 'http://res.cloudinary.com/esps/image/upload/v1713967529/images/Hyundai-Alcazar-130720212215.jpg.jpg', '2024-04-24 12:05:31', '2024-04-24 12:05:31'),
(9, 'Microcar', 'http://res.cloudinary.com/esps/image/upload/v1713967576/images/Microcar_MC2_Dynamic_HSEi_CVT_Auto_%28front%29_-_Flickr_-_mick_-_Lumix.jpg.jpg', '2024-04-24 12:06:18', '2024-04-24 12:06:18'),
(10, 'Sports car', 'http://res.cloudinary.com/esps/image/upload/v1713967640/images/best_sportscar_514.jpg.jpg', '2024-04-24 12:07:24', '2024-04-24 12:07:24'),
(11, 'Pickup truck', 'http://res.cloudinary.com/esps/image/upload/v1713967818/images/Ford_F-150_crew_cab_--_05-28-2011.jpg.jpg', '2024-04-24 12:10:20', '2024-04-24 12:10:20'),
(12, 'Jeep', 'http://res.cloudinary.com/esps/image/upload/v1713967902/images/46265.jpg.jpg', '2024-04-24 12:11:45', '2024-04-24 12:11:45'),
(13, 'Limousine', 'http://res.cloudinary.com/esps/image/upload/v1713968033/images/images%20%2811%29.jpg.jpg', '2024-04-24 12:17:42', '2024-04-24 12:17:42'),
(14, 'Roadster', 'http://res.cloudinary.com/esps/image/upload/v1713968272/images/Tesla-Roadster-103.jpg.jpg', '2024-04-24 12:17:54', '2024-04-24 12:17:54'),
(16, 'Station wagon', 'http://res.cloudinary.com/esps/image/upload/v1713968783/images/images%20%2813%29.jpg.jpg', '2024-04-24 12:27:28', '2024-04-24 12:27:28'),
(17, 'City car', 'http://res.cloudinary.com/esps/image/upload/v1713968947/images/fiat-500-city-car.jpg.jpg', '2024-04-24 12:29:10', '2024-04-24 12:29:10');

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `fromcompany` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `Negotiated` tinyint(1) NOT NULL DEFAULT 0,
  `marque_id` bigint(20) UNSIGNED NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `Mileage` int(11) NOT NULL,
  `VIN` int(11) NOT NULL,
  `bodytype_id` bigint(20) UNSIGNED NOT NULL,
  `fueltype_id` bigint(20) UNSIGNED NOT NULL,
  `engine_id` bigint(20) UNSIGNED NOT NULL,
  `transmission` varchar(255) NOT NULL,
  `drivetrain` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `alloy_wheels` tinyint(1) DEFAULT 0,
  `sunroof_moonroof` tinyint(1) DEFAULT 0,
  `panoramic_roof` tinyint(1) DEFAULT 0,
  `tinted_glass` tinyint(1) DEFAULT 0,
  `multi_zone_ac` tinyint(1) DEFAULT 0,
  `heated_front_seats` tinyint(1) DEFAULT 0,
  `navigation_system` tinyint(1) DEFAULT 0,
  `leather_seats` tinyint(1) DEFAULT 0,
  `intermittent_wipers` tinyint(1) DEFAULT 0,
  `memory_seat` tinyint(1) DEFAULT 0,
  `premium_sound_system` tinyint(1) DEFAULT 0,
  `bluetooth` tinyint(1) DEFAULT 0,
  `usb_port` tinyint(1) DEFAULT 0,
  `leather_steering_wheel` tinyint(1) DEFAULT 0,
  `apple_carplay` tinyint(1) DEFAULT 0,
  `android_auto` tinyint(1) DEFAULT 0,
  `airbag_driver` tinyint(1) DEFAULT 0,
  `airbag_passenger` tinyint(1) DEFAULT 0,
  `alarm` tinyint(1) DEFAULT 0,
  `antilock_brakes` tinyint(1) DEFAULT 0,
  `stability_control` tinyint(1) DEFAULT 0,
  `fog_lights` tinyint(1) DEFAULT 0,
  `adaptive_cruise_control` tinyint(1) DEFAULT 0,
  `blind_spot_monitor` tinyint(1) DEFAULT 0,
  `brake_assist` tinyint(1) DEFAULT 0,
  `lane_departure_warning` tinyint(1) DEFAULT 0,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `adnumber` varchar(255) DEFAULT NULL,
  `views` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `archived` int(11) DEFAULT 0,
  `hidden` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cars`
--

INSERT INTO `cars` (`id`, `title`, `condition`, `fromcompany`, `price`, `Negotiated`, `marque_id`, `model_id`, `year`, `Mileage`, `VIN`, `bodytype_id`, `fueltype_id`, `engine_id`, `transmission`, `drivetrain`, `color`, `description`, `alloy_wheels`, `sunroof_moonroof`, `panoramic_roof`, `tinted_glass`, `multi_zone_ac`, `heated_front_seats`, `navigation_system`, `leather_seats`, `intermittent_wipers`, `memory_seat`, `premium_sound_system`, `bluetooth`, `usb_port`, `leather_steering_wheel`, `apple_carplay`, `android_auto`, `airbag_driver`, `airbag_passenger`, `alarm`, `antilock_brakes`, `stability_control`, `fog_lights`, `adaptive_cruise_control`, `blind_spot_monitor`, `brake_assist`, `lane_departure_warning`, `country_id`, `state_id`, `zipcode`, `address`, `adnumber`, `views`, `status`, `created_at`, `updated_at`, `user_id`, `archived`, `hidden`) VALUES
(4, 'Explicabo Nisi exer', 'New', 'individual', 666, 0, 2, 12, 2017, 76, 46, 11, 2, 4, 'Automatic', 'All', 'BLACK', 'La BMW Série 3 de l\'année 2020 offre une combinaison parfaite de performances dynamiques, de luxe et d\'efficacité. Propulsée par un moteur diesel économe en carburant, cette berline sportive offre une puissance remarquable tout en offrant une économie de carburant impressionnante. Son moteur diesel réactif et son couple généreux garantissent une expérience de conduite agréable, que ce soit sur autoroute ou en ville. Avec son design élégant, son intérieur raffiné et ses technologies de pointe, la BMW Série 3 2020 redéfinit les normes de la conduite de luxe. Que ce soit pour des trajets quotidiens ou des escapades sur de longues distances, cette BMW allie parfaitement performance, confort et efficacité pour répondre aux besoins des conducteurs les plus exigeants.', 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 11, 21, 'Officiis repudiandae', 'Non veniam iusto ni', NULL, '3', 0, '2024-04-24 12:49:13', '2024-04-25 17:06:54', 2, 0, 0),
(6, 'Nobis repudiandae il', 'New', 'individual', 416, 1, 7, 4, 2014, 64, 72, 14, 4, 4, 'Manual', 'Rear', 'Quasi et dolores dis', 'Eligendi quaerat tem', 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 26, 39, 'Molestias fugiat mod', 'In deserunt porro pr', NULL, '0', 0, '2024-04-24 12:50:59', '2024-04-24 12:50:59', 2, 0, 0),
(10, 'Laudantium assumend', 'Used', 'individual', 447, 1, 1, 2, 2017, 53, 76, 9, 3, 2, 'Manual', 'All', 'Quia anim voluptas e', 'Quisquam tempor enim', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 7, 18, 'Ipsa quis et facili', 'Sed itaque laborum s', NULL, '0', 0, '2024-04-24 12:58:30', '2024-04-24 12:58:30', 2, 0, 0),
(11, 'Nisi numquam officia', 'Used', 'individual', 214, 1, 1, 5, 2016, 2, 26, 4, 1, 3, 'Manual', 'All', 'Quis expedita esse a', 'Corrupti itaque qui', 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 25, 22, 'Ad itaque doloribus', 'Ex recusandae Labor', NULL, '0', 0, '2024-04-24 12:58:49', '2024-04-24 12:58:49', 2, 0, 0),
(21, 'Omnis libero et pari', 'Used', 'individual', 9, 0, 3, 10, 2020, 11, 86, 14, 1, 4, 'Manual', 'All', 'Autem animi maxime', 'Natus aliqua In et', 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 53, 50, 'Accusamus ab dolorem', 'Voluptate necessitat', NULL, '0', 0, '2024-04-24 13:42:46', '2024-04-24 13:42:46', 2, 0, 0),
(22, 'Omnis ipsa exercita', 'New', 'individual', 438, 1, 5, 4, 2014, 55, 56, 5, 5, 4, 'Automatic', 'Rear', 'Aut corporis consect', 'Modi doloribus a qui', 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 55, 16, 'Sequi qui commodo fa', 'Pariatur Nam enim u', NULL, '0', 0, '2024-04-24 13:45:08', '2024-04-24 13:45:08', 3, 0, 0),
(24, 'Fugit ratione error', 'New', 'individual', 421, 0, 7, 8, 2020, 31, 44, 3, 2, 2, 'Automatic', 'Rear', 'Quos voluptatem sim', 'Quo cupiditate id r', 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 57, 13, 'Veniam doloremque r', 'Voluptas quisquam co', NULL, '0', 0, '2024-04-24 13:47:16', '2024-04-24 13:47:16', 3, 0, 0),
(25, 'Qui a sed quia autem', 'New', 'individual', 774, 1, 9, 8, 2013, 1, 82, 10, 1, 4, 'Manual', 'Rear', 'Sapiente repudiandae', 'Optio sed ut rerum', 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 19, 32, 'Minus sint sed est', 'Aut pariatur Volupt', NULL, '0', 0, '2024-04-24 13:48:27', '2024-04-24 13:48:27', 3, 0, 0),
(26, 'Magna non cumque nis', 'New', 'individual', 542, 0, 6, 15, 2016, 48, 44, 9, 1, 4, 'Automatic', 'All', 'Qui quo ea alias tot', 'Adipisicing rerum oc', 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 27, 47, 'Amet distinctio El', 'Consequatur Autem n', NULL, '0', 0, '2024-04-24 13:54:32', '2024-04-24 13:54:32', 3, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `car_images`
--

CREATE TABLE `car_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `car_images`
--

INSERT INTO `car_images` (`id`, `car_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(4, 4, 'http://res.cloudinary.com/esps/image/upload/v1713698595/images/bmw-m-series-seo-overview-ms-04.jpg.jpg', '2024-04-24 12:49:13', '2024-04-24 12:49:13'),
(5, 6, 'http://res.cloudinary.com/esps/image/upload/v1713968634/images/images%20%2812%29.jpg.jpg', '2024-04-24 12:50:59', '2024-04-24 12:50:59'),
(6, 10, 'http://res.cloudinary.com/esps/image/upload/v1713966196/images/images%20%283%29.jpg.jpg', '2024-04-24 12:58:30', '2024-04-24 12:58:30'),
(7, 11, 'http://res.cloudinary.com/esps/image/upload/v1713967480/images/images%20%2810%29.jpg.jpg', '2024-04-24 12:58:49', '2024-04-24 12:58:49'),
(8, 21, 'http://res.cloudinary.com/esps/image/upload/v1713973355/images/images%20%2814%29.jpg.jpg', '2024-04-24 13:42:46', '2024-04-24 13:42:46'),
(9, 22, 'http://res.cloudinary.com/esps/image/upload/v1713968033/images/images%20%2811%29.jpg.jpg', '2024-04-24 13:45:08', '2024-04-24 13:45:08'),
(10, 24, 'http://res.cloudinary.com/esps/image/upload/v1713967350/images/images%20%288%29.jpg.jpg', '2024-04-24 13:47:16', '2024-04-24 13:47:16'),
(11, 25, 'http://res.cloudinary.com/esps/image/upload/v1713973703/images/images%20%2815%29.jpg.jpg', '2024-04-24 13:48:27', '2024-04-24 13:48:27'),
(12, 26, 'http://res.cloudinary.com/esps/image/upload/v1713973703/images/images%20%2815%29.jpg.jpg', '2024-04-24 13:54:32', '2024-04-24 13:54:32');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'gg', 'gg@gmail.com', 'hey', '2024-04-23 20:58:01', '2024-04-23 20:58:01'),
(2, 'rabeb belhaj', 'rabebbhj222@gmail.com', 'i can ask you for a car ?', '2024-04-24 13:39:44', '2024-04-24 13:39:44');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Afghanistan', '2024-04-24 09:33:22', '2024-04-24 09:33:22'),
(5, 'Albania', '2024-04-24 09:33:39', '2024-04-24 09:33:39'),
(6, 'Algeria', '2024-04-24 09:34:43', '2024-04-24 09:34:43'),
(7, 'Argentina', '2024-04-24 09:35:07', '2024-04-24 09:35:07'),
(8, 'Australia', '2024-04-24 09:35:55', '2024-04-24 09:35:55'),
(9, 'Bahrain', '2024-04-24 09:36:06', '2024-04-24 09:36:06'),
(10, 'Bangladesh', '2024-04-24 09:36:15', '2024-04-24 09:36:15'),
(11, 'Brazil', '2024-04-24 09:36:26', '2024-04-24 09:36:26'),
(12, 'Burkina Faso', '2024-04-24 09:36:35', '2024-04-24 09:36:35'),
(13, 'Côte d\'Ivoire', '2024-04-24 09:44:07', '2024-04-24 09:44:07'),
(14, 'Cameroon', '2024-04-24 09:44:30', '2024-04-24 09:44:30'),
(15, 'Canada', '2024-04-24 09:44:44', '2024-04-24 09:44:44'),
(16, 'China', '2024-04-24 09:44:54', '2024-04-24 09:44:54'),
(17, 'Denmark', '2024-04-24 09:45:08', '2024-04-24 09:45:08'),
(18, 'Dominica', '2024-04-24 09:45:18', '2024-04-24 09:45:18'),
(19, 'Egypt', '2024-04-24 09:45:27', '2024-04-24 09:45:27'),
(20, 'Eritrea', '2024-04-24 09:45:40', '2024-04-24 09:45:40'),
(21, 'Finland', '2024-04-24 09:45:51', '2024-04-24 09:45:51'),
(22, 'France', '2024-04-24 09:46:01', '2024-04-24 09:46:01'),
(23, 'Gabon', '2024-04-24 09:46:12', '2024-04-24 09:46:12'),
(24, 'Germany', '2024-04-24 09:46:22', '2024-04-24 09:46:22'),
(25, 'Guyana', '2024-04-24 09:46:36', '2024-04-24 09:46:36'),
(26, 'Honduras', '2024-04-24 09:46:47', '2024-04-24 09:46:47'),
(27, 'India', '2024-04-24 09:46:57', '2024-04-24 09:46:57'),
(28, 'Iran', '2024-04-24 09:47:06', '2024-04-24 09:47:06'),
(29, 'Italy', '2024-04-24 09:47:15', '2024-04-24 09:47:15'),
(30, 'Japan', '2024-04-24 09:47:27', '2024-04-24 09:47:27'),
(31, 'Jordan', '2024-04-24 09:47:36', '2024-04-24 09:47:36'),
(32, 'Kuwait', '2024-04-24 09:47:48', '2024-04-24 09:47:48'),
(33, 'Lebanon', '2024-04-24 09:47:58', '2024-04-24 09:47:58'),
(34, 'Libya', '2024-04-24 09:48:18', '2024-04-24 09:48:18'),
(35, 'Luxembourg', '2024-04-24 09:48:28', '2024-04-24 09:48:28'),
(36, 'Maldives', '2024-04-24 09:48:37', '2024-04-24 09:48:37'),
(37, 'Mali', '2024-04-24 09:48:47', '2024-04-24 09:48:47'),
(38, 'Mexico', '2024-04-24 09:48:59', '2024-04-24 09:48:59'),
(39, 'Morocco', '2024-04-24 09:49:08', '2024-04-24 09:49:08'),
(40, 'Namibia', '2024-04-24 09:49:18', '2024-04-24 09:49:18'),
(41, 'Nigeria', '2024-04-24 09:49:29', '2024-04-24 09:49:29'),
(42, 'Oman', '2024-04-24 09:49:37', '2024-04-24 09:49:37'),
(43, 'Philippines', '2024-04-24 09:49:51', '2024-04-24 09:49:51'),
(44, 'Romania', '2024-04-24 09:50:03', '2024-04-24 09:50:03'),
(45, 'Saudi Arabia', '2024-04-24 09:50:11', '2024-04-24 09:50:11'),
(46, 'Serbia', '2024-04-24 09:50:30', '2024-04-24 09:50:30'),
(47, 'Spain', '2024-04-24 09:50:56', '2024-04-24 09:50:56'),
(48, 'Syria', '2024-04-24 09:51:07', '2024-04-24 09:51:07'),
(49, 'Tanzania', '2024-04-24 09:51:17', '2024-04-24 09:51:17'),
(50, 'Tunisia', '2024-04-24 09:51:27', '2024-04-24 09:51:27'),
(51, 'Turkey', '2024-04-24 09:51:36', '2024-04-24 09:51:36'),
(52, 'United Kingdom', '2024-04-24 09:51:47', '2024-04-24 09:51:47'),
(53, 'United States of America', '2024-04-24 09:51:55', '2024-04-24 09:51:55'),
(54, 'Venezuela', '2024-04-24 09:52:09', '2024-04-24 09:52:09'),
(55, 'Vietnam', '2024-04-24 09:52:17', '2024-04-24 09:52:17'),
(56, 'Zambia', '2024-04-24 09:52:26', '2024-04-24 09:52:26'),
(57, 'Zimbabwe', '2024-04-24 09:52:35', '2024-04-24 09:52:35');

-- --------------------------------------------------------

--
-- Structure de la table `engines`
--

CREATE TABLE `engines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `engine_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `engines`
--

INSERT INTO `engines` (`id`, `engine_type`, `created_at`, `updated_at`) VALUES
(1, 'Gasoline Engine', NULL, '2024-04-24 11:39:21'),
(2, 'Hybrid Engine', '2024-04-24 11:34:27', '2024-04-24 11:39:32'),
(3, 'Diesel Engine', '2024-04-24 11:34:43', '2024-04-24 11:39:55'),
(4, 'quatre cylindres turbocompressés', '2024-04-24 11:35:12', '2024-04-24 11:35:12');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `fueltypes`
--

CREATE TABLE `fueltypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fueltype` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fueltypes`
--

INSERT INTO `fueltypes` (`id`, `fueltype`, `created_at`, `updated_at`) VALUES
(1, 'diesel', NULL, NULL),
(2, 'Gasoline', '2024-04-24 11:26:37', '2024-04-24 11:26:37'),
(3, 'Bio-diesel', '2024-04-24 11:26:52', '2024-04-24 11:26:52'),
(4, 'Électricité', '2024-04-24 11:36:14', '2024-04-24 11:36:14'),
(5, 'Hydrogène', '2024-04-24 11:36:28', '2024-04-24 11:36:28');

-- --------------------------------------------------------

--
-- Structure de la table `marques`
--

CREATE TABLE `marques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `marque_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marques`
--

INSERT INTO `marques` (`id`, `name`, `slug`, `marque_image`, `created_at`, `updated_at`) VALUES
(1, 'Audi', 'Audi', 'http://res.cloudinary.com/esps/image/upload/v1713961663/images/images%20%285%29.png.png', NULL, '2024-04-24 10:27:45'),
(2, 'BMW', 'bmw', 'http://res.cloudinary.com/esps/image/upload/v1713961167/images/images.png.png', '2024-04-23 21:07:22', '2024-04-24 10:19:29'),
(3, 'Peugeot', 'peugeot', 'http://res.cloudinary.com/esps/image/upload/v1713961378/images/images%20%281%29.png.png', '2024-04-24 10:23:00', '2024-04-24 10:23:00'),
(4, 'Renault', 'renault', 'http://res.cloudinary.com/esps/image/upload/v1713961446/images/Renault_logo_1992.png.png', '2024-04-24 10:24:08', '2024-04-24 10:24:08'),
(5, 'Citroën', 'citroën', 'http://res.cloudinary.com/esps/image/upload/v1713961496/images/images%20%282%29.png.png', '2024-04-24 10:25:01', '2024-04-24 10:25:01'),
(6, 'Mercedes', 'mercedes', 'http://res.cloudinary.com/esps/image/upload/v1713961563/images/images%20%283%29.png.png', '2024-04-24 10:26:05', '2024-04-24 10:26:05'),
(7, 'Toyota', 'toyota', 'http://res.cloudinary.com/esps/image/upload/v1713961619/images/images%20%284%29.png.png', '2024-04-24 10:27:01', '2024-04-24 10:27:01'),
(8, 'Dacia', 'dacia', 'http://res.cloudinary.com/esps/image/upload/v1713961938/images/Dacia_2021.svg.png.png', '2024-04-24 10:32:19', '2024-04-24 10:32:19'),
(9, 'BYD', 'byd', 'http://res.cloudinary.com/esps/image/upload/v1713961958/images/png-transparent-byd-auto-car-electric-vehicle-byd-company-logo-broucher-company-text-trademark.png.png', '2024-04-24 10:32:39', '2024-04-24 10:32:39'),
(10, 'Ferrari', 'ferrari', 'http://res.cloudinary.com/esps/image/upload/v1713961974/images/png-transparent-ferrari-logo-laferrari-car-museo-ferrari-enzo-ferrari-ferrari-emblem-logo-sign-thumbnail.png.png', '2024-04-24 10:32:58', '2024-04-24 10:32:58'),
(11, 'Fiat', 'fiat', 'http://res.cloudinary.com/esps/image/upload/v1713962049/images/png-clipart-fiat-automobiles-fiat-500-chrysler-car-fiat-emblem-logo.png.png', '2024-04-24 10:34:11', '2024-04-24 10:34:11');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_23_224033_create_marque_table', 1),
(6, '2024_01_23_224112_create_model_table', 1),
(7, '2024_01_23_224132_create_body_type_table', 1),
(8, '2024_01_23_224228_create_fuel_type_table', 1),
(9, '2024_01_23_224300_create_country_table', 1),
(10, '2024_01_23_224338_create_state_table', 1),
(11, '2024_01_23_224517_create_engine_table', 1),
(12, '2024_01_23_224543_create_car_table', 1),
(13, '2024_01_27_215850_create_contact_table', 1),
(14, '2024_04_23_140537_adding_is_admin_to_user', 1),
(15, '2024_04_23_141542_remove_column_from_model_table', 1),
(16, '2024_04_23_141629_adding_car_images_table', 1),
(17, '2024_04_23_162350_adding_forgein_key_to_cars', 1),
(18, '2024_04_23_175517_adding_phone_to_users_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `models`
--

CREATE TABLE `models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_name` varchar(255) NOT NULL,
  `model_slug` varchar(255) NOT NULL,
  `marque_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `models`
--

INSERT INTO `models` (`id`, `model_name`, `model_slug`, `marque_id`, `created_at`, `updated_at`) VALUES
(1, 'Audi E-tron S', 'A4', 1, NULL, '2024-04-24 10:36:24'),
(2, 'AUDI Q4', '55', 1, '2024-04-23 21:09:53', '2024-04-24 10:41:55'),
(3, 'AUDI R8 SPYDER', 'AUDI R8 SPYDER', 1, '2024-04-24 10:37:55', '2024-04-24 10:37:55'),
(4, 'AUDI R8 GT', 'AUDI R8 GT', 1, '2024-04-24 10:38:48', '2024-04-24 10:38:48'),
(5, 'AUDI R8 GT', 'AUDI R8 GT', 1, '2024-04-24 10:38:56', '2024-04-24 10:38:56'),
(6, 'AUDI Q5', 'Audi Q5', 1, '2024-04-24 10:39:45', '2024-04-24 10:41:18'),
(7, 'AUDI A8', 'Audi A8', 1, '2024-04-24 10:40:16', '2024-04-24 10:41:42'),
(8, 'AUDI A1', 'Audi A1', 1, '2024-04-24 10:40:44', '2024-04-24 10:42:11'),
(9, 'AUDI A3', 'AUDI A3', 1, '2024-04-24 10:41:05', '2024-04-24 10:41:05'),
(10, 'BMW iX', 'BMW iX', 2, '2024-04-24 11:12:39', '2024-04-24 11:12:39'),
(11, 'BMW X1', 'BMW X1', 2, '2024-04-24 11:13:00', '2024-04-24 11:13:00'),
(12, 'BMW X2', 'BMW X2', 2, '2024-04-24 11:13:20', '2024-04-24 11:13:20'),
(13, 'BMW X6', 'BMW X6', 2, '2024-04-24 11:13:54', '2024-04-24 11:13:54'),
(14, 'BMW Série 5 Berline Hybride Rechargeable', 'BMW Série 5 Berline Hybride Rechargeable', 2, '2024-04-24 11:14:14', '2024-04-24 11:14:14'),
(15, 'BMW i5 Touring', 'BMW i5 Touring', 2, '2024-04-24 11:14:44', '2024-04-24 11:14:44'),
(16, 'BMW Série 4 Coupé', 'BMW Série 4 Coupé', 2, '2024-04-24 11:25:00', '2024-04-24 11:25:00'),
(17, 'PEUGEOT RIFTER', 'PEUGEOT RIFTER', 3, '2024-04-24 11:25:48', '2024-04-24 11:25:48');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
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

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(19, 'App\\Models\\User', 2, 'token-name', 'bf190c64901b3f5b4c37eca9a2e7acbfc49be8c8fdaf717b2205b540aaa36aa3', '[\"*\"]', '2024-04-25 16:17:03', NULL, '2024-04-24 13:58:30', '2024-04-25 16:17:03'),
(20, 'App\\Models\\User', 1, 'token-name', 'a24fd946624d4f5f49f90bc296c8caab00d93cf22d069d7e9a53ea72bf882169', '[\"*\"]', '2024-04-25 17:06:06', NULL, '2024-04-25 16:17:53', '2024-04-25 17:06:06');

-- --------------------------------------------------------

--
-- Structure de la table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(2, 'Tunis', 50, '2024-04-24 09:53:29', '2024-04-24 09:53:29'),
(3, 'sfax', 50, '2024-04-24 09:53:39', '2024-04-24 09:53:39'),
(4, 'sousse', 50, '2024-04-24 09:53:57', '2024-04-24 09:53:57'),
(5, 'gabes', 50, '2024-04-24 09:54:10', '2024-04-24 09:54:10'),
(6, 'bizerte', 50, '2024-04-24 09:54:21', '2024-04-24 09:54:21'),
(7, 'Nabeul', 50, '2024-04-24 09:54:45', '2024-04-24 09:54:45'),
(8, 'Jendouba', 50, '2024-04-24 09:55:03', '2024-04-24 09:55:03'),
(9, 'Kasserine', 50, '2024-04-24 09:55:25', '2024-04-24 09:55:25'),
(10, 'Sidi Bouzid', 50, '2024-04-24 09:55:39', '2024-04-24 09:55:39'),
(11, 'Tozeur', 50, '2024-04-24 09:56:05', '2024-04-24 09:56:05'),
(12, 'Ttataouine', 50, '2024-04-24 09:56:21', '2024-04-24 09:56:21'),
(13, 'Monastir', 50, '2024-04-24 09:56:39', '2024-04-24 09:56:39'),
(14, 'Ghazni', 4, '2024-04-24 09:57:36', '2024-04-24 09:57:36'),
(15, 'Helmand', 4, '2024-04-24 09:57:54', '2024-04-24 09:57:54'),
(16, 'Baghlan', 4, '2024-04-24 09:58:16', '2024-04-24 09:58:16'),
(17, 'Kukës', 5, '2024-04-24 09:58:42', '2024-04-24 09:58:42'),
(18, 'Lezhë', 5, '2024-04-24 09:58:54', '2024-04-24 09:58:54'),
(19, 'Tirana', 5, '2024-04-24 09:59:07', '2024-04-24 09:59:07'),
(20, 'Adrar', 6, '2024-04-24 10:00:04', '2024-04-24 10:00:04'),
(21, 'Oum El Bouaghi', 6, '2024-04-24 10:00:23', '2024-04-24 10:00:23'),
(22, 'Batna', 6, '2024-04-24 10:00:40', '2024-04-24 10:00:40'),
(23, 'Biskra', 6, '2024-04-24 10:01:10', '2024-04-24 10:01:10'),
(24, 'Blida', 6, '2024-04-24 10:01:22', '2024-04-24 10:01:22'),
(25, 'Buenos Aires', 7, '2024-04-24 10:02:29', '2024-04-24 10:02:29'),
(26, 'Catamarca', 7, '2024-04-24 10:02:45', '2024-04-24 10:02:45'),
(27, 'Chaco', 7, '2024-04-24 10:02:57', '2024-04-24 10:02:57'),
(28, 'Entre Ríos', 7, '2024-04-24 10:03:11', '2024-04-24 10:03:11'),
(29, 'Río Negro', 7, '2024-04-24 10:03:30', '2024-04-24 10:03:30'),
(30, 'Santiago del Estero', 7, '2024-04-24 10:03:45', '2024-04-24 10:03:45'),
(31, 'Victoria', 8, '2024-04-24 10:04:20', '2024-04-24 10:04:20'),
(32, 'Western Australia', 8, '2024-04-24 10:04:34', '2024-04-24 10:04:34'),
(33, 'Tasmania', 8, '2024-04-24 10:04:45', '2024-04-24 10:04:45'),
(34, 'Queensland', 8, '2024-04-24 10:05:05', '2024-04-24 10:05:05'),
(35, 'Bahia', 11, '2024-04-24 10:07:10', '2024-04-24 10:07:10'),
(36, 'Mato Grosso', 11, '2024-04-24 10:07:35', '2024-04-24 10:07:35'),
(37, 'Pará', 11, '2024-04-24 10:07:50', '2024-04-24 10:07:50'),
(38, 'Rio de Janeiro', 11, '2024-04-24 10:08:09', '2024-04-24 10:08:09'),
(39, 'Santa Catarina', 11, '2024-04-24 10:08:22', '2024-04-24 10:08:22'),
(40, 'Tocantins', 11, '2024-04-24 10:08:34', '2024-04-24 10:08:34'),
(41, 'Toronto', 15, '2024-04-24 10:09:01', '2024-04-24 10:09:38'),
(42, 'Quebec', 15, '2024-04-24 10:09:51', '2024-04-24 10:09:51'),
(43, 'Charlottetown', 15, '2024-04-24 10:10:10', '2024-04-24 10:10:10'),
(44, 'Montreal', 15, '2024-04-24 10:10:31', '2024-04-24 10:10:31'),
(45, 'Winnipeg', 15, '2024-04-24 10:10:43', '2024-04-24 10:10:43'),
(46, 'Hebei', 16, '2024-04-24 10:12:21', '2024-04-24 10:12:21'),
(47, 'Shanxi', 16, '2024-04-24 10:12:36', '2024-04-24 10:12:36'),
(48, 'Zhejiang', 16, '2024-04-24 10:12:48', '2024-04-24 10:12:48'),
(49, 'Jiangxi', 16, '2024-04-24 10:13:02', '2024-04-24 10:13:02'),
(50, 'Hubei', 16, '2024-04-24 10:13:14', '2024-04-24 10:13:14');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` varchar(255) DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `phone`) VALUES
(1, 'rabeb', 'rabeb@gmail.com', NULL, '$2y$12$Qb.9VwLv/MW58sAQH04Vsu3znIEAMdIyybaTl571zBd6nfo.u2Q/O', NULL, '2024-04-23 20:41:41', '2024-04-23 20:41:41', '1', NULL),
(2, 'user', 'user@gmail.com', NULL, '$2y$12$HT0vnIMlMJTNgmH4I58Ti.LZ2nlYr9TDW8T5UiPcxQZx9kUwIQe0O', NULL, '2024-04-23 20:54:50', '2024-04-23 20:54:50', '0', NULL),
(3, 'me', 'me@gmail.com', NULL, '$2y$12$4JO6JDJ3njqISMQECVe0WOvwXuH4q2gfyPxAwXezgigt4PakuvAnG', NULL, '2024-04-24 13:44:06', '2024-04-24 13:44:06', '0', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bodytypes`
--
ALTER TABLE `bodytypes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_marque_id_foreign` (`marque_id`),
  ADD KEY `cars_model_id_foreign` (`model_id`),
  ADD KEY `cars_bodytype_id_foreign` (`bodytype_id`),
  ADD KEY `cars_fueltype_id_foreign` (`fueltype_id`),
  ADD KEY `cars_engine_id_foreign` (`engine_id`),
  ADD KEY `cars_country_id_foreign` (`country_id`),
  ADD KEY `cars_state_id_foreign` (`state_id`),
  ADD KEY `cars_user_id_foreign` (`user_id`);

--
-- Index pour la table `car_images`
--
ALTER TABLE `car_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_images_car_id_foreign` (`car_id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `engines`
--
ALTER TABLE `engines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fueltypes`
--
ALTER TABLE `fueltypes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marques_name_unique` (`name`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `models_marque_id_foreign` (`marque_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bodytypes`
--
ALTER TABLE `bodytypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `car_images`
--
ALTER TABLE `car_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `engines`
--
ALTER TABLE `engines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fueltypes`
--
ALTER TABLE `fueltypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `marques`
--
ALTER TABLE `marques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_bodytype_id_foreign` FOREIGN KEY (`bodytype_id`) REFERENCES `bodytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_engine_id_foreign` FOREIGN KEY (`engine_id`) REFERENCES `engines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_fueltype_id_foreign` FOREIGN KEY (`fueltype_id`) REFERENCES `fueltypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_marque_id_foreign` FOREIGN KEY (`marque_id`) REFERENCES `marques` (`id`),
  ADD CONSTRAINT `cars_model_id_foreign` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `cars_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `car_images`
--
ALTER TABLE `car_images`
  ADD CONSTRAINT `car_images_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_marque_id_foreign` FOREIGN KEY (`marque_id`) REFERENCES `marques` (`id`);

--
-- Contraintes pour la table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
