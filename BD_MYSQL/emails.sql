-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12-Maio-2017 às 11:36
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

SELECT `id_resp`,`body_resp`,DATE_FORMAT(`datea_resp`,'%d/%m/%Y %T')AS Data
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

 SELECT `id_resp`,`body_resp`,`datea_resp`,`id_email` 
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
(2, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'body', 'Wed, 10 May 2017 11:48:45 +0100', 'txt 2\r\n', 'Aberto', 4, 1),
(3, 'teste trackit <testetrackit@gmail.com>', 'Teste 123', 'Wed, 10 May 2017 11:49:31 +0100', 'Teste Teste Teste\r\n', 'Aberto', 4, 1),
(4, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'testetr', 'Wed, 10 May 2017 11:49:21 +0100', 'asasÃ¢Â€Â‹aÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(5, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'msx', 'Wed, 10 May 2017 11:50:50 +0100', 'asasasas\r\n', 'Aberto', 4, 1),
(6, 'teste trackit <testetrackit@gmail.com>', 'Teste Ticket', 'Wed, 10 May 2017 11:58:39 +0100', 'Ticket teste\r\n', 'Aberto', 4, 1),
(7, 'Track IT Testes <testetrackit@gmail.com>', 'MS', 'Wed, 10 May 2017 11:58:44 +0100', 'asas', 'Fechado', 4, 2),
(8, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'reunia?o 1', 'Wed, 10 May 2017 12:24:37 +0100', 'ReuniÃƒÂ£o\r\n', 'Aberto', 4, 1),
(9, 'PHP Classes Newclasses <list-newclasses@phpclasses.org>', '[PHP Classes] New class daily digest of 2017-05-09', '10 May 2017 12:39:42 -0000', '\r\n\r\n\r\n\r\nNew class daily digest of 2017-05-09 - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          New class daily digest of 2017-05-09\r\n        \r\n        Monitor your stack!Try Datadog for free and monitor all your data in one place! Servers, clouds, apps, and more.\r\n        teste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n2 new classes were added to &quot;PHP Classes&quot; repository.\r\n\r\n1. PHP Twitter Search PHP SDK - This class support forum\r\n\r\n\r\nShort description:\r\n\r\nSearch for tweets and users ', 'Aberto', 4, 1),
(10, 'PHP Classes Notable <list-notable@phpclasses.org>', '[PHP Classes] Notable PHP package: PHP Session MySQL Handler', '10 May 2017 14:25:19 -0000', '\r\n\r\n\r\n\r\nNotable PHP package: PHP Session MySQL Handler - PHP Classes\r\n\r\n\r\n\r\nBy default PHP stores information of session variables in files, but applications can provide their own session handlers and store session data in other storage containers like databases. It is common to store session data in MySQL databases.\r\n\r\nOne issue to be concerned with sessions is that only one script can change session data at a time of a given user.\r\n\r\nFor databases, transactions could be used to prevent that multiple scripts try to change the same user session data in a way that could cause inconsistency.\r\n\r\nHowever, the use of sessions may cause that the table that contains session data records locks the a', 'Aberto', 4, 1),
(11, 'teste trackit <testetrackit@gmail.com>', 'awdawdawd', 'Wed, 10 May 2017 17:07:19 +0100', 'adawdawdad\r\n', 'Aberto', 4, 1),
(12, 'teste trackit <testetrackit@gmail.com>', '13123', 'Wed, 10 May 2017 17:08:57 +0100', '13123123\r\n', 'Aberto', 4, 1),
(13, 'teste trackit <testetrackit@gmail.com>', '123123', 'Wed, 10 May 2017 17:26:25 +0100', '123131312\r\n', 'Aberto', 4, 1),
(14, 'teste trackit <testetrackit@gmail.com>', '1dasd', 'Wed, 10 May 2017 17:46:21 +0100', 'awdawdawd\r\n', 'Aberto', 4, 1),
(15, 'teste trackit <testetrackit@gmail.com>', 'er gerg erg e', 'Wed, 10 May 2017 17:48:23 +0100', 'ger gegererg\r\n', 'Aberto', 4, 1),
(16, 'teste trackit <testetrackit@gmail.com>', 'dfgsdgsd', 'Wed, 10 May 2017 17:51:44 +0100', 'gds fgsd sdfgsdf\r\n', 'Aberto', 4, 1),
(17, 'teste trackit <testetrackit@gmail.com>', '123123', 'Wed, 10 May 2017 17:51:55 +0100', '123123123123123123\r\n', 'Aberto', 4, 1),
(18, 'teste trackit <testetrackit@gmail.com>', 'hhh', 'Wed, 10 May 2017 17:55:34 +0100', 'fghfghfghfgh\r\n', 'Aberto', 4, 1),
(19, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdaw', 'Thu, 11 May 2017 10:10:09 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(20, 'Rui Miguel <CacerFTW@hotmail.com>', 'gfgd', 'Thu, 11 May 2017 10:11:50 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(21, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', 'Thu, 11 May 2017 11:24:53 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(22, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfgdfg', 'Thu, 11 May 2017 11:25:45 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ntawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(23, 'Rui Miguel <CacerFTW@hotmail.com>', '23123', 'Thu, 11 May 2017 11:29:02 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(24, 'Rui Miguel <CacerFTW@hotmail.com>', 'adawd', 'Thu, 11 May 2017 11:30:21 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(25, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawda', 'Thu, 11 May 2017 11:32:26 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndsadsads\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(26, 'Rui Miguel <CacerFTW@hotmail.com>', '1aawda', 'Thu, 11 May 2017 11:34:19 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawaw\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(27, 'Rui Miguel <CacerFTW@hotmail.com>', '31231', 'Thu, 11 May 2017 11:35:16 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nadad\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(28, 'Rui Miguel <CacerFTW@hotmail.com>', '13212', 'Thu, 11 May 2017 11:36:01 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(29, 'Rui Miguel <CacerFTW@hotmail.com>', '11231212', 'Thu, 11 May 2017 11:37:26 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n1121121\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(30, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfgdg', 'Thu, 11 May 2017 11:39:03 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfgdfgdf\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(31, 'Rui Miguel <CacerFTW@hotmail.com>', '44345 3sdf', 'Thu, 11 May 2017 11:40:16 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nsdsfds\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(33, 'teste trackit <testetrackit@gmail.com>', '131231', 'Thu, 11 May 2017 14:37:27 +0100', '31231231\r\n', 'Aberto', 4, 1),
(34, 'Track IT Gmail <testetrackit@gmail.com>', 'as', 'Fri, 28 Apr 2017 16:16:37 +0100', 'TestTesteTasdasdasdasdasDasdAsdAsdAsDaSdASAasÂ ', 'Aberto', 1, 1),
(35, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'teste', 'Thu, 4 May 2017 09:53:58 +0100', 'antes da filtragem por email do departamento\r\n\r\n', 'Aberto', 1, 1),
(36, 'teste trackit <testetrackit@gmail.com>', 'PT', 'Wed, 10 May 2017 09:45:54 +0100', 'PT223\r\n', 'Aberto', 1, 1),
(37, 'Microsoft Outlook <odinpt21@gmail.com>', 'Mensagem de Teste do Microsoft Outlook', 'Thu, 11 May 2017 06:52:18 -0700 (PDT)', 'Esta Ã© uma mensagem de e-mail enviada automaticamente pelo Microsoft Outlook ao testar as definiÃ§Ãµes da conta do utilizador.\r\n', 'Aberto', 1, 1),
(38, 'Rui Miguel <CacerFTW@hotmail.com>', '12312312', 'Thu, 11 May 2017 13:39:17 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n31312312313123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(39, 'Rui Miguel <CacerFTW@hotmail.com>', 'dgdg', 'Thu, 11 May 2017 13:42:23 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nsdgsgdsgdsdg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(40, 'Rui Miguel <CacerFTW@hotmail.com>', '123123', 'Thu, 11 May 2017 13:45:03 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n12312312\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(41, 'Track IT Testes <testetrackit@gmail.com>', 'xxx', 'Thu, 11 May 2017 14:50:01 +0100', 'Testeâ€¦Â ', 'Aberto', 4, 1),
(42, 'Rui Miguel <CacerFTW@hotmail.com>', '221312', 'Thu, 11 May 2017 13:52:31 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n312312312123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(43, 'Rui Miguel <CacerFTW@hotmail.com>', 'dgsdg', 'Thu, 11 May 2017 13:53:40 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdgg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(44, 'Rui Miguel <CacerFTW@hotmail.com>', 'dhhh', 'Thu, 11 May 2017 13:55:00 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nhhhhgdfhdfghdfgh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(45, 'Rui Miguel <CacerFTW@hotmail.com>', 'gdfgdfgd', 'Thu, 11 May 2017 14:07:22 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdfgdfgdf\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(46, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', 'Thu, 11 May 2017 14:08:57 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndawdadawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(47, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdawdawd', 'Thu, 11 May 2017 14:15:01 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdwd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(48, 'Rui Miguel <CacerFTW@hotmail.com>', '1312312', 'Thu, 11 May 2017 14:17:12 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123123123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(49, 'Rui Miguel <CacerFTW@hotmail.com>', '23123', 'Thu, 11 May 2017 14:19:51 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n12312312313\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(50, 'Rui Miguel <CacerFTW@hotmail.com>', '1231231', 'Thu, 11 May 2017 14:20:49 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n312123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(51, 'Rui Miguel <CacerFTW@hotmail.com>', 'ddd', 'Thu, 11 May 2017 14:22:26 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nddd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(52, 'Ru?ben Dias <Rubendd@live.com.pt>', 'Na?o leias', 'Thu, 11 May 2017 14:24:37 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanda Rrrrrrrrrrrrrrix\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nSem vÃ­rus. \r\nwww.avast.com \r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(53, 'Diogo Banha <diogobanha97@gmail.com>', 'ERROU!', 'Thu, 11 May 2017 15:28:11 +0100', 'O rix Ã© o faustÃƒÂ£o\r\n', 'Aberto', 4, 1),
(54, 'PHP Classes Newclasses <list-newclasses@phpclasses.org>', '[PHP Classes] Added a new class: Apple iOS build', '11 May 2017 12:19:16 -0000', '\r\n\r\n\r\n\r\nAdded a new class: Apple iOS build - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          Added a new class: Apple iOS build\r\n        \r\n        Conquer the Data Layer in StyleHost a database with Compose and get a free t-shirt!\r\n        teste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n\r\n\r\n\r\nClass:\r\nApple iOS buildThis class support forum\r\nShort description:\r\n\r\nGet the version of a iOS build and version codes\r\nGroups:\r\n\r\nPHP 5, Mac OS, Parsers\r\n\r\n\r\n\r\n\r\nSupplied by:Peter Kahl\r\nDetailed descripti', 'Aberto', 4, 1),
(55, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'as', 'Wed, 10 May 2017 11:48:28 +0100', 'Ã¢Â€Â‹asabody\r\n', 'Aberto', 4, 1),
(56, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfhfdfh', 'Thu, 11 May 2017 11:41:16 +0000', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfhhdfhdfdhfdfhfhd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(57, 'Track IT Testes <testetrackit@gmail.com>', 'teste query', 'Fri, 12 May 2017 10:08:11 +0100', 'Select * from emails', 'Aberto', 4, 1);

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
(1, 'body', '2017-05-12 09:16:09', 2),
(2, 'asas', '2017-05-12 09:38:16', 2),
(3, 'teste', '2017-05-12 09:55:23', 3),
(4, 'testeando', '2017-05-12 10:03:35', 5),
(5, 'as', '2017-05-12 10:04:32', 6),
(6, 'asasa', '2017-05-12 10:04:50', 6),
(7, 'ss', '2017-05-12 10:06:13', 4),
(8, 'tes', '2017-05-12 10:09:07', 57);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
