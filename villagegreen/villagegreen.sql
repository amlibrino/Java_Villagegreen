SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `villagegreen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `villagegreen`;

-- Structure de la table `categories`
  
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_parent` int(11) DEFAULT NULL,
  `cat_nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`cat_id`, `cat_parent`, `cat_nom`) VALUES
(1, NULL, 'Guitares/Basses'),
(2, NULL, 'Batteries'),
(3, 1, 'Guitares Electrique'),
(4, 1, 'Guitares Classiques'),
(5, 1, 'Guitares Acoustiques & Electro-Acoustiques'),
(6, 1, 'Basses Electriques'),
(7, 1, 'Basses Acoustiques'),
(8, 1, 'Basses Semi-acoustiques'),
(9, 1, 'Ukulélés'),
(10, 1, 'Autres instruments à cordes pincées'),
(11, 2, 'Batteries Electriques'),
(12, 2, 'Batteries Acoustique'),
(13, 2, 'Accessoires Batteries'),
(14, NULL, 'Claviers'),
(15, NULL, 'Studio'),
(16, NULL, 'Sono'),
(17, NULL, 'Eclairage'),
(18, NULL, 'DJ'),
(19, NULL, 'Cases'),
(20, NULL, 'Accessoires'),
(21, 14, 'Pianos Numériques'),
(22, 14, 'Synthès Numériques'),
(23, 14, 'Claviers Maitres'),
(24, 14, 'Accordéons'),
(25, 15, 'Interfaces Audio'),
(26, 15, 'Interfaces Audio'),
(27, 15, ' Microphones'),
(28, 15, 'Casques et gestion'),
(29, 16, 'Amplis de Puissance'),
(30, 16, 'Effets voix'),
(31, 16, 'Sonorisation Portable'),
(32, 16, 'Packs Enceintes'),
(33, 17, 'Lumières de Soirées'),
(34, 17, 'Lumières Noires'),
(35, 17, 'Lasers'),
(36, 17, 'Stroboscopes'),
(37, 18, 'Mixers Numériques'),
(39, 18, 'Platines CD'),
(41, 18, 'Groove Stations et Samplers'),
(42, 18, 'Platines Vinyles'),
(43, 19, 'Sac et Flight Case pour Lumières'),
(44, 19, 'Elements Rackables'),
(45, 20, 'Accessoires Claviers'),
(46, 20, 'Accessoires Guitares'),
(47, 20, 'Accessoires DJ et Sono'),
(48, 20, 'Accessoires Génériques');

-- Structure de la table `client`

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `cl_id` int(11) NOT NULL,
  `c_com_id` int(11) NOT NULL,
  `c_addr_liv` varchar(255) DEFAULT NULL,
  `c_cp_liv` varchar(10) DEFAULT NULL,
  `c_ville_liv` varchar(45) DEFAULT NULL,
  `c_pays_liv` smallint(5) UNSIGNED DEFAULT NULL,
  `c_type` tinyint(4) NOT NULL DEFAULT 0,
  `c_tel_fixe` varchar(20) DEFAULT NULL,
  `c_tel_mobile` varchar(20) DEFAULT NULL,
  `c_remise` int(11) DEFAULT 0,
  `c_pro` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `client` (`cl_id`, `c_com_id`, `c_addr_liv`, `c_cp_liv`, `c_ville_liv`, `c_pays_liv`, `c_type`, `c_tel_fixe`, `c_tel_mobile`, `c_remise`, `c_pro`) VALUES
(1, 1, NULL, NULL, NULL, NULL, 0, '0659883304', '0659883304', NULL, 0),
(2, 1, NULL, NULL, NULL, NULL, 0, '0659883304', '0659883304', NULL, 0),
(3, 1, NULL, NULL, NULL, NULL, 0, '1515654', '0514541', NULL, 0);

DROP TABLE IF EXISTS `detailcomm`;
CREATE TABLE `detailcomm` (
  `com_id` int(11) NOT NULL,
  `pan_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Structure de la table `fournisseur`

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE `fournisseur` (
  `f_id` int(11) NOT NULL,
  `f_nom` varchar(255) NOT NULL,
  `f_addr` varchar(255) NOT NULL,
  `f_cp` varchar(10) NOT NULL,
  `f_ville` varchar(45) NOT NULL,
  `f_pays` smallint(5) UNSIGNED NOT NULL,
  `f_mail` varchar(45) NOT NULL,
  `f_tel` varchar(20) NOT NULL,
  `f_mobile` varchar(20) NOT NULL,
  `f_contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fournisseur` (`f_id`, `f_nom`, `f_addr`, `f_cp`, `f_ville`, `f_pays`, `f_mail`, `f_tel`, `f_mobile`, `f_contact`) VALUES
(1, 'cdiscount', 'alger', '75001', 'alger', 4, 'c@mail.fr', '0659868686', '0968686868', 'bnjr'),
(2, 'amazon', 'usa', '80000', 'amiens', 152, 'a@mail.fr', '09868668686', '0986868686', 'bnjr'),
(3, 'wish', 'chine', '75001', 'Pekin', 210, 'w@mail.fr', '095686865461432', '065421654632132', 'merci '),
(4, 'wish', 'chine', '75001', 'Pekin', 210, 'w@mail.fr', '095686865461432', '065421654632132', 'merci ');

-- Structure de la table `newsletter`

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter` (
  `nl_mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `newsletter` (`nl_mail`) VALUES
('js1998@hotmail.fr');

-- Structure de la table `panier`

DROP TABLE IF EXISTS `panier`;
CREATE TABLE `panier` (
  `pan_id` int(11) NOT NULL,
  `cl_id` int(11) NOT NULL,
  `regtime` datetime NOT NULL,
  `valide` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Structure de la table `pays`

DROP TABLE IF EXISTS `pays`;
CREATE TABLE `pays` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `code` int(3) NOT NULL,
  `alpha2` varchar(2) NOT NULL,
  `alpha3` varchar(3) NOT NULL,
  `nom_en_gb` varchar(45) NOT NULL,
  `nom_fr_fr` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pays` (`id`, `code`, `alpha2`, `alpha3`, `nom_en_gb`, `nom_fr_fr`) VALUES
(1, 4, 'AF', 'AFG', 'Afghanistan', 'Afghanistan'),
(2, 8, 'AL', 'ALB', 'Albania', 'Albanie'),
(3, 10, 'AQ', 'ATA', 'Antarctica', 'Antarctique'),
(4, 12, 'DZ', 'DZA', 'Algeria', 'Algérie'),
(5, 16, 'AS', 'ASM', 'American Samoa', 'Samoa Américaines'),
(6, 20, 'AD', 'AND', 'Andorra', 'Andorre'),
(7, 24, 'AO', 'AGO', 'Angola', 'Angola'),
(8, 28, 'AG', 'ATG', 'Antigua and Barbuda', 'Antigua-et-Barbuda'),
(9, 31, 'AZ', 'AZE', 'Azerbaijan', 'Azerbaïdjan'),
(10, 32, 'AR', 'ARG', 'Argentina', 'Argentine'),
(11, 36, 'AU', 'AUS', 'Australia', 'Australie'),
(12, 40, 'AT', 'AUT', 'Austria', 'Autriche'),
(13, 44, 'BS', 'BHS', 'Bahamas', 'Bahamas'),
(14, 48, 'BH', 'BHR', 'Bahrain', 'Bahreïn'),
(15, 50, 'BD', 'BGD', 'Bangladesh', 'Bangladesh'),
(16, 51, 'AM', 'ARM', 'Armenia', 'Arménie'),
(17, 52, 'BB', 'BRB', 'Barbados', 'Barbade'),
(18, 56, 'BE', 'BEL', 'Belgium', 'Belgique'),
(19, 60, 'BM', 'BMU', 'Bermuda', 'Bermudes'),
(20, 64, 'BT', 'BTN', 'Bhutan', 'Bhoutan'),
(21, 68, 'BO', 'BOL', 'Bolivia', 'Bolivie'),
(22, 70, 'BA', 'BIH', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine'),
(23, 72, 'BW', 'BWA', 'Botswana', 'Botswana'),
(24, 74, 'BV', 'BVT', 'Bouvet Island', 'Île Bouvet'),
(25, 76, 'BR', 'BRA', 'Brazil', 'Brésil'),
(26, 84, 'BZ', 'BLZ', 'Belize', 'Belize'),
(27, 86, 'IO', 'IOT', 'British Indian Ocean Territory', 'Territoire Britannique de l\'Océan Indien'),
(28, 90, 'SB', 'SLB', 'Solomon Islands', 'Îles Salomon'),
(29, 92, 'VG', 'VGB', 'British Virgin Islands', 'Îles Vierges Britanniques'),
(30, 96, 'BN', 'BRN', 'Brunei Darussalam', 'Brunéi Darussalam'),
(31, 100, 'BG', 'BGR', 'Bulgaria', 'Bulgarie'),
(32, 104, 'MM', 'MMR', 'Myanmar', 'Myanmar'),
(33, 108, 'BI', 'BDI', 'Burundi', 'Burundi'),
(34, 112, 'BY', 'BLR', 'Belarus', 'Bélarus'),
(35, 116, 'KH', 'KHM', 'Cambodia', 'Cambodge'),
(36, 120, 'CM', 'CMR', 'Cameroon', 'Cameroun'),
(37, 124, 'CA', 'CAN', 'Canada', 'Canada'),
(38, 132, 'CV', 'CPV', 'Cape Verde', 'Cap-vert'),
(39, 136, 'KY', 'CYM', 'Cayman Islands', 'Îles Caïmanes'),
(40, 140, 'CF', 'CAF', 'Central African', 'République Centrafricaine'),
(41, 144, 'LK', 'LKA', 'Sri Lanka', 'Sri Lanka'),
(42, 148, 'TD', 'TCD', 'Chad', 'Tchad'),
(43, 152, 'CL', 'CHL', 'Chile', 'Chili'),
(44, 156, 'CN', 'CHN', 'China', 'Chine'),
(45, 158, 'TW', 'TWN', 'Taiwan', 'Taïwan'),
(46, 162, 'CX', 'CXR', 'Christmas Island', 'Île Christmas'),
(47, 166, 'CC', 'CCK', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)'),
(48, 170, 'CO', 'COL', 'Colombia', 'Colombie'),
(49, 174, 'KM', 'COM', 'Comoros', 'Comores'),
(50, 175, 'YT', 'MYT', 'Mayotte', 'Mayotte'),
(51, 178, 'CG', 'COG', 'Republic of the Congo', 'République du Congo'),
(52, 180, 'CD', 'COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo'),
(53, 184, 'CK', 'COK', 'Cook Islands', 'Îles Cook'),
(54, 188, 'CR', 'CRI', 'Costa Rica', 'Costa Rica'),
(55, 191, 'HR', 'HRV', 'Croatia', 'Croatie'),
(56, 192, 'CU', 'CUB', 'Cuba', 'Cuba'),
(57, 196, 'CY', 'CYP', 'Cyprus', 'Chypre'),
(58, 203, 'CZ', 'CZE', 'Czech Republic', 'République Tchèque'),
(59, 204, 'BJ', 'BEN', 'Benin', 'Bénin'),
(60, 208, 'DK', 'DNK', 'Denmark', 'Danemark'),
(61, 212, 'DM', 'DMA', 'Dominica', 'Dominique'),
(62, 214, 'DO', 'DOM', 'Dominican Republic', 'République Dominicaine'),
(63, 218, 'EC', 'ECU', 'Ecuador', 'Équateur'),
(64, 222, 'SV', 'SLV', 'El Salvador', 'El Salvador'),
(65, 226, 'GQ', 'GNQ', 'Equatorial Guinea', 'Guinée Équatoriale'),
(66, 231, 'ET', 'ETH', 'Ethiopia', 'Éthiopie'),
(67, 232, 'ER', 'ERI', 'Eritrea', 'Érythrée'),
(68, 233, 'EE', 'EST', 'Estonia', 'Estonie'),
(69, 234, 'FO', 'FRO', 'Faroe Islands', 'Îles Féroé'),
(70, 238, 'FK', 'FLK', 'Falkland Islands', 'Îles (malvinas) Falkland'),
(71, 239, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud'),
(72, 242, 'FJ', 'FJI', 'Fiji', 'Fidji'),
(73, 246, 'FI', 'FIN', 'Finland', 'Finlande'),
(74, 248, 'AX', 'ALA', 'Åland Islands', 'Îles Åland'),
(75, 250, 'FR', 'FRA', 'France', 'France'),
(76, 254, 'GF', 'GUF', 'French Guiana', 'Guyane Française'),
(77, 258, 'PF', 'PYF', 'French Polynesia', 'Polynésie Française'),
(78, 260, 'TF', 'ATF', 'French Southern Territories', 'Terres Australes Françaises'),
(79, 262, 'DJ', 'DJI', 'Djibouti', 'Djibouti'),
(80, 266, 'GA', 'GAB', 'Gabon', 'Gabon'),
(81, 268, 'GE', 'GEO', 'Georgia', 'Géorgie'),
(82, 270, 'GM', 'GMB', 'Gambia', 'Gambie'),
(83, 275, 'PS', 'PSE', 'Occupied Palestinian Territory', 'Territoire Palestinien Occupé'),
(84, 276, 'DE', 'DEU', 'Germany', 'Allemagne'),
(85, 288, 'GH', 'GHA', 'Ghana', 'Ghana'),
(86, 292, 'GI', 'GIB', 'Gibraltar', 'Gibraltar'),
(87, 296, 'KI', 'KIR', 'Kiribati', 'Kiribati'),
(88, 300, 'GR', 'GRC', 'Greece', 'Grèce'),
(89, 304, 'GL', 'GRL', 'Greenland', 'Groenland'),
(90, 308, 'GD', 'GRD', 'Grenada', 'Grenade'),
(91, 312, 'GP', 'GLP', 'Guadeloupe', 'Guadeloupe'),
(92, 316, 'GU', 'GUM', 'Guam', 'Guam'),
(93, 320, 'GT', 'GTM', 'Guatemala', 'Guatemala'),
(94, 324, 'GN', 'GIN', 'Guinea', 'Guinée'),
(95, 328, 'GY', 'GUY', 'Guyana', 'Guyana'),
(96, 332, 'HT', 'HTI', 'Haiti', 'Haïti'),
(97, 334, 'HM', 'HMD', 'Heard Island and McDonald Islands', 'Îles Heard et Mcdonald'),
(98, 336, 'VA', 'VAT', 'Vatican City State', 'Saint-Siège (état de la Cité du Vatican)'),
(99, 340, 'HN', 'HND', 'Honduras', 'Honduras'),
(100, 344, 'HK', 'HKG', 'Hong Kong', 'Hong-Kong'),
(101, 348, 'HU', 'HUN', 'Hungary', 'Hongrie'),
(102, 352, 'IS', 'ISL', 'Iceland', 'Islande'),
(103, 356, 'IN', 'IND', 'India', 'Inde'),
(104, 360, 'ID', 'IDN', 'Indonesia', 'Indonésie'),
(105, 364, 'IR', 'IRN', 'Islamic Republic of Iran', 'République Islamique d\'Iran'),
(106, 368, 'IQ', 'IRQ', 'Iraq', 'Iraq'),
(107, 372, 'IE', 'IRL', 'Ireland', 'Irlande'),
(108, 376, 'IL', 'ISR', 'Israel', 'Israël'),
(109, 380, 'IT', 'ITA', 'Italy', 'Italie'),
(110, 384, 'CI', 'CIV', 'Côte d\'Ivoire', 'Côte d\'Ivoire'),
(111, 388, 'JM', 'JAM', 'Jamaica', 'Jamaïque'),
(112, 392, 'JP', 'JPN', 'Japan', 'Japon'),
(113, 398, 'KZ', 'KAZ', 'Kazakhstan', 'Kazakhstan'),
(114, 400, 'JO', 'JOR', 'Jordan', 'Jordanie'),
(115, 404, 'KE', 'KEN', 'Kenya', 'Kenya'),
(116, 408, 'KP', 'PRK', 'Democratic People\'s Republic of Korea', 'République Populaire Démocratique de Corée'),
(117, 410, 'KR', 'KOR', 'Republic of Korea', 'République de Corée'),
(118, 414, 'KW', 'KWT', 'Kuwait', 'Koweït'),
(119, 417, 'KG', 'KGZ', 'Kyrgyzstan', 'Kirghizistan'),
(120, 418, 'LA', 'LAO', 'Lao People\'s Democratic Republic', 'République Démocratique Populaire Lao'),
(121, 422, 'LB', 'LBN', 'Lebanon', 'Liban'),
(122, 426, 'LS', 'LSO', 'Lesotho', 'Lesotho'),
(123, 428, 'LV', 'LVA', 'Latvia', 'Lettonie'),
(124, 430, 'LR', 'LBR', 'Liberia', 'Libéria'),
(125, 434, 'LY', 'LBY', 'Libyan Arab Jamahiriya', 'Jamahiriya Arabe Libyenne'),
(126, 438, 'LI', 'LIE', 'Liechtenstein', 'Liechtenstein'),
(127, 440, 'LT', 'LTU', 'Lithuania', 'Lituanie'),
(128, 442, 'LU', 'LUX', 'Luxembourg', 'Luxembourg'),
(129, 446, 'MO', 'MAC', 'Macao', 'Macao'),
(130, 450, 'MG', 'MDG', 'Madagascar', 'Madagascar'),
(131, 454, 'MW', 'MWI', 'Malawi', 'Malawi'),
(132, 458, 'MY', 'MYS', 'Malaysia', 'Malaisie'),
(133, 462, 'MV', 'MDV', 'Maldives', 'Maldives'),
(134, 466, 'ML', 'MLI', 'Mali', 'Mali'),
(135, 470, 'MT', 'MLT', 'Malta', 'Malte'),
(136, 474, 'MQ', 'MTQ', 'Martinique', 'Martinique'),
(137, 478, 'MR', 'MRT', 'Mauritania', 'Mauritanie'),
(138, 480, 'MU', 'MUS', 'Mauritius', 'Maurice'),
(139, 484, 'MX', 'MEX', 'Mexico', 'Mexique'),
(140, 492, 'MC', 'MCO', 'Monaco', 'Monaco'),
(141, 496, 'MN', 'MNG', 'Mongolia', 'Mongolie'),
(142, 498, 'MD', 'MDA', 'Republic of Moldova', 'République de Moldova'),
(143, 500, 'MS', 'MSR', 'Montserrat', 'Montserrat'),
(144, 504, 'MA', 'MAR', 'Morocco', 'Maroc'),
(145, 508, 'MZ', 'MOZ', 'Mozambique', 'Mozambique'),
(146, 512, 'OM', 'OMN', 'Oman', 'Oman'),
(147, 516, 'NA', 'NAM', 'Namibia', 'Namibie'),
(148, 520, 'NR', 'NRU', 'Nauru', 'Nauru'),
(149, 524, 'NP', 'NPL', 'Nepal', 'Népal'),
(150, 528, 'NL', 'NLD', 'Netherlands', 'Pays-Bas'),
(151, 530, 'AN', 'ANT', 'Netherlands Antilles', 'Antilles Néerlandaises'),
(152, 533, 'AW', 'ABW', 'Aruba', 'Aruba'),
(153, 540, 'NC', 'NCL', 'New Caledonia', 'Nouvelle-Calédonie'),
(154, 548, 'VU', 'VUT', 'Vanuatu', 'Vanuatu'),
(155, 554, 'NZ', 'NZL', 'New Zealand', 'Nouvelle-Zélande'),
(156, 558, 'NI', 'NIC', 'Nicaragua', 'Nicaragua'),
(157, 562, 'NE', 'NER', 'Niger', 'Niger'),
(158, 566, 'NG', 'NGA', 'Nigeria', 'Nigéria'),
(159, 570, 'NU', 'NIU', 'Niue', 'Niué'),
(160, 574, 'NF', 'NFK', 'Norfolk Island', 'Île Norfolk'),
(161, 578, 'NO', 'NOR', 'Norway', 'Norvège'),
(162, 580, 'MP', 'MNP', 'Northern Mariana Islands', 'Îles Mariannes du Nord'),
(163, 581, 'UM', 'UMI', 'United States Minor Outlying Islands', 'Îles Mineures Éloignées des États-Unis'),
(164, 583, 'FM', 'FSM', 'Federated States of Micronesia', 'États Fédérés de Micronésie'),
(165, 584, 'MH', 'MHL', 'Marshall Islands', 'Îles Marshall'),
(166, 585, 'PW', 'PLW', 'Palau', 'Palaos'),
(167, 586, 'PK', 'PAK', 'Pakistan', 'Pakistan'),
(168, 591, 'PA', 'PAN', 'Panama', 'Panama'),
(169, 598, 'PG', 'PNG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée'),
(170, 600, 'PY', 'PRY', 'Paraguay', 'Paraguay'),
(171, 604, 'PE', 'PER', 'Peru', 'Pérou'),
(172, 608, 'PH', 'PHL', 'Philippines', 'Philippines'),
(173, 612, 'PN', 'PCN', 'Pitcairn', 'Pitcairn'),
(174, 616, 'PL', 'POL', 'Poland', 'Pologne'),
(175, 620, 'PT', 'PRT', 'Portugal', 'Portugal'),
(176, 624, 'GW', 'GNB', 'Guinea-Bissau', 'Guinée-Bissau'),
(177, 626, 'TL', 'TLS', 'Timor-Leste', 'Timor-Leste'),
(178, 630, 'PR', 'PRI', 'Puerto Rico', 'Porto Rico'),
(179, 634, 'QA', 'QAT', 'Qatar', 'Qatar'),
(180, 638, 'RE', 'REU', 'Réunion', 'Réunion'),
(181, 642, 'RO', 'ROU', 'Romania', 'Roumanie'),
(182, 643, 'RU', 'RUS', 'Russian Federation', 'Fédération de Russie'),
(183, 646, 'RW', 'RWA', 'Rwanda', 'Rwanda'),
(184, 654, 'SH', 'SHN', 'Saint Helena', 'Sainte-Hélène'),
(185, 659, 'KN', 'KNA', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis'),
(186, 660, 'AI', 'AIA', 'Anguilla', 'Anguilla'),
(187, 662, 'LC', 'LCA', 'Saint Lucia', 'Sainte-Lucie'),
(188, 666, 'PM', 'SPM', 'Saint-Pierre and Miquelon', 'Saint-Pierre-et-Miquelon'),
(189, 670, 'VC', 'VCT', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines'),
(190, 674, 'SM', 'SMR', 'San Marino', 'Saint-Marin'),
(191, 678, 'ST', 'STP', 'Sao Tome and Principe', 'Sao Tomé-et-Principe'),
(192, 682, 'SA', 'SAU', 'Saudi Arabia', 'Arabie Saoudite'),
(193, 686, 'SN', 'SEN', 'Senegal', 'Sénégal'),
(194, 690, 'SC', 'SYC', 'Seychelles', 'Seychelles'),
(195, 694, 'SL', 'SLE', 'Sierra Leone', 'Sierra Leone'),
(196, 702, 'SG', 'SGP', 'Singapore', 'Singapour'),
(197, 703, 'SK', 'SVK', 'Slovakia', 'Slovaquie'),
(198, 704, 'VN', 'VNM', 'Vietnam', 'Viet Nam'),
(199, 705, 'SI', 'SVN', 'Slovenia', 'Slovénie'),
(200, 706, 'SO', 'SOM', 'Somalia', 'Somalie'),
(201, 710, 'ZA', 'ZAF', 'South Africa', 'Afrique du Sud'),
(202, 716, 'ZW', 'ZWE', 'Zimbabwe', 'Zimbabwe'),
(203, 724, 'ES', 'ESP', 'Spain', 'Espagne'),
(204, 732, 'EH', 'ESH', 'Western Sahara', 'Sahara Occidental'),
(205, 736, 'SD', 'SDN', 'Sudan', 'Soudan'),
(206, 740, 'SR', 'SUR', 'Suriname', 'Suriname'),
(207, 744, 'SJ', 'SJM', 'Svalbard and Jan Mayen', 'Svalbard etÎle Jan Mayen'),
(208, 748, 'SZ', 'SWZ', 'Swaziland', 'Swaziland'),
(209, 752, 'SE', 'SWE', 'Sweden', 'Suède'),
(210, 756, 'CH', 'CHE', 'Switzerland', 'Suisse'),
(211, 760, 'SY', 'SYR', 'Syrian Arab Republic', 'République Arabe Syrienne'),
(212, 762, 'TJ', 'TJK', 'Tajikistan', 'Tadjikistan'),
(213, 764, 'TH', 'THA', 'Thailand', 'Thaïlande'),
(214, 768, 'TG', 'TGO', 'Togo', 'Togo'),
(215, 772, 'TK', 'TKL', 'Tokelau', 'Tokelau'),
(216, 776, 'TO', 'TON', 'Tonga', 'Tonga'),
(217, 780, 'TT', 'TTO', 'Trinidad and Tobago', 'Trinité-et-Tobago'),
(218, 784, 'AE', 'ARE', 'United Arab Emirates', 'Émirats Arabes Unis'),
(219, 788, 'TN', 'TUN', 'Tunisia', 'Tunisie'),
(220, 792, 'TR', 'TUR', 'Turkey', 'Turquie'),
(221, 795, 'TM', 'TKM', 'Turkmenistan', 'Turkménistan'),
(222, 796, 'TC', 'TCA', 'Turks and Caicos Islands', 'Îles Turks et Caïques'),
(223, 798, 'TV', 'TUV', 'Tuvalu', 'Tuvalu'),
(224, 800, 'UG', 'UGA', 'Uganda', 'Ouganda'),
(225, 804, 'UA', 'UKR', 'Ukraine', 'Ukraine'),
(226, 807, 'MK', 'MKD', 'The Former Yugoslav Republic of Macedonia', 'L\'ex-République Yougoslave de Macédoine'),
(227, 818, 'EG', 'EGY', 'Egypt', 'Égypte'),
(228, 826, 'GB', 'GBR', 'United Kingdom', 'Royaume-Uni'),
(229, 833, 'IM', 'IMN', 'Isle of Man', 'Île de Man'),
(230, 834, 'TZ', 'TZA', 'United Republic Of Tanzania', 'République-Unie de Tanzanie'),
(231, 840, 'US', 'USA', 'United States', 'États-Unis'),
(232, 850, 'VI', 'VIR', 'U.S. Virgin Islands', 'Îles Vierges des États-Unis'),
(233, 854, 'BF', 'BFA', 'Burkina Faso', 'Burkina Faso'),
(234, 858, 'UY', 'URY', 'Uruguay', 'Uruguay'),
(235, 860, 'UZ', 'UZB', 'Uzbekistan', 'Ouzbékistan'),
(236, 862, 'VE', 'VEN', 'Venezuela', 'Venezuela'),
(237, 876, 'WF', 'WLF', 'Wallis and Futuna', 'Wallis et Futuna'),
(238, 882, 'WS', 'WSM', 'Samoa', 'Samoa'),
(239, 887, 'YE', 'YEM', 'Yemen', 'Yémen'),
(240, 891, 'CS', 'SCG', 'Serbia and Montenegro', 'Serbie-et-Monténégro'),
(241, 894, 'ZM', 'ZMB', 'Zambia', 'Zambie');

-- Structure de la table `produit`

DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
  `pro_id` int(11) NOT NULL,
  `pro_nom` varchar(50) NOT NULL,
  `pro_desc` mediumtext NOT NULL,
  `pro_cat_id` int(11) NOT NULL,
  `pro_fou_id` int(11) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `pro_prix` decimal(7,2) NOT NULL,
  `pro_photo` varchar(50) DEFAULT NULL,
  `pro_prix_fou` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `produit` (`pro_id`, `pro_nom`, `pro_desc`, `pro_cat_id`, `pro_fou_id`, `pro_stock`, `pro_prix`, `pro_photo`, `pro_prix_fou`) VALUES
(25, 'm', '« Quand on achète une maison, on regarde les poutres ; quand on prend une femme,  il faut regarder la mère ».', 4, 2, 2, '3.00', 'jpg', 0),
(28, 'piano', '« Ne vous mettez pas en avant, mais ne restez pas en arrière. »\r\n\r\n', 24, 4, 10, '10.00', 'jpg', 0),
(29, 'hamid', 'Les grandes âmes ont de la volonté, les faibles n\'ont que des souhaits.', 8, 4, 12, '13.00', 'jpg', 0),
(30, 'ACCORDÉON', 'Patience ! Avec le temps, l\'herbe devient du lait.', 24, 3, 2, '13.00', 'jpg', 0),
(31, 'ALTO', 'wbxfdwsbf', 4, 3, 22, '2.00', 'jpg', 0),
(32, 'AMATI', 'htrertjherterjtertjrtj', 3, 2, 32, '12.00', 'jpg', 0),
(33, 'BALALAÏKA', 'Sourire, c\'est rajeunir de dix ans ; s\'attrister, c\'est se faire des cheveux blancs.', 5, 1, 25, '52.00', 'jpg', 0),
(34, 'BAMBOULA', 'Qui ose traverser les grands fleuves ne craint pas les petites rivières.', 6, 1, 12, '12.00', 'gif', 0),
(35, 'BANDONÉON', 'eBANDONÉON', 7, 2, 14, '14.00', 'jpg', 0),
(36, 'kjhgfdsq', 'QFqegfQGF', 9, 3, 225, '12.00', 'jpg', 0);

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `u_id` int(11) NOT NULL,
  `u_mail` varchar(45) NOT NULL,
  `u_pass` varchar(64) NOT NULL,
  `u_type` tinyint(4) NOT NULL DEFAULT 1,
  `u_addr` varchar(255) NOT NULL,
  `u_cp` varchar(10) NOT NULL,
  `u_ville` varchar(45) NOT NULL,
  `u_pays` smallint(5) UNSIGNED NOT NULL,
  `u_nom` varchar(255) NOT NULL,
  `u_prenom` varchar(255) NOT NULL,
  `u_nl` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `utilisateur` (`u_id`, `u_mail`, `u_pass`, `u_type`, `u_addr`, `u_cp`, `u_ville`, `u_pays`, `u_nom`, `u_prenom`, `u_nl`) VALUES
(1, 'hamid.benchikh@gmail.com', '$2y$10$Swwmp2r0EKijfC2kJ7xpVuDq2b6MgMsSX8g054pv4GFW8lNOVnpbS', 1, '6 quai de la revolution a 520', '94140', 'abbeile', 8, 'hamid', 'benchikh', 0),
(2, 'amlibrino@live.fr', '$2y$10$.a.YEW2xO4SSX.II4dZFWeiHqlaanChVQ0YSNHyeu57UZwQQvh7Je', 2, '6 quai de la revolution, a 520 6 quai de la revolution, a 520', '94140', 'ddzezef', 1, 'hamid', 'benchikh', 0),
(3, 'test@test.fr', '$2y$10$BXCl8fiLGmWbLx596aGgHO.kd5aEsZu9RtoVlVUJHbExpLUU8DooK', 4, 'test test', '80300', 'frerffr', 1, 'test', 'test', 0);

-- Structure de la vue `v_client`

DROP TABLE IF EXISTS `v_client`;
DROP VIEW IF EXISTS `v_client`;
CREATE VIEW `v_client`  AS  SELECT `c`.`cl_id` AS `cl_id`,`c`.`c_remise` AS `remise`,`c`.`c_pro` AS `pro`,`c`.`c_addr_liv` AS `addr_liv`,`c`.`c_cp_liv` AS `cp_liv`,`c`.`c_ville_liv` AS `ville_liv`,`p2`.`nom_fr_fr` AS `c_pays`,
`u`.`u_nom` AS `nom`,`u`.`u_prenom` AS `prenom`,`u`.`u_addr` AS `addr`,`u`.`u_cp` AS `cp`,`u`.`u_ville` AS `ville`,
`p1`.`nom_fr_fr` AS `u_pays`,
`comm`.`u_id` AS `id_comm`,`comm`.`u_nom` AS `nom_comm`,`comm`.`u_prenom` AS `comm_prenom`,
`u`.`u_mail` AS `u_mail`,`u`.`u_pass` AS `u_pass` 
FROM ((((`client`AS `c` JOIN `utilisateur`  `u` ON(`u`.`u_id` = `c`.`cl_id`)) 
JOIN `pays`  `p1` ON(`p1`.`id` = `u`.`u_pays`)) 
JOIN `pays`  `p2` ON(`p2`.`id` = `c`.`c_pays_liv`)) 
JOIN `utilisateur` `comm` ON(`comm`.`u_id` = `c`.`c_com_id`)) ;

-- Structure de la vue `v_list_prod`
DROP TABLE IF EXISTS `v_list_prod`;

DROP VIEW IF EXISTS `v_list_prod`;
CREATE VIEW `v_list_prod`  AS  SELECT `produit`.`pro_id` AS `pro_id`,`produit`.`pro_nom` AS `pro_nom`,`produit`.`pro_desc` AS `pro_desc`,`produit`.`pro_cat_id` AS `pro_cat_id`,`produit`.`pro_fou_id` AS `pro_fou_id`,`produit`.`pro_stock` AS `pro_stock`,`produit`.`pro_prix` AS `pro_prix`,`produit`.`pro_photo` AS `pro_photo`,`cat`.`cat_nom` AS `cat_nom`,`cp`.`cat_nom` AS `cat_parent`,`f`.`f_id` AS `f_id`,`f`.`f_nom` AS `f_nom`,`f`.`f_addr` AS `f_addr`,`f`.`f_cp` AS `f_cp`,`f`.`f_pays` AS `f_pays`,`f`.`f_mail` AS `f_mail`,`f`.`f_tel` AS `f_tel`,`f`.`f_mobile` AS `f_mobile`,`f`.`f_contact` AS `f_contact`,`pays`.`nom_fr_fr` AS `nom_pays` 
FROM ((((`produit` JOIN `fournisseur` `f` ON(`f`.`f_id` = `produit`.`pro_fou_id`)) 
JOIN `pays` ON(`pays`.`id` = `f`.`f_pays`))
JOIN `categories` `cat` ON(`cat`.`cat_id` = `produit`.`pro_cat_id`)) 
JOIN `categories` `cp` ON(`cp`.`cat_id` = `cat`.`cat_parent`)) ;

-- Index pour les tables déchargées

-- Index pour la table `categories`

ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `fk_id_sous` (`cat_parent`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cl_id`),
  ADD KEY `fk_com_u_id` (`c_com_id`),
  ADD KEY `fk_pays_liv` (`c_pays_liv`);

--
-- Index pour la table `detailcomm`
--
ALTER TABLE `detailcomm`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `fk_pan_id_idx` (`pan_id`),
  ADD KEY `fk_pro_id_idx` (`pro_id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `fk_f_pays` (`f_pays`);

--
-- Index pour la table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`nl_mail`),
  ADD UNIQUE KEY `nl_mail` (`nl_mail`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`pan_id`),
  ADD KEY `fk_cl_id_idx` (`cl_id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alpha2` (`alpha2`),
  ADD UNIQUE KEY `alpha3` (`alpha3`),
  ADD UNIQUE KEY `code_unique` (`code`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `fk_f_id_idx` (`pro_fou_id`),
  ADD KEY `fk_pro_cat_id` (`pro_cat_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `uk_mail` (`u_mail`) USING BTREE,
  ADD KEY `fk_id_pays` (`u_pays`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `detailcomm`
--
ALTER TABLE `detailcomm`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `pan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_id_sous` FOREIGN KEY (`cat_parent`) REFERENCES `categories` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_cl_id` FOREIGN KEY (`cl_id`) REFERENCES `utilisateur` (`u_id`),
  ADD CONSTRAINT `fk_com_u_id` FOREIGN KEY (`c_com_id`) REFERENCES `utilisateur` (`u_id`),
  ADD CONSTRAINT `fk_pays_liv` FOREIGN KEY (`c_pays_liv`) REFERENCES `pays` (`id`);

--
-- Contraintes pour la table `detailcomm`
--
ALTER TABLE `detailcomm`
  ADD CONSTRAINT `detailcomm_ibfk_1` FOREIGN KEY (`pan_id`) REFERENCES `panier` (`pan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detailcomm_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `produit` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fk_f_pays` FOREIGN KEY (`f_pays`) REFERENCES `pays` (`id`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`cl_id`) REFERENCES `client` (`cl_id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_pro_cat_id` FOREIGN KEY (`pro_cat_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`pro_fou_id`) REFERENCES `fournisseur` (`f_id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`u_pays`) REFERENCES `pays` (`id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
