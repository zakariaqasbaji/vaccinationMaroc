-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 18 fév. 2021 à 17:31
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `vaccination`
--

-- --------------------------------------------------------

--
-- Structure de la table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('9e82f320d5d8ffde1369566df337f3d5afac92a4', '2021-02-18 12:49:08.804996', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add personne', 7, 'add_personne'),
(26, 'Can change personne', 7, 'change_personne'),
(27, 'Can delete personne', 7, 'delete_personne'),
(28, 'Can view personne', 7, 'view_personne'),
(29, 'Can add centre vaccination', 8, 'add_centrevaccination'),
(30, 'Can change centre vaccination', 8, 'change_centrevaccination'),
(31, 'Can delete centre vaccination', 8, 'delete_centrevaccination'),
(32, 'Can view centre vaccination', 8, 'view_centrevaccination'),
(33, 'Can add Token', 9, 'add_token'),
(34, 'Can change Token', 9, 'change_token'),
(35, 'Can delete Token', 9, 'delete_token'),
(36, 'Can view Token', 9, 'view_token'),
(37, 'Can add token', 10, 'add_tokenproxy'),
(38, 'Can change token', 10, 'change_tokenproxy'),
(39, 'Can delete token', 10, 'delete_tokenproxy'),
(40, 'Can view token', 10, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$dBaYYMMftjgx$ilh9dg2a9X1zv4ob0PRzrjECwg2RGdjuAJ7i+wBBQG4=', '2021-02-18 12:02:18.261425', 1, 'zakaria', '', '', '', 1, 1, '2021-02-18 12:01:56.725304');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-18 12:03:01.800445', '1', 'CentreVaccination object (1)', 1, '[{\"added\": {}}]', 8, 1),
(2, '2021-02-18 12:03:18.606047', '2', 'CentreVaccination object (2)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2021-02-18 12:03:44.030010', '3', 'CentreVaccination object (3)', 1, '[{\"added\": {}}]', 8, 1),
(4, '2021-02-18 12:04:25.518412', '1', 'Personne object (1)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2021-02-18 12:05:17.210443', '2', 'Personne object (2)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2021-02-18 12:06:20.793092', '3', 'Personne object (3)', 1, '[{\"added\": {}}]', 7, 1),
(7, '2021-02-18 12:06:59.431317', '4', 'Personne object (4)', 1, '[{\"added\": {}}]', 7, 1),
(8, '2021-02-18 12:07:57.292565', '5', 'Personne object (5)', 1, '[{\"added\": {}}]', 7, 1),
(9, '2021-02-18 12:08:41.917588', '6', 'Personne object (6)', 1, '[{\"added\": {}}]', 7, 1),
(10, '2021-02-18 12:08:59.698808', '6', 'Personne object (6)', 2, '[{\"changed\": {\"fields\": [\"Date deuxieme dose\", \"Centre vaccination\"]}}]', 7, 1),
(11, '2021-02-18 12:09:45.898434', '7', 'Personne object (7)', 1, '[{\"added\": {}}]', 7, 1),
(12, '2021-02-18 12:10:43.141364', '8', 'Personne object (8)', 1, '[{\"added\": {}}]', 7, 1),
(13, '2021-02-18 12:11:52.571471', '9', 'Personne object (9)', 1, '[{\"added\": {}}]', 7, 1),
(14, '2021-02-18 12:12:38.961093', '10', 'Personne object (10)', 1, '[{\"added\": {}}]', 7, 1),
(15, '2021-02-18 12:13:31.245075', '11', 'Personne object (11)', 1, '[{\"added\": {}}]', 7, 1),
(16, '2021-02-18 12:14:20.453067', '12', 'Personne object (12)', 1, '[{\"added\": {}}]', 7, 1),
(17, '2021-02-18 12:15:06.861065', '2', 'Personne object (2)', 2, '[{\"changed\": {\"fields\": [\"Doses\"]}}]', 7, 1),
(18, '2021-02-18 12:49:08.806998', '1', '9e82f320d5d8ffde1369566df337f3d5afac92a4', 1, '[{\"added\": {}}]', 10, 1),
(19, '2021-02-18 13:24:59.562883', '13', 'Personne object (13)', 1, '[{\"added\": {}}]', 7, 1),
(20, '2021-02-18 13:34:24.545272', '14', 'Personne object (14)', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(9, 'authtoken', 'token'),
(10, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'vaccination', 'centrevaccination'),
(7, 'vaccination', 'personne');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-18 12:00:45.033606'),
(2, 'auth', '0001_initial', '2021-02-18 12:00:48.514802'),
(3, 'admin', '0001_initial', '2021-02-18 12:01:00.214651'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-18 12:01:03.912767'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-18 12:01:03.975766'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-18 12:01:05.479242'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-18 12:01:05.655269'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-18 12:01:05.823356'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-18 12:01:05.885461'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-18 12:01:06.650426'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-18 12:01:06.698602'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-18 12:01:06.761600'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-18 12:01:07.168816'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-18 12:01:07.344242'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-18 12:01:07.711315'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-18 12:01:07.773339'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-18 12:01:07.967819'),
(18, 'authtoken', '0001_initial', '2021-02-18 12:01:08.458756'),
(19, 'authtoken', '0002_auto_20160226_1747', '2021-02-18 12:01:10.506920'),
(20, 'authtoken', '0003_tokenproxy', '2021-02-18 12:01:10.543954'),
(21, 'sessions', '0001_initial', '2021-02-18 12:01:11.038370'),
(22, 'vaccination', '0001_initial', '2021-02-18 12:01:11.830446'),
(23, 'vaccination', '0002_auto_20210212_1436', '2021-02-18 12:01:13.674348'),
(24, 'vaccination', '0003_auto_20210212_1517', '2021-02-18 12:01:13.725026'),
(25, 'vaccination', '0004_auto_20210213_0028', '2021-02-18 12:01:17.667671'),
(26, 'vaccination', '0005_auto_20210217_1637', '2021-02-18 12:01:24.587682'),
(27, 'vaccination', '0006_auto_20210217_1808', '2021-02-18 12:01:26.434289'),
(28, 'vaccination', '0007_auto_20210217_1810', '2021-02-18 12:01:26.587213'),
(29, 'vaccination', '0008_auto_20210218_0032', '2021-02-18 12:01:28.089618'),
(30, 'vaccination', '0009_auto_20210218_0206', '2021-02-18 12:01:28.138642'),
(31, 'vaccination', '0010_auto_20210218_1133', '2021-02-18 12:01:30.078495');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('758zl3n7sygh8y3mftdsw52h927ki01g', '.eJxVjDkOwjAQRe_iGllexkso6TmDNeMFB5AtxUmFuDtESgHtf-_9Fwu4rTVsIy9hTuzMJDv9boTxkdsO0h3brfPY27rMxHeFH3Twa0_5eTncv4OKo35rJ0QRJmmrIhZJmoRGOxnlnUvkPIAp0gmQkBGjAp8oFqNAeTBWmimz9wfHxjcI:1lCi0g:FZ8MzWfk_-6gkPnbHiThyhij4RbMCVWTMSIwVkzqx-I', '2021-03-04 12:02:18.340039');

-- --------------------------------------------------------

--
-- Structure de la table `vaccination_centrevaccination`
--

DROP TABLE IF EXISTS `vaccination_centrevaccination`;
CREATE TABLE IF NOT EXISTS `vaccination_centrevaccination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(50) NOT NULL,
  `adresse` varchar(300) NOT NULL,
  `nombre_emp` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaccination_centrevaccination`
--

INSERT INTO `vaccination_centrevaccination` (`id`, `intitule`, `adresse`, `nombre_emp`) VALUES
(1, 'centre albaraka', 'hay hassani boulevard ibn sina N 45', 29),
(2, 'centre ghandi', '155 Boulevard Ghandi, Casablanca', 40),
(3, 'ensam casablanca', '150 Boulevard du Nil, Casablanca 20670', 33);

-- --------------------------------------------------------

--
-- Structure de la table `vaccination_personne`
--

DROP TABLE IF EXISTS `vaccination_personne`;
CREATE TABLE IF NOT EXISTS `vaccination_personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `cin` varchar(20) NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `doses` int(10) UNSIGNED NOT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `centre_vaccination_id` int(11) DEFAULT NULL,
  `date_deuxieme_dose` date DEFAULT NULL,
  `date_premiere_dose` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vaccination_personne_cin_7b674475_uniq` (`cin`),
  KEY `vaccination_personne_centre_vaccination_i_b3611234_fk_vaccinati` (`centre_vaccination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vaccination_personne`
--

INSERT INTO `vaccination_personne` (`id`, `nom`, `prenom`, `cin`, `age`, `doses`, `qr_code`, `centre_vaccination_id`, `date_deuxieme_dose`, `date_premiere_dose`, `gender`) VALUES
(1, 'qasbaji', 'zakaria', 'XXXXXXXXX', 21, 1, '', 1, NULL, '2021-02-05', 'homme'),
(2, 'soulami', 'fatma', 'yyyyyyy', 80, 2, 'qrcodes/qr_code-yyyyyyy_pwzXECt.png', 2, '2021-02-18', '2021-02-10', 'femme'),
(3, 'bahmid', 'jilali', 'fffffff', 67, 2, 'qrcodes/qr_code-fffffff_eQOkvIu.png', 1, '2021-02-18', '2021-02-02', 'homme'),
(4, 'sbai', 'khadija', 'ggggggg', 78, 1, '', 1, NULL, '2021-02-18', 'femme'),
(5, 'zraai', 'driss', 'jjjjjjjj', 66, 2, 'qrcodes/qr_code-jjjjjjjj_MVBKmXP.png', 1, '2021-02-18', '2021-02-01', 'homme'),
(6, 'qadij', 'saadia', 'sssssss', 91, 2, 'qrcodes/qr_code-sssssss_IypHc5I.png', 2, '2021-02-18', '2021-02-01', 'femme'),
(7, 'simour', 'abdelhaq', 'dddddd', 67, 1, '', 2, NULL, '2021-02-18', 'homme'),
(8, 'fouali', 'ali', 'ajajaja', 65, 1, '', 2, NULL, '2021-02-18', 'femme'),
(9, 'sadiq', 'mohamed', 'mmmmmm', 92, 2, 'qrcodes/qr_code-mmmmmm_7ifD38n.png', 3, '2021-02-18', '2021-02-01', 'homme'),
(10, 'dlimi', 'maati', 'wwwww', 74, 1, '', 3, NULL, '2021-02-18', 'homme'),
(11, 'mikder', 'said', 'xwxwxwxw', 84, 1, '', 3, NULL, '2021-02-18', 'homme'),
(12, 'dabir', 'aicha', 'jtjtjtjt', 88, 1, '', 3, NULL, '2021-02-18', 'femme'),
(13, 'jaafari', 'amina', 'nbvcxwqs', 67, 2, 'qrcodes/qr_code-nbvcxwqs_kVqCxGS.png', 3, '2021-02-18', '2021-02-01', 'femme'),
(14, 'souadi', 'karima', 'lililili', 88, 2, 'qrcodes/qr_code-lililili_mapwiVi.png', 1, '2021-02-18', '2021-02-01', 'femme'),
(15, 'soulamia', 'fatoma', 'yyyyyyb', 80, 2, 'qrcodes/qr_code-yyyyyyb.png', 2, '2021-02-18', '2021-02-10', 'femme');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `vaccination_personne`
--
ALTER TABLE `vaccination_personne`
  ADD CONSTRAINT `vaccination_personne_centre_vaccination_i_b3611234_fk_vaccinati` FOREIGN KEY (`centre_vaccination_id`) REFERENCES `vaccination_centrevaccination` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
