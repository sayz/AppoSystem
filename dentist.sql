-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 22 Haz 2013, 05:25:07
-- Sunucu sürümü: 5.5.31-0ubuntu0.13.04.1
-- PHP Sürümü: 5.4.9-4ubuntu2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `dentist`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Appointments`
--
-- Oluşturma: 22 Haz 2013, 02:18:33
--

CREATE TABLE IF NOT EXISTS `Appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `hour` varchar(10) NOT NULL,
  `isdone` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- TABLO BAĞLANTILARI `Appointments`:
--   `userID`
--       `Users` -> `id`
--

--
-- Tablo döküm verisi `Appointments`
--

INSERT INTO `Appointments` (`id`, `userID`, `date`, `hour`, `isdone`) VALUES
(1, 30, '21/06/2013', '17:51', 0),
(34, 7, '19/06/2013', '20:00', 0),
(35, 54, '22/06/2013', '09:30', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Users`
--
-- Oluşturma: 22 Haz 2013, 02:18:33
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `appodate` varchar(50) NOT NULL,
  `appotime` varchar(50) NOT NULL,
  `appoid` int(11) NOT NULL,
  `usertype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Tablo döküm verisi `Users`
--

INSERT INTO `Users` (`id`, `username`, `password`, `fullname`, `appodate`, `appotime`, `appoid`, `usertype`) VALUES
(1, 'admin', 'admin', 'Sefa Yildiz', '', '', 0, 0),
(7, 'ali', 'ali', 'ali veli selami', '', '', 0, 2),
(30, 'sefa', '123', 'sefa yildiz', '', '', 0, 2),
(43, 'eldar', '123', 'eldar fayz', '', '', 0, 2),
(54, 'kamil', '123', 'kamil kamile', '', '', 0, 2),
(62, 'ismail', '1234', 'ismail iseri', '', '', 0, 2),

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Appointments`
--
ALTER TABLE `Appointments`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`userID`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
