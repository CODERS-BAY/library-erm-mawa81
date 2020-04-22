-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Apr 2020 um 12:33
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article`
--

CREATE TABLE `article` (
  `book_articleID` int(8) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `authorslistID` int(8) DEFAULT NULL,
  `journalID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_reference_list`
--

CREATE TABLE `article_reference_list` (
  `book_articleID` int(8) NOT NULL,
  `reference_article` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `authorID` int(8) NOT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authorslist`
--

CREATE TABLE `authorslist` (
  `authorslistID` int(8) NOT NULL,
  `book_articleID` int(8) DEFAULT NULL,
  `authorID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_articleID` int(8) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `authorslistID` int(8) DEFAULT NULL,
  `publisherID` int(8) DEFAULT NULL,
  `translation_template` int(8) DEFAULT NULL,
  `max_copies` int(8) DEFAULT NULL,
  `is_copy` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerID` int(8) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `journalID` int(8) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keywordID` int(11) NOT NULL,
  `word` varchar(32) DEFAULT NULL,
  `relevance` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword_synonyms`
--

CREATE TABLE `keyword_synonyms` (
  `keywordID` int(11) NOT NULL,
  `synonymID` int(11) NOT NULL,
  `synonym` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan`
--

CREATE TABLE `loan` (
  `loanID` int(12) NOT NULL,
  `book_articleID` int(8) DEFAULT NULL,
  `borrowedBy` int(8) DEFAULT NULL,
  `reservedFor` int(8) DEFAULT NULL,
  `borrowDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `borrowEmployee` int(8) DEFAULT NULL,
  `returnEmployee` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishinghouse`
--

CREATE TABLE `publishinghouse` (
  `publisherID` int(8) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelve`
--

CREATE TABLE `shelve` (
  `shelveNr` int(11) NOT NULL,
  `shelvePlace` int(11) NOT NULL,
  `subjectID` int(8) DEFAULT NULL,
  `book_journal` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(8) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `keywordID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`book_articleID`),
  ADD KEY `authorslistID` (`authorslistID`,`journalID`),
  ADD KEY `journalID` (`journalID`);

--
-- Indizes für die Tabelle `article_reference_list`
--
ALTER TABLE `article_reference_list`
  ADD PRIMARY KEY (`book_articleID`,`reference_article`),
  ADD KEY `book_articleID` (`book_articleID`,`reference_article`),
  ADD KEY `reference_article` (`reference_article`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Indizes für die Tabelle `authorslist`
--
ALTER TABLE `authorslist`
  ADD PRIMARY KEY (`authorslistID`),
  ADD KEY `book_articleID` (`book_articleID`,`authorID`),
  ADD KEY `authorID` (`authorID`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_articleID`),
  ADD KEY `authorslistID` (`authorslistID`,`publisherID`,`translation_template`),
  ADD KEY `publisherID` (`publisherID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journalID`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keywordID`);

--
-- Indizes für die Tabelle `keyword_synonyms`
--
ALTER TABLE `keyword_synonyms`
  ADD PRIMARY KEY (`keywordID`,`synonymID`),
  ADD KEY `synonymID` (`synonymID`);

--
-- Indizes für die Tabelle `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loanID`),
  ADD KEY `book_articleID` (`book_articleID`,`borrowedBy`,`reservedFor`,`borrowEmployee`,`returnEmployee`),
  ADD KEY `borrowedBy` (`borrowedBy`),
  ADD KEY `reservedFor` (`reservedFor`),
  ADD KEY `borrowEmployee` (`borrowEmployee`),
  ADD KEY `returnEmployee` (`returnEmployee`);

--
-- Indizes für die Tabelle `publishinghouse`
--
ALTER TABLE `publishinghouse`
  ADD PRIMARY KEY (`publisherID`);

--
-- Indizes für die Tabelle `shelve`
--
ALTER TABLE `shelve`
  ADD PRIMARY KEY (`shelveNr`,`shelvePlace`),
  ADD KEY `subjectID` (`subjectID`,`book_journal`),
  ADD KEY `book_journal` (`book_journal`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`),
  ADD KEY `keywordID` (`keywordID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`authorslistID`) REFERENCES `authorslist` (`authorslistID`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`journalID`) REFERENCES `journal` (`journalID`);

--
-- Constraints der Tabelle `article_reference_list`
--
ALTER TABLE `article_reference_list`
  ADD CONSTRAINT `article_reference_list_ibfk_1` FOREIGN KEY (`book_articleID`) REFERENCES `article` (`book_articleID`),
  ADD CONSTRAINT `article_reference_list_ibfk_2` FOREIGN KEY (`reference_article`) REFERENCES `article` (`book_articleID`);

--
-- Constraints der Tabelle `authorslist`
--
ALTER TABLE `authorslist`
  ADD CONSTRAINT `authorslist_ibfk_1` FOREIGN KEY (`book_articleID`) REFERENCES `book` (`book_articleID`),
  ADD CONSTRAINT `authorslist_ibfk_2` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorslistID`) REFERENCES `authorslist` (`authorslistID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisherID`) REFERENCES `publishinghouse` (`publisherID`);

--
-- Constraints der Tabelle `keyword_synonyms`
--
ALTER TABLE `keyword_synonyms`
  ADD CONSTRAINT `keyword_synonyms_ibfk_1` FOREIGN KEY (`keywordID`) REFERENCES `keyword` (`keywordID`);

--
-- Constraints der Tabelle `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`borrowedBy`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`reservedFor`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`borrowEmployee`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `loan_ibfk_5` FOREIGN KEY (`returnEmployee`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `loan_ibfk_6` FOREIGN KEY (`book_articleID`) REFERENCES `book` (`book_articleID`);

--
-- Constraints der Tabelle `shelve`
--
ALTER TABLE `shelve`
  ADD CONSTRAINT `shelve_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  ADD CONSTRAINT `shelve_ibfk_2` FOREIGN KEY (`book_journal`) REFERENCES `book` (`book_articleID`);

--
-- Constraints der Tabelle `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`keywordID`) REFERENCES `keyword` (`keywordID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
