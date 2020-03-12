-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2020 at 10:29 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `center`
--
CREATE DATABASE IF NOT EXISTS `center` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `center`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(80) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressID`, `street`, `city`, `zipCode`) VALUES
(1, 'Union St', 'Chicago', '60609'),
(2, '32', 'ed', '43'),
(3, 'Union', 'Chicago', '60609'),
(4, 'state', 'chicago', '60616'),
(5, 'union', 'naperville', '777');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(30) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
(9, '4wd'),
(10, 'cook'),
(11, 'laptop'),
(12, 'computer'),
(13, 'laptop');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `region` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender` (`name`),
  KEY `regionID` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `email`, `password`, `region`) VALUES
(60, 'Chan', 'male', 'chan@iit.com', 'Qwerty1!', 'North America'),
(61, 'boris', 'male', 'o@cc.com', 'Qwerty1!', 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  PRIMARY KEY (`id`,`addressID`),
  KEY `addressID` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `addressID`) VALUES
(60, 3),
(61, 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(30) NOT NULL,
  `employee_phone` varchar(20) NOT NULL,
  `employee_email` varchar(40) NOT NULL,
  `region_name` varchar(30) NOT NULL,
  `employee_dob` varchar(15) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_name`, `employee_phone`, `employee_email`, `region_name`, `employee_dob`, `password`) VALUES
(1, 'Chan', '123', 'c@iit.com', 'North America', '4/8', 'Qwerty1!'),
(3, 'kelvin', '123', 'kk@iit.com', 'Asia', '12/31/1994', 'Qwerty1!');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_description` varchar(50) NOT NULL,
  `configurable_attributes` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `uploading_customer` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `refill_point` int(11) NOT NULL,
  `refill_date` varchar(20) NOT NULL,
  `warehouse` varchar(20) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `categoryID` (`categoryID`),
  KEY `uploading_customer` (`uploading_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `configurable_attributes`, `quantity`, `categoryID`, `uploading_customer`, `price`, `refill_point`, `refill_date`, `warehouse`) VALUES
(1, 'car', 'good', 'light', 10, 13, 60, 450, 2, '5/2/2018', 'North America'),
(6, 'lenovo', 'fds', 'd', 88, 12, 61, 88, 3, '2018-03-11', 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `product_in_warehouse`
--

DROP TABLE IF EXISTS `product_in_warehouse`;
CREATE TABLE IF NOT EXISTS `product_in_warehouse` (
  `productWarehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouseID` varchar(30) NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `product_name` varchar(40) NOT NULL,
  `categoryName` varchar(40) NOT NULL,
  PRIMARY KEY (`productWarehouseID`),
  KEY `product_id` (`product_id`),
  KEY `warehouseID` (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_in_warehouse`
--

INSERT INTO `product_in_warehouse` (`productWarehouseID`, `product_id`, `warehouseID`, `productQuantity`, `product_name`, `categoryName`) VALUES
(1, 1, 'North America', 1, 'macbook', ''),
(2, 1, 'North America', 2, 'macbook', '');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `regionName` varchar(30) NOT NULL,
  PRIMARY KEY (`regionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`regionName`) VALUES
('Africa'),
('Asia'),
('Europe'),
('Middle East'),
('North America'),
('South America');

-- --------------------------------------------------------

--
-- Table structure for table `warehouseinfo`
--

DROP TABLE IF EXISTS `warehouseinfo`;
CREATE TABLE IF NOT EXISTS `warehouseinfo` (
  `warehouseID` varchar(30) NOT NULL,
  `maxCapacity` int(11) NOT NULL,
  PRIMARY KEY (`warehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouseinfo`
--

INSERT INTO `warehouseinfo` (`warehouseID`, `maxCapacity`) VALUES
('Africa', 1000),
('Asia', 1000),
('Europe', 1000),
('Middle East', 1000),
('North America', 1000),
('South America', 1000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`regionName`);

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `customer_address_ibfk_3` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`region_name`) REFERENCES `region` (`regionName`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`uploading_customer`) REFERENCES `customers` (`id`);

--
-- Constraints for table `product_in_warehouse`
--
ALTER TABLE `product_in_warehouse`
  ADD CONSTRAINT `product_in_warehouse_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_in_warehouse_ibfk_2` FOREIGN KEY (`warehouseID`) REFERENCES `warehouseinfo` (`warehouseID`);

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`regionName`) REFERENCES `warehouseinfo` (`warehouseID`);
--
-- Database: `cs525quiz1`
--
CREATE DATABASE IF NOT EXISTS `cs525quiz1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cs525quiz1`;

-- --------------------------------------------------------

--
-- Table structure for table `b1`
--

DROP TABLE IF EXISTS `b1`;
CREATE TABLE IF NOT EXISTS `b1` (
  `name` varchar(23) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `b1`
--

INSERT INTO `b1` (`name`) VALUES
('a'),
('b');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
CREATE TABLE IF NOT EXISTS `donations` (
  `pName` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `donor` varchar(30) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`pName`,`year`,`donor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`pName`, `year`, `donor`, `amount`) VALUES
('GGK', 2015, 'Walmart', 5),
('GGK', 2016, 'ben', 3),
('GGK', 2017, 'Apple', 11),
('GGK', 2018, 'ben', 4),
('HHH', 2011, 'GARY', 10),
('HHH', 2016, 'Koch', 3),
('HHH', 2018, 'Koch', 4),
('JDF', 2017, 'Walmart', 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `name` varchar(50) NOT NULL,
  `party` varchar(50) NOT NULL,
  `since` int(11) NOT NULL,
  PRIMARY KEY (`name`,`party`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`name`, `party`, `since`) VALUES
('Alice', 'GGK', 1990),
('Alice', 'JDF', 2011),
('Bab', 'GGK', 2000),
('Bob', 'JDF', 2014),
('cas', 'GGK', 1986),
('Peter', 'JDF', 2014),
('Vran', 'GGK', 1991);

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
CREATE TABLE IF NOT EXISTS `party` (
  `pName` varchar(50) NOT NULL,
  `leaning` varchar(50) NOT NULL,
  `established` int(11) NOT NULL,
  `endowment` int(11) NOT NULL,
  `test` int(11) NOT NULL,
  PRIMARY KEY (`pName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`pName`, `leaning`, `established`, `endowment`, `test`) VALUES
('GGK', 'middle', 1980, 100, 55),
('HHH', 'far right', 2010, 23, 55),
('JDF', 'middle right', 1950, 60, 55),
('LKE', 'middle left', 1951, 55, 55);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `name` varchar(50) NOT NULL,
  `pos` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`name`,`pos`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`name`, `pos`, `year`, `salary`) VALUES
('Alice', 'Governor', 2017, 100),
('Alice', 'vice', 2018, 200),
('ben', 'go', 2016, 50),
('ben', 'go', 2018, 300),
('ben', 'vice', 2016, 300),
('ben', 'vice', 2017, 300),
('Bob', 'state', 2016, 150),
('jon', 'go', 2017, 100),
('Peter', 'go', 2017, 210);

-- --------------------------------------------------------

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
CREATE TABLE IF NOT EXISTS `t1` (
  `name` varchar(23) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t1`
--

INSERT INTO `t1` (`name`) VALUES
('a'),
('b'),
('c');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `pos` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `avgSalary` int(11) NOT NULL,
  PRIMARY KEY (`pos`,`year`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`pos`, `year`, `avgSalary`) VALUES
('go', 2016, 50),
('go', 2017, 155),
('go', 2018, 300),
('governer', 2017, 100),
('state', 2016, 150),
('vice', 2016, 300),
('vice', 2017, 300),
('vice', 2018, 200);
--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mydb`;
--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `contactName` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `majorCategory` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL,
  `region` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender` (`name`),
  KEY `regionID` (`region`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `contactName`, `gender`, `address`, `email`, `phone`, `majorCategory`, `password`, `region`) VALUES
(16, 'tat', 'ch', 'male', '4550 ', 'ee@ee.com', '773773', 'bag', 'Qwerty1!', 'North America'),
(17, 'testq', 'rr', 'male', '777', '22@g.com', '88', '88', 'Qwerty1!', 'Europe');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(30) NOT NULL,
  `employee_phone` varchar(11) NOT NULL,
  `region_name` varchar(20) NOT NULL,
  `employee_dob` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL,
  `employeeEmail` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_description` varchar(50) NOT NULL,
  `configurable_attributes` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `uploading_customer` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `refill_point` int(11) NOT NULL,
  `refill_date` varchar(20) NOT NULL,
  `max_storage` int(11) NOT NULL,
  `warehouse` varchar(20) NOT NULL,
  `image` blob,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_description`, `configurable_attributes`, `quantity`, `category`, `uploading_customer`, `price`, `refill_point`, `refill_date`, `max_storage`, `warehouse`, `image`) VALUES
(9, 'bat', 'toy', 'light', 11, 'toy', 16, 22, 2, '12-9', 23, 'North America', 0xffd8ffe000104a46494600010100000100010000ffdb0043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1effdb0043010505050706070e08080e1e1411141e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1effc20011080190019003012200021101031101ffc4001c0001000203010101000000000000000000000607010405030208ffc4001a010100030101010000000000000000000000020304010506ffda000c03010002100310000001b940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f3f4f0877db3a1bdc6b6d713b5558f8f3d79c7a02e8000000000000000000000000000018d1dff2ae5f5f51991e7b2392688c8b169e0ca6152784b97de894bed87df3b93ded156d0df9800000000000000000000000006b6ca2d2dce671bcfd7d3e6f6633e76bdefad1d5f3f5e7dbef5616f7b9dceec5b4f4fb3c0e77afe7c931a9d8dd9723652000000000000000000000001878f3a8b3afa9c1f1f375ea7a6e723c2f576e5ff3b3f4fe2e7e3edbb2c663d62c1be6fdadc9242f62994d913e8fb3e6f6f3a9b7bf304f800000000000000000000001e3cea67d5d1e368f95bbd34feb5bc3f5ac5cebec7da7cc04d889cb20fe46fcc878df3e4ed986625d1f6fceee67536b7e5c89f00000000000000000000000c64e31e5e51bf3f4eec7fb1ede27a7a32dafb625d9ea1bafe8e3eaf231afe1fa9ef2af3e6fa38654e1777dcf3322fac3a00000000000000000000001adb388b99d1fac573d688747bfe4efe547a40cb7727dfe7bd4ca33d6e64c6f842e6f19fbba1dbf2de7b3e7645d0000000000000000000000000031a1beafbe3eef3ea3327e774f2688b49b8ddcae5c2e96c684e3bf16967c763a7bf1891f7bea36e70000000000000000006331fe47bbc1ac27b4d3e9d3d581b970e7f3fdd5297585b79819f2f4719606aed11ee7cfedde6449e5caebf9e6b3ddadb37d661264f93e981930658c83ccf4000000001aff009e2d8a831e0bd6438ceadac652952fc7b6684c1e67ea1d6e7f6b6fa34e7bfdede5c364fcfbb5efa9bb7a721cf9251cfe8e346bfcfb695577564c5db1b3754562d5d1cc783f45b97d5d7ba05c59b46a8cb6156d66f8dba2b88eddf53519b9fdcf4b23bdaf6c3d7d8beff9a4ec4a5b3e6fd2598c49f46b094be6aeb4aa0a68b37a7abb56db88b4aab984253dca9ed82b8ad6e3a3b262fd3f9e774777a01d9733f37fe84a07179f7cc93536b5eea9f73536b2e2b386cdf5ac863d23cf964e346afcf774d2d74e4c3db1af7549d9e0dbf9f27e75bde175f5755d919ed722dbec017e954d6cd4d4e7e85935b593de8d0b2eacfbd0497e5c5c1b9ff32fe8e94f7069d78a82dfa6a9cf6ded413a729f6601f7614614bdd512e6c6161fe7ff00d07cd95958dc147aaa2f1577a1768facc02f1a73f786bdd5d70ad7a4f2e2bdb3597bdb7f2ec884d8fc8e719e7db7d13755216864c33b634b5eea9ae6a16e1cf97b35c5918bb47e70b4b577b3e49d0d7b952da74dd19a4364d436af7bb35bcc6a1e72d9ee6a6e5b7d39dcecd499715cb2381cf346ace32b2dc323190632006bec39ce76efa1c8a54dfa13ceaa699b2b8900aa9be54077a765ade95ef5e7399679dd1b2e632ef70c8030c801e7e8006323190c3231906320000001883cde30fa40247ce76f3079bf7b955764479b88576baede2b197f39dec7da76608f3922633d908746330cd6b3be477d14edf7bd041a7065059c1f4af78f5d76d6346273b2778af650e76b1c98473967a3b229cc3b200000002b4b2a073caa9ad357b3318575cda357da129d4ff7d8ebd757065d1fedd9641e571fea461351a35e9d2f6a42f3e59ff56272cbafc4565713e72313d834c6bab8b22407bdd8b2ebcb0fb2ad2cb814f5cd286cd22eecceb3b3202784d21928e4762013b8771de964226f65813b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffc40032100001040200040503020505000000000004010203050006101112131421343550203033162515232426402231368090ffda0008010100010502ff00c0972a35383dfca6e08a9d5f17337aa20a5eec1933ff0072c99e91c60f358be2677ac2e45e69823fb25e4aee76a9fed6327727893933125ef4bf0ef6a3db04af1a76b91c961fcab119fcd91bbaac1f32442008b249e488412e25e3c49145f0b22bdb91111c9c2cc7eec4094b971d324424dca207ce73e657e068d890b29e53c0811899311145913e493e14b1525c6952c0f8c945cb08fb33c8f4984195cac1c52998d8648e59a57cce1a26c6d96c60893ba5938206c8be1c88239d9345384feec73b2bc57c92c513226e2a22a182f651a92cea38a88b144d67c2be36bf241a64c91e745887e78a8e46ca3f98f1f6a2fa0dee424b1e66221ab8c1c9764612e47046cf852211df93871f386091847d36f23a32622d398d288ff857c8d6648744dc90e7ae3a721715c62e72239c2feb8fe8289ea2e386199ae053236190e4654e9914ec7fc2bdc8d42894c9487bf0099e3631ed7b785899fcb85193b512711e196c21bf0d3ccc89af9a725d15639cb2b61872473c895cae153c614903a59e71c2e4e4723879a26c6445384e6a8a63b9fc249dcc6871f522724224e863bb85cdd860f12314a30e4e50891f21004e83cb1fc829944213cf2582391228df17c32f964bdc3661e16431d9c9d2951076e1b4f24163fe8494588a544734e179a5512bf10423a5c8a36c6cc9dbe24e4f24b76f9b53936d21ea8837f58cf6a390e1dcc7853a1117c43d7a5a045d2cc3d9d53e3d3a9a022b198f6a391ed704431c8e6ff98aa8893dcd642bfa8aaf07b5af217eb7b7a9384acea978237fd5c24623da3f50d2ff009771650d740c759ec0509ae5742d968eae46dc6b920ecabb83007561d01e37dee69ce56364645d5cbe8e7f63a9bd5f72791b0c366648719401a055bc76eae4189d7cf7016098442c9e3d9e392bcad56179ef63518d9636cb1ed30b80cd68449abf0b162252c262c53b5f0daa170d88c982d8aacf86c06e1b002d82bb56814f46a235b742976376da1b5cba8ac2b1f4a358d9c6fa3b7e5aac4540662e32d97f52fdcdca7ed5484cee1bf46cf0a4d4d94b2acf559bdfe7d13f1f0debd3eadec5c360f7aa2f67e1b4c6f9f60ae308ae2eb4d84e1f362f3a5d17d1e3636b5f9bd7e7d17d363628db2e6ce5f85a928594766b45f8baae2b9b19d615a557b2448386cc6a8559465f8daccde93fa4ad774d87d169edb9ad22a51e6f7f9f44fc5c37af4daafb170d87dea8bd9f85aaff00796cd4de252ace9eb8aae321386bff0066d1bd071deff3e89e9b8ec0e5b2bfdbc347d569a5f64ffa379f5c2fa6e074696f7da710e80dcdb2059e9d1792d7908505c76093b54d0c6e9661624806cdeff3689f8f86f5e9f574e545c361f7aa2f67e170bcb70cd9693bd9547cd5c5185426ebfa3fb6f1deff003e89e9b81c43451294d51ce9f6049a18def1e70e7692371debd70be9b0f21a28742cb6886b5f180dc41236589c88e6ddd7bebccd4ed5a3bf8eea737a751aa56af0de215707a4ce8c3b86f12f5935907860385ffbd517b3f0bb5feec4e1b2d1f770332615ba427ed7c77af51a27a7e1bb17d30d209e0eb737417b676945f58cb691a4fc36f7f8a385d80468d5561e3c8d9cd6148376fb1b78c9355eab62d609878701a3d9ebe68ab5d7a6818cda83e92b6320868643233ab6cc339bc0a863220b0aa3ab0807698fa27d9d8fca6a82242f81658e2b6c3ac93e8acc4656e145402b6de674f721588852f0d968fbd9a5272a9e12c8c8a3da8869c6ea6646128f3473c66588822c93a997c34f1111e6d71325a8ac22700e11a11847dc9218a4c4043456b5ad4b6a410ecb1ac36b9f59b1943e016e099c5e3c0e58e28e3fbc8d44ff0039cd472596b624f85d0d90eb01f6c1643b41c990df594f91a5f13810fe1a3f8de59d2df85d9ce2837a66d760582fa73e3b01233895dab0abd244bdeeb5e36a869268b726f800214d909829653a51b8bae6b5a471d8eca5058e8f678180be678bb3973875b5d23a506d4f261d8130938a66d186a6c4c92b49d84f841f10826d27161af6768ca869ed82d8bf0200ff00a8cc82925b0960fbbbb7e4cdc7d61d14b43680cb1cfb8e4434466d1584cb54468be86d4361e1321d86ad9436a9651f02e48e21c37f880ebe78258b85fd57f118dc56c358cab323383dd3d9ea17f6bbbf3db30dff009b61fe8b47f6ccddf9f573dab2bbc4f83b311868718db0d5b686dbf88a7ddda8324a7e6ce19249454119305254940df602192cda2feb1b622ea421020b7109738686ec71375aad9c4e37c1c875611058d80dad4040a1f0bc86d1ce209d80a828c2f015f6a234e08576c15b1d3d71b2d9614192fdaf0c6ab85d4852040336d10a257c7ec794f31d3436d095384d336385badd71033ffefdff00ffc4002f1100020201030205030304030000000000010200031104122110311322234041323351052061303470716281b1ffda0008010301013f01ff00038ef194a9c19626d0b0279777b55233ccb6935ffa9aaaf2ab68f9135951f228fc4d5af8616a1f11aaf0972ddcfb31c45d38b466b3cfe26946e1e059ff005169f43637c199a9addd91c46a96b3e23f26369adb4ef7e07f32cf0d785e7d922ab773889a3b3ea432bf37dde0fe66ab52d73ff1d3f4fd433e50f7fccd469ecb3bb88fa744eef0e3e3d8a54cfd84ab4560e738881f66d2e211838e9fa72136e719c4b9687e3254cb34847d2730823bfb2a74cd67278129b28aced4e4cd4e885a739c3183f4d7f92312aa56a06b5ef2d7ab51c3f0d2cadab383ecb388cecfdcc475d2a7fcbff25771aa936b7732dbb650bfc99aab8abad83e66a905e9e3277f99bdb18f66a76f339266a2cdd851d84bdf352085f753b4fc4d3de6a33515853b97b1feb121464c1633fd22335abcf7955caffb49cf54b30369ed0ff5754f96db146d18e970f0ecc883cc201ebe3a28f5888466503d43d05a52c39ed01cc651e288e9b8625d5854c895541901311768c4d4d84100456dc33d351c2e445ed2d242f12a6dcb353c59980e7a6afea0228c28107f71d17ef9e9a7fbadd1543ee062b350db4f6879b41e9a9fb734ff006c4271032b06cfccd2bf1b7a6a3e88b629c09f5bff00a89e9d857f32eabc412ab4d7e579e3a4ac8b1f7374b54abef13c74c4a94ee2e61941c584f4a1bccd1d038c195232d983d3527c989a73e4025efc60450008de95b995927bfeec4c09650ad336d7df98354bf3058a7b083d88604910580b6d8adba2d81b3881c15dd16cddf1310903a330519315f77c4ddce22b64e22b06ccf1b9c6233855c98af9f88d66d3880e467f7a0f3b4f0f2c6539c1cc159c123bcac7a582226770c76e9764b443c732cc6de6559ddfc46f23e6540f26543198c3d412f194959e7e65b8ccab76de7fc03fffc4002e1100010400040503020701000000000000010002031104122131051013223240415123611420303370718143ffda0008010201013f01fe077683451bc48d0e0a1973b9e3e0a32f7867a59012deddd61f1226ed3b8dd60a6e9cae80ff008b0138ea4ae2b87bfad23e629b88ebc9963d86e7d19161498b7e18d4a34f958d736c62213fda7cee7cdd41bac93319a83aa6621ee67459b28f150615991ba9fb284cb2773f41f1e8a591ecf16da978932b2c8c2a5cb9be96cb03836e1d9f7556b8ae0db1d48dd9613130c3ae524a8b1b24be3194d2e23bbd0c93c71f91588e22c768d65a711d4cd96934870b1cb8c3c086be561a4922d72da8788b1da38109ae0ed47a2c5631b176b05b962219dc3a929a583e24e806570b09dc662aed1aa9f10fc43b3bb65009f09dcdd5aa1999336dbe888b149b1323d82742ec7cb67c027e184f8ae93760b0f84eacaf6fc0583c289e2746770570f99d03ff000f27f8ba2cbcc37f46f66714b46b7458287234bcee560e2cb3485322e9624b86ce58cc209c69bac1cc5edc8ff21fac4d6a848e778844c8d4c943f99d7935a0127e5572961b707b7709a6c7eae21d672a02857294647d84350bfeb5c80fab4a9423bcf2ea16bcfc206d11f5004e6e614a58c35b614718736ca6372853bcde89a6c5f29b46da1b290e9a28dd9829f47da1af2c4ee1345043f7b90fdd3ca1f33c9ad0ecc0a6b8c468ec8eb20e53f8287c07204106fdd61dda5729bc5078d9793bfa4dec7d2963ce13242ced72eab53087bf31e5234b5d9c2eab5301b2e3ca134f3ca23a94e6070a2a3616be8f29fc5427b694aed290aa4eec92d3093bfe7a09f0872b919f74271ee83c1d90f421d669078bca9aeb4d90141c08b4d7dfb72240e4e3945a6bafd95eb481b41d6babad5273b28b4d75fb273e8d206ff3b7c8ac96e2a2bad5061ab1ba60fa699be9ca5b2537509fb265dfd91ed75a8fdca8c6a511de14a2da989f56997975fe01ffc400481000010203040508070506030900000000010203000411101221311322415161052332427172b1c1142050527381a13033628291153540d1e1f02463f13443538083909293a2ffda0008010100063f02ff00b04d4dada37d6d2377b3149de2124e7b6c6c6e4d8a5ab2117d5d259a9f65059e81c0f08c2c75a390558ae02962258659aa00b2e37d11d25797b20a55883065dcc77711151095ec508a6e8755db1a43b0429c566a3668583447595be0247b1aa917b846068771b2fa7a68c447e2da21b7076180bdc3183d90964649f1817880122a6344d608f18ecb35958ee19c56e5c4f1cfd8b7d06e39be346f6a9fa4631a568eaabc609198ce1c6d209c36415688e5863179e414818d4c5d196c118915da62eb7afe119e8d1c22f118fb1eeac4606a8dfb22e2b54c1ae08182b8c5d42401650c17a5d22bb47f28da7898caf2a38fb1718ab530aec5631aed950de9318df1174b981df156b58184a06c1eaa9095109cc523554e462f287e68fbf73e4635de70fe68c07ea7d8bcea531cca8fce1baa70bc32f59374f5639d49a708d450af1f62eb2808c2aaec11aadb9fa460cabf48e8ac7e58068b80af55585e46548bc9457b230be239b749e04473b2ff003446071e387b16a6358d06e8a2354473b83462f24d45a52c9ad702add1757d31b62fa328dcbda3d8f5518a308278ec8bcfb9f2114424240db180ec10036b21471317cac627742cadc269b216d9db00eeca02dbc3845f46aab788d14c6aab62b61f62d114ed317dd25d5718a08e31a36ba236c04273399df1747f62001b0c051c9558d19c8d445d396c3175ce81cff9d9ac91176f5f471cc7b1cb6de081d2545c4083d91a52315f847e686d1f861b738e31431c7618f4773a432f6468d380eb180948a01606baa31545229bd4200e104886d5f8628634adf486d80adbd61ec9260b8ae9398d8c0deb165d30a68f515650c6993d03d210140e07f8da9348a2e6d15fc38f847df2bff03146a6da277134fb0a1cad68fba6d277db45651a057ddaba07cbf8cbcbd659e8a37c146928d8cfdd4c73882fab7a8f9453d1109e29c20bd26a2ea06683d21fce004acb8d6d6d597f480f327b46d07ede95c62eaa2eab31b77fdadda8bd9d3ed56eacd1291530b7d7b7a2370dd0db74d750bcbedf504d349a36ee6372a12aaf34bd57070b346e5ea70511e10dfa34ccca50e26b4d29c21f5cd4c4c2c22941a554048c8416d75ba73a1a432e4acc4c202ea0a74a61b9b7dd7dc714aa8abaac31b0072fe195d594f843f2e89c98ba859039c312f34eb8f38f285eaa9d3e1687d95621b186c2374079a3de4ed49b5c999675f69c46383aac61e726df9870208481a5540036468a5577030d8bcbad2958fdecb1d8a5434957293ce5f04e0b221c5a794de6ee1a62a518d5e5651ed5aa271a9b2a2e26ee6aaefb7d36f7345573f27f78fdadc19baa09f9430d9eb3891f5f55f1b502f8f9592ce1cca056c95eeaa26fb53e76cb77cf844bfcfc6d9aefc4a7c216865b1552909004691bc08c1683b78407993da368364d772260ff0099e56296948055d23bec95eeaa267be3c2c53a13aea0013be96394345b9a898654e0c1e6efa61b27a68d457cbd5436cce28a548aeb244254ebeb754a4826b4b545b55d75c375077434f1e9528bedb25cff0099e512eadcea7c7d599f84af0b256beef9d92bdd544d77936cb77cf844bfcfc6d9aefc4afc216b1de6e0cdcaa79e1d24fbff00d634ade592d1be03ecaaa0e636889bf8661ff8be5ea4af755133df1e1ea31c9e8e8a0d0f9c25d4271973ff00cc2a594755e187787aac7c2f386bb82d5cb1fb9966cd7bc7fbfa43dc9eee15c40fc433b1c2054b66fc54670d3e9eba6bea4cabf053f5843481552cd0436ca7242426c95eeaa26bb53e76cb77cf844b761f1b66bbf12bf085ad77dbb1539269e7735a075b8f6c695be8f5d1be261e615549655f2c21df8be43d495eeaa267be3c2d75f56484d61c9d7259d985aab8a76139c2da5f264c5d58a184b89aa568554436fa3a2b4d7d463e179c35dc163b30ac909ac2a61996617e90ad2152d743089e79a436b52afd106a38c25c41aa542a20a48a8305ba1d12b16cf08f4398551b51d456e3ea2245071ade73ca3f683e9a7fc207c6d65f1feed543f3875851fbc461f2b65e5938a9209a76c30c6d420036cd7c4894f842d49dcb6ed54dc9a79ccd681d6e238c3ada0ea3a8285a4c39f14f80f5257baa899ef8f0b5a924e6bd65766c8659235a955769b1134060e8a1ed10e49a8e2d9bc9ec317346abbef79dade82ae04b7425236d61b4bcdbe85848079b87dc42568610004de199da6199261454852c1756060042342416c0a2691a4ebb4aaa63d126496d483a978662c2cbe8a8fa882594fa435bd39fe91a1753a540eaaf02235d87927e460a393a5175f7c8bc47ca04c4db5e938d54147331cc382f7b87036ad874550b1431a568296849aa1d46ced8bb38d282fde46462e48cb3aeb872a88fda5ca66ae937928e3c6d05f70201ca1f7d0d39756b246a9861879cd1b8817485036053ee04039561c9c65b5a90142e9ba71a404b4eeb91d12286d54e49a79ccd681d6e3db0af8a6d2e38aba919986fd1af389422950939c3edcd5e682e8412931a46961483b4414bced154add02a6113734dad2ce90669382446919585a72a8b177ba4935461b6113096d78748533103413398e8946bddf77b3ed79c6d0bef0ac57d158ffd62289000e10574d13defa7ce2f2d26e0c9d465fd202267fc437bfad1469e017ee2b036d54cb6a3c52239b6d29ec1f6d8003f8ea100882b973e8ebe1d1fd23ee74a9dede317438fa40eab89a8fac516c34e76544733c92a57eb1ce298924f01795053a675d24d4a9c554fb3f21ec59412ee5dd22885615dd64bfa33976f56f615ac079382bae9dc617245ce6026b769c2c71b7157e592ba5da64234ad281053549875732bbe52ba0c29b2173176f118247184cda265b48562946194133ec86dc069dbea7a399a4dfad387ebea34d4b2417de344d76469b4edbdbdbc0c36b986c36e94eb246c8d34baee2ef815a430e2cd54a6d24fe91272adb9469ca5e14cf13633269739850c534e06c79c6df68320929cb282ecbcc37741a6b0021b134417a9ae46f89612ae5cd2120e1d91fed52ff4fe50a1ca0e216e5ec0a77439314bd7721bcc09b6a65a42558a51842bf68321b5a5541f8beda43be7cace4fef1f1102725d24ca3a68b4eee1fca14f36abc85b7507f2d93f2ef26a9520fcb2877926755cd90744bd9fe90ffc4f285cbacddae47718bacdd9865390cffac2ef37a375be90b56b757710062add039210d3614eb9792faf0a882db0ee9343cda8f116a0a1cd1bcdf44c5e996d330ca73567f5109986c115cc1d863fea0895f849f0890fcbe26c97ee8f0363ff000d5e10efc5f216495dcef2a9f48e8b1f4847a6534fd6a42e5966815b7745c97299865390cfe99c2d0b6f46f37d21f6d2665da2e5c51bd4d995924a61a53810ad6a6cc442d8793790a143155209600551cdf64ccd29a506540d15bf28a0a07918a15e50f2661a2d92ba8af641449bfa172b5aef8d12f93d2e2bdf87a626a9a678d48dd6b8c3468bc08e30c4a2b93030b6a834c55827b2152efb01b2859d607a7c6d6dee4e780b99b7ef42a54f27845f1754b8430a20ab3576c392ea34bd91dc63d153261f427a2738fda7ca540b1d1458c4d25a25909155fc8d8ea522a4a0d21c6e61a2da8b95a1ecb254cab25cb8493f48fdd8dff7f38599f970cac2b0037429b947b42eef8d12e412f2875ffd21e9b9cfbe7baa367fcfe7ffc4002c1001000201020405040301010100000000010011213141105161718191a1b1f02050c1d130e1f1408090ffda0008010100013f21ff00e04ed838e64d2bcb8a83aeafb675a125d2c4aeee1defbe6f05ca86d9cd71d2e9f6aca43f77b3da192ac63a4dc704eccdae5a797ec8ac32f8e0feb274b88b151f97fb3f70d3ece6d53a48e020d6fc2e5dcb27408bf699bebed9d687df3c29bcd99eaaf7ef16dad06f14a364d7a0851057d98eae0d74be1366dc38126b316f28d5372330e8f123d835e85ff912cf62158774cb43933d632b861993df35bd215431a1e6f3e0f51f2e65e13c2e773c36fb2e8e1d0efd195752df55032b87732411259656db898eca11ca3535b00bcc5f3d702359a8b4341601046f77bc341165dd2501598c63cd17efb634bf99ac37bb97c61f66717b93b9da5d2c1c532efc98379dd2f9cc93feb8844cb625450023a8cacf72174738cb5ea9821df14e8432dcf3cc4b97f622317b8a3e92d86f05e73220372ccf4d3ce280d0a4df3581b61b480baf12f37e84b8b4ec11a0ca5443ca7a9846b6fdca9aae8579a84bcd1fb29576f9e8cd29f4fde275d90e8d61f4e1bf715d6571d426847f2ebf2663ec81591d5986bdd467b18acf504a613a4e948595d1b2ee155d599393cbe865e500e4396f30f4e8aa9f950b9a24735530ecf5afd260d0e416f587d868e528e5289a1920cec5bd8ed4a72d585b551bea3d085c6fa2705021eb6297a09a0c0d3aa4b8dd49a275255aea32fe38d1f646409dfa3984cc12ebfb606eaaf72f79406f6099af1232bd0682ce92c690c3056f08ed806a1d336b4e891dacb559a794ce5271a3fd4201d9f839869f6468a43e11e1bc47521a4f0815001ca136696930573969dd8f3f936b1b135abe43782728a026a9160aaffd125cf51e1cd3b2d7e1080269130eb9892d93dc6e7d92a11815d09ca08d8ed07530d79bde5db7287765e725748169ca46e6b47c759526a8f9195b2c6351b3fca30b9377cb943eccccb4f8ed723ac0cda00e0bbb1e1c200d09611fd89536d495db3af8cea48b88c2c60eb05b06ff00dc12d071c87ecf5c0d1d02e206cd7e86c70c41fa10d20a6824dd580ece4f7e1432c95d171972e700121626ff00f6b2103557488db1b5a45f55f56475a398f930fac9f59acae1d451f4e20175d5c5215a9902d3b4ff00d8cbfc3272ff000758a5d5c961f6dd854dd0aaf2625a1d42a3c9994470307323708037e08e8277f04f1b97c6e5f1b97c76a6eab8a02c7d3ac4353fec70b97c297579972f85cbe3d0e6a66b9ff2db09df90444dcabc9e29f402f37fad38a42f4f6ad3fb35f3883621d437f099112d86de67cd5c2d745af61db32844fa615bcb4f4971f4d16dfacc421ab0bccccbff00fb2c12b4b62e366094a18bce909ba0b678bee266210aeadb799ea46217b6550e15ca3d5cd652a24e8cf60c26a4a6e4e68174997acaae80e325ae19785428de62e268c2b3b6f0a525f8758d8ad20aabaf5948a7ada597ce09ddf20dfac33b1aeb8ea1e080b5c4b14bf4e8327f222bd24f53ed0b4021e22183e8a597e215fabe0e5584ba98fc70f8ae6439be55f43af4beff0007486bbbf627c0f2e39d93155b9995cad243ba96bf1c3f82781f1560f09f670681620668517c3e6399c6823c6e8c5abdde1fbe4ed5f2b943cf005e9f39cb0f7e6bbbcabe8c8aba98097af46eb5a89f000806b6a0e2b44026bccf812d35f9570fefc78372028079c21f27d2041d3f221b434e63e69e1f11cc9f29c9fa28f47eff000749f1fa13e17971f0b29a3cf65b3e3c6085770c0793d7acdd940d5e4c17087c1cbf47c4733e901716b57cdcbf0251c8081b2c27b794c487e08f4bfa7d623e4791c552b396d5fe3119945d1b611e5edc2b64c4e86be8b10b006c8db582ba3b9e7f4673ab67be1f995e653eacd0999e0700ddb7e423c3f3ae2653177827af83a4f8fd09f0bcb8dcf97e38189db09bcaf8b8716d611c1fdcf146d16c7acd6f37f41f11ccfa00d60f77f23ce61dc20d45a8a46d2e89da1580ae2912259847a5edf47a847cc7238509daee763ce248ee3af879f9c03b51b2d51975fcca3e1b7461f21523b91fd60f3fc9dc8c897cda3ecf47de0d9c516fd2b6e4fcf9428a498dcfe6a1c071b17a20fd92af99badfe8bc47351473401e92c4f502b3ebc18efbafc477f271c6bbdfe39a233e15b7e0ccb246984d957dc94373fa234df2b3e87994e7a8e4d1e2fb4c487bbcfea54f9c5dbcabca7f7819bc9f796dfb999d1cb0f5a2eb88d2df928598b84c266c961ce2e3c3eb55f22a234a96dcd2fd7c269801345188cc1898b2de13e72817385405daf990d25e23d1dce63ce294d81c7bfe90f34df2f463fb8ab726147bcc333f600622431a0af31e7d987011338df0dfc38e373243f5af16f6367d2538f14d2f80e90ad3be9afb16b35ca01a9b1e4ad89b70dc4ea16fca5e239575e26367a56fb620d964622b4b7315947a12b9d3a4154d8b81cf0f0a9d81cbcafc3799114fe3389b81da6c45037e5459bc63b4d2c46f5976690eb931a12a2fe409d8268cdea8d25fe667ccf71c344c0cc57971ccb8c317ab59f52346472e03759eafef8d4a952a570afa09aec0fba5104f3fe89d3750a26aa0dbd7b3797b64fee374a6546e68f8efe30b13be3efe12f875738a83507d33dbe8a952b832a57165de61b68acf1a952a12a540e0ca95ff000a57a2912c62a926685afc3c2344ada37b358ef3683c88a0ece23300f3b8d3da66d6fcb712d0c9cc1fc1d0fb721d4b81361784afb256cf806de2ef344ad42584e0ae72bb471f1b1ca696c2a75abaebc335f69374191e6451634ba38b19952a15c3b20e985b156970b94e28bd9b7bb179ac562a6f5b716514f375a3cb641be36840991a0d39db2a0499013b5517e0c0c4251629c8c88386f9cb2f33ad5729476f8f72073e1c06300b473935d76842e46dac3936e5176ededaeaf9758476f94305fd590b7b35ef3fca86cf26b589d0eb0d3b8073c6888e838e2cf27d586775a30f5569e26bfcdf13ce499925dc1a1308e9f0cf920a2a15d9369aa01bbad29d6646089a2c6bc5e8cf42f6472b851d8d197df4f6aa7431e48458117d99dcf2e2075dba191e5b8dd4bcae2060bb0362b8d59a55f46f67f737c102b0f30ee9096373545a93e7f780a0dfeb4a0cca16e311349f11cd3d7785fefa3443e57f32fa668e9d6ad69d2a23a2e06a8c8cd42786b0e8b0f085e1de5399e3b7f31319561ea76844ee6553e0a9878111f156c74131e33685ad67aaf811a8d92bddd19577b94c9d907f52d8a1b5ed2901e0a7ae1a80a70c1ba5ae7adbc406a517021ba9407b2a81d1fdca25e1773e2cce4a98b78e1ecc6eb26830ebab446bd5ac696e53094b4f43233b6e760e88e9de2ba5b16a35469a01b4da145b3051fe90947c683751880aa10c94ce2313ef5d4c6cdfa704d1939bca6bab087a55739caf6ef3452029af5ca9947c3e5345db75bdff00c15c2b851fc347d3471a38d7d344a3971a3ff65fffda000c03010002000300000010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ce12b64a3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf00e8a4c3118f3cf3cf3cf3cf3cf3cf3cf3cf0180a0a1b067fcf3cf3cf3cf3cf3cf3cf3cf3ce0af9d7051032bcf3cf3cf3cf3cf3cf3cf3cf0df938fccc0826f3cf3cf3cf3cf3cf3cf3cf3cb97e038eec527bcf3cf3cf3cf3cf3cf3cf3cf1549adfb14bb3cf3cf3cf3cf3cf3cf3cf3cf3cf3b0343a0ef4f3cf3cf3cf3cf3cf3cf15090278f1c78a2bc19df34f34f3cf3ce3cf3cb8ff332dd1ddf0272cc3d022141442f3e460f2ae7cdacabcc6807cc7d03c101330abcf24ad5fc33be52fbaccb408f994f19d65a88c8cf2c73c6c9d77b7dabcf0cf3c73c72cf3c71cf3cf1d02d18b22f77c180441146498ec1f3cf3cf3ca1228e4e5f12a36d512952a8e7683cf3cf3cf1c71c71c73cb1cf1cb1c72cb0cb1cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ffc4002911010002010302050403010000000000000100112131415110716181b1c1d14091a1f0203070f1ffda0008010301013f10ff0007020748cf58962e4bfcb116b4ba3bfd290d2cdfb46075591e49c5c2fbe8fe6028e6879a42ef178aeafb794aff000438397d8fa342b4b9a7c355af9724570f15ea7bc139919e1ffb162f53008e6a6aa9d0e3c7bc4f90dfe1ac1bbb97d8fa252ad788d7e25f06d6e37e91200d3a02afbc74df80edbbe305263c20b16b5c7947318eedcd287b0c21caced5eff4296663466f7a7d658218acb6fdf11996a7464280d9de3afa03ccd664c4f7a7ecfb5c76853f45b4ceab83ef0417a47cc1646a0dbcf8fdc4b966b5596fb131c4723bb8fdc4434ec5d7e13e256fececf6fa22cbab94c59c71e44b555bdbd4f8f04722f117cbf04b55fc15157c0cf71d66cc9a3dfe66b2d9c3edc7d1aaa6a6916d39586b46579eecf06edf43da536a2b3b3afe6a5af537200cfa5e1c8f6fee70944cf62e581d80785cc29878e97051b25c500edf3078e971997e1e4829a97fd8806080dba57e1de205d99d878f2945541c4c569f68029848b9ad3efd37505806cd252b6ad3ef009691f5b7dd97716f8bd39b04e5f684237e89b4a60c65635b8257aeba303e5a00137e999388c86c1357f76e9f81f1d3d47af4739535c2a206767a6b794fd1de0056313cfe89735b746610006d98c6e06dcb28838ca161d4d205451cc4cb1b8d533b1d0f959bc16d7f3100d5e9da202d6a1a4d0fcc502d710285d5c78f4f82f441ae816dcc16e64dbce0e565c76ef0c86934bd1d7ce1caacdaba57f043ac0b42654c30c7148dc146336cf97cc4a64feaafe669d4f78b37106d5b35f68f0d44e108282c5f24a4d5dae8e3425eab1de057bc82c368a0366a24c9bed2a1622bab1dc8544575c4a807f361135af48b6984447ca12c6956143a0be671101630e23017e43b7424036e35bd4f08894530240b3822c42b4df98956289b465a55b115cdd8965629888071eb0342bbe9052d235a9e9122ebff0001ffc4002a110100020103030206030101000000000001001121314151106171819140a1c1d1e1f02030b170f1ffda0008010201013f10ff0083b55d5534eb49e253e44209aa2bd83f3f0af855b3cf7ed0e42b10efdbb4e26afd55ed2e0d0abe82c5dc341d8e3eb119be71d8fabf06f50d77836dbd07d4d98bcccd061ecd7fb058e40e3925a02305442ac668053977742bc43cfcfab3e655f6c1afabf0592a1d92fd985465ea24bd365ece6bc67483716b57e8768814c44749a439e7d654af49a3f33645ca812e001ecdfd3e04dc476dfda0cd4f731edbc30bb21a0a3da194b1e83db4a2bd332bab3ca67d1d264dbdcb3dc87db676f81419aacb633ef51ee5741d5f434098c874e4f1c90992d2e9a3e70cebb15b07eef0202fcd192b93897eef9e4ec902be075e57885a91cfe5974ab01df9afbca215af5b06deac4dc3079bfc24c166378767b6b14612f56ddbd752696ae462fcf3f06565c3af7389584a08a073dbe362772d3eafd66c80f99facb7e07462e1ac29cf0faff719b6932383961968276b98a30f500474e828dd6fb57d221478e9a12f9c6e3289fed5110c86dd28fc91177302f8ff001284a856d95f6884a6584edf7e85d3530059a43c0c54305a44565f9846cb7bcc04003666090dfa26839868442ba9c12b575818902ce9911284e0987ef8e9f2df6e9fafcf44791d0f90938e9add22816c5f79fd12d4f6e8f4c6d073318dff00d4cc6e1cc2c5a9310c4cc371a2e763a110b37839771c455ff9140b60296afef140b61f9de9203e866ba32e6f0ab6cc3c2e58400d278e610bfc883ac0342668c30c34a47e024d08be91299f81041b45bdc40bd6cd4b30da709cb7562513546ba0a296e9479815ee8690da15c366a20c8bf106d915558f30680af6952ff9947f1fe4534c38a7d21b294db028b05f522004db496097adef6e8038dbdf93b468ac02c4b8f097e52ea8b12172156c42de6359d98ca1197abeb0e4a4792361d7ff0001ffc4002c1001000202010304020203000203000000010011213141516181107191a1b1c150f02030d140f18090e1ffda0008010100013f10ff00e82125e0a082f4b6bf706f84f44201747b0fdbe836c70ec87b6f47f12ea59d639c452f085d94c3f32952807661fb3d0cb7843c67ea0cbfa2f7bb7bba838b81ddaf000f1e97fc3bad4b53313ab8f71a7bd42a84c2698b23b4750811dfbfab1f30c91c93315867813f6c01749733a46a73aca7e7c9075f4dfbb9840dea6454f40bd5e5ebc38ce8500d07f0b71877d177231d0a5bb76b3d9f350c1d3ebde6718fdb5f8196cb641efc19646ab7b003f12d7e8af003cb1516f2b9cdff00c788c0c3b53401d581f635841aec8fcbed03780baebe967f094b6989b4eab57d9df583a5829adf4474c1348b722c4ee1fb0ee778058534cd07afbcd829ae68b07cc5e12a09cd19fd315f656f292f5952077383c0d7bac49742540d65f966724737849f0767cce2eb219e78d6e65d7fd0833141aebb7e1607babfc26e357cfd3f6bc9f718be315a3d4eddcfa8ec5b87b25809afe3983a3baeec4128d8ec3f8dc7d3750b83aedf88450a40aaaac5e20057a65f00bd2af129440076e1ea7e894a0d1000eef04abf1a6a7badf82132c8a100e872fa2106c656ceebf505158fe0f88275966a73712787eaa18fd06c0fe9c4c12ec1e29a47f4cbd778d5ccd3f37c62705162afbaf2fbca42a2d40b13b92be00addc838ee7c4bce53343f57c439b6da3ca1c7bb31b2bcd35ed2fa8f988ea404bc7f03530bc0d79432c48e0be8527dc15d90315ed94f24be876f387dcd639840ef64203c02a58fc92aa00465e47e60dfad046a929b97580040caaa0e1b3c46a52729b79487150f517ea6a71e87e4b020a39b7fb23a25398fdb028afe096359c12dccb9fd29997e9d7a2cf1b7c91090ee54a4d704c57ab98a4492b0472ab9dd80ad7e17f0c6d866eabff4d41061263a10f1fc137abb889683d927d11daacf0bf7cb1b532f2efc470876ef15ef51e52d5361b82f48d4df22ee367f83c461fe1138c117a56e6c0ea564ba21a63151d3291f24d2874e7c11af1050df3f90e7ee247233fe007d44a5ff0002b3685eb53b08e8a8fd80d755e84488ed2cf879fc47d8814afcdc788676081e6f3b11e4f30cfedaec608988a1500cacc0251fb30ca754e75e634e2ec1c05eb52db51802f4dfdbde0c02f159f75c9fd61497528e988f43f8432f4c82d7cf68c02dd62fb1783ccbc6ca45afbafd106c8eabee165805835c1d67fec702f8314602b5577be903da2b6b06df9970e5192061450efea046715f0f9d47d4c0cee84f6c246ab5d2a9c8b9ff00f205cfab0dfad198b04cd2fc9a3e8f6886dbfe0c841d7797ba0caf820bb1aedcdd8e3e6e140b500a0f12900144f072c044a97883f574398088ad5640fa33ae2643b75b733fae594641e800712a3640577aaf21280a951e7167d10cdae6032bfefe48d1900783a1fbeded15a1458991272164d52c681cc370f43e83921afe0894b9a658add05ac4b8bed160e9eaf684c339395eab96526d0a654304646435f3bf89d0bfd0c40748cd69197cb3384276bff05f88d8809520391cdf7466236fb237ee38eded3009bd9fc2a0253add278fd9baf1ef0e1b503edeaf79c4048af6edc07bb55e60800140683a46059a9ee121d68a8782a25c55e1a1af92c96cb6f9a0a7ec9f86b2ee46f061ba9fa7d90f8c3c74fe9d91c992ff0085a864fa2314b4bc0128679a99fd319f76615a8598163d92fe082843d2e930cc4cbe51a8f4e9f2773bcd6932e1b6a7537f3d603046803a7ff33da194ab100755751c0fd3723d3048bb817581fc4d504ef3ec22c625948ea78ff1b9960a41d4bc9e600d7a611b17f2c3ed8ca811d0077d5d3f7eb45d1a846e495d6e57becf2748475ff92e25fb15a7136af0f3f9319b38bf7b8b1bf81b5ec108dd30eb734a03b37ef1a31aa3b8e1fc830871a5926d0c03a50fbc310dc9d1cddcaf6c7518aa91cbf747f874993d16b8b81f694845ae195ef290a659554ca4a569f88365fa08cd02d4583a6ba6256a96130ae03c2759a826a85078f73c9c3e23a81ef2b06e70ac2eaf35d65252591100b5eb9b88babdd586eaf17fed086dcf0adfa215e6e3616af637d5566118ab908a2f650f6f50abacc0c231683968e037ee20051934a515eadbbe96731028d8e9eb0d9088b00d981e171b422274cd9b5226158083f2e44a0ad1817cc322a5ddd0516955eec271d3a91d901ee2456a139c10a54bb6cbac11675352982a4e46eeee0a85cee201b376346eea3c4add9176eaa481796dd56a194056c6607a37ab2b5a5a3c8fd39332a9a3566867f30f2406eb312c3b4b34c8ac8a05e2c256a3fd49dd221156a833d61bd484aaa0a2d72fbb19daa02da6f351583a435d0857e4c209b12af1597704de4ad9c8c1a8d147688f65daa5865744b010b62731dc7640655701d66f8162e2ed5f18f7474363dc87f859fe78328ae45fe21e60217edd018003fc19d554e805fc1e66d4eb3ba19c02cfcfa83d5d870e212b757fea7a67e26c803396f9ff00036380e20b020b7ac0c199300e0f08e9d8cfb3aa047c3df499209046f1f011fd4f7317c7fda5c0d24045b05cd001dbd1534dcd3fbda78c10d0e9af40bedf64353b173b92afc47e92b54d51a68b77a07d84c3beef2402f76bcbfe0550938b36778b08c45e6801b35b8965f182cd6a19e6f47a0556630be2699c9f7073d52093fba8da7be215134da95eebafc309f0d8f0668643fc0a5157dcbf4417a96af603e93fc07fd351ff000983ec9f610fedfa3d43fb83ff00b874a557aacd9da7c31ba8a1c91547721c0cd6c3e49a6dec4e49f09f0ecc4ab77fe0b9523cfad37e837fb7ea9cce25ee29739e415f8c87b8c14231340f6867e538eb6ae0b1f951e086bd5351dff573f5445474a1f2e90f29f9238cb926c50ee8bf4d208b0b729f79e2345448708d9f7061536e8d7bc04f12f7ea4d15e0c184c40e72947e6574dc35b00bf357e989f46fbc4baf1206a33336d2bb53fec603c37b3e8ec9f6b2fedfa3d733c0060aa801d01c8fd8fcb6a81a560ee47a0cd3b1ed642997f128aacf81d3c988439deae37e837fb7ea9ccdc4ecb30f20fb2879848e8a69681a7298f65eb3a91b3c81fbc3ade8c844137ffb971607be0caee3678f5e93fb1eb8eac8d65d47b2871e22bc883cc4022b4cdd58305a88787d3db516cd8d9027bab7109f4c71c33ac4291ec918418392fd9ee527b3ccb028e6b68dc703c7ba058370be6a2e2e184a973506deedb4e87545be1291014b1d58a762bd20a2bd1faae8e1817b5079824591aedad1e47885d4e229bbe63e5137f9231caf93afb1f4d1c4b6e34fc025c0d510ce274f0bdb1ff7e81b2a5934220d7521f63f2dd3ccaed682bc5d87c388c81d575af53446bc412791bfd14e93bdcbd1dbccdb5f22c99a09c14bb1f65f84456a55d17c0e30fbfb9337d535da6076cb2709be2e760ae6af7791820d9d22816c497937e2602ac2be63fef29841a1b1a854afadb359c68abe3bc2c341e401029ab5d6a91a24886c1003e258887048aae066c461c9685fcb0a2ac52ba25699a2026cf36b87c61f7a6c96fdcb85fa6ff363da68a0ac31c92c3b06b8a87aadcfc71a5fc41eb4ed60e50a13aaa7696d1b62837726439d0f3304f6007f88eb6259d4f4b7935fa69e4784691e1080120968b6516973797d4019b08875b85762c80cf5a11d57fb0c7bcb3cc0bbc04628aa7545d55428a7a32804b43328015732f6b79256ba318a8fc09cad152b0444e610a589631a75085a0ba2873529435c00132c055bed1febb1145840d47510c5a086e90750fdbf26d02897894d835ebc4267fd66a319e5fd4a16d46d01ecc30d244c1a44be8c4fc82f591a77de0501096dd506eea285e8a00c68761a756380679554ab321d4f4294af0087502e41d3ac212e2368673a64ee11e0de2afde38c85d2d55603283512e67b94ed37b95851bb896ee57881457a25ee0808141f8433b7fd5b03073450f040b1758117f0fbf0f7812f05ab7bc34cf61aed707c540a47b6bf77783e0b2a0bd01c791804b8d38b889c36b3e522162d963f0215c4f1e9b28ca7f48f440a2a05d352951eff005170902211596d6b97afab66eea525604db736dcaf5886dbf417cd4a7f485355feff0032a54e8c603c2384962fa5797dbc95da2e965e5fdf53f105f03043a50d78a97ea9cf8b853ea5368255fdd49f70e297598fed64beecc8b536d818358b0013cff086e606afd6c845964a187500e8972ec6ea1203fc3a7a097564679f453984b2e1d65f58fa5f68371f73d1cf254be9fee2644169441a35b6bace4eb068f51d6d6e8d1975d63b34266d3327bb6b93b8c130bf4dc961c95dfa033a05d98016a374b9c911e3d3617043f6616950d500db0845ca34bd59d0cafb42cef7da3382c04e2ceb287117b6c3cccb48d3b2887a2a2e2914d4776ad4ab78dd401664ebe97cc6aba0a88d96c2802f1b5870915a06d194f2748893ce21c6723556669c5b50003a2d6b141382077ab7148aa306585811af2881660699903da2d55fba9469c873c4c0a638ec48ae829bdd3ac5885c648d2f8a10c044abb1694074d12b3dfa684686b2b5e8059446e01803592fa25f9d81a0215e0b73d867349503b54350fb9d628141f4032cd82f495c02b3fee41a57684000244b139894a663e45b7b794f7f758cf97847e14d2708c76ec41284a814b25c0727fc94da65692e05d7e54e59a0952ac09c7dacba39384e8b03115aa1b69693b27b4be23052960472168472273e8c5bf322a8957ef9c0656a13b60ec170459b05392cabb9591212100aef0dd5d964ef03d8886880b5d2e8c99041a788008a1846b6d1ef0ef2c70cab4291e73cf2240b8716fc40781508c9abe0638cff00881463d0568801ea41b0606a32e477facff3544649c995b5705d4d3d881be54ed20073486392e58d8b4616baa1ec277898a37ad562993250456b1966ff00dad4758145aad8ead749a5546120b00aa2da70b5d2011597bae11e11a4784800b688219976704addf10db118186d69c4337cb671019be099e53b1e1a6156ea69a05967925608456997539bb59a755a6203557b8bd59fd78813441d942c62c8d1828f54016a7612f17d786a3f5a07000a32a40b072d6721b718a375acbb3805d95829f4a97e9746b9cae0d631751b80bf6852aaa2b6179cf69d5b65f369d8005f3572efa3722c61720993a2c128b431baba05c9c02cd41a545e36022461ab2ab6f7d40019136804ddec71ccc818cdb7aa041e5633143469f63c89e2644138e841b6b58ddb5d207af8e2aad9fa2b3e429be237354b620da4e5b8c07a732bb428d8e848fc047b6fc43626d165a2e821fed41d830034443b07d297745fa64ba251003404a3a4a3a100347aa0cec100347ad1d09d8257a760801a3d29d0f441dc00d07a7609d87c400d15289d820068ff00e657ffd9);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `regionID` int(11) NOT NULL,
  `regionName` varchar(20) NOT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`regionID`, `regionName`) VALUES
(1, 'North America');
--
-- Database: `testing123`
--
CREATE DATABASE IF NOT EXISTS `testing123` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `testing123`;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `RegionID` int(11) NOT NULL,
  `regionName` varchar(20) NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`RegionID`, `regionName`) VALUES
(1, 'Asia'),
(2, 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL,
  `name` varchar(12) NOT NULL,
  `regionID` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `regionID` (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `name`, `regionID`) VALUES
(1, 'gary', 1),
(2, 'ran', 2),
(3, 'tom', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`regionID`) REFERENCES `region` (`RegionID`);
--
-- Database: `toys_review`
--
CREATE DATABASE IF NOT EXISTS `toys_review` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `toys_review`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add make', 7, 'add_make'),
(26, 'Can change make', 7, 'change_make'),
(27, 'Can delete make', 7, 'delete_make'),
(28, 'Can view make', 7, 'view_make'),
(29, 'Can add toys', 8, 'add_toys'),
(30, 'Can change toys', 8, 'change_toys'),
(31, 'Can delete toys', 8, 'delete_toys'),
(32, 'Can view toys', 8, 'view_toys'),
(33, 'Can add comic', 9, 'add_comic'),
(34, 'Can change comic', 9, 'change_comic'),
(35, 'Can delete comic', 9, 'delete_comic'),
(36, 'Can view comic', 9, 'view_comic');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(10, 'pbkdf2_sha256$150000$F9IHk7uEs5fs$fBYD51eboUpnV3Wvtg7Zaf0GUYiq6nPabN2jjiKTlpk=', '2020-03-12 21:46:51.044593', 0, 'nate0528', 'Nate', '', 'natenate@gmail.com', 0, 1, '2020-03-11 18:47:52.397243'),
(11, 'pbkdf2_sha256$150000$HWKxtmwrSGp7$ubegSNvCIYKb2fdi8V2erKg8VMJrUK3gjYeJ0bvZNoc=', '2020-03-12 21:45:24.378444', 0, 'gary0602', 'Gary', '', 'gary@gmail.com', 0, 1, '2020-03-12 20:08:59.012191');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(9, 'toys', 'comic'),
(7, 'toys', 'make'),
(8, 'toys', 'toys');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-08-12 02:22:15.787956'),
(2, 'auth', '0001_initial', '2019-08-12 02:22:15.936432'),
(3, 'admin', '0001_initial', '2019-08-12 02:22:16.299791'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-08-12 02:22:16.390332'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-12 02:22:16.402135'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-08-12 02:22:16.485172'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-08-12 02:22:16.520335'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-08-12 02:22:16.550262'),
(9, 'auth', '0004_alter_user_username_opts', '2019-08-12 02:22:16.560488'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-08-12 02:22:16.596644'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-08-12 02:22:16.599219'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-08-12 02:22:16.609937'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-08-12 02:22:16.644986'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-08-12 02:22:16.677535'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-08-12 02:22:16.706509'),
(16, 'auth', '0011_update_proxy_permissions', '2019-08-12 02:22:16.723771'),
(17, 'sessions', '0001_initial', '2019-08-12 02:22:16.749205'),
(18, 'toys', '0001_initial', '2019-08-12 03:34:27.033583'),
(19, 'accounts', '0001_initial', '2019-08-14 04:44:14.497344'),
(20, 'accounts', '0002_delete_user', '2019-08-27 23:21:21.683309');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5bn4xrld0jnu7wq2njj1lpeixb69r1dg', 'ODc2N2I5ZTM1ZDk2MTU3NjhmMDMwODdmMjZkOGY2ZmNiOTA4ZjIyZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MDNiNGQwYWVkMGRiMzdlMTFhMmNjYjQ5NWZlYzMxN2FmYzMxMzI0In0=', '2019-08-27 04:11:36.110808'),
('8e8pqq1nzoo08ojnrj7k83b8jxhxn30x', 'NDMxZDdiYTRkOTA5Y2E4NzZlY2MyMjVhNjA4ODg5YmQ3NTRiYjkwYjp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YjIyMmZjOTk4YjIwZjgzOTE4YzdjN2NiNDdlMzkyZTFlYzM1YzBkIn0=', '2019-10-31 20:24:13.743082'),
('bcld14tjm5njgymeunc8yylm908avggy', 'MThhNDQyOTQ1ZmFmMmE3MGM4YzVmNDViMzEwMDI4NmFjNDcxNWVjMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGIwZTc2M2JkMzRjZGFjMWNjY2JkMTA5NTUxMTMyODg4YWY3YjA5In0=', '2019-09-11 04:15:21.680917'),
('sxsn9160gu9fmt60sk5ylma1ms8w4g4f', 'OWIyNDIyNWI0Mjg5YWZiMWY5OWQyYzE3ZDVkZjNjODRiZWU1Mzg1Mjp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTcxOTk1MGU1NDIxYzAxOTIwNThhOGFjNWM5ZGY5ZmMzMTExNGI3In0=', '2019-12-30 03:20:10.182501');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `region_name` varchar(50) NOT NULL,
  PRIMARY KEY (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_name`) VALUES
('Africa'),
('Antarctica'),
('Asia'),
('Australia'),
('Europe'),
('North America'),
('South America');

-- --------------------------------------------------------

--
-- Table structure for table `toys_comic`
--

DROP TABLE IF EXISTS `toys_comic`;
CREATE TABLE IF NOT EXISTS `toys_comic` (
  `comic_name` varchar(255) NOT NULL,
  PRIMARY KEY (`comic_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toys_comic`
--

INSERT INTO `toys_comic` (`comic_name`) VALUES
('DC Comics'),
('Marvel'),
('Others');

-- --------------------------------------------------------

--
-- Table structure for table `toys_make`
--

DROP TABLE IF EXISTS `toys_make`;
CREATE TABLE IF NOT EXISTS `toys_make` (
  `makeName` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`makeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toys_make`
--

INSERT INTO `toys_make` (`makeName`, `url`) VALUES
('Kaiyodo', NULL),
('Mafex', 'www.medicomtoy.co.jp'),
('Mezco', 'https://www.mezcotoyz.com/'),
('Others', NULL),
('S.H. Figuarts', 'https://www.shfiguarts.com/');

-- --------------------------------------------------------

--
-- Table structure for table `toys_toys`
--

DROP TABLE IF EXISTS `toys_toys`;
CREATE TABLE IF NOT EXISTS `toys_toys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `post_date` datetime(6) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `votes_total` int(11) NOT NULL,
  `comic_name_id` varchar(255) DEFAULT NULL,
  `makeName_id` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toys_toys_comic_name_id_65d63bc8` (`comic_name_id`),
  KEY `toys_toys_make_name_id_d467149f` (`makeName_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toys_toys`
--

INSERT INTO `toys_toys` (`id`, `title`, `description`, `picture`, `post_date`, `rating`, `votes_total`, `comic_name_id`, `makeName_id`, `owner_id`) VALUES
(34, 'Assassins', 'Assassins killing each other', 'images/assassin_YBJsksD.jpg', '2020-03-12 16:42:59.573971', NULL, 0, NULL, 'Others', 10),
(35, 'punishers and wolvie', 'planning the way to save the world', 'images/punisher_wolie_cIXyAlR.jpg', '2020-03-12 16:44:06.000398', NULL, 0, NULL, 'Mezco', 11),
(36, 'Ironman mk50 mk85', 'Group of different Ironmans', 'images/ironman_yuzSLEd.jpg', '2020-03-12 16:44:26.624846', NULL, 0, NULL, 'S.H. Figuarts', 11),
(37, 'Daredevil', 'The netflix ver.', 'images/8daredevil_TcXVoSF.jpg', '2020-03-12 16:45:09.258532', NULL, 0, NULL, 'Mezco', 10),
(38, 'Iceman', 'The Villains!', 'images/iceman_bQtDuEg.jpg', '2020-03-12 16:45:47.187563', NULL, 0, NULL, 'Others', 11),
(39, 'Superman', 'Stand alone Sup', 'images/sup_PhhEZ8x.jpg', '2020-03-12 16:46:15.076312', NULL, 0, NULL, 'Mezco', 11);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `toys_toys`
--
ALTER TABLE `toys_toys`
  ADD CONSTRAINT `toys_toys_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `toys_toys_ibfk_2` FOREIGN KEY (`makeName_id`) REFERENCES `toys_make` (`makeName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
