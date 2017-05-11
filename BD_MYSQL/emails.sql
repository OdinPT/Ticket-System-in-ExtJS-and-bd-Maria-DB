-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Maio-2017 às 13:47
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagarEmails` (IN `_id` INT(10))  NO SQL
BEGIN

DELETE FROM emails WHERE (id=_id);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagaResposta` (IN `_id` INT(11))  NO SQL
BEGIN

DELETE FROM respostas where id_resp=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaInfo` (IN `_id` INT(11))  NO SQL
Begin

SELECT `id`,`datea`,`state`,nome_departamento
FROM `emails`,departamento 
WHERE id_departamento_emails=id_departamento and id=_id;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ConCat` (IN `_pa` VARCHAR(700))  READS SQL DATA
    COMMENT 'Procura por Palavras chave inseridas'
Begin
Call VerDicionario();

select body from emails where body like CONCAT('%',_pa,'%') ;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ForcLimpeza` ()  NO SQL
BEGIN
SET GLOBAL FOREIGN_KEY_CHECKS= 0;
TRUNCATE table emails;
SET GLOBAL FOREIGN_KEY_CHECKS=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirRespostas` (IN `_body` VARCHAR(700), IN `_id_email` INT(11))  NO SQL
BEGIN 


    INSERT INTO respostas
         (
           body_resp,
           datea_resp,
           id_email)
           
    VALUES 
         ( 
           
        _body, 
        Now(),
        _id_email) ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirTickets` (IN `_from` VARCHAR(150), IN `_subject` VARCHAR(250), IN `_date` VARCHAR(100), IN `_message` VARCHAR(700))  NO SQL
BEGIN 


    INSERT INTO emails
         (
           fromaddress,
           subject,
           datea,
           body)
           
    VALUES 
         ( 
           
        _from, 
        _subject, 
        _date,   
        _message) ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirTickets2` (IN `_from` VARCHAR(150), IN `_subject` VARCHAR(250), IN `_date` VARCHAR(100), IN `_message` VARCHAR(700), IN `_user` VARCHAR(100))  BEGIN 


    INSERT INTO emails
         (
           fromaddress,
           subject,
           datea,
           body,
           id_departamento_emails)
           
    VALUES 
         ( 
           
        _from, 
        _subject, 
        _date,   
        _message,
        MostraIdDepartamento(_user)) ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LimpaHistorico` ()  NO SQL
BEGIN
DELETE FROM emails where (`id_grupo_emails` = 2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LimpaRecuperados` ()  NO SQL
BEGIN
DELETE FROM emails where (`id_grupo_emails` = 3);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LimpaRespostas` ()  NO SQL
Begin
truncate respostas;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LimpaTickets` ()  BEGIN
DELETE FROM emails where (`id_grupo_emails` = 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Login` (IN `_username` VARCHAR(100), IN `_password` VARCHAR(100))  NO SQL
BEGIN

select * 
from admin 
where username = _username and pass = _password;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MudaGrupo` (IN `_id` INT(11))  BEGIN

UPDATE emails 

SET id_grupo_emails = MudaGrupoTicket(`id_grupo_emails`), state = MudaEstado(`state`) where id=_id;


   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowBody` (IN `_id` INT)  BEGIN
SELECT id,fromaddress,body,subject,datea,state,nome_departamento
FROM emails,departamento,grupo 
WHERE id_departamento_emails=id_departamento and id_grupo_emails=id_grupo and id=_id;

   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowBodyDetailsHis` (IN `_id` INT)  BEGIN
 SELECT `id`,`fromaddress`,`subject`,`datea`,`state`,nome_departamento FROM emails, grupo,departamento
   where (`id_grupo_emails`=id_grupo) and (id_departamento_emails=id_departamento) and nome_grupo="Histórico" and  (id=_id);  
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `showBodyDetailsRec` (IN `_id` INT)  BEGIN
 SELECT `id`,`fromaddress`,`subject`,`datea`,`state`,nome_departamento FROM emails, grupo,departamento
   where (`id_grupo_emails`=id_grupo) and (id_departamento_emails=id_departamento) and nome_grupo="Recuperado" and  (id=_id);  
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowBodyDetailsTicket` (IN `_id` INT)  BEGIN
	SELECT `id`,`fromaddress`,`subject`,`datea`,`state`,`nome_departamento` 
		FROM emails,grupo, departamento 
	where (id_departamento_emails=id_departamento) and (`id_grupo_emails`=id_grupo) and nome_grupo="Ticket" and  (id=_id); 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowRespostas` ()  NO SQL
Begin

SELECT `id_resp`,`body_resp`,DATE_FORMAT(`datea_resp`,'%d/%m/%Y')
from respostas,emails 
where (`id_email`= id);

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowRespostasHistorico` (IN `_ID_Ticket` INT(11))  NO SQL
Begin

 SELECT `id_resp`,`body_resp`,`datea_resp`,`datea_resp`,`id_email` 
 FROM emails,respostas where id_email=id and(`id_email`=_ID_Ticket);

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowRespostasTicket` (IN `_ID_Ticket` INT(11))  NO SQL
    COMMENT 'Mostra as Respostas do Ticket que recebeu o id'
Begin

 SELECT `id_resp`,`body_resp`,`datea_resp`,`datea_resp`,`id_email` 
 FROM emails,respostas where id_email=id and(`id_email`=_ID_Ticket);

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelec` (IN `_id` INT(11))  NO SQL
BEGIN
 
 SELECT `body`,fromaddress FROM emails,grupo, departamento 
 
 where (id_departamento_emails=id_departamento) and (`id_grupo_emails`=id_grupo) and nome_grupo="Ticket" and  (id=_id); 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelecHistorico` (IN `_id` INT)  BEGIN
 SELECT id, fromaddress, subject, datea ,body ,`state`,`nome_departamento`,nome_grupo FROM emails,grupo, departamento where (id_departamento_emails=id_departamento) and (`id_grupo_emails`=id_grupo) and nome_grupo="Historico" and  (id=_id); 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelecRecovered` (IN `_id` INT)  BEGIN
	SELECT id, fromaddress, subject, datea ,body ,`state`,`nome_departamento`,nome_grupo
    
		FROM emails,departamento, grupo 
	where (id_departamento_emails=id_departamento) and nome_grupo="Recuperado" and  (id=_id); 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicket` ()  BEGIN

select `id`,`fromaddress`,`subject`,`datea`,`body`, `state`,`nome_departamento`
from emails, departamento, grupo
where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Ticket')order by id asc;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicketHistorico` ()  BEGIN
	select`id`,`fromaddress`,`subject`,`datea`,`body`,`state`,`nome_departamento`,`nome_grupo` from emails, departamento, grupo
	where (`id_departamento_emails`=id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Historico')Order by id asc;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerticketRecuperado` ()  NO SQL
BEGIN

select `id`,`fromaddress`,`subject`,`datea`,`body`, `state`,`nome_departamento`
from emails, departamento, grupo
where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Recuperado')order by id asc;
   
   
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `MostraIdDepartamento` (`_Nome` VARCHAR(40)) RETURNS INT(11) NO SQL
Begin
declare temp int(11);

SELECT `id_departamento_funcionarios` INTO temp FROM `admin` WHERE username=_Nome;
return temp;

End$$

CREATE DEFINER=`root`@`localhost` FUNCTION `MudaEstado` (`_estado` VARCHAR(12)) RETURNS VARCHAR(10) CHARSET latin1 BEGIN
    DECLARE a varchar(10);
 
    IF (_estado = 'Aberto')  THEN
 		SET a = 'Fechado';
    ELSEIF (_estado = 'Fechado') THEN
        SET a = 'Aberto';
    END IF;
 RETURN (a);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `MudaGrupoTicket` (`_id_grupo` INT) RETURNS INT(2) NO SQL
BEGIN
    DECLARE a int (1);
 
    IF (_id_grupo = 1)  THEN
 		SET a = 2;
    ELSEIF (_id_grupo = 2 ) THEN
        SET a = 3;
     Else 
     set a = 2;
    END IF;
 RETURN (a);
 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id_funcionario` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `id_departamento_funcionarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id_funcionario`, `username`, `pass`, `id_departamento_funcionarios`) VALUES
(1, 'odinpt21@gmail.com', 'abcd1995', 1),
(2, 'testetrackit@gmail.com', 'testetrackit123', 4),
(3, 'testetrackit2@gmail.com', 'testetrackit123', 4),
(4, 'no-reply@trackit.pt', 'tr4ck1t', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nome_departamento`) VALUES
(1, 'Call Center'),
(2, 'Operações'),
(3, 'N/D'),
(4, 'Devellopers');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `fromaddress` varchar(150) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `datea` varchar(100) NOT NULL,
  `body` varchar(700) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Aberto',
  `id_departamento_emails` int(11) DEFAULT '3',
  `id_grupo_emails` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`, `id_departamento_emails`, `id_grupo_emails`) VALUES
(1, 'Track IT Gmail <testetrackit@gmail.com>', 'as', 'Fri, 28 Apr 2017 16:16:37 +0100', 'TestTesteTasdasdasdasdasDasdAsdAsdAsDaSdASAasÂ ', 'Aberto', 1, 1),
(2, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'teste', 'Thu, 4 May 2017 09:53:58 +0100', 'antes da filtragem por email do departamento\r\n\r\n', 'Fechado', 1, 2),
(3, 'teste trackit <testetrackit@gmail.com>', 'PT', 'Wed, 10 May 2017 09:45:54 +0100', 'PT223\r\n', 'Fechado', 1, 2),
(4, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'as', 'Wed, 10 May 2017 11:48:28 +0100', 'Ã¢Â€Â‹asabody\r\n', 'Aberto', 4, 1),
(5, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'body', 'Wed, 10 May 2017 11:48:45 +0100', 'txt 2\r\n', 'Aberto', 4, 1),
(6, 'teste trackit <testetrackit@gmail.com>', 'Teste 123', 'Wed, 10 May 2017 11:49:31 +0100', 'Teste Teste Teste\r\n', 'Aberto', 4, 1),
(7, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'testetr', 'Wed, 10 May 2017 11:49:21 +0100', 'asasÃ¢Â€Â‹aÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(8, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'msx', 'Wed, 10 May 2017 11:50:50 +0100', 'asasasas\r\n', 'Aberto', 4, 1),
(9, 'teste trackit <testetrackit@gmail.com>', 'Teste Ticket', 'Wed, 10 May 2017 11:58:39 +0100', 'Ticket teste\r\n', 'Aberto', 4, 1),
(10, 'Track IT Testes <testetrackit@gmail.com>', 'MS', 'Wed, 10 May 2017 11:58:44 +0100', 'asas', 'Aberto', 4, 1),
(11, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'reunia?o 1', 'Wed, 10 May 2017 12:24:37 +0100', 'ReuniÃƒÂ£o\r\n', 'Aberto', 4, 1),
(12, 'PHP Classes Newclasses <list-newclasses@phpclasses.org>', '[PHP Classes] New class daily digest of 2017-05-09', '10 May 2017 12:39:42 -0000', '\r\n\r\n\r\n\r\nNew class daily digest of 2017-05-09 - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          New class daily digest of 2017-05-09\r\n        \r\n        Monitor your stack!Try Datadog for free and monitor all your data in one place! Servers, clouds, apps, and more.\r\n        teste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n2 new classes were added to &quot;PHP Classes&quot; repository.\r\n\r\n1. PHP Twitter Search PHP SDK - This class support forum\r\n\r\n\r\nShort description:\r\n\r\nSearch for tweets and users ', 'Aberto', 4, 1),
(13, 'PHP Classes Notable <list-notable@phpclasses.org>', '[PHP Classes] Notable PHP package: PHP Session MySQL Handler', '10 May 2017 14:25:19 -0000', '\r\n\r\n\r\n\r\nNotable PHP package: PHP Session MySQL Handler - PHP Classes\r\n\r\n\r\n\r\nBy default PHP stores information of session variables in files, but applications can provide their own session handlers and store session data in other storage containers like databases. It is common to store session data in MySQL databases.\r\n\r\nOne issue to be concerned with sessions is that only one script can change session data at a time of a given user.\r\n\r\nFor databases, transactions could be used to prevent that multiple scripts try to change the same user session data in a way that could cause inconsistency.\r\n\r\nHowever, the use of sessions may cause that the table that contains session data records locks the a', 'Aberto', 4, 1),
(14, 'teste trackit <testetrackit@gmail.com>', 'awdawdawd', 'Wed, 10 May 2017 17:07:19 +0100', 'adawdawdad\r\n', 'Aberto', 4, 1),
(15, 'teste trackit <testetrackit@gmail.com>', '13123', 'Wed, 10 May 2017 17:08:57 +0100', '13123123\r\n', 'Aberto', 4, 1),
(16, 'teste trackit <testetrackit@gmail.com>', '123123', 'Wed, 10 May 2017 17:26:25 +0100', '123131312\r\n', 'Aberto', 4, 1),
(17, 'teste trackit <testetrackit@gmail.com>', '1dasd', 'Wed, 10 May 2017 17:46:21 +0100', 'awdawdawd\r\n', 'Aberto', 4, 1),
(18, 'teste trackit <testetrackit@gmail.com>', 'er gerg erg e', 'Wed, 10 May 2017 17:48:23 +0100', 'ger gegererg\r\n', 'Aberto', 4, 1),
(19, 'teste trackit <testetrackit@gmail.com>', 'dfgsdgsd', 'Wed, 10 May 2017 17:51:44 +0100', 'gds fgsd sdfgsdf\r\n', 'Aberto', 4, 1),
(20, 'teste trackit <testetrackit@gmail.com>', '123123', 'Wed, 10 May 2017 17:51:55 +0100', '123123123123123123\r\n', 'Aberto', 4, 1),
(21, 'teste trackit <testetrackit@gmail.com>', 'hhh', 'Wed, 10 May 2017 17:55:34 +0100', 'fghfghfghfgh\r\n', 'Aberto', 4, 1),
(22, 'teste trackit <testetrackit@gmail.com>', 'awdawdawdawd', 'Thu, 11 May 2017 09:06:44 +0100', 'adawdawdawdawd\r\n', 'Aberto', 4, 1),
(23, 'teste trackit <testetrackit@gmail.com>', 'awdawdaw', 'Thu, 11 May 2017 09:10:14 +0100', 'dawdawawwa\r\n', 'Aberto', 4, 1),
(24, 'Track IT Testes <testetrackit@gmail.com>', 'TESTE', 'Thu, 11 May 2017 09:13:39 +0100', 'Â asdfghjkl', 'Aberto', 4, 1),
(25, 'teste trackit <testetrackit@gmail.com>', 'awdad', 'Thu, 11 May 2017 09:26:22 +0100', 'ddd\r\n', 'Aberto', 4, 1),
(26, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'asas', 'Thu, 11 May 2017 09:27:46 +0100', 'aÃ¢Â€Â‹asaasasÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(27, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'asas', 'Thu, 11 May 2017 09:29:15 +0100', 'Ã¢Â€Â‹testeÃ¢Â€Â‹aa\r\n', 'Aberto', 4, 1),
(28, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', 'Thu, 11 May 2017 08:36:06 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\naaawawa\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(29, 'Rui Miguel <CacerFTW@hotmail.com>', 'aadawa', 'Thu, 11 May 2017 08:37:43 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nwawwaawwa\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(30, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', 'Thu, 11 May 2017 08:48:45 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawawaw\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(31, 'Rui Miguel <CacerFTW@hotmail.com>', 'gsdgg', 'Thu, 11 May 2017 08:50:41 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfsgg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(32, 'Rui Miguel <CacerFTW@hotmail.com>', 'aawawaw', 'Thu, 11 May 2017 08:55:47 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nddd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(33, 'Rui Miguel <CacerFTW@hotmail.com>', 'awaw', 'Thu, 11 May 2017 08:57:03 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawaw\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(34, 'Rui Miguel <CacerFTW@hotmail.com>', '12313', 'Thu, 11 May 2017 08:58:17 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(35, 'Rui Miguel <CacerFTW@hotmail.com>', 'fsdfsfsd', 'Thu, 11 May 2017 08:59:14 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nsdfsdfsdfsd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(36, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'asdas', 'Thu, 11 May 2017 10:00:00 +0100', 'Ã¢Â€Â‹Ã¢Â€Â‹asasdasdÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(37, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'asas', 'Thu, 11 May 2017 10:02:16 +0100', 'Ã¢Â€Â‹asasÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(38, 'Rui Miguel <CacerFTW@hotmail.com>', 'awawawa', 'Thu, 11 May 2017 09:11:43 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(39, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdawd', 'Thu, 11 May 2017 09:14:52 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdaddddd\r\n\r\n\r\n\r\n', 'Fechado', 4, 2),
(40, 'Rui Miguel <CacerFTW@hotmail.com>', 'hythty', 'Thu, 11 May 2017 09:16:02 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nhttyhtyh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(41, 'Rui Miguel <CacerFTW@hotmail.com>', '213', 'Thu, 11 May 2017 09:16:59 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n123123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(42, 'Rui Miguel <CacerFTW@hotmail.com>', 'adawd', 'Thu, 11 May 2017 09:18:16 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\neuÃ©eÃ©Ã©\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(43, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', 'Thu, 11 May 2017 09:19:40 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nÃ©uÃ©\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(44, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdaw', 'Thu, 11 May 2017 09:22:17 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `nome_grupo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nome_grupo`) VALUES
(1, 'Ticket'),
(2, 'Histórico'),
(3, 'Recuperado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE `respostas` (
  `id_resp` int(11) NOT NULL,
  `body_resp` varchar(700) NOT NULL,
  `datea_resp` varchar(100) NOT NULL,
  `id_email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `respostas`
--

INSERT INTO `respostas` (`id_resp`, `body_resp`, `datea_resp`, `id_email`) VALUES
(1, 'asa', '2017-05-01', 1),
(2, 'leo.teste', '0000-00-00', 1),
(3, 'body123', '2017-05-10 11:34:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `funcionarios_fk_departamentos` (`id_departamento_funcionarios`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails` (`body`),
  ADD KEY `emails_FK_Departamento` (`id_departamento_emails`),
  ADD KEY `emails_FK_grupos` (`id_grupo_emails`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indexes for table `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`id_resp`),
  ADD KEY `respostas_FK_emails` (`id_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_fk_departamento` FOREIGN KEY (`id_departamento_funcionarios`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_FK_Departamento` FOREIGN KEY (`id_departamento_emails`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emails_FK_grupos` FOREIGN KEY (`id_grupo_emails`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_FK_emails` FOREIGN KEY (`id_email`) REFERENCES `emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
