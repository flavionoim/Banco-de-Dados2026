-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/08/2026 às 22:52
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Flávio Gustavo', 'flavionoim@gmail.com', '564.880.086-76'),
(2, 'Pedro Henrique', 'pedro@gmail.com', '544.890.087-66'),
(3, 'Paulo Gustavo', 'paulo@gmail.com', '574.880.089-67'),
(4, 'João Cleber', 'joao@gmail.com', '514.880.086-76'),
(5, 'Ademar Coelho', 'ademar@gmail.com', '564.810.086-76'),
(6, 'Wemerson Filho', 'wemerson@gmail.com', '564.880.586-76');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(4, '2026-08-01', '2026-08-12', '16:55:00', '17:36:00', NULL, 1, 13),
(5, '2026-07-08', NULL, '09:30:00', NULL, NULL, 2, 14),
(6, '2026-07-30', NULL, '12:03:00', NULL, NULL, 3, 16),
(7, '2026-07-14', NULL, '19:04:00', NULL, NULL, 4, 17),
(8, '2026-08-24', NULL, '11:05:00', NULL, NULL, 5, 15),
(9, '2026-08-02', NULL, '07:15:00', NULL, NULL, 6, 18);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(13, '1', '1°Andar', 'Suíte Master'),
(14, '2', '4°Andar', 'King'),
(15, '10', '2°Andar', 'Presidencial'),
(16, '3', '3°Andar', 'Uma Cama'),
(17, '4', '5°Andar', 'Duas Camas'),
(18, '15', 'Cobertura', 'Presidencial');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(1, 'Pepsi Lata 600ml', 0, 8.50, 'Bebida'),
(2, 'Salgadinho Pringles 300g', 0, 12.90, 'Comida'),
(3, 'Hersheys 100g', 0, 5.00, 'Comida'),
(4, 'Salgadinho Pippos 500g', 0, 3.50, 'Comida'),
(5, 'Vinho Tinto 1L', 0, 30.00, 'Bebida'),
(6, 'Champagne', 0, 63.00, 'Bebida'),
(7, 'Petit Gateau', 0, 50.00, 'Comida'),
(8, 'Picanha Na Brasa', 0, 60.00, 'Comida');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicohospedagem`
--

CREATE TABLE `servicohospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicohospedagem`
--

INSERT INTO `servicohospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`, `total`) VALUES
(4, 7, '2026-08-02', '16:40:12', NULL),
(4, 4, '2026-08-02', '17:19:00', NULL),
(4, 3, '2026-08-02', '23:40:12', NULL),
(4, 5, '2026-08-03', '07:10:34', NULL),
(5, 1, '2026-07-08', '10:40:00', NULL),
(5, 2, '2026-07-08', '12:10:00', NULL),
(5, 3, '2026-07-08', '14:20:00', NULL),
(5, 6, '2026-07-09', '05:20:00', NULL),
(5, 4, '2026-07-09', '10:11:01', NULL),
(6, 5, '2026-07-30', '20:13:00', NULL),
(6, 6, '2026-07-30', '21:10:00', NULL),
(6, 1, '2026-07-31', '04:10:12', NULL),
(6, 7, '2026-07-31', '10:02:00', NULL),
(6, 2, '2026-07-31', '15:00:00', NULL),
(7, 7, '2026-07-14', '22:18:00', NULL),
(7, 3, '2026-07-14', '23:07:10', NULL),
(7, 2, '2026-07-14', '23:58:59', NULL),
(7, 5, '2026-07-15', '02:21:00', NULL),
(7, 6, '2026-07-15', '04:32:00', NULL),
(8, 2, '2026-08-24', '11:59:00', NULL),
(8, 7, '2026-08-24', '12:57:21', NULL),
(8, 5, '2026-08-24', '14:30:00', NULL),
(8, 4, '2026-08-24', '15:20:03', NULL),
(8, 4, '2026-08-24', '16:12:02', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD CONSTRAINT `servicohospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicohospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
