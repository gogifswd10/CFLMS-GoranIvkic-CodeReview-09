-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 11:40
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_goran_ivkic_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_goran_ivkic_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_goran_ivkic_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `address_id` int(15) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zip_code` int(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`address_id`, `street`, `zip_code`, `city`) VALUES
(1, 'Mariahilfer Straße 1', 1060, 'Wien'),
(2, 'Mariahilfer Gürtel 12', 1060, 'Wien'),
(3, 'Mariahilfer Straße 23', 1070, 'Wien'),
(4, 'Gürtel Gürtel 55', 1050, 'Wien'),
(5, 'Yugo Gürtel 6', 1160, 'Wien'),
(6, 'Meidlinger Gürtel 6', 1120, 'Wien'),
(7, 'Meidlinger Hauptstraße 76', 1120, 'Wien'),
(8, 'Simmeringer Hauptstraße 176', 1110, 'Wien'),
(9, 'Döblinger Hauptstraße 111', 1190, 'Wien'),
(10, 'Zehetbauergasse 4', 1110, 'Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(15) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fk_address_id` int(15) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_address_id`, `phone`) VALUES
(1, 'Knjigoslav', 'Goranovski', 3, 676666991),
(2, 'Knjigo', 'Mehmedovski', 3, 676666991),
(3, 'Mujo', 'Hasic', 3, 676666992),
(4, 'Haso', 'Mujic', 4, 676666993);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(15) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `fk_package_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `gender`, `hire_date`, `fk_package_id`) VALUES
(1, 'Sefika', 'Adislic', 'female', '2018-12-01', 1),
(2, 'Zgembo', 'Adislic', 'male', '2018-12-01', 2),
(3, 'Meho', 'Mehic', 'male', '2016-12-01', 3),
(4, 'Fata', 'Mujina', 'female', '2015-11-01', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(15) NOT NULL,
  `time_sent` time NOT NULL,
  `date_sent` date NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `fk_customer_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `time_sent`, `date_sent`, `weight`, `fk_customer_id`) VALUES
(1, '10:10:10', '2020-07-02', '5.00', 1),
(2, '12:12:12', '2020-07-02', '4.00', 2),
(3, '15:15:15', '2020-07-06', '4.00', 3),
(4, '10:10:10', '2020-07-02', '5.00', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pivot`
--

CREATE TABLE `pivot` (
  `pivot_id` int(15) NOT NULL,
  `fk_package_id` int(15) DEFAULT NULL,
  `fk_process_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `process`
--

CREATE TABLE `process` (
  `process_id` int(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fk_address_id` int(15) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  `fk_employee_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `process`
--

INSERT INTO `process` (`process_id`, `name`, `fk_address_id`, `phone`, `fk_employee_id`) VALUES
(0, 'Paketdienste Wien', 10, 676666988, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(15) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fk_address_id` int(15) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `time_received` time DEFAULT NULL,
  `fk_package_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `fk_address_id`, `phone`, `date_received`, `time_received`, `fk_package_id`) VALUES
(1, 'Max', 'Mustermann', 1, 676666990, '2020-07-08', '11:12:14', 1),
(2, 'Dax', 'Musterheinz', 1, 676666999, '2020-07-08', '11:12:14', 2),
(3, 'Manny', 'Musterfrau', 2, 676666998, '2020-07-09', '11:12:18', 3),
(4, 'Jimmy', 'Hoffa', 2, 676666997, '2020-07-07', '10:12:18', 4);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `pivot`
--
ALTER TABLE `pivot`
  ADD PRIMARY KEY (`pivot_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_process_id` (`fk_process_id`);

--
-- Indizes für die Tabelle `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `pivot`
--
ALTER TABLE `pivot`
  ADD CONSTRAINT `pivot_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `pivot_ibfk_2` FOREIGN KEY (`fk_process_id`) REFERENCES `process` (`process_id`);

--
-- Constraints der Tabelle `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `process_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
