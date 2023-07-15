-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2022 at 11:15 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iso_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updatedate` varchar(250) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updatedate`, `email`) VALUES
(1, 'KenyaBureauOfStandards', 'kebs12345', '2007', 'kebs12@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `Description`, `creationDate`, `lastupdationdate`) VALUES
(1, 'General', 'JUST A GENERAL COMPLAINT', '0000-00-00 00:00:00', '2021-07-22 13:00:31'),
(2, 'certification issue', 'This category is for certification issues/compliant against an iso org.', '0000-00-00 00:00:00', '2021-07-22 13:00:31'),
(3, 'Product standards', 'This category is for complaints that relate to product standards of an iso org. ', '0000-00-00 00:00:00', '2021-07-22 13:00:31'),
(4, 'corruption allegation', 'Complaints that based on corruption activities', '2021-07-22 13:25:14', '2021-07-22 13:25:14'),
(7, 'working environment', 'This category is for issues relating to working environment of an iso org.', '2021-07-22 15:05:49', '2021-07-22 15:05:49'),
(8, 'customer relations', 'This category is for issues relating to customer relations of an iso org.', '2021-08-03 11:41:25', '2021-08-03 11:41:25'),
(13, 'general', 'general categories', '2021-08-31 11:29:27', '2021-08-31 11:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(10) NOT NULL,
  `complaintNo` int(10) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNo`, `status`, `remark`, `remarkDate`) VALUES
(2, 5, 'closed', 'well received', '2021-07-23 13:15:54'),
(3, 2, 'in process', 'the bureau is currently investigating', '2021-07-23 13:22:49'),
(4, 7, 'closed', 'details reviewed and closed', '2021-07-23 14:40:54'),
(5, 11, 'closed', 'we are not allowing any more appeals', '2021-07-27 14:30:10'),
(6, 1, 'closed', 'complaint does not have enough evidence', '2021-08-03 15:44:03'),
(7, 76, 'closed', 'The documents have been reviewed and the are in order.', '2021-08-11 17:32:45'),
(8, 69, 'closed', 'The evidence provided is shallow and lack depth. ', '2021-08-11 17:38:32'),
(9, 77, 'closed', 'The evidence that we have found have confirmed your case and have forwarded it to the relavant authorities', '2021-08-11 17:40:19'),
(10, 73, 'closed', 'the catholic university is university that does not produce any products.', '2021-08-11 17:41:49'),
(12, 14, 'closed', 'final verdict reached', '2021-08-13 15:50:11'),
(14, 13, 'open', 'still under investigation', '2021-08-30 11:44:37'),
(15, 162, 'closed', 'investigation ended', '2021-08-31 11:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaintno` int(10) NOT NULL,
  `userid` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  `county` varchar(250) NOT NULL,
  `noc` varchar(250) DEFAULT NULL,
  `complaintdetails` varchar(250) NOT NULL,
  `complaintfile` varchar(250) DEFAULT NULL,
  `regdate` date DEFAULT curdate(),
  `status` varchar(250) DEFAULT NULL,
  `lastupdatedate` date DEFAULT curdate(),
  `complaintAgainst` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`complaintno`, `userid`, `category`, `county`, `noc`, `complaintdetails`, `complaintfile`, `regdate`, `status`, `lastupdatedate`, `complaintAgainst`) VALUES
(1, 1, 'General', 'Nairobi', 'important', 'corruption complaint', 'null', '2020-11-08', 'closed', '2021-01-05', 'Catholic university'),
(2, 1, 'General', 'Nairobi', 'important', 'corruption complaint', 'null', '2019-07-27', 'inprocess', '2019-12-15', 'National Social Security Fund'),
(3, 1, 'Working environment', 'Mombasa', 'important', 'corruption complaint', 'null', '2021-05-03', 'inprocess', '2021-05-06', 'University of Embu'),
(4, 2, 'customer relations', 'Kisumu', 'not-important', 'thank you', 'null', '2021-08-03', 'closed', '2021-08-06', 'Catholic university'),
(5, 2, 'General', 'Narok', 'not-important', 'thank you', 'null', '2021-07-23', 'closed', '2021-07-28', 'National Social Security Fund'),
(6, 3, 'certification issue', 'Marsabit', 'important', 'review of details', 'null', '2020-01-03', 'closed', '2020-02-15', 'Catholic university'),
(7, 3, 'Product standard', 'Taita-Taveta', 'important', 'review of details', 'null', '2021-03-03', 'closed', '2021-04-15', 'University of Embu'),
(8, 3, 'customer realtions', 'Taita-Taveta', 'important', 'review of details', 'null', '2021-08-03', 'inprocess', '2021-08-05', 'Communications Authority of Kenya'),
(9, 3, 'product standards', 'Muranga', 'important', 'review of details', 'null', '2019-09-03', 'inprocess', '2019-09-15', 'University of Embu'),
(10, 3, 'working environment', 'Machakos', 'important', 'review of details', 'null', '2019-06-23', 'closed', '2019-07-15', 'National Social Security Fund'),
(11, 5, 'customer relation', 'kisumu', 'important', 'Appeal details', 'null', '2021-05-13', 'closed', '2021-06-01', 'National Social Security Fund'),
(12, 15, 'working environment', 'Nakuru', 'not important', 'Very good work', 'null', '2018-05-14', 'closed', '2018-07-01', 'Catholic University'),
(13, 17, 'corruption allegation', 'Kisii', 'important', 'Corruption details', 'null', '2018-03-09', 'open', '2018-05-01', 'Nairobi City Water & Sewerage Company Limited'),
(14, 13, 'General', 'Mombasa', 'important', 'review of details', 'null', '2021-04-15', 'closed', '2021-07-01', 'University of Embu'),
(15, 18, 'customer relation', 'Nairobi', 'not important', 'Very good work', 'null', '2021-01-03', 'closed', '2021-05-01', 'Catholic University'),
(16, 19, 'corruption allegation', 'Mombasa', 'important', 'review of details', 'null', '2020-12-26', 'inprocess', '2020-12-30', 'University of Embu'),
(17, 20, 'General', 'Mombasa', 'important', 'review of details', 'null', '2019-05-12', 'open', '2019-07-01', 'National Social Security Fund'),
(18, 16, 'corruption allegation', 'Kitui', 'important', 'review of details', 'null', '2021-04-28', 'inprocess', '2021-05-12', 'National Social Security Fund'),
(19, 13, 'customer relation', 'Machakos', 'important', 'review of details', 'null', '2021-05-16', 'inprocess', '2021-06-10', 'Catholic University'),
(68, 1, 'General', 'Marsabit', 'important', 'unfavorable working conditions', 'null', '2021-07-27', 'open', '2021-07-27', 'Catholic university'),
(69, 1, 'customer relations', 'Nairobi', 'important', 'the iso organisation has poor customer relations as a result of harrasment. ', 'null', '2021-08-03', 'closed', '2021-08-03', 'Catholic University'),
(70, 1, 'Product standards', 'Garrisa', 'important', 'The product standard needs to be investigated', 'null', '2021-08-08', 'open', '2021-08-08', 'Catholic University'),
(73, 1, 'General', 'Kilifi', 'important', 'complaint against catholic on product issue', 'null', '2021-08-04', 'closed', '2021-08-06', 'Catholic University'),
(76, 1, 'certification issue', 'Isiolo', 'important', 'Certification forgery on documents submitted to the bureau ', 'null', '2021-08-11', 'closed', '2021-08-11', 'Catholic University'),
(77, 1, 'Product standards', 'Nyandarua', 'important', 'The water source is dirty and may cause health harm', 'null', '2021-08-11', 'closed', '2021-08-11', 'Kisumu Water and sanitation Company limited'),
(78, 1, 'corruption allegation', 'Marsabit', 'important', 'corruption activity at the campus on student registration', 'null', '2021-08-11', 'open', '2021-08-11', 'Catholic University'),
(79, 1, 'working environment', 'Taiat-Taveta', 'important', 'The employees are suffering from lack of enough toilets in the establishment', 'null', '2021-08-11', 'open', '2021-08-11', 'Catholic University'),
(80, 1, 'customer relations', 'Meru', 'important', 'The students are not treated well in the  main office.', 'null', '2021-08-11', 'open', '2021-08-11', 'Catholic University'),
(81, 1, 'General', 'Muranga', 'important', 'The organistional structure is not optimal', 'null', '2021-08-11', 'open', '2021-08-11', 'Catholic University'),
(82, 1, 'certification issue', 'Meru', 'important', 'the university is not properly certified', 'null', '2021-08-11', 'open', '2021-08-11', 'Catholic University'),
(83, 1, 'Product standards', 'Uasin-Gishu', 'important', 'the goods provided are not up to code.', 'null', '2021-08-11', 'open', '2021-08-11', 'Bulto Suppliers & Transporters Ltd'),
(159, 1, 'General', 'Marsabit', 'important', 'efegrgrgererherherhetheth', '', '2021-08-13', 'open', '2021-08-13', 'Kenya Medical Training College'),
(160, 1, 'General', 'Mandera', 'important', 'unhygenic training conditions', '', '2021-08-30', 'open', '2021-08-30', 'Kenya Medical Training College'),
(161, 1, 'General', 'Kilifi', 'important', 'Poor working conditions', '', '2021-08-31', 'open', '2021-08-31', 'Catholic University'),
(162, 96, 'certification issue', 'Kiambu', 'important', 'unhygenic working conditions', '', '2021-08-31', 'closed', '2021-08-31', 'Nairobi City Water & Sewerage Company Limited');

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

CREATE TABLE `county` (
  `id` int(11) NOT NULL,
  `countyname` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `postingdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `county`
--

INSERT INTO `county` (`id`, `countyname`, `description`, `postingdate`, `updatedate`) VALUES
(1, 'Mombasa', 'Beatiful coast city', '2019-12-31 21:00:00', '0000-00-00 00:00:00'),
(2, 'Kwale', 'tourist attaraction town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(3, 'Kilifi', 'tourist attaraction town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(4, 'Tana-River', 'Coast town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(5, 'Lamu', 'Coast town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(6, 'Taiat-Taveta', 'Coast town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(7, 'Garrisa', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(8, 'Wajir', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(9, 'Mandera', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(10, 'Marsabit', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(11, 'Isiolo', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(12, 'Meru', 'Eastern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(13, 'Tharaka-Nithi', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(14, 'Embu', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(15, 'Kitui', 'Eastern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(16, 'Machakos', 'Eastern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(17, 'Makueni', 'Eastern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(18, 'Nyandarua', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(19, 'Nyeri', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(20, 'Kirinyaga', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(21, 'Muranga', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(22, 'Kiambu', 'Central Town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(23, 'Turkana', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(24, 'West-Pokot', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(25, 'Samburu', 'Northern town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(26, 'Trans-Nzoia', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(27, 'Uasin-Gishu', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(28, 'Elgeyo-Marakwet', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(29, 'Nandi', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(30, 'Baringo', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(31, 'Laikipia', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(32, 'Nakuru', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(33, 'Narok', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(34, 'Kajiado', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(35, 'Kericho', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(36, 'Bomet', 'Nort-Rift town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(37, 'Kakamega', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(38, 'Vihiga', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(39, 'Bungoma', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(40, 'Busia', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(41, 'Siaya', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(42, 'Siaya', 'Lake Region town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(43, 'Homa-Bay', 'Lake Region town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(44, 'Migori', 'Lake Region town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(45, 'Kisii', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(46, 'Nyamira', 'Western town', '2020-01-01 21:00:00', '0000-00-00 00:00:00'),
(47, 'Nairobi', 'Capital City', '2020-01-01 21:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `isologin`
--

CREATE TABLE `isologin` (
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `isologin`
--

INSERT INTO `isologin` (`id`, `userid`, `username`, `logintime`, `logout`, `status`) VALUES
(0, 0, 'cuea12@gmail.com', '2021-07-27 09:40:22', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `isoorg`
--

CREATE TABLE `isoorg` (
  `id` int(11) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `useremail` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `contactno` int(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `county` varchar(250) NOT NULL,
  `userimage` varchar(250) DEFAULT NULL,
  `regdate` varchar(250) DEFAULT NULL,
  `updationdate` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `CertNo` varchar(255) DEFAULT NULL,
  `ScopeCert` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `isoorg`
--

INSERT INTO `isoorg` (`id`, `fullname`, `useremail`, `password`, `contactno`, `address`, `county`, `userimage`, `regdate`, `updationdate`, `status`, `CertNo`, `ScopeCert`) VALUES
(1, 'University of Embu', 'embuni@gmail.com', 'uof12345', 23231232, 'P.O BOX 6-60100,EMBU', 'Embu', '', '28-06- 2018', '', 'active', 'ISMS/004', 'Provision of Training,Research and Extension'),
(2, 'National Social Security Fund', 'nssf@gmail.com', 'nssf12345', 2147483647, 'P.O BOX 14448-00800 ,NAIROBI', 'Nairobi', '', '23-08-2019', 'Null', 'active', 'ISMS/007', 'Provision of social security'),
(3, 'Communications Authority of Kenya', 'CAK12@gmail.com', 'cak12345', 23344232, 'P.O BOX 14448-00800 ,NAIROBI', 'Nairobi', '', '05-10-2015', 'Null', 'active', 'ISMS/002', 'Provision of licensing and regulatory services, publishing of ICT statistical information competition management and universal access'),
(4, 'National Council for Population and Development', 'NCPD@gmail.com', 'ncpd12345', 546344232, 'P.O BOX 48994-00100,NAIROBI', 'Nairobi', '', '23-04-2020', 'Null', 'active', 'ISMS/003', 'Promotion and coordination of population & development activities and?provision of leadership and guidance in matters related to population & development in Kenya'),
(5, 'Mukiria Technical Training Institute', 'MTTI@gmail.com', 'mtti12345', 23344232, 'P.O BOX 1093-60200,MERU', 'Meru', 'null', '06-02-2020', 'Null', 'active', 'ISMS/008', 'Entrepreneurial training through research innovation and technology'),
(6, 'Laikipia University (LU)', 'LU@gmail.com', 'lu48494', 23344232, 'P.0 BOX1100-20300,NYAHURURU', 'Nyahururu', 'null', '08-08-2019', 'Null', 'active', 'ISMS/006', 'Design, Development and delivery of teaching, learning, research, innovation and community service'),
(7, 'Nairobi City Water & Sewerage Company Limited', 'NCWS@gmail.com', 'NCE48494', 23344232, 'P.O BOX 30656-00100 NAIROBI', 'Nairobi', 'null', '22-02-2021', 'Null', 'active', 'QMS 343', 'Water supply and waste collection from the customers to the trunk lines; and water harvesting storage and treatment'),
(8, 'Railways Training Institute', 'RTI@gmail.com', 'N48494', 23344232, 'P.O BOX 4226-00100,NAIROBI', 'Nairobi', 'null', '12-01-2021', 'Null', 'active', 'QMS 342', 'Vocational Education Training at NAIROBI Campus and Provision of Vocational Education Training and Maritime courses at Kisumu Campus'),
(9, 'Commission for University Education', 'CUE@gmail.com', 'N48494', 23344232, 'P O Box 5499-00200 NAIROBI', 'Nairobi', 'null', '16-09-2019', 'Null', 'active', 'QMS 122', 'University accreditation, approval of academic programmes, quality auditing of institutions and academic programmes, provision of policy advice to the Cabinet Secretary in charge of Education, research, innovation, institutional capacity building and reso'),
(10, 'Bulto Suppliers & Transporters Ltd', 'BST@gmail.com', 'N48494', 23344232, 'P.O. Box 404-00202, NAIROBI ', 'Nairobi', 'null', '26-09-2016', 'Null', 'active', 'QMS 288', 'Transportation of Goods'),
(11, 'Rift Valley Technical Training Institute', 'RVTTI@gmail.com', 'wq342dwed323', 98334673, 'P O Box 244-30100, ELDORET', 'ELDORET', 'Null', '20-09-2010', 'null', 'active', 'QMS/121', 'Training services in Technical and Vocational Education and Training (T.V.E.T)'),
(12, 'Kenya Medical Training College', 'KMTC@gmail.com', '4543wed323', 27334673, 'P.O. Box 30195-00100, NAIROBI', 'Nairobi', 'Null', '17-06-2009', 'null', 'active', 'QMS/069', 'Training of Health Professionals'),
(13, 'Louis Dreyfus Company (LDC)', 'LDC@gmail.com', '4t45wed323', 27334673, 'P.O BOX 34256-80118 Mombasa,Kenya', 'Mombasa', 'Null', '17-07-2019', 'null', 'active', 'QMS /330', 'Trading of bulk palm oil and bulk grain, vessel discharge, storage and loading of palm oil'),
(14, 'Technical and Vocational Education and Training Authority', 'TVE@gmail.com', '4t45wed323', 27334673, 'PO BOX 36525-00100,NAIROBI', 'Nairobi', 'Null', '15-01-2021', 'null', 'active', 'QMS 340', 'Technical Vocational and education and Training Authority (TVETA'),
(15, 'Kenya National Commission For UNESCO', 'KNCU@gmail.com', '4t45wed323', 27334673, 'P. O BOX 698 - 00100 NAIROBI', 'Nairobi', 'Null', '15-04-2019', 'null', 'active', 'QMS/326', 'Technical and Corporate Support Services. The products and services covered include knowledge generation, capacity building, provision of expert advisory services, coordination of ratification of UNESCO Conventions, establishments of UNESCO networks'),
(16, 'Mount Kenya University', 'MKU@gmail.com', '4t45wed323', 27334673, 'P O Box 342-00100, THIKA', 'Nairobi', 'Null', '19-12-2012', 'null', 'active', 'QMS/210', 'Teaching, Research, innovation and Community service'),
(17, 'Catholic University', 'cuea12@gmail.com', 'cuea12345', 723362677, 'P. O BOX 698 - 00100 NAIROBI', 'Nairobi ', 'Null', '2012-01-20', 'null', 'active', 'QMS/146', 'Research, teaching (curriculum implementation) and community service'),
(18, 'Technical University of Kenya', 'TUK@gmail.com', '4t45wed323', 27334673, 'P.O. Box 52428-00200, NAIROBI', 'Nairobi', 'Null', '3-05-2016', 'null', 'active', 'QMS/278', 'Teaching, research and extension'),
(19, 'Kisumu Water and sanitation Company limited', 'KWSC@gmail.com', '4t45wed323', 27334673, 'P.O.Box 3210-40100, KISUMU', 'Kisumu', 'Null', '3-05-2016', 'null', 'active', 'QMS/157', 'Supply of drining water,collection and treatment of waste water.');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `userid`, `username`, `logintime`, `logout`, `status`) VALUES
(1, 1, 'Isaqo Elema', '2019-12-31 21:00:00', '2020-01-01 01:12:09', 0),
(2, 2, 'lawrence Kamau', '2021-07-10 05:23:00', '2021-07-10 05:52:09', 0),
(3, 3, 'Grace kamau', '2021-07-10 05:23:00', '0000-00-00 00:00:00', 1),
(4, 4, 'Dorothy Wangui', '2021-06-11 15:23:00', '0000-00-00 00:00:00', 1),
(5, 5, 'Abdi kadir', '2021-01-14 16:23:00', '0000-00-00 00:00:00', 1),
(6, 1, 'Isaqo Elema', '2020-03-03 21:45:00', '2020-03-03 21:58:54', 0),
(7, 3, 'Grace Kamau', '2020-03-03 21:45:00', '2020-03-03 21:58:54', 0),
(8, 5, 'Abdi kadir', '2020-04-30 21:45:00', '2020-04-30 21:58:54', 0),
(9, 2, 'lawrence Kamau', '2021-02-28 21:45:00', '2021-02-28 21:58:54', 0),
(10, 4, 'Dorothy Kamau', '2019-02-28 21:45:00', '2019-02-28 21:58:54', 0),
(11, 8, 'Chris Okoth', '2018-10-31 21:45:00', '2018-10-31 21:58:54', 0),
(12, 10, 'Ali Hasan', '2011-10-31 21:45:00', '2011-10-31 21:58:54', 0),
(13, 13, 'Tom Macharia', '2017-10-31 21:45:00', '2017-10-31 21:58:54', 0),
(14, 11, 'Mark kaliua', '2020-02-29 21:45:00', '0000-00-00 00:00:00', 1),
(15, 20, 'Moses macha', '2021-02-28 21:45:00', '0000-00-00 00:00:00', 1),
(16, 9, 'lilian rahab', '2021-05-20 21:45:00', '0000-00-00 00:00:00', 1),
(17, 14, 'Kevin mark', '2021-06-21 16:45:00', '0000-00-00 00:00:00', 1),
(18, 6, 'Agnes Wangui', '2021-11-21 16:45:00', '0000-00-00 00:00:00', 1),
(19, 10, 'Ali Hasan', '2019-10-31 21:45:00', '2011-10-31 21:58:54', 0),
(20, 10, 'Ali Hasan', '2011-10-31 21:45:00', '2011-10-31 21:58:54', 0),
(21, 1, 'iscoelema12@gmail.com', '2021-07-19 11:03:07', '0000-00-00 00:00:00', 0),
(25, 1, 'iscoelema12@gmail.com', '2021-07-19 11:04:34', '0000-00-00 00:00:00', 0),
(26, 1, 'iscoelema12@gmail.com', '2021-07-19 11:54:20', '0000-00-00 00:00:00', 0),
(27, 1, 'iscoelema12@gmail.com', '2021-07-19 12:52:01', '0000-00-00 00:00:00', 0),
(28, 1, 'iscoelema12@gmail.com', '2021-07-19 12:54:17', '0000-00-00 00:00:00', 0),
(29, 1, 'iscoelema12@gmail.com', '2021-07-19 12:55:22', '0000-00-00 00:00:00', 0),
(30, 1, 'iscoelema12@gmail.com', '2021-07-19 14:09:55', '0000-00-00 00:00:00', 0),
(31, 0, 'iscoelema12@gmail.com', '2021-07-19 14:10:14', '0000-00-00 00:00:00', 0),
(32, 1, 'iscoelema12@gmail.com', '2021-07-19 14:10:26', '0000-00-00 00:00:00', 0),
(33, 1, 'iscoelema12@gmail.com', '2021-07-19 15:22:31', '0000-00-00 00:00:00', 0),
(34, 0, 'iscoelema12@gmail.com', '2021-07-19 15:23:04', '0000-00-00 00:00:00', 0),
(35, 1, 'iscoelema12@gmail.com', '2021-07-19 15:23:17', '0000-00-00 00:00:00', 0),
(36, 1, 'iscoelema12@gmail.com', '2021-07-20 09:18:35', '0000-00-00 00:00:00', 0),
(37, 1, 'iscoelema12@gmail.com', '2021-07-20 09:29:13', '0000-00-00 00:00:00', 0),
(38, 0, 'iscoelema12@gmail.com', '2021-07-23 11:38:49', '0000-00-00 00:00:00', 0),
(39, 1, 'iscoelema12@gmail.com', '2021-07-23 11:39:05', '0000-00-00 00:00:00', 0),
(40, 1, 'iscoelema12@gmail.com', '2021-07-23 11:49:35', '0000-00-00 00:00:00', 0),
(41, 1, 'iscoelema12@gmail.com', '2021-07-23 12:13:45', '0000-00-00 00:00:00', 0),
(42, 1, 'iscoelema12@gmail.com', '2021-07-23 12:22:19', '0000-00-00 00:00:00', 0),
(43, 1, 'iscoelema12@gmail.com', '2021-07-23 12:24:07', '0000-00-00 00:00:00', 0),
(44, 1, 'iscoelema12@gmail.com', '2021-07-27 08:53:40', '0000-00-00 00:00:00', 0),
(45, 1, 'iscoelema12@gmail.com', '2021-07-27 12:34:35', '0000-00-00 00:00:00', 0),
(46, 1, 'Isaqo Elema', '2021-07-27 13:13:43', '2021-07-27 13:13:43', 1),
(47, 1, 'Isaqo Elema', '2021-07-27 13:16:44', '2021-07-27 13:16:44', 1),
(48, 1, 'Isaqo Elema', '2021-08-03 09:13:24', '2021-08-03 09:13:24', 1),
(49, 1, 'Isaqo Elema', '2021-08-03 11:11:31', '2021-08-03 11:11:31', 1),
(50, 1, 'Isaqo Elema', '2021-08-03 11:24:25', '2021-08-03 11:24:25', 1),
(51, 0, 'CAK@gmail.com', '2021-08-03 13:21:41', '2021-08-03 13:21:41', 0),
(52, 1, 'Isaqo Elema', '2021-08-03 15:49:03', '2021-08-03 15:49:03', 1),
(53, 1, 'Isaqo Elema', '2021-08-03 16:13:56', '2021-08-03 16:13:56', 1),
(54, 1, 'Isaqo Elema', '2021-08-03 16:48:23', '2021-08-03 16:48:23', 1),
(55, 0, 'frferfe', '2021-08-03 17:06:32', '2021-08-03 17:06:32', 0),
(56, 0, 'swdwd', '2021-08-03 17:06:38', '2021-08-03 17:06:38', 0),
(57, 0, 'iscoelema12@gmail.com', '2021-08-03 17:06:50', '0000-00-00 00:00:00', 0),
(58, 0, 'iscoelema12@gmail.com', '2021-08-03 17:07:03', '0000-00-00 00:00:00', 0),
(59, 1, 'Isaqo Elema', '2021-08-03 17:07:16', '2021-08-03 17:07:16', 1),
(60, 0, 'f', '2021-08-03 17:16:40', '2021-08-03 17:16:40', 0),
(61, 0, 'iscoelema12@gmail.com', '2021-08-03 17:16:54', '0000-00-00 00:00:00', 0),
(62, 0, 'iscoelema12@gmail.com', '2021-08-03 17:17:01', '0000-00-00 00:00:00', 0),
(63, 1, 'Isaqo Elema', '2021-08-03 17:17:13', '2021-08-03 17:17:13', 1),
(64, 0, '', '2021-08-03 17:55:28', '2021-08-03 17:55:28', 0),
(65, 0, 'iscoelema12@gmail.com', '2021-08-03 17:55:39', '0000-00-00 00:00:00', 0),
(66, 0, 'iscoelema12@gmail.com', '2021-08-03 17:55:51', '0000-00-00 00:00:00', 0),
(67, 1, 'Isaqo Elema', '2021-08-03 17:56:07', '2021-08-03 17:56:07', 1),
(68, 1, 'Isaqo Elema', '2021-08-03 17:58:56', '2021-08-03 17:58:56', 1),
(69, 1, 'Isaqo Elema', '2021-08-04 07:55:16', '2021-08-04 07:55:16', 1),
(70, 1, 'Isaqo Elema', '2021-08-04 08:34:07', '2021-08-04 08:34:07', 1),
(71, 0, 'i', '2021-08-04 09:09:41', '2021-08-04 09:09:41', 0),
(72, 1, 'Isaqo Elema', '2021-08-04 09:10:03', '2021-08-04 09:10:03', 1),
(73, 0, 'iscoelema12@gmail.com', '2021-08-07 08:55:36', '0000-00-00 00:00:00', 0),
(74, 1, 'Isaqo Elema', '2021-08-07 08:55:47', '2021-08-07 08:55:47', 1),
(75, 0, 'iscoelema12@gmail.com', '2021-08-07 12:29:21', '0000-00-00 00:00:00', 0),
(76, 1, 'Isaqo Elema', '2021-08-07 12:29:30', '2021-08-07 12:29:30', 1),
(77, 1, 'Isaqo Elema', '2021-08-07 12:56:53', '2021-08-07 12:56:53', 1),
(78, 1, 'Isaqo Elema', '2021-08-07 13:13:09', '2021-08-07 13:13:09', 1),
(79, 1, 'Isaqo Elema', '2021-08-08 16:29:02', '2021-08-08 16:29:02', 1),
(80, 0, 'cuea12@gmail.com', '2021-08-08 17:12:30', '2021-08-08 17:12:30', 0),
(81, 0, '', '2021-08-08 17:24:47', '2021-08-08 17:24:47', 0),
(82, 0, '', '2021-08-08 17:25:07', '2021-08-08 17:25:07', 0),
(83, 1, 'Isaqo Elema', '2021-08-08 17:25:15', '2021-08-08 17:25:15', 1),
(84, 1, 'Isaqo Elema', '2021-08-11 16:59:21', '2021-08-11 16:59:21', 1),
(85, 1, 'Isaqo Elema', '2021-08-11 17:11:35', '2021-08-11 17:11:35', 1),
(86, 1, 'Isaqo Elema', '2021-08-11 17:23:22', '2021-08-11 17:23:22', 1),
(87, 1, 'Isaqo Elema', '2021-08-11 17:35:24', '2021-08-11 17:35:24', 1),
(88, 1, 'Isaqo Elema', '2021-08-12 09:28:05', '2021-08-12 09:28:05', 1),
(89, 1, 'Isaqo Elema', '2021-08-12 09:35:07', '2021-08-12 09:35:07', 1),
(90, 1, 'Isaqo Elema', '2021-08-12 09:35:36', '2021-08-12 09:35:36', 1),
(91, 0, '', '2021-08-12 09:52:57', '2021-08-12 09:52:57', 0),
(92, 0, '', '2021-08-12 09:54:28', '2021-08-12 09:54:28', 0),
(93, 0, '', '2021-08-12 09:54:31', '2021-08-12 09:54:31', 0),
(94, 0, '', '2021-08-12 09:54:43', '2021-08-12 09:54:43', 0),
(95, 0, '', '2021-08-12 09:54:51', '2021-08-12 09:54:51', 0),
(96, 0, '', '2021-08-12 09:55:42', '2021-08-12 09:55:42', 0),
(97, 0, '', '2021-08-12 09:55:45', '2021-08-12 09:55:45', 0),
(98, 0, '', '2021-08-12 09:56:00', '2021-08-12 09:56:00', 0),
(99, 1, 'Isaqo Elema', '2021-08-12 09:57:41', '2021-08-12 09:57:41', 1),
(100, 0, '', '2021-08-12 09:57:51', '2021-08-12 09:57:51', 0),
(101, 0, '', '2021-08-12 09:58:18', '2021-08-12 09:58:18', 0),
(102, 0, '', '2021-08-12 09:58:21', '2021-08-12 09:58:21', 0),
(103, 0, 'iscoelema12@gmail.com', '2021-08-12 09:58:27', '0000-00-00 00:00:00', 0),
(104, 0, 'iscoelema12@gmail.com', '2021-08-12 09:58:38', '0000-00-00 00:00:00', 0),
(105, 0, 'iscoelema12@gmail.com', '2021-08-12 09:59:10', '0000-00-00 00:00:00', 0),
(106, 1, 'Isaqo Elema', '2021-08-12 09:59:18', '2021-08-12 09:59:18', 1),
(107, 0, 'i', '2021-08-12 09:59:32', '2021-08-12 09:59:32', 0),
(108, 0, 'isa', '2021-08-12 09:59:38', '2021-08-12 09:59:38', 0),
(109, 0, 'fwefewef', '2021-08-12 09:59:42', '2021-08-12 09:59:42', 0),
(110, 0, 'erferffer@.com', '2021-08-12 09:59:51', '2021-08-12 09:59:51', 0),
(111, 0, 'iscoelema12@gmail.com', '2021-08-12 09:59:57', '0000-00-00 00:00:00', 0),
(112, 1, 'Isaqo Elema', '2021-08-12 10:00:07', '2021-08-12 10:00:07', 1),
(113, 0, 'iscoelema12@gmail.com', '2021-08-12 10:01:50', '0000-00-00 00:00:00', 0),
(114, 0, 'iscoelema12@gmail.com', '2021-08-12 10:01:59', '0000-00-00 00:00:00', 0),
(115, 1, 'Isaqo Elema', '2021-08-12 10:02:08', '2021-08-12 10:02:08', 1),
(116, 0, '', '2021-08-12 10:36:19', '2021-08-12 10:36:19', 0),
(117, 0, 'iscoelema12@gmail.com', '2021-08-12 10:36:24', '0000-00-00 00:00:00', 0),
(118, 1, 'Isaqo Elema', '2021-08-12 10:36:33', '2021-08-12 10:36:33', 1),
(119, 1, 'Isaqo Elema', '2021-08-13 10:27:15', '2021-08-13 10:27:15', 1),
(120, 1, 'Isaqo Elema', '2021-08-13 12:35:00', '2021-08-13 12:35:00', 1),
(121, 1, 'Isaqo Elema', '2021-08-13 12:35:14', '2021-08-13 12:35:14', 1),
(122, 1, 'Isaqo Elema', '2021-08-13 12:35:48', '2021-08-13 12:35:48', 1),
(123, 1, 'Isaqo Elema', '2021-08-13 12:36:37', '2021-08-13 12:36:37', 1),
(124, 1, 'Isaqo Elema', '2021-08-13 12:38:06', '2021-08-13 12:38:06', 1),
(125, 1, 'Isaqo Elema', '2021-08-13 12:38:14', '2021-08-13 12:38:14', 1),
(126, 1, 'Isaqo Elema', '2021-08-13 12:39:15', '2021-08-13 12:39:15', 1),
(127, 0, 'idfbfdbdfbfd', '2021-08-13 12:39:24', '2021-08-13 12:39:24', 0),
(128, 0, 'idfbfdbdfbfd', '2021-08-13 12:39:36', '2021-08-13 12:39:36', 0),
(129, 0, 'idfbfdbdfbfd', '2021-08-13 12:40:38', '2021-08-13 12:40:38', 0),
(130, 0, 'iscoelema12@gmail.com', '2021-08-13 12:41:15', '0000-00-00 00:00:00', 0),
(131, 1, 'Isaqo Elema', '2021-08-13 12:41:27', '2021-08-13 12:41:27', 1),
(132, 0, 'howard@gmail.com', '2021-08-13 12:54:44', '0000-00-00 00:00:00', 0),
(133, 92, 'mike howard', '2021-08-13 12:54:56', '2021-08-13 12:54:56', 1),
(134, 0, '', '2021-08-13 15:58:13', '2021-08-13 15:58:13', 0),
(135, 0, '', '2021-08-14 09:36:57', '2021-08-14 09:36:57', 0),
(136, 0, '', '2021-08-14 09:39:35', '2021-08-14 09:39:35', 0),
(137, 0, 'idfbfdbdfbfd@gmail.com', '2021-08-14 09:40:13', '2021-08-14 09:40:13', 0),
(138, 0, 'cuea12@gmail.com', '2021-08-14 09:53:54', '2021-08-14 09:53:54', 0),
(139, 0, 'cuea12@gmail.com', '2021-08-14 09:54:05', '2021-08-14 09:54:05', 0),
(140, 0, 'cuea12@gmail.com', '2021-08-14 09:54:48', '2021-08-14 09:54:48', 0),
(141, 0, 'cuea12@gmail.com', '2021-08-14 09:55:32', '2021-08-14 09:55:32', 0),
(142, 1, 'Isaqo Elema', '2021-08-14 10:14:38', '2021-08-14 10:14:38', 1),
(143, 0, 'iscoelema12@gmail.com', '2021-08-15 19:02:48', '0000-00-00 00:00:00', 0),
(144, 1, 'Isaqo Elema', '2021-08-15 19:02:57', '2021-08-15 19:02:57', 1),
(145, 0, 'iscoelema12@gmail.com', '2021-08-15 19:03:53', '0000-00-00 00:00:00', 0),
(146, 0, 'cuea12@gmail.com', '2021-08-15 19:04:04', '2021-08-15 19:04:04', 0),
(147, 0, 'cuea12@gmail.com', '2021-08-15 19:04:13', '2021-08-15 19:04:13', 0),
(148, 0, 'cuea12@gmail.com', '2021-08-15 19:04:54', '2021-08-15 19:04:54', 0),
(149, 0, 'cuea12@gmail.com', '2021-08-15 19:05:39', '2021-08-15 19:05:39', 0),
(150, 0, 'embuni@gmail.com', '2021-08-15 19:08:55', '2021-08-15 19:08:55', 0),
(151, 0, 'iscoelema12@gmail.com', '2021-08-16 10:30:15', '0000-00-00 00:00:00', 0),
(152, 1, 'Isaqo Elema', '2021-08-16 10:30:36', '2021-08-16 10:30:36', 1),
(153, 1, 'Isaqo Elema', '2021-08-17 10:12:16', '2021-08-17 10:12:16', 1),
(154, 1, 'Isaqo Elema', '2021-08-18 10:56:38', '2021-08-18 10:56:38', 1),
(155, 0, 'iscoelema12@gmail.com', '2021-08-25 10:30:45', '0000-00-00 00:00:00', 0),
(156, 1, 'Isaqo Elema', '2021-08-25 10:30:57', '2021-08-25 10:30:57', 1),
(157, 0, 'iscoelema12@gmail.com', '2021-08-25 10:31:57', '0000-00-00 00:00:00', 0),
(158, 0, 'kebs12@gmail.com', '2021-08-25 10:32:11', '2021-08-25 10:32:11', 0),
(159, 0, 'kebs12@gmail.com', '2021-08-25 10:32:20', '2021-08-25 10:32:20', 0),
(160, 0, 'kebs12@gmail.com', '2021-08-25 10:32:31', '2021-08-25 10:32:31', 0),
(161, 93, 'jules konde', '2021-08-25 10:35:24', '2021-08-25 10:35:24', 1),
(162, 1, 'Isaqo Elema', '2021-08-30 11:53:22', '2021-08-30 11:53:22', 1),
(163, 0, 'dssdcsdc@gmail.com', '2021-08-30 11:53:50', '2021-08-30 11:53:50', 0),
(164, 1, 'Isaqo Elema', '2021-08-30 11:54:00', '2021-08-30 11:54:00', 1),
(165, 94, 'abudo', '2021-08-30 11:59:41', '2021-08-30 11:59:41', 1),
(166, 0, 'iscoelema12@gmail.com', '2021-08-30 12:05:04', '0000-00-00 00:00:00', 0),
(167, 1, 'Isaqo Elema', '2021-08-30 12:05:13', '2021-08-30 12:05:13', 1),
(168, 1, 'Isaqo Elema', '2021-08-30 12:54:39', '2021-08-30 12:54:39', 1),
(169, 1, 'Isaqo Elema', '2021-08-30 13:23:24', '2021-08-30 13:23:24', 1),
(170, 1, 'Isaqo Elema', '2021-08-30 14:20:06', '2021-08-30 14:20:06', 1),
(171, 1, 'Isaqo Elema', '2021-08-31 06:58:11', '2021-08-31 06:58:11', 1),
(172, 1, 'Isaqo Elema', '2021-08-31 09:24:20', '2021-08-31 09:24:20', 1),
(173, 96, 'joel mark', '2021-08-31 11:19:54', '2021-08-31 11:19:54', 1),
(174, 96, 'joel mark', '2021-08-31 11:36:01', '2021-08-31 11:36:01', 1),
(175, 1, 'Isaqo Elema', '2021-08-31 12:38:48', '2021-08-31 12:38:48', 1),
(176, 1, 'Isaqo Elema', '2021-09-04 10:41:09', '2021-09-04 10:41:09', 1),
(177, 1, 'Isaqo Elema', '2021-12-08 11:26:25', '2021-12-08 11:26:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `useremail` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `contactno` int(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `county` varchar(250) NOT NULL,
  `userimage` varchar(255) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `useremail`, `password`, `contactno`, `address`, `county`, `userimage`, `regdate`, `updationdate`, `status`) VALUES
(1, 'Isaqo Elema', 'iscoelema12@gmail.com', 'isaqo12345', 723362677, 'P.O BOX 6-60100', 'Marsabit ', 'null', '2012-01-19 21:00:00', '0000-00-00 00:00:00', 'Active'),
(2, 'lawrence kamau', 'lk@gmail.com', 'lawrence12345', 2147483647, 'P.O BOX 6-60100', 'Kajiado', 'null', '2020-09-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(3, 'Grace kamau', 'Gk@gmail.com', 'lk12112323', 2147483647, 'P.O BOX 6-60100', 'Kajiado', 'null', '2020-09-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(4, 'Dorothy Wangui', 'DW@gmail.com', 'lk12112', 9726127, 'P.O BOX 6-60100', 'nairobi', 'null', '2021-09-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(5, 'Abdi kadir', 'ABD@gmail.com', 'trr2112', 3726127, 'P.O BOX 6-60100', 'nairobi', 'null', '2021-05-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(6, 'Agnes Wangui', 'AW@gmail.com', 'kkk12112', 6726127, 'P.O BOX 6-60100', 'kisumu', 'null', '2021-09-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(7, 'Ahmed juma', 'Ahm@gmail.com', 'jdnjd2112', 5426127, 'P.O BOX 6-60100', 'Mombasa', 'null', '2021-01-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(8, 'Chris okoth', 'kAW@gmail.com', 'k412112', 54726127, 'P.O BOX 6-60100', 'Nakuru', 'null', '2021-07-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(9, 'lilian rahab', 'lAW@gmail.com', 'tbvr12112', 9726127, 'P.O BOX 6-60100', 'isiolo', 'null', '2020-09-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(10, 'Ali Hasan', 'lAhm@gmail.com', 'ytjd2112', 5426127, 'P.O BOX 6-60100', 'Garissa', 'null', '2019-01-07 21:00:00', '0000-00-00 00:00:00', 'active'),
(11, 'Mark kaliua', 'mark@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Nairobi', 'null', '2019-09-17 21:00:00', '0000-00-00 00:00:00', 'active'),
(12, 'Tom Macharia', 'Tom@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Mombasa', 'null', '2018-05-17 21:00:00', '0000-00-00 00:00:00', 'active'),
(13, 'Tom Macharia', 'Tom@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'West-Pokot', 'null', '2018-05-17 21:00:00', '0000-00-00 00:00:00', 'active'),
(14, 'kevin mark', 'Kevin@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Kisii', 'null', '2020-08-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(15, 'Brian muo', 'Brian@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Kisumu', 'null', '2021-06-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(16, 'lilian muo', 'Lilian@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Taita-Taveta', 'null', '2020-05-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(17, 'Grace wambui', 'Grace@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Machakos', 'null', '2017-05-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(18, 'Naomi wambui', 'Naomi@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Nakuru', 'null', '2019-05-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(19, 'Frank kui', 'Frank@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Nakuru', 'null', '2019-05-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(20, 'Moses macha', 'Moses@gmail.com', '32dd322', 237346, 'P.O BOX 6-60100', 'Nakuru', 'null', '2019-05-27 21:00:00', '0000-00-00 00:00:00', 'active'),
(21, 'alan muio', 'alan12@gmail.com', 'alan12345', 743244353, '', '', 'null', '2021-07-27 09:00:29', '2021-07-27 09:01:03', NULL),
(22, 'dan chemjor', 'danchem@gmail.com', 'dan12345', 2147483647, '', '', 'null', '2021-07-27 09:00:29', '2021-07-27 09:01:03', NULL),
(23, 'chris chris', 'chrischris@gmail.com', 'chrischris12', 2147483647, '', '', 'null', '2021-07-27 09:00:29', '2021-07-27 09:01:03', NULL),
(67, 'nike adidas', 'nike12@gmail.com', 'nike12345', 2147483647, '', '', NULL, '2021-08-03 16:07:50', '2021-08-03 16:07:50', NULL),
(69, 'adidi mark', 'adidi12@gmail.com', '', 0, '', '', NULL, '2021-08-03 16:12:26', '2021-08-03 16:12:26', NULL),
(73, 'adios adios', 'adios12@gmail.com', 'adios12345', 2147483647, '', '', NULL, '2021-08-03 16:30:46', '2021-08-03 16:30:46', NULL),
(74, 'grace wahu', 'grace12@gmail.com', '', 0, '', '', NULL, '2021-08-03 16:37:12', '2021-08-03 16:37:12', NULL),
(76, 'william hao', 'willian12@gmail.com', 'willian12345', 2147483647, '', '', NULL, '2021-08-03 16:42:56', '2021-08-03 16:42:56', NULL),
(78, 'paul vuyanzi', 'vuyanzi12@gmail.com', 'vuyanzi12345', 743244353, '', '', NULL, '2021-08-12 10:07:03', '2021-08-12 10:07:03', NULL),
(92, 'mike howard', 'howard@gmail.com', 'howard12345', 743244353, '', '', NULL, '2021-08-13 12:54:00', '2021-08-13 12:54:00', NULL),
(94, 'abudo', 'abu123@gmail.com', 'abu12345', 2147483647, '', '', NULL, '2021-08-30 11:58:50', '2021-08-30 11:58:50', NULL),
(95, 'dominic njau', 'njau12@gmail.com', 'njau12345', 743244353, '', '', NULL, '2021-08-31 11:14:55', '2021-08-31 11:14:55', NULL),
(96, 'joel mark', 'joel@gmail.com', 'joel12345', 2147483647, '', '', NULL, '2021-08-31 11:18:18', '2021-08-31 11:18:18', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaintno`);

--
-- Indexes for table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `isologin`
--
ALTER TABLE `isologin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `isoorg`
--
ALTER TABLE `isoorg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaintno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `county`
--
ALTER TABLE `county`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `isoorg`
--
ALTER TABLE `isoorg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
