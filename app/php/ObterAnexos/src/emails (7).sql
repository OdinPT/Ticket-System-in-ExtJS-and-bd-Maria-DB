-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Maio-2017 às 11:27
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emails`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `fromaddress` varchar(150) NOT NULL,
  `Email_mail` text,
  `subject` varchar(250) NOT NULL,
  `datea` datetime NOT NULL,
  `body` varchar(700) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Aberto',
  `id_departamento_emails` int(11) DEFAULT '3',
  `id_grupo_emails` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `Email_mail`, `subject`, `datea`, `body`, `state`, `id_departamento_emails`, `id_grupo_emails`) VALUES
(7, 'Track IT Gmail <testetrackit@gmail.com>', NULL, 'as', '2017-05-16 19:36:57', 'TestTesteTasdasdasdasdasDasdAsdAsdAsDaSdASAasÂ ', 'Aberto', 1, 1),
(8, 'teste trackit <testetrackit@gmail.com>', NULL, 'PT', '2017-05-16 19:36:57', 'PT223\r\n', 'Fechado', 1, 2),
(9, 'Microsoft Outlook <odinpt21@gmail.com>', NULL, 'Mensagem de Teste do Microsoft Outlook', '2017-05-16 19:36:58', 'Esta ÃƒÂ© uma mensagem de e-mail enviada automaticamente pelo Microsoft Outlook ao testar as definiÃ§Ãµes da conta do utilizador.\r\n', 'Aberto', 1, 1),
(14, 'teste trackit <testetrackit@gmail.com>', NULL, 'awdawd', '2017-05-17 09:49:39', 'awdawdawdawdaw\r\n', 'Aberto', 4, 3),
(15, 'teste trackit <testetrackit@gmail.com>', NULL, 'Ã§a?dÃ§awdaÃ§da?wÃ§dawÃ§dadw', '2017-05-17 10:19:50', '~Ã§awdÃ£wÃ§dawÃ§dawd~ad~wÃ§daw~daÃ§wda\r\n', 'Aberto', 4, 1),
(17, 'teste trackit <testetrackit@gmail.com>', NULL, '12312313', '2017-05-17 11:06:04', '\r\n', 'Aberto', 4, 1),
(18, 'teste trackit <testetrackit@gmail.com>', NULL, 'adawd', '2017-05-17 11:07:03', 'awdawd\r\n', 'Aberto', 4, 3),
(19, 'teste trackit <testetrackit@gmail.com>', NULL, 'awdawdawd', '2017-05-17 14:21:18', 'dawdad\r\n', 'Aberto', 4, 1),
(20, 'teste trackit <testetrackit@gmail.com>', NULL, 'dadawdad', '2017-05-17 14:21:19', 'awdawdawdawd\r\n', 'Aberto', 4, 1),
(21, 'teste trackit <testetrackit@gmail.com>', NULL, 'awd', '2017-05-17 14:21:19', 'awdawdawd\r\n', 'Aberto', 4, 1),
(22, 'teste trackit <testetrackit@gmail.com>', NULL, 'dawdawdawd', '2017-05-17 14:21:19', 'wadawdaw\r\n', 'Aberto', 4, 1),
(23, 'teste trackit <testetrackit@gmail.com>', NULL, 'awdawda', '2017-05-17 14:21:20', 'wawdawda\r\n', 'Aberto', 4, 1),
(24, 'teste trackit <testetrackit@gmail.com>', NULL, '12312', '2017-05-17 14:21:20', '121\r\n', 'Aberto', 4, 1),
(25, 'teste trackit <testetrackit@gmail.com>', NULL, 'Here is the subject', '2017-05-18 10:26:55', 'This is the HTML message body in bold!\r\n\r\n\r\n', 'Aberto', 4, 1),
(26, 'PHP Classes Notable <list-notable@phpclasses.org>', NULL, '[PHP Classes] Notable PHP package: Unified PHP Playlist', '2017-05-18 12:27:54', '\r\n\r\n\r\n\r\nNotable PHP package: Unified PHP Playlist - PHP Classes\r\n\r\n\r\n\r\nPlaylists are lists of audio and video clips that can be watched in a sequence defined by the user. Playlists can be saved in files defined in many different formats.\r\n\r\nThis class can read playlists in many well known formats. It can extract many types of details of the listed media.\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          Notable PHP package: Unified PHP Playlist\r\n        \r\n        Find Top DevelopersWe help companies like Airbnb, Pfizer, and Artsy find great developers. Let us find your next great hire. Get started today.\r\n        \r\n\r\nteste, a PHP package is considered Notable when it does something different tha', 'Aberto', 4, 1),
(27, 'PHP Classes Newsletter <list-newsletter@phpclasses.org>', NULL, '[PHP Classes] Weekly PHP Classes newsletter of Thursday - 2017-05-18', '2017-05-18 12:27:54', '\r\n\r\n\r\n\r\nteste this is the Weekly PHP Classes newsletter of Thursday - 2017-05-18 - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          teste this is the Weekly PHP Classes newsletter of Thursday - 2017-05-18\r\n        \r\n        Find Top DevelopersWe help companies like Airbnb, Pfizer, and Artsy find great developers. Let us find your next great hire. Get started today.\r\n        \r\n\r\nteste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nContents\r\nPHP Classes site tip of the day\r\nLatest PHP ', 'Aberto', 4, 1),
(28, 'Tudosb InformaÌtica <tudosbinformatica@gmail.com>', NULL, '21:17', '2017-05-18 23:19:32', '23:15Â ', 'Aberto', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails` (`body`),
  ADD KEY `emails_FK_Departamento` (`id_departamento_emails`),
  ADD KEY `emails_FK_grupos` (`id_grupo_emails`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_FK_Departamento` FOREIGN KEY (`id_departamento_emails`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emails_FK_grupos` FOREIGN KEY (`id_grupo_emails`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
