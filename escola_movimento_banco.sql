-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/11/2026 às 23:30
-- Versão do servidor: 10.11.19-MariaDB
-- Versão do PHP: 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola_movimento`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `email`, `mensagem`, `data_envio`) VALUES
(1, 'Bia', 'biancadalmagro928@gmail.com', 'orçamento', '2026-11-24 19:29:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `data_depoimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `depoimentos`
--

INSERT INTO `depoimentos` (`id`, `nome`, `mensagem`, `foto`, `data_depoimento`) VALUES
(1, 'Mary Janny', 'Fazer parte da Escola de Dança Movimento foi uma experiência que transformou minha relação com a dança. Encontrei um ambiente acolhedor, onde pude desenvolver minha confiança e minha paixão pela arte.', 'images/depoimentos/mary-janny.png', '2026-03-15'),
(2, 'Paulinho da Viola', 'Entrei na turma de jazz sem saber nada e hoje me sinto muito mais solto no palco. A energia da aula é contagiante.', 'images/depoimentos/paulinho-da-viola.png', '2026-05-08'),
(3, 'Lerigol', 'A turma de dança urbana mudou minha relação com o próprio corpo. Saio de cada aula com muito mais energia do que entrei.', 'images/depoimentos/lerigol.png', '2026-06-02'),
(4, 'John Wick', 'Os professores são super dedicados e as aulas são dinâmicas. Dá pra ver o cuidado que eles têm com a evolução de cada aluno.', 'images/depoimentos/john-wick.png', '2026-07-19'),
(5, 'Natieli', 'Na Movimento encontrei muito mais do que aulas de dança. É um lugar que realmente incentiva a gente a se superar.', 'images/depoimentos/natieli.png', '2026-07-30'),
(6, 'Lananala', 'A união entre técnica, criatividade e paixão faz com que cada aula seja especial. Recomendo pra qualquer idade.', 'images/depoimentos/lananala.png', '2026-08-12'),
(7, 'Bia', 'Estou começando agora mas as aulas são incríveis.', NULL, '2026-11-24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `pagina` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `descricao`, `preco`, `imagem`, `pagina`) VALUES
(1, 'Ballet — Turma Adulta', 'Técnicas iniciantes até nível profissional, com aulas semanais na barra e no centro.', 180.00, 'images/servicos/ballet-1.jpg', 'servico1.html'),
(2, 'Dança Urbana — Intermediária', 'Aulas em grupo com técnicas de street dance, ritmo e expressão corporal.', 160.00, 'images/servicos/urbana-1.jpg', 'servico2.html'),
(3, 'Jazz — Turma Livre', 'Movimentos dinâmicos, musicalidade e presença de palco para todas as idades.', 170.00, 'images/servicos/ballet-2.jpg', 'servico3.html');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
