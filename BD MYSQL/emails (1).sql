-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11-Jun-2017 às 16:37
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
truncate table upload;
truncate table respostas;
SET GLOBAL FOREIGN_KEY_CHECKS=1;
end$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `inserirhistoricoestados` (IN `hora` DATE, IN `IdTicket` INT, IN `IDEstado` INT, IN `DataAlt` INT, IN `IDNEstado` INT, IN `IDFuncEst` VARCHAR(30))  BEGIN

    INSERT INTO historicoestados2
         (
			HoraAtribuicaoEstado,
         	IdTicketEstado,
         	IDEstadoEstado,
             DataAlteracaoEstado,
			IDNovoEstado,
			IDFuncEstado)
          
          
    VALUES 
         ( 
          Now(),
         IdTicket,
         IDEstado,
         DataAlt,
         IDNEstado,
        retornaIdMail(IDFuncEst)) ; 


END$$

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

SELECT `id_resp`,`subject_resp`,`body_resp`,`datea_resp`,`id_email`
FROM `respostas` 
WHERE `id_email`=_id;

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

SELECT `id_resp`,`subject_resp`,`body_resp`,DATE_FORMAT(`datea_resp`,'%d/%m/%Y %T')AS Data
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

 SELECT `id_email`,`datea_resp`,`body_resp`,`subject_resp`,`id_resp` FROM respostas,emails where id_email=id and(`id_email`=_ID_Ticket);

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



SELECT `id_funcionario`,`username`,`pass`,nome_departamento,Descricao_TipoUtilizador AS Tipo_Utilizador

FROM funcionario, departamento,tipoutilizador

where (`id_departamento_funcionarios`= id_departamento) and `Tipo_Funcionario`= ID_TipoUtilizador and id_funcionario=_id
ORDER BY id_funcionario;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicket` (IN `_iddep` INT(11))  BEGIN

select `id`,`email`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y %h:%i') As datea,`body`, `state`,`nome_departamento`

from emails, departamento, grupo

where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Ticket') and (id_departamento_emails=_iddep)

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

CREATE DEFINER=`root`@`localhost` FUNCTION `retornaIdMail` (`mail` VARCHAR(100)) RETURNS INT(100) BEGIN
declare temp int(11);

SELECT `id_funcionario` INTO temp FROM funcionario WHERE username like mail;
return temp;

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
  `Email_Cliente` varchar(100) NOT NULL,
  `DataNasc_Cliente` date NOT NULL,
  `Contribuinte_Cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nome_Cliente`, `Email_Cliente`, `DataNasc_Cliente`, `Contribuinte_Cliente`) VALUES
(1, 'Teste', 'trackit@gmail.com', '2017-05-15', 123),
(2, 'Leonardo Almeida', 'leonardo.almeidavieira@gmail.com', '1995-06-28', 32123);

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
(2, 'Operations'),
(3, 'N/D'),
(4, 'Devellopers'),
(19, 'awd'),
(20, 'waawaawa');

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
(1, 'testetrackit@gmail.com', 'Track IT Testes <testetrackit@gmail.com>', 'sabado', '2017-06-11 03:24:34', 'sabado\r\n\r\n', 'Sendo Lido', 1, 1),
(2, 'testetrackit@gmail.com', 'Track IT Testes <testetrackit@gmail.com>', 's', '2017-06-11 03:24:35', '231231~\r\n\r\n\r\n\r\nasasdas\r\n\r\n', 'Sendo Lido', 1, 1),
(3, 'testetrackit@gmail.com', 'Track IT Testes <testetrackit@gmail.com>', '1531', '2017-06-11 03:24:35', '1531\r\n\r\n', 'Sendo Lido', 1, 1),
(4, 'leonardo.almeidavieira@gmail.com', 'Leonardo Almeida <leonardo.almeidavieira@gmail.com>', 'teste', '2017-06-11 03:24:36', '--\r\n*__*\r\n\r\n*Leonardo Almeida*\r\n', 'Sendo Lido', 1, 1),
(5, 'testetrackit@gmail.com', 'Track IT Testes <testetrackit@gmail.com>', 'sexta2', '2017-06-11 03:24:36', 'Serxta12\r\n\r\n', 'Lido', 1, 1),
(6, 'testetrackit@gmail.com', 'Track IT Testes <testetrackit@gmail.com>', 'sexta', '2017-06-11 03:24:37', 'Sexta feira\r\n\r\ntestetrackit\r\n\r\n', 'Sendo Lido', 1, 1);

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
(36, 'teste2', 'teste2', 2, 3),
(37, 'testetrackit@gmail.com', 'testetrackit123', 1, 4),
(38, 'testetrackit2@gmail.com', 'testetrackit123', 2, 4),
(39, 'admin', 'admin', 2, 3),
(40, 'odinpt21@gmail.com', 'abcd1995', 1, 3),
(41, '2', '2', 4, 3);

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
-- Estrutura da tabela `historicoestados2`
--

CREATE TABLE `historicoestados2` (
  `idHistoricoEstados` int(11) NOT NULL,
  `HoraAtribuicaoEstado` date DEFAULT NULL,
  `IdTicketEstado` int(11) DEFAULT NULL,
  `IDEstadoEstado` int(11) DEFAULT NULL,
  `DataAlteracaoEstado` int(11) DEFAULT NULL,
  `IDFuncEstado` int(30) DEFAULT NULL,
  `IDNovoEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historicoestados2`
--

INSERT INTO `historicoestados2` (`idHistoricoEstados`, `HoraAtribuicaoEstado`, `IdTicketEstado`, `IDEstadoEstado`, `DataAlteracaoEstado`, `IDFuncEstado`, `IDNovoEstado`) VALUES
(1, '0000-00-00', 16, 2, 2, 39, 2),
(3, '0000-00-00', 4, 1231, 1231, 37, 1231),
(4, '0000-00-00', 6, 42, 4131, 37, 23423),
(5, '0000-00-00', 1, 23, 232323, 37, 123),
(6, '2017-06-11', 1, 10000, 212, 37, 3123123),
(7, '2017-06-11', 1, 2, 1231232, 37, 123),
(8, '2017-06-11', 2, 0, 34, 37, 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicoestadosantiga`
--

CREATE TABLE `historicoestadosantiga` (
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
  `subject_resp` varchar(150) CHARACTER SET latin1 NOT NULL,
  `body_resp` varchar(700) NOT NULL,
  `datea_resp` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'Super User'),
(4, 'EmailDeDepartamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `content` mediumblob NOT NULL,
  `id_ticket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `historicoestados2`
--
ALTER TABLE `historicoestados2`
  ADD PRIMARY KEY (`idHistoricoEstados`),
  ADD KEY `IdTicketEstado_idx` (`IdTicketEstado`),
  ADD KEY `IDEstadoEstado_idx` (`IDEstadoEstado`),
  ADD KEY `IDNovoEstado_idx` (`IDNovoEstado`),
  ADD KEY `IDFuncEstado_idx` (`IDFuncEstado`);

--
-- Indexes for table `historicoestadosantiga`
--
ALTER TABLE `historicoestadosantiga`
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
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `historicoestados2`
--
ALTER TABLE `historicoestados2`
  MODIFY `idHistoricoEstados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `historicoestadosantiga`
--
ALTER TABLE `historicoestadosantiga`
  MODIFY `id_historicoTicket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `respostas`
--
ALTER TABLE `respostas`
  MODIFY `id_resp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipoutilizador`
--
ALTER TABLE `tipoutilizador`
  MODIFY `ID_TipoUtilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_fk_emails` FOREIGN KEY (`id_email`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
