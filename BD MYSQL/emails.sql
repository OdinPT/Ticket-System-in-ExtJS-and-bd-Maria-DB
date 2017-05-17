-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2017 às 15:48
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
(4, 'odinpt21 <odinpt21@gmail.com>', 'vvvvvv', '2017-05-16 18:27:55', 'aaa', 'Aberto', 4, 1),
(6, 'teste trackit <testetrackit@gmail.com>', '12312', '2017-05-16 18:49:19', '312313123\r\n', 'Fechado', 4, 2),
(7, 'Track IT Gmail <testetrackit@gmail.com>', 'as', '2017-05-16 19:36:57', 'TestTesteTasdasdasdasdasDasdAsdAsdAsDaSdASAasÂ ', 'Aberto', 1, 1),
(8, 'teste trackit <testetrackit@gmail.com>', 'PT', '2017-05-16 19:36:57', 'PT223\r\n', 'Aberto', 1, 1),
(9, 'Microsoft Outlook <odinpt21@gmail.com>', 'Mensagem de Teste do Microsoft Outlook', '2017-05-16 19:36:58', 'Esta ÃƒÂ© uma mensagem de e-mail enviada automaticamente pelo Microsoft Outlook ao testar as definiÃ§Ãµes da conta do utilizador.\r\n', 'Aberto', 1, 1),
(13, 'Track IT Testes <testetrackit@gmail.com>', 'dezasseis maio', '2017-05-16 22:14:55', 'Maio:PÂ ', 'Fechado', 4, 2),
(14, 'teste trackit <testetrackit@gmail.com>', 'awdawd', '2017-05-17 09:49:39', 'awdawdawdawdaw\r\n', 'Aberto', 4, 3),
(15, 'teste trackit <testetrackit@gmail.com>', 'Ã§a?dÃ§awdaÃ§da?wÃ§dawÃ§dadw', '2017-05-17 10:19:50', '~Ã§awdÃ£wÃ§dawÃ§dawd~ad~wÃ§daw~daÃ§wda\r\n', 'Aberto', 4, 1),
(16, 'teste trackit <testetrackit@gmail.com>', '1231', '2017-05-17 11:06:03', '2312313\r\n', 'Fechado', 4, 2),
(17, 'teste trackit <testetrackit@gmail.com>', '12312313', '2017-05-17 11:06:04', '\r\n', 'Aberto', 4, 1),
(18, 'teste trackit <testetrackit@gmail.com>', 'adawd', '2017-05-17 11:07:03', 'awdawd\r\n', 'Aberto', 4, 3),
(19, 'teste trackit <testetrackit@gmail.com>', 'awdawdawd', '2017-05-17 14:21:18', 'dawdad\r\n', 'Aberto', 4, 1),
(20, 'teste trackit <testetrackit@gmail.com>', 'dadawdad', '2017-05-17 14:21:19', 'awdawdawdawd\r\n', 'Aberto', 4, 1),
(21, 'teste trackit <testetrackit@gmail.com>', 'awd', '2017-05-17 14:21:19', 'awdawdawd\r\n', 'Aberto', 4, 1),
(22, 'teste trackit <testetrackit@gmail.com>', 'dawdawdawd', '2017-05-17 14:21:19', 'wadawdaw\r\n', 'Aberto', 4, 1),
(23, 'teste trackit <testetrackit@gmail.com>', 'awdawda', '2017-05-17 14:21:20', 'wawdawda\r\n', 'Aberto', 4, 1),
(24, 'teste trackit <testetrackit@gmail.com>', '12312', '2017-05-17 14:21:20', '121\r\n', 'Aberto', 4, 1);

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
(1, 'as', '2017-05-16 18:21:23', 14),
(2, 'teste', '17-04-2017', 4);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
