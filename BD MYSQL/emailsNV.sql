-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Maio-2017 às 18:12
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaFuncionario` ()  NO SQL
Begin

SELECT * FROM funcionario ORDER BY id_funcionario;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFuncionario` (IN `_id` INT(11))  NO SQL
BEGIN

DELETE FROM funcionario WHERE id_funcionario=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ForcLimpeza` ()  NO SQL
BEGIN
SET GLOBAL FOREIGN_KEY_CHECKS= 0;
TRUNCATE table emails;
SET GLOBAL FOREIGN_KEY_CHECKS=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `FuncSelecionado` (IN `_id` INT)  NO SQL
Begin

SELECT * FROM funcionario WHERE id_funcionario=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirCliente` (IN `_NC` VARCHAR(150), IN `_EC` VARCHAR(100), IN `_DNC` DATE, IN `_CC` INT(10))  NO SQL
BEGIN 


    INSERT INTO cliente
         (
           Nome_Cliente,
           Email_Cliente,
           DataNasc_Cliente,
           Contribuinte_Cliente)
           
    VALUES 
         ( 
           
        _NC, 
        _EC, 
       _DNC,
        _CC) ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirFuncionario` (IN `_name` VARCHAR(100), IN `_pass` VARCHAR(100), IN `_idDepar` INT(11), IN `_TP` INT(11))  NO SQL
Begin

INSERT INTO funcionario
		(
    	username,
       	pass,
       	id_departamento_funcionarios,
        Tipo_Funcionario) 

		VALUES (
            _name,
            _pass,
            _idDepar,
            _TP);
End$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirTickets2` (IN `_mail` VARCHAR(100), IN `_from` VARCHAR(150), IN `_subject` VARCHAR(250), IN `_message` VARCHAR(700), IN `_user` VARCHAR(100))  BEGIN 


    INSERT INTO emails
         (
              email,
           fromaddress,
            
           subject,
           datea,
           body,
           id_departamento_emails)
           
    VALUES 
         ( 
          _mail, 
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
from funcionario 
where username = _username and pass = _password;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MudaGrupo` (IN `_id` INT(11))  BEGIN

UPDATE emails 

SET id_grupo_emails = MudaGrupoTicket(`id_grupo_emails`), state = MudaEstado(`state`) where id=_id;


   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RespostaSelecionada` (IN `_id` INT(11))  NO SQL
Begin

SELECT `id_resp`,`body_resp`,`datea_resp`,`id_email`
FROM `respostas` 
WHERE `id_email`=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RetornaTipoUtilizador` (IN `_mail` VARCHAR(100))  NO SQL
BEGIN

SELECT Tipo_Funcionario FROM funcionario WHERE username =_mail;
End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowBody` (IN `_id` INT)  BEGIN
SELECT id,email,fromaddress,body,subject,datea,state,nome_departamento
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
	SELECT `id`,`email`,`fromaddress`,`subject`,`datea`,`state`,`nome_departamento` 
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
 SELECT id, fromaddress, subject, datea ,body ,`state`,`nome_departamento`,nome_grupo 
 
 FROM emails,grupo, departamento
 
 where (id_departamento_emails=id_departamento) and (`id_grupo_emails`=id_grupo) and nome_grupo="Historico" and  (id=_id); 
 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelecRecovered` (IN `_id` INT)  BEGIN
	SELECT id, fromaddress, subject, datea ,body ,`state`,`nome_departamento`,nome_grupo
    
		FROM emails,departamento, grupo 
	where (id_departamento_emails=id_departamento) and nome_grupo="Recuperado" and  (id=_id); 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerClientes` ()  NO SQL
BEGIN
select * from cliente;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerClienteSelecionado` (IN `mail` INT(100))  NO SQL
BEGIN

SELECT `id_funcionario`,`username`,`pass`,nome_departamento,Descricao_TipoUtilizador AS Tipo_Utilizador

FROM funcionario, departamento,tipoutilizador

where (`id_departamento_funcionarios`= id_departamento) and (Tipo_Funcionario= ID_TipoUtilizador) and(id_funcionario =mail)
ORDER BY id_funcionario;


End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerFuncionario` ()  NO SQL
BEGIN
SELECT `id_funcionario`,`username`,`pass`,`nome_departamento`,`Descricao_TipoUtilizador` 
FROM funcionario, departamento, tipoutilizador
where (id_departamento_funcionarios= id_departamento) and Tipo_Funcionario= ID_TipoUtilizador;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerFuncSelecionado` (IN `_id` INT(11))  NO SQL
Begin

SELECT * FROM funcionario WHERE id_funcionario=_id
ORDER BY id_funcionario;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicket` ()  BEGIN

select `id`,`email`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y %h:%i') As datea,`body`, `state`,`nome_departamento`

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

SELECT `id_departamento_funcionarios` INTO temp FROM funcionario WHERE username=_Nome;
return temp;

End$$

CREATE DEFINER=`root`@`localhost` FUNCTION `MudaEstado` (`_estado` VARCHAR(12)) RETURNS VARCHAR(10) CHARSET latin1 BEGIN
    DECLARE a varchar(10);
 
    IF (_estado = 'Aberto')  THEN
 		SET a = 'Lido';
    ELSEIF (_estado = 'Lido') THEN
        SET a = 'Atribuido';
     ELSEIF (_estado = 'Atribuido') THEN
       SET a = 'Fechado';
     ELSEIF (_estado = 'Fechado') THEN
       SET a = 'Reaberto'; 
     ELSEIF (_estado = 'Reaberto') THEN
       SET a = 'Fechado';
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

CREATE DEFINER=`root`@`localhost` FUNCTION `VerificaClienteExiste` (`_email` VARCHAR(100)) RETURNS TINYINT(1) NO SQL
Begin
declare temp bool;
SET temp = 0;

 
    SELECT EXISTS(SELECT `Email_Cliente`, `email` FROM `cliente`,`emails` where `Email_Cliente`=_email)
    INTO temp ;
    RETURN temp;

return temp;
End$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `Nome_Cliente` varchar(100) NOT NULL,
  `Email_Cliente` varchar(100) DEFAULT NULL,
  `DataNasc_Cliente` date DEFAULT NULL,
  `Contribuinte_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nome_Cliente`, `Email_Cliente`, `DataNasc_Cliente`, `Contribuinte_Cliente`) VALUES
(1, 'TesteTrackIT', 'testetrackit@gmail.com', '2017-05-31', 123),
(2, 'teste', 'teste', '2017-05-10', 1211),
(3, '', '', '0000-00-00', 0),
(4, 'g', 'g', '2017-06-30', 0),
(5, 'das', 'g', '2017-05-19', 21),
(6, 'qqq', 'qqq', '2017-05-30', 1231),
(7, 'asdas', 'asa', '2017-05-17', 0),
(8, '', '', '0000-00-00', 0),
(9, 'as', 'as', '2017-05-09', 123),
(10, 'ttt', 'ttt', '2017-05-10', 231),
(11, 'r', 'w', '2017-05-12', 12),
(12, 'teste1646', 'tes@gmasas', '2017-05-03', 0),
(13, 'w', 's', '2017-05-10', 0),
(14, '3', '2', '2017-05-10', 23);

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
  `email` varchar(150) NOT NULL,
  `fromaddress` varchar(230) NOT NULL,
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

INSERT INTO `emails` (`id`, `email`, `fromaddress`, `subject`, `datea`, `body`, `state`, `id_departamento_emails`, `id_grupo_emails`) VALUES
(1, 'testetrackit@gmail.com', 'teste trackit <testetrackit@gmail.com>', 'hoje', '2017-05-22 11:20:55', 'teste\r\n\r\n\r\n', 'Aberto', 4, 1),
(2, 'odinpt21@gmail.com', 'odinpt21 <odinpt21@gmail.com>', 'asa', '2017-05-22 11:23:05', 'asasdas', 'Aberto', 4, 1),
(3, 'odinpt21@gmail.com', 'odinpt21 <odinpt21@gmail.com>', 'xx', '2017-05-22 11:23:06', 'gggggg', 'Fechado', 4, 2),
(4, 'list-notable@phpclasses.org', 'PHP Classes Notable <list-notable@phpclasses.org>', '[PHP Classes] Notable PHP package: PHP Wscript.shell Exec', '2017-05-22 15:30:11', '\r\n\r\n\r\n\r\nNotable PHP package: PHP Wscript.shell Exec - PHP Classes\r\n\r\n\r\n\r\nWScript is an environment for executing scripts that takes advantage of objects running on Windows that provide several types of services.\r\n\r\nThis class provides means to execute actions from PHP using WScript that can be useful, like for instance running Windows applications and simulating keyboard typing events.\r\n\r\n\r\n\r\n   \r\n    \r\n      \r\n        \r\n          Notable PHP package: PHP Wscript.shell Exec\r\n        \r\n        Know when and why code breaksUsers finding bugs? Searching logs for errors? Find + fix broken code fast!\r\n        \r\n\r\nteste, a PHP package is considered Notable when it does something different that is ', 'Aberto', 4, 1),
(6, 'odinpt21@gmail.com', 'odinpt21 <odinpt21@gmail.com>', 'sdasdasdasd', '2017-05-25 17:12:47', 'ssss', 'Aberto', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL,
  `Descricao_Estado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`ID_Estado`, `Descricao_Estado`) VALUES
(1, 'Aberto'),
(2, 'Lido'),
(3, 'Atribuido'),
(4, 'Fechado '),
(5, 'Reaberto ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ficheiro`
--

CREATE TABLE `ficheiro` (
  `ID_File` int(10) NOT NULL,
  `F_File` binary(200) NOT NULL,
  `Email_File` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `id_departamento_funcionarios` int(11) NOT NULL,
  `Tipo_Funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `username`, `pass`, `id_departamento_funcionarios`, `Tipo_Funcionario`) VALUES
(1, 'odinpt21@gmail.com', 'abcd1995', 1, 3),
(2, 'testetrackit@gmail.com', 'testetrackit123', 3, 3),
(3, 'testetrackit2@gmail.com', 'testetrackit123', 3, 2),
(4, 'no-reply@trackit.pt', 'tr4ck1t', 2, 3),
(29, 'admin', 'admin', 3, 3),
(30, 'abc', 'abc', 3, 3),
(32, 'f', 'f', 3, 3);

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
-- Estrutura da tabela `historicoestados`
--

CREATE TABLE `historicoestados` (
  `id_historicoTicket` int(11) NOT NULL,
  `HoraAtribuicao_Estado` datetime NOT NULL,
  `ID_Ticket` int(11) NOT NULL,
  `ID_EstadoTicket` int(11) NOT NULL,
  `Data_AlteracaoEstado` date NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE `respostas` (
  `id_resp` int(11) NOT NULL,
  `body_resp` varchar(700) NOT NULL,
  `datea_resp` date NOT NULL,
  `id_email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `respostas`
--

INSERT INTO `respostas` (`id_resp`, `body_resp`, `datea_resp`, `id_email`) VALUES
(1, 'teste', '2017-05-01', 1),
(2, 'teste', '2017-05-22', 6),
(3, 'resposta 1640', '2017-05-21', 2),
(4, 'testetetete', '2017-05-22', 4),
(5, 'teste', '2017-05-22', 2),
(6, 'ontem', '2017-05-22', 1),
(7, 'ontem', '2017-05-22', 1),
(8, 'hoje', '2017-05-22', 8),
(9, 'hoje', '2017-05-22', 8),
(10, 'teste', '2017-05-22', 9),
(11, 'dd', '2017-05-24', 1),
(12, 's', '2017-05-24', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoutilizador`
--

CREATE TABLE `tipoutilizador` (
  `ID_TipoUtilizador` int(11) NOT NULL,
  `Descricao_TipoUtilizador` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoutilizador`
--

INSERT INTO `tipoutilizador` (`ID_TipoUtilizador`, `Descricao_TipoUtilizador`) VALUES
(1, 'Normal'),
(2, 'Admin'),
(3, 'Super User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

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
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indexes for table `ficheiro`
--
ALTER TABLE `ficheiro`
  ADD PRIMARY KEY (`ID_File`),
  ADD KEY `file_fk_email` (`Email_File`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `funcionarios_fk_departamentos` (`id_departamento_funcionarios`),
  ADD KEY `funcionario_fk_TP` (`Tipo_Funcionario`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indexes for table `historicoestados`
--
ALTER TABLE `historicoestados`
  ADD PRIMARY KEY (`id_historicoTicket`),
  ADD KEY `historicoestados_fk_emails` (`ID_EstadoTicket`),
  ADD KEY `historicoEstados_FK_Utilizadores` (`id_funcionario`);

--
-- Indexes for table `respostas`
--
ALTER TABLE `respostas`
  ADD PRIMARY KEY (`id_resp`),
  ADD KEY `respostas_FK_emails` (`id_email`);

--
-- Indexes for table `tipoutilizador`
--
ALTER TABLE `tipoutilizador`
  ADD PRIMARY KEY (`ID_TipoUtilizador`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ficheiro`
--
ALTER TABLE `ficheiro`
  MODIFY `ID_File` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `historicoestados`
--
ALTER TABLE `historicoestados`
  MODIFY `id_historicoTicket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tipoutilizador`
--
ALTER TABLE `tipoutilizador`
  MODIFY `ID_TipoUtilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_FK_Departamento` FOREIGN KEY (`id_departamento_emails`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emails_FK_grupos` FOREIGN KEY (`id_grupo_emails`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ficheiro`
--
ALTER TABLE `ficheiro`
  ADD CONSTRAINT `file_fk_email` FOREIGN KEY (`Email_File`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_fk_TP` FOREIGN KEY (`Tipo_Funcionario`) REFERENCES `tipoutilizador` (`ID_TipoUtilizador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento_funcionarios`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `historicoestados`
--
ALTER TABLE `historicoestados`
  ADD CONSTRAINT `historicoEstados_FK_Utilizadores` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicoestados_fk_emails` FOREIGN KEY (`ID_EstadoTicket`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicoestados_fk_estado` FOREIGN KEY (`ID_EstadoTicket`) REFERENCES `estado` (`ID_Estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_FK_emails` FOREIGN KEY (`id_email`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
