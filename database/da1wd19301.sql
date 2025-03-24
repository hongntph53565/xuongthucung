-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 18, 2024 lúc 07:31 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `da1wd19301`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL,
  `soft_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `cate_name`, `type`, `soft_delete`) VALUES
(1, 'Thức ăn cho mèo', 0, 0),
(2, 'Thức ăn cho chó', 0, 0),
(5, 'Thời trang mèo', 0, 0),
(6, 'Chó', 1, 0),
(7, 'Mèo', 1, 0),
(8, 'Chuột hunter', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `payment` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `quantity`, `description`, `status`, `category_id`) VALUES
(1, 'Súp thưởng cho mèo, cat food đầy đủ dinh dưỡng', '', 100000, 100, 'Súp thưởng cho mèo, cat food đầy đủ dinh dưỡng giá rẻ thanh 15g Món ăn cho mèo Món ăn cho thú cưng Món ăn cho mè', 1, 1),
(2, 'Bát ăn cho chó mèo', '', 100000, 120, 'Bát ăn là nơi chứa thức ăn và nước cho chó và mèo.', 1, 5),
(3, 'Thức ăn Royal Canin cho chó', '', 50000, 10, 'Thức ăn Royal Canin cho chó', 1, 1),
(12, 'Tôm viên cho mèo', '', 120000, 122, 'thức ăn tom viên cho mèo', 1, 1),
(13, 'Test 10 update', 'images/newFile-9326-1694653874.jpg', 230000, 1000, 'Test 10', 1, 5),
(14, 'Test 11', 'images/AA1rxAGg.jpg', 100000, 100, 'Test 11', 1, 1),
(15, 'Maria – Alaska Đen Trắng Cái', 'images/anh1.jpg', 2000000, 1, '7 NGÀY ĐỔI TRẢ với bất kỳ lý do gì\r\nAN TÂM SONG HÀNH với bảo hiểm 365 NGÀY\r\nTiết kiệm 30-50% thời gian & chi phí với gói chăm sóc tùy biến linh hoạt\r\nĐường dây hỗ trợ 24/7\r\nFreeship toàn quốc', 1, 6),
(16, 'Marty – Alaska Nâu Đỏ Cái', 'images/anh2.jpg', 1200000, 1, '7 NGÀY ĐỔI TRẢ với bất kỳ lý do gì\r\nAN TÂM SONG HÀNH với bảo hiểm 365 NGÀY\r\nTiết kiệm 30-50% thời gian & chi phí với gói chăm sóc tùy biến linh hoạt\r\nĐường dây hỗ trợ 24/7\r\nFreeship toàn quốc', 1, 6),
(17, 'Rambo – Alaska Nâu Đỏ Đực', 'images/anh3.jpg', 1800000, 1, '7 NGÀY ĐỔI TRẢ với bất kỳ lý do gì\r\nAN TÂM SONG HÀNH với bảo hiểm 365 NGÀY\r\nTiết kiệm 30-50% thời gian & chi phí với gói chăm sóc tùy biến linh hoạt\r\nĐường dây hỗ trợ 24/7\r\nFreeship toàn quốc', 1, 6),
(18, 'Alaska Standard Nâu Đỏ Đực C13022', 'images/anh4.jpg', 1300000, 1, '7 NGÀY ĐỔI TRẢ với bất kỳ lý do gì\r\nAN TÂM SONG HÀNH với bảo hiểm 365 NGÀY\r\nTiết kiệm 30-50% thời gian & chi phí với gói chăm sóc tùy biến linh hoạt\r\nĐường dây hỗ trợ 24/7\r\nFreeship toàn quốc', 1, 6),
(19, 'Thức ăn cho chó Ganador Adult Salmon & Rice', 'images/ta1.jpg', 29000, 200, 'Thức ăn cho chó Ganador Adult Salmon & Rice là thực phẩm dành cho chó trưởng thành với công thức chế biến được nghiên cứu bởi các chuyên gia', 1, 2),
(20, 'Hạt Pedigree Puppy vị gà và trứng 400g', 'images/ta2.jpg', 57000, 100, 'Thức ăn dạng hạt Pedigree Puppy vị gà sốt trứng đem đến những bữa ăn đầy đủ chất dinh dưỡng, cùng hương vị ngon miệng kích thích các bé ăn uống.', 1, 2),
(21, 'Thức ăn hạt Dog On Red – Protein 33%', 'images/ta3.png', 329000, 100, 'Thức ăn hạt Dog On Red khô dành cho chó với hàm lượng đạm lên tới 33% giúp cho các boss nhỏ có thể nhanh chóng tăng cân, phát triển thể trạng khoẻ mạnh.', 1, 2),
(22, 'Hạt Classic Pets Small Breed Dog Beef Flavour – 2kg', 'images/ta4.jpg', 312000, 1000, 'Thức ăn hạt Classic Pets Small Breed Dog Beef Flavour dành cho cún con với hàm lượng dinh dưỡng cao, mùi vị thơm ngon dễ dàng để các boss hấp thụ.', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
