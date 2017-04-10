-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2017 alle 11:02
-- Versione del server: 5.5.54-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_spese`
--
CREATE DATABASE IF NOT EXISTS `db_spese` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_spese`;

-- --------------------------------------------------------

--
-- Struttura della tabella `t_categorie`
--

CREATE TABLE IF NOT EXISTS `t_categorie` (
`id_categoria` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `id_utente` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `t_categorie`
--

INSERT INTO `t_categorie` (`id_categoria`, `nome`, `id_utente`) VALUES
(1, 'Pizza fuori', 1),
(2, 'Caffè al bar', 1),
(3, 'aperitivo', 10),
(4, 'world of warcraft', 11),
(5, 'cell', 10),
(6, 'prestiti', 1),
(7, 'stipendio', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `t_freq`
--

CREATE TABLE IF NOT EXISTS `t_freq` (
`id_freq` int(11) NOT NULL,
  `frequenza` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `t_freq`
--

INSERT INTO `t_freq` (`id_freq`, `frequenza`) VALUES
(1, 'occasionale'),
(2, 'ricorrente');

-- --------------------------------------------------------

--
-- Struttura della tabella `t_movimenti`
--

CREATE TABLE IF NOT EXISTS `t_movimenti` (
`id_movimento` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importo` decimal(8,2) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `id_utente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_freq` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `t_movimenti`
--

INSERT INTO `t_movimenti` (`id_movimento`, `data`, `importo`, `descrizione`, `id_utente`, `id_categoria`, `id_freq`, `id_tipo`) VALUES
(1, '2017-01-03 11:05:47', -13.00, NULL, 10, 3, 1, 2),
(2, '2017-04-03 10:05:47', -26.00, NULL, 11, 4, 1, 2),
(4, '2017-02-06 13:07:49', -113.00, NULL, 10, 1, 1, 2),
(5, '2017-03-06 13:10:14', 200.00, 'prestito', 10, 6, 2, 1),
(6, '2017-04-01 11:00:00', -10.00, 'così tanto per', 10, 2, 2, 2),
(7, '2017-05-15 06:00:00', 1000.00, 'accredito stipendio', 10, 7, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `t_tipi`
--

CREATE TABLE IF NOT EXISTS `t_tipi` (
`id_tipo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `t_tipi`
--

INSERT INTO `t_tipi` (`id_tipo`, `tipo`) VALUES
(1, 'entrata'),
(2, 'uscita');

-- --------------------------------------------------------

--
-- Struttura della tabella `t_utenti`
--

CREATE TABLE IF NOT EXISTS `t_utenti` (
`id_utente` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `pwd` varchar(8) NOT NULL,
  `mail` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `t_utenti`
--

INSERT INTO `t_utenti` (`id_utente`, `user`, `pwd`, `mail`) VALUES
(1, 'Utente Generale', 'password', 'prova@example.com'),
(10, 'marco', 'marco', 'marco@gmail.com'),
(11, 'emilio', 'emilio', 'emilio@gmail.com'),
(12, 'ciccio', 'ciccio', 'ciccio@gmail.com'),
(13, 'ciccio1', 'ciccio', 'ciccio@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_categorie`
--
ALTER TABLE `t_categorie`
 ADD PRIMARY KEY (`id_categoria`), ADD KEY `id_utente` (`id_utente`);

--
-- Indexes for table `t_freq`
--
ALTER TABLE `t_freq`
 ADD PRIMARY KEY (`id_freq`);

--
-- Indexes for table `t_movimenti`
--
ALTER TABLE `t_movimenti`
 ADD PRIMARY KEY (`id_movimento`), ADD KEY `id_utente` (`id_utente`), ADD KEY `id_categoria` (`id_categoria`), ADD KEY `id_freq` (`id_freq`), ADD KEY `id_tipo` (`id_tipo`);

--
-- Indexes for table `t_tipi`
--
ALTER TABLE `t_tipi`
 ADD PRIMARY KEY (`id_tipo`);

--
-- Indexes for table `t_utenti`
--
ALTER TABLE `t_utenti`
 ADD PRIMARY KEY (`id_utente`), ADD UNIQUE KEY `user` (`user`,`mail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_categorie`
--
ALTER TABLE `t_categorie`
MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `t_freq`
--
ALTER TABLE `t_freq`
MODIFY `id_freq` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_movimenti`
--
ALTER TABLE `t_movimenti`
MODIFY `id_movimento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `t_tipi`
--
ALTER TABLE `t_tipi`
MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_utenti`
--
ALTER TABLE `t_utenti`
MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `t_categorie`
--
ALTER TABLE `t_categorie`
ADD CONSTRAINT `t_categorie_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `t_utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `t_movimenti`
--
ALTER TABLE `t_movimenti`
ADD CONSTRAINT `t_movimenti_ibfk_4` FOREIGN KEY (`id_tipo`) REFERENCES `t_tipi` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `t_movimenti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `t_utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `t_movimenti_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `t_categorie` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `t_movimenti_ibfk_3` FOREIGN KEY (`id_freq`) REFERENCES `t_freq` (`id_freq`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
