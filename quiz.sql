-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 02 Octobre 2017 à 10:30
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `quiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `sentence` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questions`
--

INSERT INTO `questions` (`id`, `sentence`) VALUES
(1, 'Lorsqu\'un pancake tombe dans la neige avant le 31 décembre, on dit'),
(2, 'Lorsqu\'un Pancake prend l\'avion à destination de Toronto, et qui s\'en va faire une escale technique à St Claude, qui c\'est qu\'on va dire de ce pancake là ? On nous dit :'),
(3, 'Lorsqu\'un pancake est invité à une teuf, est ce qu\'on doit :'),
(4, 'Au cours de quel événement historique, fut créé le Pancake ?'),
(5, 'Si un TGV va vers le Sud et un vent soufle du Nord, où va la fumée ?'),
(6, 'Une vache est dans un pré carré, elle met 90 min pour manger le coté droit, 90 min pour le bas, 90 min le coté gauche et 1h30 pour le coté du haut, pourquoi ?'),
(7, 'Si un coq pond un oeuf sur le toit d\'une maison et l\'oeuf tombe par terre, va-i-il se briser ?'),
(8, 'Le 14 Juillet existe-t-il en Tanzanie ?'),
(9, 'Que représente : 11111111 ?'),
(10, 'Qu\'est-ce qui est jaune et qui attend ?');

-- --------------------------------------------------------

--
-- Structure de la table `responses`
--

CREATE TABLE `responses` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `id_questions` smallint(3) NOT NULL,
  `sentence` varchar(255) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `responses`
--

INSERT INTO `responses` (`id`, `id_questions`, `sentence`, `correct`) VALUES
(1, 1, 'Que c\'est un pancake qui est tombé dans la neige avant le 31 décembre ?', 0),
(2, 1, 'Que c\'est une plat surgelée ?', 1),
(3, 1, 'Que c\'est un frizby comestible ?', 0),
(4, 1, 'La réponse D', 0),
(5, 2, 'Qu\'il n\'est pas encore arrivé à Toronto ?', 0),
(6, 2, 'Qu\'il est supposé arriver à Toronto, mais qu\'on l\'attend toujours ?', 0),
(7, 2, 'Qu\'est ce qu\'il fout ce maudit pancake tabernacle ?', 1),
(8, 2, 'La réponse D', 0),
(9, 3, 'L\'inciter à aller boire à l\'open bar', 1),
(10, 3, 'Lui offrir et lui présenter Raymond Bar', 0),
(11, 3, 'Lui présenter des mala bar', 0),
(12, 3, 'La réponse D', 0),
(13, 4, 'En 1618, pendant la guerre des croissants au beurre', 0),
(14, 4, 'Pendant le massacre de la Saint Panini', 0),
(15, 4, 'En 112 avant Céline, pendant la prise de la brioche... événement tragique', 1),
(16, 4, 'Toujours la réponse D', 0),
(17, 5, 'Vers le Sud', 0),
(18, 5, 'Vers l\'Est', 0),
(19, 5, 'Un TGV n\'a pas de fumée', 1),
(20, 6, 'Parce qu\'elle est constipée !', 0),
(21, 6, 'Parce qu\'elle n\'a plus faim !', 0),
(22, 6, 'Parce que 90 min et 1h30, c\'est pareil !', 1),
(23, 7, 'Oui', 0),
(24, 7, 'Non', 0),
(25, 7, 'Un coq ne pond pas d\'oeuf !', 1),
(26, 8, 'Oui', 1),
(27, 8, 'Non', 0),
(28, 9, 'Onze Millions', 0),
(29, 9, 'Un octet', 0),
(30, 9, 'Un troupeau de 1', 1),
(31, 10, 'Un canarie patient', 0),
(32, 10, 'Jonathan', 1),
(33, 10, 'Une personne qui a de mauvais goûts vestimentaires', 0);

-- --------------------------------------------------------

--
-- Structure de la table `score`
--

CREATE TABLE `score` (
  `login` varchar(255) NOT NULL,
  `score` int(5) NOT NULL,
  `idscore` int(11) NOT NULL,
  `datescore` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `login` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`login`, `mdp`, `level`) VALUES
('hugo.slbpt@gmail.com', 'hugo', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_questions` (`id_questions`);

--
-- Index pour la table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`idscore`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `score`
--
ALTER TABLE `score`
  MODIFY `idscore` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
