-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2020 at 07:50 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `blogid` int(11) NOT NULL,
  `blog_title` varchar(250) DEFAULT NULL,
  `blog_desc` text NOT NULL,
  `blog_img` varchar(300) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>published 0=>unpublished',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores BlogData';

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`blogid`, `blog_title`, `blog_desc`, `blog_img`, `status`, `created_on`, `updated_on`) VALUES
(1, 'Test Blog', 'Desc', 'a.jpg', 1, '2020-10-03 16:10:51', '2020-10-03 16:10:51'),
(2, 'dfsf', 'dsfdf', '/assets/upload/blogimg/unnamed8.jpg', 1, '2020-10-04 05:08:03', '2020-10-04 05:08:03'),
(3, 'werwer', 'werw', '/assets/upload/blogimg/unnamed9.jpg', 1, '2020-10-04 05:08:10', '2020-10-04 05:08:10'),
(4, 'test', 'demo', '/assets/upload/blogimg/unnamed10.jpg', 1, '2020-10-04 05:10:41', '2020-10-04 05:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `backenduser`
--

CREATE TABLE `backenduser` (
  `uid` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => Active, 0=> Blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Login for Backend Panel';

--
-- Dumping data for table `backenduser`
--

INSERT INTO `backenduser` (`uid`, `username`, `password`, `status`) VALUES
(1, 'admin', '123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`blogid`);

--
-- Indexes for table `backenduser`
--
ALTER TABLE `backenduser`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `blogid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `backenduser`
--
ALTER TABLE `backenduser`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
