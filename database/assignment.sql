-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2019 at 05:25 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'women'),
(2, 'men'),
(3, 'bag'),
(4, 'shoes'),
(5, 'watches');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `content` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `content`, `percent`) VALUES
(1, 'VNVODICH', 100);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `transaction_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_cost` float NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`transaction_id`, `user_id`, `total_cost`, `status`, `created`) VALUES
('87d4205e3a88759064642518c9124451', 5, 425.79, 'Pending', '2018-12-11 19:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `kind` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='products that can be added to cart';

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `kind`, `created`, `modified`) VALUES
(1, 'Điện thoại iPhone 7 Plus 32GB', 'Màn hình:	LED-backlit IPS LCD, 5.5\", Retina HD <br>\r\n\r\nHệ điều hành:	iOS 12 <br>\r\n\r\nCamera sau:	Chính 12 MP & Phụ 12 MP\r\n<br>\r\nCamera trước:	7 MP\r\n<br>\r\nCPU:	Apple A10 Fusion 4 nhân 64-bit\r\n<br>\r\nRAM:	3 GB\r\n<br>\r\nBộ nhớ trong:	32 GB\r\n<br>\r\nThẻ SIM:\r\n1 Nano SIM, Hỗ trợ 4G', '58.79', '1', '2018-12-04 15:36:18', '2018-12-04 15:36:18'),
(27, 'San Antonio Spurs Kawhi Leonard #2 \nAdidas Black T-Shirt', '&lt;p&gt;Kawhi Leonard San Antonio Spurs T shirt, made by Adidas the official on court producers of NBA apparel and jerseys.&lt;/p&gt;\r\n&lt;p&gt;Leonard and 2 are printed on the back in authentic font.&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Basic Print&lt;/li&gt;\r\n&lt;li&gt;Officially licensed NBA Product&lt;/li&gt;\r\n&lt;li&gt;NBA Hologram Sticker&lt;/li&gt;\r\n&lt;li&gt;Mens Sizing&lt;/li&gt;\r\n&lt;li&gt;100% Cotton&lt;/li&gt;\r\n&lt;li&gt;Adidas &quot;Go To Tee&quot;&lt;/li&gt;\r\n&lt;/ul&gt;', '99.99', '2', '2016-10-28 20:49:40', '2016-10-28 05:49:40'),
(28, 'dien thoai sam sung', '&lt;p&gt;Looks like a jersey, wears like a tee -- this 100% cotton Adidas NBA player name and number t-shirt sports screen prints of your favorite player\'s name and number, plus team graphics on the chest.&lt;/p&gt;\r\n&lt;p&gt;Officially licensed by the NBA.&lt;/p&gt;', '49.99', '3', '2016-10-28 20:52:43', '2016-10-28 05:52:43'),
(42, 'Điện thoại Xiaomi Redmi Note 8 Pro (6GB/64GB)', 'Thông số kỹ thuật <br>\r\nMàn hình:	IPS LCD, 6.53\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 64 MP & Phụ 8 MP, 2 MP, 2 MP<br>\r\nCamera trước:	20 MP<br>\r\nCPU:	Mediatek Helio G90T 8 nhân<br>\r\nRAM:	6 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB<br>\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4500 mAh, có sạc nhanh', '134.00', '4', '2019-11-04 00:00:00', '2019-11-21 17:00:00'),
(44, 'Pin sạc dự phòng 5.000 mAh eSaver Safari 2S', 'Thông số kỹ thuật <br>\r\nHiệu suất sạc:	65%<br>\r\nDung lượng pin:	5.000 mAh<br>\r\nThời gian sạc đầy pin:	5 - 6 giờ (dùng <br>Adapter 1A)2 - 3 giờ (dùng Adapter 2.1A)\r\nNguồn vào:	Micro USB: 5V - 2A<br>\r\nNguồn ra:	USB 1: 5V - 1AUSB 2: 5V - 2.1A<br>\r\nLõi pin:	Pin Li-Ion<br>\r\nTiện ích:	Đèn LED báo hiệu<br>\r\nKích thước:	Dài 9.5 cm - ngang 4.8 cm - dày 2 cm<br>\r\nTrọng lượng:	200g<br>\r\nSản xuất tại:	Trung Quốc', '12.00', '5', '2019-11-03 00:00:00', '2019-11-27 17:00:00'),
(31, 'Điện thoại iPhone Xs Max 64GB', 'Thông số kỹ thuật <br>\r\nMàn hình:	OLED, 6.5\", Super Retina<br>\r\nHệ điều hành:	iOS 12<br>\r\nCamera sau:	Chính 12 MP & Phụ 12 MP<br>\r\nCamera trước:	7 MP<br>\r\nCPU:	Apple A12 Bionic 6 nhân<br>\r\nRAM:	4 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ SIM:\r\nNano SIM & eSIM, Hỗ trợ 4G<br>\r\n\r\nDung lượng pin:	3174 mAh, có sạc nhanh', '29.99', '1', '2016-10-28 20:59:20', '2016-10-28 05:59:20'),
(32, 'Điện thoại iPhone 11 Pro Max 64GB\r\n', 'Thông số kỹ thuật <br>\r\nMàn hình:	OLED, 6.5\", Super Retina XDR<br>\r\nHệ điều hành:	iOS 13<br>\r\nCamera sau:	3 camera 12 MP<br>\r\nCamera trước:	12 MP<br>\r\nCPU:	Apple A13 Bionic 6 nhân<br>\r\nRAM:	4 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ SIM:\r\nNano SIM & eSIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng). <br>Giá từ 170.000đ<br>\r\nDung lượng pin:	3969 mAh, có sạc nhanh', '29.99', '1', '2016-10-28 21:03:19', '2016-10-28 06:03:19'),
(33, 'Điện thoại iPhone 8 Plus 64GB', 'Thông số kỹ thuật <br>\r\nMàn hình:	LED-backlit IPS LCD, 5.5\", Retina HD<br>\r\nHệ điều hành:	iOS 12<br>\r\nCamera sau:	Chính 12 MP & Phụ 12 MP<br>\r\nCamera trước:	7 MP<br>\r\nCPU:	Apple A11 Bionic 6 nhân<br>\r\nRAM:	3 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ SIM:\r\n1 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	2691 mAh, có sạc nhanh', '29.99', '1', '2016-10-28 21:05:30', '2016-10-28 06:05:30'),
(34, 'Điện thoại OPPO K3', 'Thông số kỹ thuật <br>\r\nMàn hình:	AMOLED, 6.5\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 16 MP & Phụ 2 MP<br>\r\nCamera trước:	16 MP<br>\r\nCPU:	Snapdragon 710 8 nhân 64-bit<br>\r\nRAM:	6 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng). <br>Giá từ 170.000đ<br>\r\nDung lượng pin:	3765 mAh, có sạc nhanh', '29.99', '2', '2016-10-28 21:06:34', '2016-10-28 06:06:34'),
(35, 'Điện thoại OPPO Reno2 F', 'Thông số kỹ thuật <br>\r\nMàn hình:	AMOLED, 6.53\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP<br>\r\nCamera trước:	16 MP<br>\r\nCPU:	MediaTek Helio P70 8 nhân<br>\r\nRAM:	8 GB<br>\r\nBộ nhớ trong:	128 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB<br>\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng). <br>Giá từ 170.000đ<br>\r\nDung lượng pin:	4000 mAh, có sạc nhanh', '32.24', '2', '2016-10-28 21:08:05', '2016-10-28 06:08:05'),
(36, 'Điện thoại OPPO A5s', 'Thông số kỹ thuật <br>\r\nMàn hình:	IPS LCD, 6.2\", HD+<br>\r\nHệ điều hành:	Android 8.1 (Oreo)<br>\r\nCamera sau:	Chính 13 MP & Phụ 2 MP<br>\r\nCamera trước:	8 MP<br>\r\nCPU:	MediaTek Helio P35 8 nhân 64-bit<br>\r\nRAM:	3 GB<br>\r\nBộ nhớ trong:	32 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB<br>\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4230 mAh', '109.93', '2', '2016-10-28 21:08:52', '2016-10-28 06:08:52'),
(37, 'Điện thoại OPPO F11 Pro 128GB', 'Thông số kỹ thuật <br>\r\nMàn hình:	LTPS LCD, 6.5\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 48 MP & Phụ 5 MP<br>\r\nCamera trước:	16 MP<br>\r\nCPU:	MediaTek Helio P70 8 nhân<br>\r\nRAM:	6 GB<br>\r\nBộ nhớ trong:	128 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 256 GB<br>\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4000 mAh, có sạc nhanh', '46.99', '2', '2016-10-28 21:09:44', '2016-10-28 06:09:44'),
(38, 'Điện thoại Samsung Galaxy A50 64GB', 'hông số kỹ thuật <br>\r\nMàn hình:	Super AMOLED, 6.4\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 25 MP & Phụ 8 MP, 5 MP<br>\r\nCamera trước:	25 MP<br>\r\nCPU:	Exynos 9610 8 nhân 64-bit<br>\r\nRAM:	4 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 512 GB<br>\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4000 mAh, có sạc nhanh', '29.99', '3', '2016-10-28 21:46:06', '2016-10-28 06:46:06'),
(40, 'Điện thoại Samsung Galaxy Note 10+', 'Thông số kỹ thuật <br>\r\nMàn hình:	Dynamic AMOLED, 6.8\", Quad HD+ (2K+)<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 12 MP & Phụ 12 MP, 16 MP, TOF 3D<br>\r\nCamera trước:	10 MP<br>\r\nCPU:	Exynos 9825 8 nhân 64-bit<br>\r\nRAM:	12 GB<br>\r\nBộ nhớ trong:	256 GB<br>\r\nThẻ nhớ:	MicroSD, hỗ trợ tối đa 1 TB<br>\r\nThẻ SIM:\r\n2 SIM Nano (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4300 mAh, có sạc nhanh', '32.00', '3', '2016-11-02 20:15:38', '2016-11-02 05:15:38'),
(43, 'Điện thoại Xiaomi Mi 9T', 'Thông số kỹ thuật <br>\r\nMàn hình:	AMOLED, 6.39\", Full HD+<br>\r\nHệ điều hành:	Android 9.0 (Pie)<br>\r\nCamera sau:	Chính 48 MP & Phụ 13 MP, 8 MP<br>\r\nCamera trước:	20 MP<br>\r\nCPU:	Snapdragon 730 8 nhân<br>\r\nRAM:	6 GB<br>\r\nBộ nhớ trong:	64 GB<br>\r\nThẻ SIM:\r\n2 Nano SIM, Hỗ trợ 4G<br>\r\nHOTSIM Mobi Big 70 (3GB data/tháng).<br> Giá từ 170.000đ<br>\r\nDung lượng pin:	4000 mAh, có sạc nhanh', '87.00', '4', '2019-11-03 00:00:00', '2019-11-28 17:00:00'),
(45, 'Tai nghe chụp tai Sony MDR-100AAPYCE\r\n', 'Thông số kỹ thuật <br>\r\nTương thích:	AndroidWindowsiOS (iPhone, iPad)Windows Phone<br>\r\nJack cắm:	3.5mm<br>\r\nĐộ dài dây:	1.2 m<br>\r\nKết nối cùng lúc:	1 thiết bị<br>\r\nPhím điều khiển:	Mic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạcChuyển bài hát<br>\r\nThương hiệu của:	Sony<br>\r\nSản xuất tại:	Trung Quốc', '34.00', '5', '2019-11-03 00:00:00', '2019-11-28 17:00:00'),
(46, 'Đế sạc không dây 9W Qi Type C Samsung EP-P1100 Đen\r\n', 'Thông số kỹ thuật <br>\r\nModel:	EP-P1100 <br>\r\nChức năng:	Sạc<br>\r\nĐầu vào:	Type C: 5V - 2A ,9V - 1.67A<br>\r\nĐầu ra:	Không dây: 5V - 1A ,10V - 0.9A<br>\r\nKích thước:	Đường kính: 9 cm, Dày 1.2 cm<br>\r\nThương hiệu của:	Hàn Quốc<br>\r\nSản xuất tại:	Việt Nam', '23.00', '5', '2019-11-03 00:00:00', '2019-11-26 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='image files related to a product';

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `name`, `created`, `modified`) VALUES
(105, 1, 'product-detail-01.jpg', '2018-12-05 10:38:00', '2018-12-04 15:38:41'),
(106, 1, 'product-detail-02.jpg', '2018-12-04 15:39:12', '2018-12-04 15:39:12'),
(107, 1, 'product-detail-03.jpg', '2018-12-04 15:39:36', '2018-12-04 15:39:36'),
(83, 31, 'iphonexsmax3.jpg', '2016-10-28 20:58:02', '2019-11-08 03:03:06'),
(82, 29, 'p32.jpg', '2016-10-28 20:56:23', '2016-10-28 05:56:23'),
(81, 29, 'p31.jpg', '2016-10-28 20:56:23', '2016-10-28 05:56:23'),
(80, 28, 'p22.jpg', '2016-10-28 20:52:43', '2016-10-28 05:52:43'),
(79, 28, 'p21.jpg', '2016-10-28 20:52:43', '2016-10-28 05:52:43'),
(77, 27, 'p11.jpg', '2016-10-28 20:49:40', '2016-10-28 05:49:40'),
(78, 27, 'p12.jpg', '2016-10-28 20:49:40', '2016-10-28 05:49:40'),
(84, 31, 'iphonexsmax1.jpg', '2016-10-28 20:59:20', '2019-11-08 02:52:24'),
(85, 31, 'iphonexsmax2.jpg', '2016-10-28 20:59:20', '2019-11-08 03:04:46'),
(86, 32, 'iphone11promax1.jpeg', '2016-10-28 21:03:19', '2019-11-08 03:08:59'),
(87, 32, 'iphone11promax2.jpeg', '2016-10-28 21:03:19', '2019-11-08 03:08:17'),
(89, 33, 'iphone8plus1.jpg', '2016-10-28 21:05:30', '2019-11-08 03:20:15'),
(90, 33, 'iphone8plus2.jpg', '2016-10-28 21:05:30', '2019-11-08 03:21:10'),
(91, 34, 'oppok31.png', '2016-10-28 21:06:34', '2019-11-08 03:38:06'),
(92, 34, 'oppok32.jpg', '2016-10-28 21:06:34', '2019-11-08 03:38:27'),
(93, 34, 'oppok33.png', '2016-10-28 21:06:34', '2019-11-08 03:38:21'),
(94, 35, 'opporeno1.jpg', '2016-10-28 21:08:05', '2019-11-08 03:33:24'),
(95, 35, 'opporeno3.jpg', '2016-10-28 21:08:05', '2019-11-08 03:32:58'),
(96, 36, 'oppoa5s1.jpg', '2016-10-28 21:08:52', '2019-11-08 03:29:04'),
(97, 36, 'oppoa5s2.jpg', '2016-10-28 21:08:52', '2019-11-08 03:29:09'),
(98, 36, 'oppoa5s3.jpeg', '2016-10-28 21:08:52', '2019-11-08 03:30:00'),
(99, 37, 'oppo11pro1.jpg', '2016-10-28 21:09:44', '2019-11-08 03:25:18'),
(100, 37, 'oppo11pro2.jpg', '2016-10-28 21:09:44', '2019-11-08 03:26:17'),
(101, 37, 'oppo11pro3.jpg', '2016-10-28 21:09:44', '2019-11-08 03:26:22'),
(102, 38, 'samsunga501.png', '2016-10-28 21:46:06', '2019-11-08 03:47:36'),
(103, 38, 'samsunga502.jpg', '2016-10-28 21:46:06', '2019-11-08 03:47:52'),
(104, 40, 'samsungnote101.jpg', '2016-11-02 20:15:38', '2019-11-08 03:43:45'),
(51, 14, 'gardman-r687-4-tier-mini-greenhouse-1.jpg', '0000-00-00 00:00:00', '2015-03-19 01:45:42'),
(52, 14, 'gardman-r687-4-tier-mini-greenhouse-2.jpg', '0000-00-00 00:00:00', '2015-03-19 01:45:42'),
(53, 15, 'spalding-nba-street-basketball-1.jpg', '0000-00-00 00:00:00', '2015-03-19 01:48:34'),
(54, 16, 'bandai-hobby-thousand-sunny-model-ship-one-piece-grand-ship-collection-1.jpg', '0000-00-00 00:00:00', '2015-03-19 02:02:25'),
(55, 16, 'bandai-hobby-thousand-sunny-model-ship-one-piece-grand-ship-collection-2.jpg', '0000-00-00 00:00:00', '2015-03-19 02:02:25'),
(56, 16, 'bandai-hobby-thousand-sunny-model-ship-one-piece-grand-ship-collection-3.jpg', '0000-00-00 00:00:00', '2015-03-19 02:02:25'),
(57, 16, 'bandai-hobby-thousand-sunny-model-ship-one-piece-grand-ship-collection-4.jpg', '0000-00-00 00:00:00', '2015-03-19 02:02:25'),
(59, 17, 'bandai-tamashii-nations-nami-new-world-ver-one-piece-figuartszero-bandai-tamashii-nations-2.jpg', '0000-00-00 00:00:00', '2015-03-19 02:07:20'),
(73, 17, '29097235540_b2fefed80d_k.jpg', '2016-09-17 22:01:17', '2016-09-17 07:01:17'),
(74, 25, '14194449_1363884933625826_1306807357_n.jpg', '2016-09-18 01:03:15', '2016-09-17 10:03:15'),
(61, 17, 'bandai-tamashii-nations-nami-new-world-ver-one-piece-figuartszero-bandai-tamashii-nations-4.jpg', '0000-00-00 00:00:00', '2015-03-19 02:07:20'),
(71, 17, 'bandai-tamashii-nations-nami-new-world-ver-one-piece-figuartszero-bandai-tamashii-nations-5.jpg', '2016-08-17 15:53:17', '2016-08-17 00:53:17'),
(67, 19, 'products.jpg', '0000-00-00 00:00:00', '2015-03-25 20:29:34'),
(69, 20, 'tp-link-mr3420-2.jpg', '2016-08-08 14:12:59', '2016-08-07 23:12:59'),
(70, 21, 'd-link-universal-modem.jpg', '2016-08-08 14:24:19', '2016-08-07 23:24:19'),
(75, 25, '29097235540_b2fefed80d_k.jpg', '2016-09-18 01:03:15', '2016-09-17 10:03:15'),
(76, 20, 'aaa.png', '2016-10-13 16:31:58', '2016-10-13 01:31:58'),
(109, 32, 'iphone11promax3.jpeg', '2019-11-13 00:00:00', '2019-11-08 03:16:27'),
(110, 33, 'iphone8plus3.jpg', '2019-11-07 00:00:00', '2019-11-20 17:00:00'),
(111, 35, 'opporeno2.jpg', '2019-11-05 00:00:00', '2019-11-20 17:00:00'),
(112, 40, 'samsungnote102.jpg', '2019-11-05 00:00:00', '2019-11-21 17:00:00'),
(113, 40, 'samsungnote103.jpg', '2019-11-07 00:00:00', '2019-11-29 17:00:00'),
(114, 38, 'samsunga503.jpg', '2019-11-01 00:00:00', '2019-11-28 17:00:00'),
(115, 42, 'xiaomi11.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00'),
(116, 42, 'xiaomi12.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00'),
(117, 42, 'xiaomi13.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00'),
(118, 43, 'xiaomi9t1.jpg', '2019-11-05 00:00:00', '2019-11-28 17:00:00'),
(119, 43, 'xiaomi9t2.jpg', '2019-11-04 00:00:00', '2019-11-20 17:00:00'),
(120, 43, 'xiaomi9t3.jpg', '2019-11-05 00:00:00', '2019-11-27 17:00:00'),
(121, 44, 'phukien1.jpg', '2019-11-03 00:00:00', '2019-11-29 17:00:00'),
(122, 44, 'phukien2.jpg', '2019-11-11 00:00:00', '2019-11-21 17:00:00'),
(123, 44, 'phukien3.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00'),
(124, 45, 'tainghe1.jpg', '2019-11-03 00:00:00', '2019-11-26 17:00:00'),
(125, 45, 'tainghe2.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00'),
(126, 45, 'tainghe3.jpg', '2019-11-03 00:00:00', '2019-11-18 17:00:00'),
(127, 46, 'desac1.jpg', '2019-11-11 00:00:00', '2019-11-21 17:00:00'),
(128, 46, 'desac2.jpg', '2019-11-04 00:00:00', '2019-11-19 17:00:00'),
(129, 46, 'desac3.jpg', '2019-11-04 00:00:00', '2019-11-27 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `forgot_pass_identity` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`, `email`, `forgot_pass_identity`, `firstName`, `lastName`, `type`, `modified`) VALUES
(5, 'root', '25d55ad283aa400af464c76d713c07ad', 'root@gmail.com', '', 'Nguyens', 'CÃ´ng Phuong1', 2, '2018-12-11 20:41:49'),
(6, 'toan', 'e10adc3949ba59abbe56e057f20f883e', 'toanbku@gmail.com', 'fb7a2fbae3c9d598cb2e905ffdbb5096', 'Nguyá»…n PhÆ°Æ¡ng', 'VÆ°Æ¡ng', 1, '2018-12-11 19:23:15'),
(14, 'aaa', 'e10adc3949ba59abbe56e057f20f883e', 'aa@gmail.com', '', 'Ho', 'Quang Toan', 1, '0000-00-00 00:00:00'),
(18, 'phuongvuong', 'e10adc3949ba59abbe56e057f20f883e', 'phuongvuong@gmail.com', '', 'Phuong', 'Vuong', 1, '0000-00-00 00:00:00'),
(19, 'vana', 'e10adc3949ba59abbe56e057f20f883e', 'asssa@gmail.com', '', 'Nguyá»…n VÄƒn', 'ToÃ n1', 1, '2018-12-11 19:20:03'),
(20, 'hcmut', 'e10adc3949ba59abbe56e057f20f883e', '1613594@hcmut.edu.vn', '0fc2388693f5b78b6baa1c7bf55d502a', 'Quang', 'Toan', 1, '2018-12-11 18:19:08'),
(21, 'viethung', 'e10adc3949ba59abbe56e057f20f883e', 'viethungcse@gmail.com', '', 'Nguyen', 'Viet Hung', 1, '0000-00-00 00:00:00'),
(22, 'thib', '827ccb0eea8a706c4c34a16891f84e7b', 'tranthib@gmail.com', '', 'Tran', 'Thi B', 1, '0000-00-00 00:00:00'),
(23, 'thic', 'e10adc3949ba59abbe56e057f20f883e', 'thic@gmail.com', '', 'Phan Thi', 'CC', 1, '0000-00-00 00:00:00'),
(25, 'tuanbieber', '6af30782907da685bb7283eb5c44a490', 'championship1604@gmail.com', '', 'Nguyen', 'Tuan', 1, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
