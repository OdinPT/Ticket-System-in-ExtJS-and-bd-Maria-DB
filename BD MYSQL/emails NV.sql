-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Jul-2017 às 01:31
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagarDepartamento` (IN `_id` INT)  NO SQL
BEGIN

DELETE FROM departamento WHERE id_departamento=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagarEmails` (IN `_id` INT(10))  NO SQL
BEGIN

DELETE FROM emails WHERE (id=_id);

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ApagaResposta` (IN `_id` INT(11))  NO SQL
BEGIN

DELETE FROM respostas where id_resp=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizaDepartamento` (IN `_iddepartamento2` INT, IN `_nome` VARCHAR(200), IN `_id` INT)  NO SQL
BEGIN


UPDATE departamento 
SET id_departamento=_iddepartamento2, nome_departamento=_nome WHERE id_departamento=_id;

   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizaFuncionario` (IN `_user` VARCHAR(100), IN `_pass` VARCHAR(100), IN `_iddep` INT, IN `_tf` INT, IN `_id` INT)  NO SQL
Begin

UPDATE funcionario SET username=_username, pass=_pass, id_departamento_funcionarios=_iddep, Tipo_Funcionario=_tf WHERE id_funcionario=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaDepartamentos` ()  NO SQL
Begin

SELECT * FROM departamento ORDER BY id_departamento;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaDepSelec` (IN `_id` INT)  NO SQL
BEGIN

SELECT * FROM departamento WHERE id_departamento=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaEstados` ()  NO SQL
BEGIN

SELECT `ID_Estado`,`Descricao_Estado` FROM estado;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaFuncionarios` ()  NO SQL
BEGIN
SELECT `id_funcionario`,`username`,`pass`,`nome_departamento`,Descricao_TipoUtilizador FROM funcionario,departamento,tipoutilizador  where `id_departamento_funcionarios`=id_departamento and Tipo_Funcionario= ID_TipoUtilizador ORDER BY id_funcionario;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaFuncionariosDepart` (IN `_func` VARCHAR(230))  NO SQL
Begin

SELECT * FROM funcionario WHERE username like _func;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaFuncSelec` (IN `_id` INT)  NO SQL
BEGIN

SELECT `id_funcionario`,`username`,`pass`,`nome_departamento`,Descricao_TipoUtilizador FROM funcionario,departamento,tipoutilizador  where `id_departamento_funcionarios`=id_departamento and Tipo_Funcionario= ID_TipoUtilizador and id_funcionario=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaGridDepartamentoHistorico` (IN `_id` INT)  NO SQL
begin
select `idHistoricoDep`,`IdTicketDep`,`HoraAtribuicaoDep`,`HoraAtribuicaoDep`,`IDDepartamentoDep`,`IDFuncEstado` from historicodepartamentos where IdTicketDep= _id;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaHistoricoEstado` (IN `_id` INT)  NO SQL
Begin

SELECT `idHistoricoEstados`,`HoraAtribuicaoEstado`,`IdTicketEstado`,`Descricao_Estado`,`username`,DesTipoRes
FROM historicoestados, estado, funcionario,tipo_resolucao

where IDEstadoEstado=ID_Estado  and IDFuncEstado=id_funcionario and   IdTicketEstado = _id and `IdResTicket`=IdTipoRes order by idHistoricoEstados desc;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaInfo` (IN `_id` INT(11))  NO SQL
Begin

SELECT `id`,`datea`,`state`,nome_departamento
FROM `emails`,departamento 
WHERE id_departamento_emails=id_departamento and id=_id;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaRespostaSelecionada` (IN `_id` INT)  NO SQL
Begin

SELECT * FROM respostas WHERE id_resp=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaTiposResolução` ()  NO SQL
SELECT * FROM `tipo_resolucao`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CarregaTiposUtilizador` ()  NO SQL
BEGIN

SELECT * FROM tipoutilizador ORDER BY ID_TipoUtilizador;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ForcLimpeza` ()  NO SQL
BEGIN
SET GLOBAL FOREIGN_KEY_CHECKS= 0;
TRUNCATE table emails;
truncate table upload;
truncate table respostas;
truncate TABLE historicoestados;
TRUNCATE table historicodepartamentos;
TRUNCATE table Comentarios;


SET GLOBAL FOREIGN_KEY_CHECKS=1;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirDepartamento` (IN `_iddepartamento4` INT, IN `_nomedepartamento4` VARCHAR(100))  NO SQL
Begin

INSERT INTO departamento
					(id_departamento, 
			 		nome_departamento) 
 
 			VALUES (_iddepartamento4,_nomedepartamento4);

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirFicheiro` (IN `_file` VARCHAR(100), IN `_data` MEDIUMBLOB, IN `_id` INT)  NO SQL
Begin
INSERT INTO upload
		(nome, content, id_ticket) VALUES (_file, _data,_id);


end$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirHistoricoDepartamentos` (IN `IdTicket` INT(11), IN `IDDepart` INT(11), IN `IDFunc` VARCHAR(100))  NO SQL
BEGIN

    INSERT INTO historicodepartamentos 
    			( 
        `IdTicketDep`,
		`HoraAtribuicaoDep`,
		`IDDepartamentoDep`,
		`IDFuncEstado`) 
    
    VALUES ( 
        IdTicket,
        Now(),
        IDDepart,
         retornaIdMail(IDFunc));
   
   update  emails set emails.id_departamento_emails=IDDepart where id=IdTicket;
  
  End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inserirhistoricoestados` (IN `IdTicket` INT, IN `IDEstado` INT, IN `IDFuncEst` VARCHAR(30))  BEGIN

    INSERT INTO historicoestados
         (
			HoraAtribuicaoEstado,
         	IdTicketEstado,
         	IDEstadoEstado,
			IDFuncEstado)
          
          
    VALUES 
         ( 
          Now(),
         IdTicket,
         IDEstado,
        retornaIdMail(IDFuncEst));
        
update  emails set emails.state=IDEstado where id=IdTicket;
update emails set emails.id_Res_Ticket=idREs where id =IdTicket;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inserirhistoricoestados2` (IN `IdTicket` INT, IN `IDFuncEstado` VARCHAR(100), IN `idREs` INT)  NO SQL
Begin
 
 INSERT INTO historicoestados
         (
			HoraAtribuicaoEstado,
         	IdTicketEstado,
			IDFuncEstado,
        	IdResTicket)
    VALUES 
         ( 
          Now(),
         IdTicket,
        retornaIdMail(IDFuncEstado),
         idREs);
        
        update emails set emails.id_Res_Ticket= idREs where id =IdTicket;
              IF (idREs = 5)  THEN
 		update emails set emails.state = 5 where id= IdTicket;
             End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirRespostas` (IN `_subject` VARCHAR(100), IN `_body` VARCHAR(230), IN `_id_email` INT(11))  NO SQL
BEGIN 


    INSERT INTO respostas
         (
           subject_resp,
           body_resp,
           datea_resp,
         	id_email)   
          
    VALUES 
         ( 
           _subject,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `MudaEstado` (IN `_id` INT)  NO SQL
Begin
UPDATE emails SET state='6',id_grupo_emails=1 WHERE id=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MudaGrupo` (IN `_id` INT(11))  BEGIN

UPDATE emails 

SET id_grupo_emails = MudaGrupoTicket(id_grupo_emails), state = 5 where id=_id;

   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RespostaSelecionada` (IN `_id` INT(11))  NO SQL
Begin

SELECT `id_resp`,`subject_resp`,`body_resp`,`datea_resp`,`id_email`
FROM `respostas` 
WHERE id_email=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowBody` (IN `_id` INT)  BEGIN
SELECT id,email,fromaddress,body,subject,datea,Descricao_Estado,nome_departamento
FROM emails,departamento,grupo,estado 

WHERE id_departamento_emails=id_departamento and id_grupo_emails=id_grupo  and state=ID_Estado and id=_id;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `teste` (IN `_funcionario` VARCHAR(100), IN `_id` INT)  NO SQL
BEGIN

UPDATE emails SET id_func_emails= _funcionario WHERE id=_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelec` (IN `_id` INT(11))  NO SQL
BEGIN
 
SELECT `id`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y %H:%i') as `datea`,`body`,`Descricao_Estado`,`email`,nome_departamento,DesTipoRes,`id_func_emails`

FROM emails, departamento , estado,tipo_resolucao
WHERE `id_departamento_emails`=id_departamento and (`state`=ID_Estado)  and (id_Res_Ticket=`IdTipoRes`) and (id=_id);
  
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TicketSelecHistorico` (IN `_id` INT)  BEGIN
 SELECT id, fromaddress, subject, datea ,body ,`state`,`nome_departamento`,nome_grupo 
 
 FROM emails,grupo, departamento
 
 where (id_departamento_emails=id_departamento) and (`id_grupo_emails`=id_grupo) and nome_grupo="Historico" and  (id=_id); 
 
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerComentarioTicket` (IN `_id` INT)  NO SQL
BEGIN
SELECT * FROM `comentarios` WHERE `ID_Ticket` =_id;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDepFunc` (IN `_tipo` INT)  NO SQL
BEGIN

SELECT * FROM funcionario WHERE id_departamento_funcionarios=_tipo;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerFuncSelecionado` (IN `_id` INT(11))  NO SQL
Begin



SELECT `id_funcionario`,`username`,`pass`,nome_departamento,Descricao_TipoUtilizador AS Tipo_Utilizador

FROM funcionario, departamento,tipoutilizador

where (`id_departamento_funcionarios`= id_departamento) and `Tipo_Funcionario`= ID_TipoUtilizador and id_funcionario=_id
ORDER BY id_funcionario;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerHistoricoDepartamento` (IN `_id` INT(11))  NO SQL
Begin
select `idHistoricoDep`,`IdTicketDep`,`HoraAtribuicaoDep`,`HoraAtribuicaoDep`,`nome_departamento`,`username`
from historicodepartamentos,departamento,funcionario

where IDDepartamentoDep=id_departamento and `IDFuncEstado`= id_funcionario and IdTicketDep= _id; 

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificaAdmin` (IN `email` VARCHAR(100))  NO SQL
BEGIN

SELECT * FROM funcionario WHERE username=email;

End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificausoEmail` (IN `_id` INT)  NO SQL
BEGIN

SELECT * FROM emails WHERE id=_id;
End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicket` (IN `_iddep` INT(11))  BEGIN


select `id`,`email`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y   %H:%i') As datea,`body`, `Descricao_Estado`,DesTipoRes,id_func_emails,`nome_departamento`

from emails, departamento, grupo, estado,tipo_resolucao

where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Ticket') and (id_departamento_emails=_iddep) and (`state`=ID_Estado) and (id_Res_Ticket=IdTipoRes)

order by id asc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerTicketHistorico` ()  BEGIN
	
   
select `id`,`email`,`fromaddress`,`subject`,DATE_FORMAT(`datea`,'%d/%m/%Y   %H:%i') As datea,`body`, `Descricao_Estado`,DesTipoRes,id_func_emails,`nome_departamento`

from emails, departamento, grupo, estado,tipo_resolucao

where (`id_departamento_emails`= id_departamento) and (id_grupo_emails=id_grupo) and (nome_grupo= 'Historico')  and (`state`=ID_Estado) and (id_Res_Ticket=IdTipoRes)

order by id asc; 
    
    
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

CREATE DEFINER=`root`@`localhost` FUNCTION `MudaEstado` (`_estado` INT(11)) RETURNS INT(12) BEGIN
    DECLARE a int (10);
 
    IF (_estado = 1)  THEN
 		SET a = 2;
    ELSEIF (_estado = 2) THEN
        SET a = 4;
     ELSEIF (_estado = 4) THEN
       SET a = 5;
     ELSEIF (_estado = 5) THEN
       SET a = 6; 
     ELSEIF (_estado = 6) THEN
       SET a = 5;
    END IF;
 RETURN (a);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `MudaGrupoTicket` (`_id_grupo` INT) RETURNS INT(11) NO SQL
BEGIN
    DECLARE a int (1);
 
    IF (_id_grupo = 1)  THEN
 		SET a = 2;
    ELSEIF (_id_grupo = 2 ) THEN
        SET a = 1;
     Else 
     set a = 2;
    END IF;
 RETURN (a);
 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `retornaIdMail` (`mail` VARCHAR(200)) RETURNS INT(100) BEGIN
declare temp int(11);

SELECT `id_funcionario` INTO temp FROM funcionario WHERE username like mail;
return temp;

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `RetornaMail` (`id` INT(100)) RETURNS VARCHAR(100) CHARSET latin1 NO SQL
BEGIN
declare temp varchar(200);

SELECT `username` INTO temp FROM funcionario WHERE id_funcionario=id;
return temp;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `ID_Comentario` int(11) NOT NULL,
  `ID_Ticket` int(11) NOT NULL,
  `Data_comentario` date NOT NULL,
  `Comentario` varchar(700) NOT NULL,
  `ID_Utilizador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(5, 'teste2');

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
  `state` int(10) NOT NULL DEFAULT '1',
  `id_departamento_emails` int(11) DEFAULT '3',
  `id_grupo_emails` int(11) NOT NULL DEFAULT '1',
  `id_func_emails` varchar(100) DEFAULT 'ND',
  `id_Res_Ticket` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'Sendo Lido'),
(4, 'Atibuido'),
(5, 'Fechado'),
(6, 'Reaberto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `id_departamento_funcionarios` int(11) DEFAULT NULL,
  `Tipo_Funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `username`, `pass`, `id_departamento_funcionarios`, `Tipo_Funcionario`) VALUES
(36, 'teste2', '2', 2, 1),
(37, 'testetrackit@gmail.com', 'testetrackit123', 1, 4),
(38, 'testetrackit2@gmail.com', 'testetrackit123', 2, 4),
(39, 'admin', 'admin', 2, 3),
(40, 'odinpt21@gmail.com', 'abcd1995', 1, 3),
(41, 'callcenter', 'callcenter', 1, 3),
(43, 'teste', 'teste', 1, 1),
(46, 'trackit093@gmail.com', '123teste123', 3, 4),
(49, 'normal', 'normal', 1, 1),
(52, 'Odin', 'Odin', 1, 3);

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
(2, 'Histórico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicodepartamentos`
--

CREATE TABLE `historicodepartamentos` (
  `idHistoricoDep` int(11) NOT NULL,
  `IdTicketDep` int(11) DEFAULT NULL,
  `HoraAtribuicaoDep` datetime DEFAULT NULL,
  `IDDepartamentoDep` int(11) DEFAULT NULL,
  `IDFuncEstado` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `historicoestados`
--

CREATE TABLE `historicoestados` (
  `idHistoricoEstados` int(11) NOT NULL,
  `HoraAtribuicaoEstado` datetime DEFAULT NULL,
  `IdTicketEstado` int(11) DEFAULT NULL,
  `IDEstadoEstado` int(11) DEFAULT '2',
  `IDFuncEstado` int(30) DEFAULT NULL,
  `IdResTicket` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE `respostas` (
  `id_resp` int(11) NOT NULL,
  `subject_resp` varchar(150) CHARACTER SET latin1 NOT NULL,
  `body_resp` varchar(700) NOT NULL,
  `datea_resp` datetime DEFAULT NULL,
  `id_email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoutilizador`
--

CREATE TABLE `tipoutilizador` (
  `ID_TipoUtilizador` int(11) NOT NULL,
  `Descricao_TipoUtilizador` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoutilizador`
--

INSERT INTO `tipoutilizador` (`ID_TipoUtilizador`, `Descricao_TipoUtilizador`) VALUES
(1, 'Normal'),
(2, 'Admin'),
(3, 'Super User'),
(4, 'Email De Departamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_resolucao`
--

CREATE TABLE `tipo_resolucao` (
  `IdTipoRes` int(11) NOT NULL,
  `DesTipoRes` varchar(230) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_resolucao`
--

INSERT INTO `tipo_resolucao` (`IdTipoRes`, `DesTipoRes`) VALUES
(1, 'Not solved'),
(2, 'duplicate'),
(3, 'Incomplete'),
(4, 'Not applicable'),
(5, 'Can not be solved'),
(6, 'Resolved');

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
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_Comentario`),
  ADD KEY `funcionarios_FK_comentarios` (`ID_Utilizador`),
  ADD KEY `comentarios_FK_ticket` (`ID_Ticket`) USING BTREE;

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
  ADD KEY `emails_FK_grupos` (`id_grupo_emails`),
  ADD KEY `emails_FK_estados` (`state`),
  ADD KEY `emails_fk_tipoResolucao` (`id_Res_Ticket`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`);

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
-- Indexes for table `historicodepartamentos`
--
ALTER TABLE `historicodepartamentos`
  ADD PRIMARY KEY (`idHistoricoDep`),
  ADD KEY `IdTicketEstado_idx` (`IdTicketDep`),
  ADD KEY `IDEstadoEstado_idx` (`IDDepartamentoDep`),
  ADD KEY `IDFuncEstado_idx` (`IDFuncEstado`),
  ADD KEY `IDFuncEstado` (`IDFuncEstado`);

--
-- Indexes for table `historicoestados`
--
ALTER TABLE `historicoestados`
  ADD PRIMARY KEY (`idHistoricoEstados`),
  ADD KEY `IdTicketEstado_idx` (`IdTicketEstado`),
  ADD KEY `IDEstadoEstado_idx` (`IDEstadoEstado`),
  ADD KEY `IDFuncEstado_idx` (`IDFuncEstado`),
  ADD KEY `historicodepartamentos_fk_tipoReslucao` (`IdResTicket`);

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
-- Indexes for table `tipo_resolucao`
--
ALTER TABLE `tipo_resolucao`
  ADD PRIMARY KEY (`IdTipoRes`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_fk_emails` (`id_ticket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ID_Comentario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `historicodepartamentos`
--
ALTER TABLE `historicodepartamentos`
  MODIFY `idHistoricoDep` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `historicoestados`
--
ALTER TABLE `historicoestados`
  MODIFY `idHistoricoEstados` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `tipo_resolucao`
--
ALTER TABLE `tipo_resolucao`
  MODIFY `IdTipoRes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_FK_ticket` FOREIGN KEY (`ID_Ticket`) REFERENCES `emails` (`id`),
  ADD CONSTRAINT `funcionarios_FK_comentarios` FOREIGN KEY (`ID_Utilizador`) REFERENCES `funcionario` (`id_funcionario`);

--
-- Limitadores para a tabela `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_FK_Departamento` FOREIGN KEY (`id_departamento_emails`) REFERENCES `departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emails_FK_estados` FOREIGN KEY (`state`) REFERENCES `estado` (`ID_Estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emails_FK_grupos` FOREIGN KEY (`id_grupo_emails`) REFERENCES `grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emails_fk_tipoResolucao` FOREIGN KEY (`id_Res_Ticket`) REFERENCES `tipo_resolucao` (`IdTipoRes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_fk_TP` FOREIGN KEY (`Tipo_Funcionario`) REFERENCES `tipoutilizador` (`ID_TipoUtilizador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento_funcionarios`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `historicodepartamentos`
--
ALTER TABLE `historicodepartamentos`
  ADD CONSTRAINT `historicodepartamentos_fk_departamento` FOREIGN KEY (`IDDepartamentoDep`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicodepartamentos_fk_funcionario` FOREIGN KEY (`IDFuncEstado`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `historicoestados`
--
ALTER TABLE `historicoestados`
  ADD CONSTRAINT `historicodepartamentos_fk_tipoReslucao` FOREIGN KEY (`IdResTicket`) REFERENCES `tipo_resolucao` (`IdTipoRes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicoestados_FK_funcionario` FOREIGN KEY (`IDFuncEstado`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicoestados_ibfk_1` FOREIGN KEY (`IdTicketEstado`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `historicoestados_ibfk_2` FOREIGN KEY (`IDEstadoEstado`) REFERENCES `estado` (`ID_Estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `respostas`
--
ALTER TABLE `respostas`
  ADD CONSTRAINT `respostas_fk_emails` FOREIGN KEY (`id_email`) REFERENCES `emails` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
