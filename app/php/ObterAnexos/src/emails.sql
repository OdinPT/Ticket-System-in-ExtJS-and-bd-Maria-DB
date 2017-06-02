-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Mar-2017 às 15:25
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
  `subject` varchar(250) NOT NULL,
  `datea` varchar(100) NOT NULL,
  `body` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `subject`, `datea`, `body`) VALUES
(1, 'Leonardo Manuel Vieira <leonardo.vieira@estudantes.ips.pt>', 'Teste titulo', 'Tue, 21 Mar 2017 11:41:28 +0000', 'asdassssssssssssssssssssssssssssssssssssssssssssssss=\r\nssssssssssssdasdasdasda\r\n&nbsp;\r\nEnviado do \r\nCorreio para Windows 10\r\n&nbsp;\r\n\r\n\r\n\r\n\r\n\n\r\n\r\nEstudante: 150210023@estudantes.ips.pt, C=\r\nurso: CTeSP Tecnologias e Programa&ccedil;&atilde;o de Sist'),
(2, 'teste trackit <testetrackit@gmail.com>', 'awd', 'Tue, 21 Mar 2017 11:19:07 +0000', 'awd'),
(3, 'teste trackit <testetrackit@gmail.com>', 'Teste', 'Tue, 21 Mar 2017 11:09:13 +0000', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`,`body`),
  ADD UNIQUE KEY `body` (`body`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
