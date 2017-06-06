-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Mar-2017 às 13:19
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
  `body` varchar(250) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Aberto',
  `department` varchar(100) NOT NULL DEFAULT 'N/ atribuido'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`, `department`) VALUES
(1, 'Equipa do Gmail <mail-noreply@google.com>', 'Mantenha tudo organizado com a caixa de entrada do Gmail', 'Fri, 24 Mar 2017 03:57:08 -0700', 'Mantenha tudo organizado com a caixa de entrada do Gmail=\r\n=\r\nOl=C3=A1 teste=\r\nA caixa de entrada do Gmail d=C3=A1-lhe controlo totalConhe=C3=A7a a caixa de entradaA caixa de entrada do Gmail organiza os se=\r\nus emails ao orden=C3=A1-los em categoria', 'Aberto', 'Departamento1'),
(2, 'Equipa do Gmail <mail-noreply@google.com>', 'O melhor do Gmail, onde quer que esteja', 'Fri, 24 Mar 2017 03:57:08 -0700', 'O melhor do Gmail, onde quer que esteja=', 'Aberto', 'Departamento2'),
(3, 'Equipa do Gmail <mail-noreply@google.com>', '=?UTF-8?Q?Tr=C3=AAs_sugest=C3=B5es_para_aproveitar_melhor_o_Gmail?=', 'Fri, 24 Mar 2017 03:57:07 -0700', 'Tr=C3=AAs sugest=C3=B5es para aproveitar melhor o GmailOl=C3=A1 testeSugest=C3=B5es para aproveitar melhor o GmailTra=\r\nnsfira os seus contactos e emails para o GmailNo seu computador, pode copiar os c=\r\nontactos e emails da conta de email antiga par', 'Aberto', 'N/ atribuido'),
(4, 'Equipa do Gmail <mail-noreply@google.com>', '=?UTF-8?Q?Foi_criado_o_endere=C3=A7o_testetrackit2@gmail.com_para_o_Gmail?=', 'Fri, 24 Mar 2017 03:57:08 -0700', '', 'Aberto', 'N/ atribuido'),
(5, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'tutyutyutyu', 'Thu, 23 Mar 2017 15:08:34 +0000', 'tyutyutyutyututyut', 'Aberto', 'N/ atribuido'),
(6, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'ddddd', 'Thu, 23 Mar 2017 14:06:02 +0000', 'ddddd', 'Aberto', 'N/ atribuido'),
(7, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'xxxxxxxxxxxzczc', 'Thu, 23 Mar 2017 11:59:54 +0000', 'xxxxxxxxxxxxxxxxxxxxxx', 'Aberto', 'Departamento2'),
(8, 'Rui Nascimento <ruinascimento1996@gmail.com>', '123123123123', 'Thu, 23 Mar 2017 11:55:24 +0000', '12332131231', 'Aberto', 'N/ atribuido'),
(9, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'EEEEEEEEEEEE', 'Thu, 23 Mar 2017 11:25:34 +0000', 'EEEEEEEEEEEEEEEEEEEEEEEEEEEEE', 'Aberto', 'N/ atribuido'),
(10, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'kappa', 'Thu, 23 Mar 2017 09:15:45 +0000', '123', 'Aberto', 'Departamento2'),
(11, 'Leonardo Manuel Vieira <leonardo.vieira@estudantes.ips.pt>', 'asdasd', 'Wed, 22 Mar 2017 16:11:21 +0000', 'asdasdasdas\r\n&nbsp;\r\nEnviado do \r\nCorreio para Windows 10\r\n&nbsp;\r\n\r\n\r\n\r\n\r\n\n\r\n\r\nEstudante: 150210023@estudantes.ips.pt, C=\r\nurso: CTeSP Tecnologias e Programa&ccedil;&atilde;o de Sistemas de Informa&=\r\nccedil;&atilde;o, Escola: ESTS', 'Aberto', 'Departamento1'),
(12, 'Leonardo Manuel Vieira <leonardo.vieira@estudantes.ips.pt>', 'Teste titulo', 'Tue, 21 Mar 2017 11:41:28 +0000', 'asdassssssssssssssssssssssssssssssssssssssssssssssss=\r\nssssssssssssdasdasdasda\r\n&nbsp;\r\nEnviado do \r\nCorreio para Windows 10\r\n&nbsp;\r\n\r\n\r\n\r\n\r\n\n\r\n\r\nEstudante: 150210023@estudantes.ips.pt, C=\r\nurso: CTeSP Tecnologias e Programa&ccedil;&atilde;o de Sist', 'Aberto', 'N/ atribuido'),
(13, 'teste trackit <testetrackit@gmail.com>', 'awd', 'Tue, 21 Mar 2017 11:19:07 +0000', 'awd', 'Aberto', 'N/ atribuido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `fromaddress` varchar(150) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `datea` varchar(100) NOT NULL,
  `body` varchar(250) NOT NULL,
  `state` varchar(20) NOT NULL DEFAULT 'Aberto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`) VALUES
(171, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'kappa', 'Thu, 23 Mar 2017 09:15:45 +0000', '123', 'Aberto'),
(199, 'Leonardo Manuel Vieira <leonardo.vieira@estudantes.ips.pt>', 'asdasd', 'Wed, 22 Mar 2017 16:11:21 +0000', 'asdasdasdas\r\n&nbsp;\r\nEnviado do \r\nCorreio para Windows 10\r\n&nbsp;\r\n\r\n\r\n\r\n\r\n\n\r\n\r\nEstudante: 150210023@estudantes.ips.pt, C=\r\nurso: CTeSP Tecnologias e Programa&ccedil;&atilde;o de Sistemas de Informa&=\r\nccedil;&atilde;o, Escola: ESTS', 'Aberto'),
(131, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'ddddd', 'Thu, 23 Mar 2017 14:06:02 +0000', 'ddddd', 'Fechado'),
(216, 'Rui Nascimento <ruinascimento1996@gmail.com>', 'EEEEEEEEEEEE', 'Thu, 23 Mar 2017 11:25:34 +0000', 'EEEEEEEEEEEEEEEEEEEEEEEEEEEEE', 'Aberto');

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
-- Indexes for table `historico`
--
ALTER TABLE `historico`
  ADD UNIQUE KEY `emails_UQ` (`body`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
