-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 24 apr 2023 om 12:13
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `graphixapi`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `auth_tokens`
--

INSERT INTO `auth_tokens` (`id`, `token`) VALUES
(1, 'FrfZ0SIPyPEXULxPP4RwPo9Usc1Dr77YiIuqIKoch2GZc');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dieren_data`
--

CREATE TABLE `dieren_data` (
  `id` int(11) NOT NULL,
  `naam` varchar(225) NOT NULL,
  `kenmerken` varchar(225) NOT NULL,
  `rijk` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `dieren_data`
--

INSERT INTO `dieren_data` (`id`, `naam`, `kenmerken`, `rijk`) VALUES
(1, 'Hert', 'Bruine vacht, groot gewei', 'Animalia (Dieren)'),
(2, 'Kangaroo', 'Heeft lange achterpoten, heeft geen duim aan voorpoot, is een vegetariër', 'Animalia (Dieren)'),
(3, 'Muis', 'Bruin, lange staart', 'Animalia (Dieren)'),
(4, 'Kat', 'Gevoelsharen op zijn gezicht, zachte vacht', 'Animalia (Dieren)');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `dieren_data`
--
ALTER TABLE `dieren_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `dieren_data`
--
ALTER TABLE `dieren_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
