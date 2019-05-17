-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 17 mai 2019 à 16:24
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
(2, 'puuuu@poo', '2019-05-17 15:57:33'),
(3, 'ererttee@poo.bom', '2019-05-17 15:57:51'),
(4, 'dedeed@ppooo', '2019-05-17 16:01:11'),
(5, 'dedeed@ppooo', '2019-05-17 16:01:42');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emailcandidat`
--
ALTER TABLE `emailcandidat`
  ADD PRIMARY KEY (`PK_EmailCandidat`);

--
-- Index pour la table `emailconseil`
--
ALTER TABLE `emailconseil`
  ADD PRIMARY KEY (`PK_EmailConseil`);

--
-- Index pour la table `emailrecruteur`
--
ALTER TABLE `emailrecruteur`
  ADD PRIMARY KEY (`PK_EMAILRECRUTEUR`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
