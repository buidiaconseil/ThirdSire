-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 19 mai 2019 à 16:34
-- Version du serveur :  10.1.39-MariaDB
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `buissondiazconseil`
--

-- --------------------------------------------------------

--
-- Structure de la table `emailcandidat`
--

CREATE TABLE `emailcandidat` (
  `PK_EmailCandidat` bigint(20) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emailcandidat`
--

INSERT INTO `emailcandidat` (`PK_EmailCandidat`, `Email`, `Date`) VALUES
(1, 'sebastien.diaz@gmail.com', '2019-05-17 15:22:31');

-- --------------------------------------------------------

--
-- Structure de la table `emailconseil`
--

CREATE TABLE `emailconseil` (
  `PK_EmailConseil` bigint(20) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emailrecruteur`
--

CREATE TABLE `emailrecruteur` (
  `PK_EMAILRECRUTEUR` bigint(20) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emailrecruteur`
--

INSERT INTO `emailrecruteur` (`PK_EMAILRECRUTEUR`, `Email`, `Date`) VALUES
(1, 'puuuu@poo', '2019-05-17 15:54:51'),
(3, 'ererttee@poo.bom', '2019-05-17 15:57:51'),
(5, 'dedeed@ppooo', '2019-05-17 16:01:42');

-- --------------------------------------------------------

--
-- Structure de la table `funnel`
--

CREATE TABLE `funnel` (
  `PK_Funnel` int(11) NOT NULL,
  `Titre` varchar(200) NOT NULL,
  `Clef` varchar(16) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `funnel`
--

INSERT INTO `funnel` (`PK_Funnel`, `Titre`, `Clef`, `Date`) VALUES
(1, 'Funnel Candidat', 'FUNCAND', '2019-05-19 15:08:17'),
(2, 'Funnel Recruteur', 'FUNREC', '2019-05-19 15:09:13'),
(3, 'Funnel Conseil', 'FUNCON', '2019-05-19 15:09:13');

-- --------------------------------------------------------

--
-- Structure de la table `funnelprocessus`
--

CREATE TABLE `funnelprocessus` (
  `FK_Funnel` int(11) NOT NULL,
  `FK_Processus` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `funnelprocessus`
--

INSERT INTO `funnelprocessus` (`FK_Funnel`, `FK_Processus`, `Date`) VALUES
(1, 1, '2019-05-19 15:12:28'),
(2, 2, '2019-05-19 15:12:28'),
(3, 3, '2019-05-19 15:12:36');

-- --------------------------------------------------------

--
-- Structure de la table `processus`
--

CREATE TABLE `processus` (
  `PK_Processus` int(11) NOT NULL,
  `FK_ProcessusPrecedent` int(11) DEFAULT NULL,
  `Titre` varchar(200) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `processus`
--

INSERT INTO `processus` (`PK_Processus`, `FK_ProcessusPrecedent`, `Titre`, `Date`) VALUES
(1, NULL, 'Candidat a Convertir', '2019-05-19 15:11:07'),
(2, NULL, 'Recruteur a Convertir', '2019-05-19 15:11:07'),
(3, NULL, 'Conseil a Convertir', '2019-05-19 15:11:24');

-- --------------------------------------------------------

--
-- Structure de la table `processustemplate`
--

CREATE TABLE `processustemplate` (
  `FK_Processus` int(11) NOT NULL,
  `FK_Template` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `processustemplate`
--

INSERT INTO `processustemplate` (`FK_Processus`, `FK_Template`, `Date`) VALUES
(1, 1, '2019-05-19 16:22:52');

-- --------------------------------------------------------

--
-- Structure de la table `template`
--

CREATE TABLE `template` (
  `PK_TemplateEmail` int(11) NOT NULL,
  `Template` text NOT NULL,
  `Titre` varchar(200) NOT NULL,
  `Actif` tinyint(1) NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `template`
--

INSERT INTO `template` (`PK_TemplateEmail`, `Template`, `Titre`, `Actif`, `Date`) VALUES
(1, 'Bonjour ,\r\n\r\nJe tiens à vous remercier pour votre choix concernant votre enregistrement.\r\n\r\nC\'est avec un grand honneur et aussi un grand sens des responsabilités que je reçois cette demande.\r\n\r\nNous foulons devenir la société qui vous suivra et vous aidera à évoluer tout au long de votre carrière.\r\n\r\nC\'est pourquoi je vous invite dès a présent à me fournir toutes les informations vous concernant afin de faire rapidement connaissance.\r\n\r\nCela peut être des liens, un CV, ou bien d\'autres éléments.\r\n\r\nVoici quelque petites questions afin de bien comprendre vos besoins et votre personnalité:\r\n\r\nQuel type de poste recherchez vous ?\r\n\r\nEtes vous mobile ? A l’international ?\r\n\r\nQuelle est la réalisation professionnelle dont vous êtes le plus fier ?\r\n\r\nQuelles sont vos prétentions salariales ?\r\n\r\nComment vous voyez-vous dans 5 ans ?\r\n\r\nQuelles sont vos 3 qualités et 3 défauts ?\r\n\r\nQu’est-ce qui vous motive chaque jour ?\r\n\r\nComment réagissez-vous lorsque vous devez travailler sous pression ?\r\n\r\n\r\nVeuillez trouver ici mes sincères salutations, et mes remerciements appuyés.\r\n\r\n\r\nSébastien DIAZ\r\n\r\nBuisson Diaz Conseil\r\nhttp://www.buissondiaz.com\r\n', 'Merci de nous avoir choisi.', 1, '2019-05-19 15:34:19');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emailcandidat`
--
ALTER TABLE `emailcandidat`
  ADD PRIMARY KEY (`PK_EmailCandidat`),
  ADD UNIQUE KEY `Email` (`Email`) USING HASH;

--
-- Index pour la table `emailconseil`
--
ALTER TABLE `emailconseil`
  ADD PRIMARY KEY (`PK_EmailConseil`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `emailrecruteur`
--
ALTER TABLE `emailrecruteur`
  ADD PRIMARY KEY (`PK_EMAILRECRUTEUR`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Index pour la table `funnel`
--
ALTER TABLE `funnel`
  ADD PRIMARY KEY (`PK_Funnel`),
  ADD UNIQUE KEY `ClefUnique` (`Clef`);

--
-- Index pour la table `funnelprocessus`
--
ALTER TABLE `funnelprocessus`
  ADD UNIQUE KEY `FK_Funnel_2` (`FK_Funnel`,`FK_Processus`),
  ADD KEY `FK_Funnel` (`FK_Funnel`,`FK_Processus`);

--
-- Index pour la table `processus`
--
ALTER TABLE `processus`
  ADD PRIMARY KEY (`PK_Processus`);

--
-- Index pour la table `processustemplate`
--
ALTER TABLE `processustemplate`
  ADD UNIQUE KEY `FK_Processus` (`FK_Processus`,`FK_Template`);

--
-- Index pour la table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`PK_TemplateEmail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `emailcandidat`
--
ALTER TABLE `emailcandidat`
  MODIFY `PK_EmailCandidat` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `emailconseil`
--
ALTER TABLE `emailconseil`
  MODIFY `PK_EmailConseil` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emailrecruteur`
--
ALTER TABLE `emailrecruteur`
  MODIFY `PK_EMAILRECRUTEUR` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `funnel`
--
ALTER TABLE `funnel`
  MODIFY `PK_Funnel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `processus`
--
ALTER TABLE `processus`
  MODIFY `PK_Processus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `template`
--
ALTER TABLE `template`
  MODIFY `PK_TemplateEmail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
