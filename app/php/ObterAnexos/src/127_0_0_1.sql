-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Abr-2017 às 11:21
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contatos`
--
CREATE DATABASE IF NOT EXISTS `contatos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `contatos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`id`, `email`, `name`, `phone`) VALUES
(1, 'awd', 'awd', '123'),
(2, 'ssssssssssssss', 'awd', '444');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `db_example`
--
CREATE DATABASE IF NOT EXISTS `db_example` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_example`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_group`
--

CREATE TABLE `tb_group` (
  `group_id` char(7) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `privilege` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_group`
--

INSERT INTO `tb_group` (`group_id`, `group_name`, `privilege`) VALUES
('G000001', 'ADMINISTRATOR', '[{\"privilege_id\":\"P000001\",\"privilege\":\"Sales\",\"module_id\":\"m1\"},{\"privilege_id\":\"P000006\",\"privilege\":\"Group & Privilege\",\"module_id\":\"m6\"},{\"privilege_id\":\"P000007\",\"privilege\":\"User\",\"module_id\":\"m7\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_privilege`
--

CREATE TABLE `tb_privilege` (
  `privilege_id` char(7) NOT NULL,
  `privilege` varchar(150) NOT NULL,
  `module_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_privilege`
--

INSERT INTO `tb_privilege` (`privilege_id`, `privilege`, `module_id`) VALUES
('P000001', 'Sales', 'm1'),
('P000002', 'Report Sales', 'm2'),
('P000003', 'Report Product', 'm3'),
('P000004', 'Sales Chart', 'm4'),
('P000005', 'Products', 'm5'),
('P000006', 'Group & Privilege', 'm6'),
('P000007', 'User', 'm7');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` bigint(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `group_id` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `user_name`, `user_password`, `group_id`) VALUES
(1, 'demo', 'demo', 'G000001'),
(2, 'admin', 'admin', 'G000001'),
(4, 'user', 'user', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `tb_privilege`
--
ALTER TABLE `tb_privilege`
  ADD PRIMARY KEY (`privilege_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;--
-- Database: `emails`
--
CREATE DATABASE IF NOT EXISTS `emails` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `emails`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'rui', 'rui');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `fromaddress` varchar(150) NOT NULL,
  `subject` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `datea` varchar(100) NOT NULL,
  `body` varchar(250) NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Aberto',
  `department` varchar(100) NOT NULL DEFAULT 'N/ atribuido'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`, `department`) VALUES
(2, 'teste trackit <testetrackit@gmail.com>', '908908908', 'Wed, 5 Apr 2017 15:32:00 +0100', '90909090890890', 'Aberto', 'N/ atribuido'),
(3, 'teste trackit <testetrackit@gmail.com>', 'ad112', 'Wed, 5 Apr 2017 15:26:03 +0100', '2323', 'Aberto', 'N/ atribuido'),
(4, 'teste trackit <testetrackit@gmail.com>', 'adawda', 'Wed, 5 Apr 2017 15:13:08 +0100', 'axzz aawd a', 'Aberto', 'N/ atribuido'),
(5, 'teste trackit <testetrackit@gmail.com>', 'xxx', 'Wed, 5 Apr 2017 12:16:03 +0100', 'xxx', 'Aberto', 'N/ atribuido'),
(6, 'teste trackit <testetrackit@gmail.com>', 'dd', 'Thu, 6 Apr 2017 10:13:38 +0100', 'ddddddd', 'Aberto', 'N/ atribuido');

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
  `state` varchar(20) NOT NULL DEFAULT 'Aberto',
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id`, `fromaddress`, `subject`, `datea`, `body`, `state`, `department`) VALUES
(11, 'teste trackit <testetrackit@gmail.com>', '908908908', 'Wed, 5 Apr 2017 15:32:00 +0100', '90909090890890', 'Fechado', 'N/ atribuido'),
(2, 'teste trackit <testetrackit@gmail.com>', 'adawda', 'Wed, 5 Apr 2017 15:13:08 +0100', 'axzz aawd a', 'Fechado', 'N/ atribuido'),
(5, 'teste trackit <testetrackit@gmail.com>', 'awddd', 'Wed, 5 Apr 2017 14:53:25 +0100', 'dddd', 'Fechado', 'N/ atribuido'),
(6, 'Leonardo Manuel Vieira <leonardo.vieira@estudantes.ips.pt>', 'abc', 'Wed, 5 Apr 2017 13:46:55 +0000', 'TESTE a=E7oriano\r\n&nbsp;\r\n&nbsp;\r\nEnviado do \r\nCorreio para Windows 10\r\n&nbsp;\r\n\r\n\r\n\r\n\r\n\n\r\n\r\nEstudante: 150210023@estudantes.ips.pt, C=\r\nurso: CTeSP Tecnologias e Programa=E7=E3o de Sistemas de Informa=E7=E3o, Es=\r\ncola: ESTS', 'Fechado', 'N/ atribuido'),
(7, 'teste trackit <testetrackit@gmail.com>', 'xxx', 'Wed, 5 Apr 2017 14:46:10 +0100', 'xxxxxx', 'Fechado', 'N/ atribuido'),
(1, 'teste trackit <testetrackit@gmail.com>', 'azxxczx', 'Wed, 5 Apr 2017 17:08:18 +0100', 'zxzzx', 'Fechado', 'N/ atribuido');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Extraindo dados da tabela `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('tickets', 'email', 'varchar', '50', 'latin1_swedish_ci', 0, ',', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'Ticket', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuaÃ§Ã£o)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"ConteÃºdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"ConteÃºdo da tabela @TABLE@ (continuaÃ§Ã£o)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"emails\",\"table\":\"emails\"},{\"db\":\"emails\",\"table\":\"admin\"},{\"db\":\"emails\",\"table\":\"historico\"},{\"db\":\"contatos\",\"table\":\"contatos\"},{\"db\":\"test\",\"table\":\"users\"},{\"db\":\"pweb\",\"table\":\"equipas\"},{\"db\":\"tickets\",\"table\":\"ticketinfo\"},{\"db\":\"tickets\",\"table\":\"kappa\"},{\"db\":\"sencha\",\"table\":\"contact\"},{\"db\":\"trackit_tickets\",\"table\":\"tickets\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'emails', 'emails', '{\"CREATE_TIME\":\"2017-03-21 11:44:43\",\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\"]}', '2017-03-22 17:36:15'),
('root', 'tickets', 'ticketinfo', '{\"CREATE_TIME\":\"2017-03-20 09:56:09\",\"col_order\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"],\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]}', '2017-03-20 12:40:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-04-05 14:08:01', '{\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\",\"lang\":\"pt\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `pweb`
--
CREATE DATABASE IF NOT EXISTS `pweb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pweb`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipas`
--

CREATE TABLE `equipas` (
  `EquipaID` int(10) UNSIGNED NOT NULL,
  `EquipaNome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `EquipaLocalizacao` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `equipas`
--

INSERT INTO `equipas` (`EquipaID`, `EquipaNome`, `EquipaLocalizacao`) VALUES
(1, 'Boston Celtics', 'Este'),
(2, 'Dallas Mavericks', 'Oeste'),
(3, 'Brooklyn Nets', 'Este'),
(4, 'Houston Rockets', 'Oeste'),
(5, 'New York Knicks', 'Este'),
(6, 'Memphis Grizzlies', 'Oeste'),
(7, 'Philadephia 76ers', 'Este'),
(8, 'New Orleans Pelicans', 'Oeste'),
(9, 'Toronto Raptors', 'Este'),
(10, 'San Antonio Spurs', 'Oeste'),
(11, 'Chicago Bulls', 'Este'),
(12, 'Denver Nuggets', 'Oeste'),
(13, 'Cleveland Cavaliers', 'Este'),
(14, 'Minnesota Timberwolves', 'Oeste'),
(15, 'Detroit Pistons', 'Este'),
(16, 'Oklahoma City Thunders', 'Oeste'),
(17, 'Indiana Pacers', 'Este'),
(18, 'Portland Trail Blazers', 'Oeste'),
(19, 'Milwaukee Bucks', 'Este'),
(20, 'Utah Jazz', 'Oeste'),
(21, 'Atlanta Hawks', 'Este'),
(22, 'Golden State Warriors', 'Oeste'),
(23, 'Charlotte Hornets', 'Este'),
(24, 'Los Angeles Clippers', 'Oeste'),
(25, 'Miami Heat', 'Este'),
(26, 'Los Angeles Lakers', 'Oeste'),
(27, 'Orlando Magic', 'Este'),
(28, 'Phoenix Suns', 'Oeste'),
(29, 'Washington Wizards', 'Este'),
(30, 'Sacramento Kings', 'Oeste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipas_jogos`
--

CREATE TABLE `equipas_jogos` (
  `EquJogosID` int(11) NOT NULL,
  `JogoID` int(11) NOT NULL,
  `EquipaCasaID` int(11) NOT NULL,
  `EquipaVisitanteID` int(11) NOT NULL,
  `EquipaCasaPontos` int(11) NOT NULL,
  `EquipaVisitantePontos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `equipas_jogos`
--

INSERT INTO `equipas_jogos` (`EquJogosID`, `JogoID`, `EquipaCasaID`, `EquipaVisitanteID`, `EquipaCasaPontos`, `EquipaVisitantePontos`) VALUES
(1, 1, 1, 2, 120, 90),
(2, 2, 1, 3, 84, 110),
(3, 3, 4, 1, 90, 93),
(4, 4, 2, 3, 130, 121),
(5, 5, 2, 4, 87, 60),
(6, 6, 4, 3, 112, 101),
(7, 7, 5, 6, 94, 81),
(8, 8, 7, 5, 90, 111),
(9, 9, 8, 5, 92, 125),
(10, 10, 7, 6, 84, 82),
(11, 11, 6, 8, 70, 94),
(12, 12, 8, 7, 103, 100),
(13, 13, 9, 10, 68, 97),
(14, 14, 11, 9, 117, 115),
(15, 15, 9, 12, 59, 78),
(16, 16, 11, 10, 109, 95),
(17, 17, 10, 12, 114, 120),
(18, 18, 12, 11, 130, 127),
(19, 19, 13, 14, 98, 70),
(20, 20, 13, 15, 79, 82),
(21, 21, 16, 13, 110, 111),
(22, 22, 14, 15, 99, 80),
(23, 23, 14, 16, 119, 122),
(24, 24, 15, 16, 84, 87),
(25, 25, 17, 18, 89, 94),
(26, 26, 17, 19, 115, 114),
(27, 27, 20, 17, 94, 100),
(28, 28, 18, 19, 112, 92),
(29, 29, 18, 20, 85, 90),
(30, 30, 19, 20, 106, 101),
(31, 31, 21, 22, 105, 103),
(32, 32, 21, 23, 109, 85),
(33, 33, 24, 21, 95, 82),
(34, 34, 22, 23, 78, 88),
(35, 35, 22, 24, 120, 90),
(36, 36, 24, 23, 78, 96),
(37, 37, 25, 26, 111, 99),
(38, 38, 25, 27, 98, 82),
(39, 39, 28, 25, 121, 103),
(40, 40, 27, 26, 98, 95),
(41, 41, 26, 28, 89, 65),
(42, 42, 28, 27, 115, 93),
(43, 43, 29, 30, 123, 120),
(44, 44, 30, 29, 122, 98),
(45, 45, 29, 30, 96, 92);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador_equipa`
--

CREATE TABLE `jogador_equipa` (
  `JogEquID` int(10) UNSIGNED NOT NULL,
  `JogadorID` int(11) NOT NULL,
  `EquipasID` int(11) NOT NULL,
  `JogEquDataInicio` date NOT NULL,
  `JogEquDataFim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `jogador_equipa`
--

INSERT INTO `jogador_equipa` (`JogEquID`, `JogadorID`, `EquipasID`, `JogEquDataInicio`, `JogEquDataFim`) VALUES
(2, 2, 2, '2013-09-19', '2015-09-19'),
(3, 3, 3, '2013-09-19', '2016-09-19'),
(4, 4, 4, '2013-09-19', '2016-09-19'),
(5, 5, 5, '2013-09-19', '2016-09-19'),
(6, 6, 6, '2013-09-19', '2016-09-19'),
(7, 7, 7, '2013-09-19', '2016-09-19'),
(8, 8, 8, '2013-09-19', '2016-09-19'),
(9, 9, 9, '2013-09-19', '2016-09-19'),
(10, 10, 10, '2013-09-19', '2016-09-19'),
(11, 11, 11, '2013-09-19', '2016-09-19'),
(12, 12, 12, '2013-09-19', '2016-09-19'),
(13, 13, 13, '2013-09-19', '2016-09-19'),
(14, 14, 14, '2013-09-19', '2016-09-19'),
(15, 15, 15, '2013-09-19', '2016-09-19'),
(16, 16, 16, '2013-09-19', '2016-09-19'),
(17, 17, 17, '2013-09-19', '2016-09-19'),
(18, 18, 18, '2013-09-19', '2016-09-19'),
(19, 19, 19, '2013-09-19', '2016-09-19'),
(20, 20, 20, '2013-09-19', '2016-09-19'),
(21, 21, 21, '2013-09-19', '2016-09-19'),
(22, 22, 22, '2013-09-19', '2016-09-19'),
(23, 23, 23, '2013-09-19', '2016-09-19'),
(24, 24, 24, '2013-09-19', '2016-09-19'),
(25, 25, 25, '2013-09-19', '2016-09-19'),
(26, 26, 26, '2013-09-19', '2016-09-19'),
(27, 27, 27, '2013-09-19', '2016-09-19'),
(28, 28, 28, '2013-09-19', '2016-09-19'),
(29, 29, 29, '2013-09-19', '2016-09-19'),
(30, 30, 30, '2013-09-19', '2016-09-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `JogadorID` int(10) UNSIGNED NOT NULL,
  `JogadorNome` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `JogadorAltura` float NOT NULL,
  `JogadorDataNascimento` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `jogadores`
--

INSERT INTO `jogadores` (`JogadorID`, `JogadorNome`, `JogadorAltura`, `JogadorDataNascimento`) VALUES
(2, 'Dirk Nowitzk', 212, '02-03-1978'),
(3, 'Dajon Williams', 189, '5-8-1990'),
(4, 'James Harden', 183, '28-1-1991'),
(5, 'William Cosey', 179, '12-3-1987'),
(6, 'Marc Gasol', 203, '29-11-1984'),
(7, 'Nerlens Noel', 208, '24-5-1993'),
(8, 'Jason Moore', 191, '1-12-1988'),
(9, 'Lamar DeRozan', 186, '26-3-1983'),
(10, 'Tim Duncan', 212, '15-9-1979'),
(11, 'David Rose', 181, '29-4-1988'),
(12, 'Buck Antalaya', 199, '18-12-1981'),
(13, 'LeBron James', 203, '29-7-1985'),
(14, 'Ricky Rubio', 178, '3-6-1992'),
(15, 'John Macintire', 193, '11-5-1982'),
(16, 'Russell Westbrook', 182, '30-11-1989'),
(17, 'Patrick LaBrooks', 190, '19-2-1979'),
(18, 'Damian Lillard', 181, '21-1-1986'),
(19, 'Jeremiah Lamb', 205, '27-10-1981'),
(20, 'Anthony Levine', 187, '9-3-1994'),
(21, 'Dante Morrison', 198, '25-6-1986'),
(22, 'Stephen Curry', 184, '14-9-1984'),
(23, 'Wayne Bacic', 203, '7-12-1984'),
(24, 'Chris Paul', 180, '1-11-1991'),
(25, 'Muhammad Khalasar', 215, '11-9-1981'),
(26, 'Kobe Bryant', 197, '23-7-1977'),
(27, 'Dende Kateson', 189, '24-2-1985'),
(28, 'Dave Barry', 202, '11-10-1990'),
(29, 'John Wall', 198, '24-12-1995'),
(30, 'Holt Theodore', 216, '22-12-1986');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadores_jogos`
--

CREATE TABLE `jogadores_jogos` (
  `JogJogID` int(10) UNSIGNED NOT NULL,
  `JogadorID` int(11) NOT NULL,
  `JogoID` int(11) NOT NULL,
  `JogJogPontos` int(11) NOT NULL,
  `JogJogMinutos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `jogadores_jogos`
--

INSERT INTO `jogadores_jogos` (`JogJogID`, `JogadorID`, `JogoID`, `JogJogPontos`, `JogJogMinutos`) VALUES
(2, 2, 1, 19, 23),
(3, 3, 2, 40, 27),
(4, 4, 3, 8, 14),
(5, 5, 7, 28, 27),
(6, 6, 10, 50, 30),
(7, 7, 8, 13, 17),
(8, 8, 9, 16, 24),
(9, 9, 13, 5, 7),
(10, 10, 16, 31, 20),
(11, 11, 16, 22, 23),
(12, 12, 15, 19, 25),
(13, 13, 19, 43, 26),
(14, 14, 19, 25, 19),
(15, 15, 20, 24, 32),
(16, 16, 21, 14, 22),
(17, 17, 25, 21, 24),
(18, 18, 25, 17, 22),
(19, 19, 28, 15, 21),
(20, 20, 29, 11, 14),
(21, 21, 31, 21, 34),
(22, 22, 34, 11, 16),
(23, 23, 34, 26, 23),
(24, 24, 33, 16, 14),
(25, 25, 38, 25, 26),
(26, 26, 37, 11, 8),
(27, 27, 38, 19, 15),
(28, 28, 42, 37, 29),
(29, 29, 45, 3, 6),
(30, 30, 45, 27, 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogos`
--

CREATE TABLE `jogos` (
  `JogoID` int(10) UNSIGNED NOT NULL,
  `JogoData` date NOT NULL,
  `Playoff` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `jogos`
--

INSERT INTO `jogos` (`JogoID`, `JogoData`, `Playoff`) VALUES
(1, '2015-09-19', 0),
(2, '2015-09-21', 0),
(3, '2015-09-24', 0),
(4, '2015-09-19', 0),
(5, '2015-09-21', 0),
(6, '2015-09-24', 0),
(7, '2015-09-25', 0),
(8, '2015-09-20', 0),
(9, '2015-09-24', 0),
(10, '2015-09-27', 0),
(11, '2015-09-30', 0),
(12, '2015-09-28', 0),
(13, '2015-09-19', 0),
(14, '2015-09-21', 0),
(15, '2015-09-24', 0),
(16, '2015-09-20', 0),
(17, '2015-09-30', 0),
(18, '2015-09-28', 0),
(19, '2015-09-19', 0),
(20, '2015-09-21', 0),
(21, '2015-09-24', 0),
(22, '2015-09-22', 0),
(23, '2015-09-26', 0),
(24, '2015-09-23', 0),
(25, '2015-09-19', 0),
(26, '2015-09-20', 0),
(27, '2015-09-22', 0),
(28, '2015-09-20', 0),
(29, '2015-09-27', 0),
(30, '2015-09-30', 0),
(31, '2015-09-19', 0),
(32, '2015-09-21', 0),
(33, '2015-09-30', 0),
(34, '2015-09-20', 0),
(35, '2015-09-22', 0),
(36, '2015-09-25', 0),
(37, '2015-09-19', 0),
(38, '2015-09-21', 0),
(39, '2015-09-24', 0),
(40, '2015-09-20', 0),
(41, '2015-09-22', 0),
(42, '2015-09-29', 0),
(43, '2015-09-19', 0),
(44, '2015-09-21', 0),
(45, '2015-09-24', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `membros`
--

CREATE TABLE `membros` (
  `MembroID` int(10) UNSIGNED NOT NULL,
  `MembroTipo` tinyint(1) NOT NULL DEFAULT '0',
  `MembroLogin` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `MembroSenha` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `MembroNome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MembroDataNascimento` varchar(15) COLLATE utf8_unicode_ci DEFAULT '99-99-9999',
  `MembroEmail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MembroLocalidade` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembroEquipa` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembroSobre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembroData` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembroFoto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembroIP` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `membros`
--

INSERT INTO `membros` (`MembroID`, `MembroTipo`, `MembroLogin`, `MembroSenha`, `MembroNome`, `MembroDataNascimento`, `MembroEmail`, `MembroLocalidade`, `MembroEquipa`, `MembroSobre`, `MembroData`, `MembroFoto`, `MembroIP`) VALUES
(1, 2, 'lodyny', '12345', 'C&eacute;sar Nero', '03-11-1994', 'cesar.augusto.nero@hotmail.com', 'Set&uacute;bal', 'Sem Equipa Atualmente', 'Administrador do Site ^.^', '01-05-2016', NULL, '::1'),
(2, 1, 'cacerftw', '12345', 'Rui Nascimento', '11-11-1911', 'cacerftw@gmail.com', 'Set&uacute;bal', 'Grizzlies Bears', 'Moderador do Site ^.^', '01-05-2016', NULL, '::1'),
(3, 0, 'abcd', '123456', 'abcdadadadawd', '01-01-1970', '', '', '', '', '10-03-2017', NULL, '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `membroslogs`
--

CREATE TABLE `membroslogs` (
  `LogID` int(10) UNSIGNED NOT NULL,
  `MembroID` int(11) NOT NULL,
  `LogData` varchar(25) NOT NULL,
  `LogIP` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `membroslogs`
--

INSERT INTO `membroslogs` (`LogID`, `MembroID`, `LogData`, `LogIP`) VALUES
(1, 1, '09/03/2017 11:17:22', '::1'),
(2, 1, '09/03/2017 11:26:14', '::1'),
(3, 1, '10/03/2017 10:22:31', '::1'),
(4, 1, '10/03/2017 10:51:05', '::1'),
(5, 1, '10/03/2017 11:08:36', '::1'),
(6, 3, '10/03/2017 11:09:13', '::1'),
(7, 1, '10/03/2017 12:38:52', '::1'),
(8, 1, '13/03/2017 17:00:01', '::1'),
(9, 1, '22/03/2017 16:33:04', '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinador_equipa`
--

CREATE TABLE `treinador_equipa` (
  `TreEquID` int(10) UNSIGNED NOT NULL,
  `EquipaID` int(11) NOT NULL,
  `TreinadorID` int(11) NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `treinador_equipa`
--

INSERT INTO `treinador_equipa` (`TreEquID`, `EquipaID`, `TreinadorID`, `DataInicio`, `DataFim`) VALUES
(1, 1, 1, '2013-09-19', '2016-09-19'),
(2, 2, 2, '2013-09-19', '2016-09-19'),
(3, 3, 3, '2013-09-19', '2016-09-19'),
(4, 4, 4, '2013-09-19', '2016-09-19'),
(5, 5, 5, '2013-09-19', '2016-09-19'),
(6, 6, 6, '2013-09-19', '2016-09-19'),
(7, 7, 7, '2013-09-19', '2016-09-19'),
(8, 8, 8, '2013-09-19', '2016-09-19'),
(9, 9, 9, '2013-09-19', '2016-09-19'),
(10, 10, 10, '2013-09-19', '2016-09-19'),
(11, 11, 11, '2013-09-19', '2016-09-19'),
(12, 12, 12, '2013-09-19', '2016-09-19'),
(13, 13, 13, '2013-09-19', '2016-09-19'),
(14, 14, 14, '2013-09-19', '2016-09-19'),
(15, 15, 15, '2013-09-19', '2016-09-19'),
(16, 16, 16, '2013-09-19', '2016-09-19'),
(17, 17, 17, '2013-09-19', '2016-09-19'),
(18, 18, 18, '2013-09-19', '2016-09-19'),
(19, 19, 19, '2013-09-19', '2016-09-19'),
(20, 20, 20, '2013-09-19', '2016-09-19'),
(21, 21, 21, '2013-09-19', '2016-09-19'),
(22, 22, 22, '2013-09-19', '2016-09-19'),
(23, 23, 23, '2013-09-19', '2016-09-19'),
(24, 24, 24, '2013-09-19', '2016-09-19'),
(25, 25, 25, '2013-09-19', '2016-09-19'),
(26, 26, 26, '2013-09-19', '2016-09-19'),
(27, 27, 27, '2013-09-19', '2016-09-19'),
(28, 28, 28, '2013-09-19', '2016-09-19'),
(29, 29, 29, '2013-09-19', '2016-09-19'),
(30, 30, 30, '2013-09-19', '2016-09-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `treinadores`
--

CREATE TABLE `treinadores` (
  `treinadorID` int(10) UNSIGNED NOT NULL,
  `treinadorNome` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `treinadores`
--

INSERT INTO `treinadores` (`treinadorID`, `treinadorNome`) VALUES
(1, 'Brad Stevens'),
(2, 'Rick Carlisle'),
(3, 'Kenny Atkinson'),
(4, 'Mike Anthony'),
(5, 'Jeff Hornacek'),
(6, 'David Fizdale'),
(7, 'Brett Brown'),
(8, 'Alvin Gentry'),
(9, 'Dwayne Casey'),
(10, 'Greg Popovich'),
(11, 'Fred Hogberg'),
(12, 'Michael Malone'),
(13, 'Tyronn Lue'),
(14, 'Tom Thibodeau'),
(15, 'Stan Van Gundy'),
(16, 'Billy Donovan'),
(17, 'Nate McMillan'),
(18, 'Terry Stots'),
(19, 'Jason Kidd'),
(20, 'Quin Snyder'),
(21, 'Quin Buldenhozer'),
(22, 'Steve Kerr'),
(23, 'Steve Clifford'),
(24, 'Doc Rivers'),
(25, 'Erik Spoelstra'),
(26, 'Luke Walton'),
(27, 'Frank Vogel'),
(28, 'Earl Watson'),
(29, 'Scott Brooks'),
(30, 'Dave Joerger');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipas`
--
ALTER TABLE `equipas`
  ADD PRIMARY KEY (`EquipaID`);

--
-- Indexes for table `equipas_jogos`
--
ALTER TABLE `equipas_jogos`
  ADD PRIMARY KEY (`EquJogosID`);

--
-- Indexes for table `jogador_equipa`
--
ALTER TABLE `jogador_equipa`
  ADD PRIMARY KEY (`JogEquID`);

--
-- Indexes for table `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`JogadorID`);

--
-- Indexes for table `jogadores_jogos`
--
ALTER TABLE `jogadores_jogos`
  ADD PRIMARY KEY (`JogJogID`);

--
-- Indexes for table `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`JogoID`);

--
-- Indexes for table `membros`
--
ALTER TABLE `membros`
  ADD PRIMARY KEY (`MembroID`);

--
-- Indexes for table `membroslogs`
--
ALTER TABLE `membroslogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `treinador_equipa`
--
ALTER TABLE `treinador_equipa`
  ADD PRIMARY KEY (`TreEquID`);

--
-- Indexes for table `treinadores`
--
ALTER TABLE `treinadores`
  ADD PRIMARY KEY (`treinadorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipas`
--
ALTER TABLE `equipas`
  MODIFY `EquipaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `equipas_jogos`
--
ALTER TABLE `equipas_jogos`
  MODIFY `EquJogosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `jogador_equipa`
--
ALTER TABLE `jogador_equipa`
  MODIFY `JogEquID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jogadores`
--
ALTER TABLE `jogadores`
  MODIFY `JogadorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jogadores_jogos`
--
ALTER TABLE `jogadores_jogos`
  MODIFY `JogJogID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jogos`
--
ALTER TABLE `jogos`
  MODIFY `JogoID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `membros`
--
ALTER TABLE `membros`
  MODIFY `MembroID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `membroslogs`
--
ALTER TABLE `membroslogs`
  MODIFY `LogID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `treinador_equipa`
--
ALTER TABLE `treinador_equipa`
  MODIFY `TreEquID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `treinadores`
--
ALTER TABLE `treinadores`
  MODIFY `treinadorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;--
-- Database: `sencha`
--
CREATE DATABASE IF NOT EXISTS `sencha` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sencha`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contact`
--

CREATE TABLE `contact` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contact`
--

INSERT INTO `contact` (`ID`, `name`, `email`) VALUES
(1, 'Contact1', 'contact1@email.com'),
(2, 'Contact2', 'contact2@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `email`) VALUES
(1, 'kappa', 123, 'awd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `tickets`
--
CREATE DATABASE IF NOT EXISTS `tickets` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tickets`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `kappa`
--

CREATE TABLE `kappa` (
  `id` int(11) NOT NULL,
  `to` int(100) NOT NULL,
  `from` int(100) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ticketinfo`
--

CREATE TABLE `ticketinfo` (
  `id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `frome` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `datea` varchar(50) NOT NULL,
  `message` varchar(200) NOT NULL,
  `image` varchar(59) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ticketinfo`
--

INSERT INTO `ticketinfo` (`id`, `subject`, `frome`, `email`, `datea`, `message`, `image`) VALUES
(1, 'awd', 'awd', 'awd', 'awd', 'awd', 'awd');
--
-- Database: `trackit_tickets`
--
CREATE DATABASE IF NOT EXISTS `trackit_tickets` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trackit_tickets`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Conteudo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`ID`, `Data`, `Conteudo`) VALUES
(1, '2017-03-08', 'Ajudaaaaaaaaaaaaaa'),
(2, '2017-03-27', 'Kappppppaaaaaaaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;--
-- Database: `trackit_user`
--
CREATE DATABASE IF NOT EXISTS `trackit_user` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trackit_user`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` tinytext NOT NULL,
  `user_password` tinytext NOT NULL,
  `group_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `group_id`) VALUES
(1, 'demo', 'demo', '0'),
(2, 'demo', 'demo', 'G000001'),
(3, 'admin', 'admin', 'G000001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
