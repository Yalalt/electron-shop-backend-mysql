-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 03, 2023 at 05:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(2000, 'Samsung'),
(2001, 'HP'),
(2002, 'Acer'),
(2003, 'Apple'),
(2004, 'Breville'),
(2005, 'Xiaomi'),
(2006, 'Phillips'),
(2007, 'XP-Pen'),
(2008, 'UGreen'),
(2009, 'Beats'),
(2010, 'Nintendo'),
(2011, 'Amazon Basic'),
(2012, 'Celestron'),
(2013, 'Microsoft');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1000, 'appliances'),
(1001, 'computers'),
(1002, 'tablets'),
(1003, 'electronics'),
(1004, 'console');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_date` date NOT NULL,
  `description` varchar(256) NOT NULL,
  `sale` varchar(64) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `brand_id`, `category_id`, `created_date`, `description`, `sale`, `price`, `stock`, `image`) VALUES
(4000, '4-Door Flex', 2000, 1000, '2023-03-03', 'Customize a Samsung Bespoke 3- or 4-door French door refrigerator or 4-Door Flex refrigerator with panels available in multiple colors and finishes.', '20', 1222, 12, 'https://image-us.samsung.com/SamsungUS/home/home-appliances/refrigerators/090321/rs22t5561sr/RS22T5561SR_01_SIlver_samsung.jpg?$product-details-jpg$'),
(4001, 'HP Elitebook 840', 2001, 1001, '2023-03-03', 'An item that has been used previously. The item may have some signs of cosmetic wear, but is fully operational and functions as intended.', '0', 180, 23, 'https://i.ebayimg.com/images/g/E8wAAOSwO9Bjmd1t/s-l1600.jpg'),
(4002, 'HP Probook 430', 2001, 1001, '2023-03-03', 'Touch Convertible Laptop AMD. 1 year Warranty. Free and fast delivery.', '15', 265, 4, 'https://i.ebayimg.com/images/g/F2oAAOSwbxBimCXu/s-l1600.jpg'),
(4003, 'Acer Spin 3', 2002, 1001, '2023-03-03', 'Touch Convertible Laptop AMD. 1 year Warranty. Free and fast delivery.', '10', 220, 12, 'https://i.ebayimg.com/images/g/YLkAAOSwKjpjpOdr/s-l1600.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `specification`
--

CREATE TABLE `specification` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `property` varchar(64) NOT NULL,
  `value` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specification`
--

INSERT INTO `specification` (`id`, `product_id`, `property`, `value`) VALUES
(3000, 4000, 'Height', '69 7/8 inches'),
(3001, 4000, 'Width', '35 3/4 inches'),
(3002, 4001, 'Display', '14 inch'),
(3003, 4001, 'CPU', 'i5-6300U 2,4 GHZ'),
(3004, 4001, 'Hard', '1TB SSD'),
(3005, 4001, 'RAM', '16GB'),
(3006, 4002, 'Display', '13 inch'),
(3007, 4002, 'CPU', 'i5-8250U 2,4 GHZ'),
(3008, 4002, 'Hard', '256GB SSD'),
(3009, 4003, 'Display', '14 inch'),
(3010, 4003, 'CPU', 'i5-8250U 2,4 GHZ'),
(3011, 4003, 'Hard', '512GB SSD'),
(3012, 4003, 'RAM', '8GB DDR5');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `role` enum('admin','client','moderator') DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `contact` varchar(128) NOT NULL,
  `address1` varchar(256) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `user_image` varchar(256) DEFAULT NULL,
  `register_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `role`, `password`, `email`, `contact`, `address1`, `address2`, `user_image`, `register_date`) VALUES
(10000, 'Yalalt', 'admin', 'admin123', 'yalaltg@gmail.com', '9992-7888, 85061299', 'Bayangol 4th province 152A 503', 'Khanuul disctrict', 'none', '2023-03-03'),
(10001, 'manager', 'moderator', 'manager123', 'tuulmanager@gmail.com', '94460357', 'Sukhbaatar district 123 43', 'Khanuul White hill 4021', 'none', '2023-03-03'),
(10002, 'Lawrence', 'client', 'manager123', 'ldymick1@kickstarter.com', '(640) 1876281', '67 Cardinal Park', 'United state', 'none', '2023-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`) VALUES
(5000, 10000, 4001),
(5001, 10000, 4003),
(5002, 10001, 4000),
(5003, 10001, 4001),
(5004, 10001, 4002),
(5005, 10001, 4003),
(5006, 10002, 4003),
(5007, 10002, 4001);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `specification`
--
ALTER TABLE `specification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2014;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4004;

--
-- AUTO_INCREMENT for table `specification`
--
ALTER TABLE `specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3013;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5008;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `specification`
--
ALTER TABLE `specification`
  ADD CONSTRAINT `specification_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;