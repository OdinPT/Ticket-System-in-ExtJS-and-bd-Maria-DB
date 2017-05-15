-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15-Maio-2017 às 23:54
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirTickets2` (IN `_from` VARCHAR(150), IN `_subject` VARCHAR(250), IN `_message` VARCHAR(700), IN `_user` VARCHAR(100))  BEGIN 


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
          Now(),
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

select `id`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y %h:%i') As datea,`body`, `state`,`nome_departamento`

from emails, departamento, grupo

where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Ticket')

order by id asc;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicketHistorico` ()  BEGIN
	select`id`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y %h:%i') As datea,`body`,`state`,`nome_departamento`,`nome_grupo` 
from emails, departamento, grupo
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
  `datea` datetime NOT NULL,
  `body` varchar(700) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Aberto',
  `id_departamento_emails` int(11) DEFAULT '3',
  `id_grupo_emails` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`, `id_departamento_emails`, `id_grupo_emails`) VALUES
(2, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'body', '2017-05-12 14:52:44', 'txt 2\r\n', 'Fechado', 4, 2),
(3, 'teste trackit <testetrackit@gmail.com>', 'Teste 123', '2017-05-12 14:52:45', 'Teste Teste Teste\r\n', 'Aberto', 4, 1),
(4, 'Tudo Sobre Informa?tica <tudosbinformatica@gmail.com>', 'testetr', '2017-05-12 14:52:46', 'asasÃ¢Â€Â‹aÃ¢Â€Â‹\r\n', 'Aberto', 4, 1),
(5, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'msx', '2017-05-12 14:52:46', 'asasasas\r\n', 'Aberto', 4, 2),
(6, 'teste trackit <testetrackit@gmail.com>', 'Teste Ticket', '2017-05-12 14:52:46', 'Ticket teste\r\n', 'Fechado', 4, 2),
(7, 'Track IT Testes <testetrackit@gmail.com>', 'MS', '2017-05-12 14:52:47', 'asas', 'Aberto', 4, 1),
(8, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'reunia?o 1', '2017-05-12 14:52:48', 'ReuniÃƒÂ£o\r\n', 'Aberto', 4, 1),
(9, 'PHP Classes Newclasses <list-newclasses@phpclasses.org>', '[PHP Classes] New class daily digest of 2017-05-09', '2017-05-12 14:52:49', '\r\n\r\n\r\n\r\nNew class daily digest of 2017-05-09 - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          New class daily digest of 2017-05-09\r\n        \r\n        Monitor your stack!Try Datadog for free and monitor all your data in one place! Servers, clouds, apps, and more.\r\n        teste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n2 new classes were added to &quot;PHP Classes&quot; repository.\r\n\r\n1. PHP Twitter Search PHP SDK - This class support forum\r\n\r\n\r\nShort description:\r\n\r\nSearch for tweets and users ', 'Aberto', 4, 1),
(11, 'teste trackit <testetrackit@gmail.com>', 'awdawdawd', '2017-05-12 14:52:49', 'adawdawdad\r\n', 'Aberto', 4, 1),
(12, 'teste trackit <testetrackit@gmail.com>', '13123', '2017-05-12 14:52:50', '13123123\r\n', 'Aberto', 4, 1),
(13, 'teste trackit <testetrackit@gmail.com>', '123123', '2017-05-12 14:52:50', '123131312\r\n', 'Aberto', 4, 1),
(14, 'teste trackit <testetrackit@gmail.com>', '1dasd', '2017-05-12 14:52:51', 'awdawdawd\r\n', 'Aberto', 4, 3),
(15, 'teste trackit <testetrackit@gmail.com>', 'er gerg erg e', '2017-05-12 14:52:52', 'ger gegererg\r\n', 'Aberto', 4, 1),
(16, 'teste trackit <testetrackit@gmail.com>', 'dfgsdgsd', '2017-05-12 14:52:52', 'gds fgsd sdfgsdf\r\n', 'Aberto', 4, 1),
(17, 'teste trackit <testetrackit@gmail.com>', '123123', '2017-05-12 14:52:52', '123123123123123123\r\n', 'Aberto', 4, 1),
(18, 'teste trackit <testetrackit@gmail.com>', 'hhh', '2017-05-12 14:52:53', 'fghfghfghfgh\r\n', 'Aberto', 4, 1),
(19, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdaw', '2017-05-12 14:52:53', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(20, 'Rui Miguel <CacerFTW@hotmail.com>', 'gfgd', '2017-05-12 14:52:53', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(21, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', '2017-05-12 14:52:54', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(22, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfgdfg', '2017-05-12 14:52:54', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ntawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(23, 'Rui Miguel <CacerFTW@hotmail.com>', '23123', '2017-05-12 14:52:54', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(24, 'Rui Miguel <CacerFTW@hotmail.com>', 'adawd', '2017-05-12 14:52:54', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(25, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawda', '2017-05-12 14:52:54', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndsadsads\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(26, 'Rui Miguel <CacerFTW@hotmail.com>', '1aawda', '2017-05-12 14:52:55', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawaw\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(27, 'Rui Miguel <CacerFTW@hotmail.com>', '31231', '2017-05-12 14:52:55', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nadad\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(28, 'Rui Miguel <CacerFTW@hotmail.com>', '13212', '2017-05-12 14:52:55', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(29, 'Rui Miguel <CacerFTW@hotmail.com>', '11231212', '2017-05-12 14:52:55', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n1121121\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(30, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfgdg', '2017-05-12 14:52:55', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfgdfgdf\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(31, 'Rui Miguel <CacerFTW@hotmail.com>', '44345 3sdf', '2017-05-12 14:52:56', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nsdsfds\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(32, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfhfdfh', '2017-05-12 14:52:56', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfhhdfhdfdhfdfhfhd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(33, 'teste trackit <testetrackit@gmail.com>', '131231', '2017-05-12 14:52:57', '31231231\r\n', 'Aberto', 4, 1),
(34, 'Rui Miguel <CacerFTW@hotmail.com>', '12312312', '2017-05-12 14:52:57', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n31312312313123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(35, 'Rui Miguel <CacerFTW@hotmail.com>', 'dgdg', '2017-05-12 14:52:58', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nsdgsgdsgdsdg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(36, 'Rui Miguel <CacerFTW@hotmail.com>', '123123', '2017-05-12 14:52:58', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n12312312\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(37, 'Track IT Testes <testetrackit@gmail.com>', 'xxx', '2017-05-12 14:52:58', 'Testeâ€¦Â ', 'Aberto', 4, 1),
(38, 'Rui Miguel <CacerFTW@hotmail.com>', '221312', '2017-05-12 14:52:58', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n312312312123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(39, 'Rui Miguel <CacerFTW@hotmail.com>', 'dgsdg', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdgg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(40, 'Rui Miguel <CacerFTW@hotmail.com>', 'dhhh', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nhhhhgdfhdfghdfgh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(41, 'Rui Miguel <CacerFTW@hotmail.com>', 'gdfgdfgd', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdfgdfgdf\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(42, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndawdadawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(43, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawdawdawd', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdwd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(44, 'Rui Miguel <CacerFTW@hotmail.com>', '1312312', '2017-05-12 14:52:59', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123123123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(45, 'Rui Miguel <CacerFTW@hotmail.com>', '23123', '2017-05-12 14:53:00', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n12312312313\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(46, 'Rui Miguel <CacerFTW@hotmail.com>', '1231231', '2017-05-12 14:53:00', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n312123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(47, 'Rui Miguel <CacerFTW@hotmail.com>', 'ddd', '2017-05-12 14:53:00', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nddd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(48, 'Ru?ben Dias <Rubendd@live.com.pt>', 'Na?o leias', '2017-05-12 14:53:00', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanda Rrrrrrrrrrrrrrix\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nSem vÃ­rus. \r\nwww.avast.com \r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(49, 'Diogo Banha <diogobanha97@gmail.com>', 'ERROU!', '2017-05-12 14:53:01', 'O rix Ã© o faustÃƒÂ£o\r\n', 'Aberto', 4, 1),
(50, 'PHP Classes Newclasses <list-newclasses@phpclasses.org>', '[PHP Classes] Added a new class: Apple iOS build', '2017-05-12 14:53:01', '\r\n\r\n\r\n\r\nAdded a new class: Apple iOS build - PHP Classes\r\n\r\n\r\n\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          Added a new class: Apple iOS build\r\n        \r\n        Conquer the Data Layer in StyleHost a database with Compose and get a free t-shirt!\r\n        teste you are getting this message as free service for being a user of the PHP Classes site to which you registered voluntarily using the email address testetrackit@gmail.com. If you wish to unsubscribe go to the unsubscribe page.\r\n\r\n\r\n\r\nClass:\r\nApple iOS buildThis class support forum\r\nShort description:\r\n\r\nGet the version of a iOS build and version codes\r\nGroups:\r\n\r\nPHP 5, Mac OS, Parsers\r\n\r\n\r\n\r\n\r\nSupplied by:Peter Kahl\r\nDetailed descripti', 'Aberto', 4, 1),
(51, 'Track IT Testes <testetrackit@gmail.com>', 'teste query', '2017-05-12 14:53:01', 'Select * from emails', 'Aberto', 4, 1),
(52, 'Rui Miguel <CacerFTW@hotmail.com>', '1231231', '2017-05-12 14:53:01', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n2312313123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(53, 'Rui Miguel <CacerFTW@hotmail.com>', '123123', '2017-05-12 14:53:01', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n1231231\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(54, 'Rui Miguel <CacerFTW@hotmail.com>', '2412312', '2017-05-12 14:53:02', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123123123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(55, 'Rui Miguel <CacerFTW@hotmail.com>', '12312', '2017-05-12 14:53:02', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n31231313\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(56, 'Rui Miguel <CacerFTW@hotmail.com>', 'hgfhfh', '2017-05-12 14:53:02', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nfghfghfgh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(57, 'Rui Miguel <CacerFTW@hotmail.com>', 'dfgdf', '2017-05-12 14:53:03', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdgd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(58, 'Rui Miguel <CacerFTW@hotmail.com>', 'fhfgh', '2017-05-12 14:53:03', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nfhfghfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(59, 'Tudosb Informa?tica <tudosbinformatica@gmail.com>', 'teste', '2017-05-12 14:53:03', 'Â Teste data auto-.', 'Aberto', 4, 1),
(60, 'Rui Miguel <CacerFTW@hotmail.com>', 'sadawdawd', '2017-05-12 14:53:03', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdawadaaaaa\r\n\r\n\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(61, 'Rui Miguel <CacerFTW@hotmail.com>', 'daawdadadaw', '2017-05-12 14:53:03', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nadadadadadadawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(62, 'Rui Miguel <CacerFTW@hotmail.com>', 'dgdfg', '2017-05-12 14:53:04', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfgdgdfgdfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(63, 'Rui Miguel <CacerFTW@hotmail.com>', 'gdfgdf', '2017-05-12 14:53:04', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndfgdfgdfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(65, 'Rui Miguel <CacerFTW@hotmail.com>', 'dawdawda', '2017-05-12 14:53:05', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nadadawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(66, 'Rui Miguel <CacerFTW@hotmail.com>', 'a', '2017-05-12 14:53:05', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(67, 'odinpt21 <odinpt21@gmail.com>', 'teste', '2017-05-12 14:53:05', 'Data actual?Â ', 'Aberto', 4, 1),
(69, 'Track IT Gmail <testetrackit@gmail.com>', 'as', '2017-05-12 15:12:05', 'TestTesteTasdasdasdasdasDasdAsdAsdAsDaSdASAasÂ ', 'Aberto', 1, 3),
(70, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'teste', '2017-05-12 15:12:06', 'antes da filtragem por email do departamento\r\n\r\n', 'Aberto', 1, 3),
(74, 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'as', '2017-05-15 14:17:56', 'Ã¢Â€Â‹asabody\r\n', 'Aberto', 4, 1),
(75, 'Rui Miguel <CacerFTW@hotmail.com>', 'ffggdfgdf', '2017-05-15 14:18:05', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ngdfgdfgdfgdfg\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(76, 'Rui Miguel <CacerFTW@hotmail.com>', 'ffg', '2017-05-15 14:18:06', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nfghfhfghfgh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(77, 'Rui Miguel <CacerFTW@hotmail.com>', 'fghfhfg', '2017-05-15 14:18:08', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nfhfghfghfgh\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(78, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawd', '2017-05-15 14:18:09', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdada\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(79, 'Rui Miguel <CacerFTW@hotmail.com>', 'GFHFGHFHGF', '2017-05-15 14:18:09', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdadadawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(80, 'Rui Miguel <CacerFTW@hotmail.com>', 'awaw', '2017-05-15 14:18:09', '\r\n\r\n\r\n\r\n\r\n\r\n\r\ndadawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(81, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdaw', '2017-05-15 14:18:09', '\r\n\r\n\r\n\r\n\r\n\r\n\r\naawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(82, 'Rui Miguel <CacerFTW@hotmail.com>', 'awdawaw', '2017-05-15 14:18:10', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nadawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(83, 'Rui Miguel <CacerFTW@hotmail.com>', '12312', '2017-05-15 14:18:10', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n3123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(84, 'Rui Miguel <CacerFTW@hotmail.com>', '12312daw', '2017-05-15 14:18:10', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nawdawdawdawd\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(85, 'Rui Miguel <CacerFTW@hotmail.com>', '2123', '2017-05-15 14:18:10', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n123\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(86, 'Rui Miguel <CacerFTW@hotmail.com>', '1', '2017-05-15 14:18:11', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n1\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(87, 'Rui Miguel <CacerFTW@hotmail.com>', '12313', '2017-05-15 14:18:12', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n12313\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(88, 'Rui Miguel <CacerFTW@hotmail.com>', 'fff', '2017-05-15 14:18:12', '\r\n\r\n\r\n\r\n\r\n\r\n\r\nff\r\n\r\n\r\n\r\n', 'Aberto', 4, 1),
(89, 'Rui Miguel <CacerFTW@hotmail.com>', '123', '2017-05-15 14:18:12', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n321\r\n\r\n\r\n\r\n', 'Aberto', 4, 1);

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
(4, 'testeando', '2017-05-12 10:03:35', 5),
(5, 'as', '2017-05-12 10:04:32', 6),
(6, 'asasa', '2017-05-12 10:04:50', 6),
(7, 'ss', '2017-05-12 10:06:13', 4),
(8, 'tes', '2017-05-12 10:09:07', 57),
(9, 'Aguenta la cm tretas!\r\n', '2017-05-12 12:02:02', 20),
(11, 'qwqw', '2017-05-12 15:11:12', 2),
(12, 'asasas', '15-05-2017', 70),
(13, 'autoload!?', '2017-05-15 09:44:45', 3),
(14, 'body', '2017-05-15 09:50:21', 3),
(15, 'asdas', '2017-05-15 14:22:19', 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
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
