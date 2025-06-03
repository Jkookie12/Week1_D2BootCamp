-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2025 at 08:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `birthday`, `address`, `username`, `password`, `profile_image`) VALUES
(1, 'jhonemar', '0000-00-00', 'P2 Cigla Mahay Butuan City ', 'hearty123', 'labyulove', NULL),
(2, 'June Ralph Aton', '0000-00-00', 'Pequeno', 'june123', 'aton123', 'uploads/494571306_3971418826458848_4863331260972193398_n_1.jpg'),
(3, 'Precious Heart Aguanta', '0000-00-00', 'P2 Mahay', 'preciousheart12', 'hearty123', 'uploads/494571306_3971418826458848_4863331260972193398_n_1.jpg'),
(4, 'jhonemar', '2025-06-10', 'Pequeno', 'jungkook123', 'hearty123', 'uploads/494571306_3971418826458848_4863331260972193398_n.jpg'),
(5, 'heartylab', '2003-10-03', 'taligaman', 'hearty123', '123', 'uploads/494571306_3971418826458848_4863331260972193398_n.jpg'),
(6, 'Raph Raph Gwapa', '2003-03-03', 'doongan', 'raph123', 'gwapa123', 'uploads/480275704_4030808450495289_5198713003479093134_n.jpg'),
(7, 'Juney Boy Aton', '1969-06-03', 'Pequeno', 'Juney123', 'Butodd123', 'uploads/485202774_684584660795364_8294050670563012076_n.jpg'),
(8, 'daisy', '2025-07-01', 'cabadbaran', 'daisy123', 'marsan', 'uploads/485202774_684584660795364_8294050670563012076_n.jpg'),
(9, 'jaspher', '2025-06-23', 'sds', 'sdsd', 'sdfg', 'uploads/485202774_684584660795364_8294050670563012076_n.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
