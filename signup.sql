-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 12:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `signup`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '$2y$10$5JlK/7JjdzJ6QgdAvm5e6uYZMZ9H6.Fdz65P6ivR9QKn1Hh5JH0pG', '2024-11-13 11:42:28'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '$2y$10$yY6IqbSYRfQXqqDsK32SKeQ64XZYuD9sUXcdYTVB1cWpz5Ob9eJ4G', '2024-11-13 11:42:28'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '$2y$10$Ksj0gdwF72u9Sdj77PjdGeiZ2nAKV9bZB.VA0J9nmwYy6d7hZ8PaS', '2024-11-13 11:42:28'),
(4, 'Bob', 'Martin', 'bob.martin@example.com', '$2y$10$3FwZmVZBovLxHlC4wrlbLu9S2ydZt1l2nTyA8EoP6gk7tHDM3BLOO', '2024-11-13 11:42:28'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', '$2y$10$zjlh7o8MLwQUoy1tHsWcb6QLp4pwE33S9zpQle5JH37hGSCgnWk1y', '2024-11-13 11:42:28'),
(6, 'Eve', 'White', 'eve.white@example.com', '$2y$10$9Q/J0PoLqChRhTt95aDFeeThb5zfrwsEKdDyyLzCkqGpO1g0KmTrC', '2024-11-13 11:42:28'),
(7, 'David', 'Wilson', 'david.wilson@example.com', '$2y$10$TAlu2joqv5pEby8aA1Jz0T1sHnPHzog.l6XtD3cPfm3ptROOq63y2', '2024-11-13 11:42:28'),
(8, 'Sophia', 'Taylor', 'sophia.taylor@example.com', '$2y$10$U/YY0veubDlGpP2V3Tjl3He8jlx9Czlt6lLQJlMW7xjGvLzfswBGG', '2024-11-13 11:42:28'),
(9, 'Mike', 'Davis', 'mike.davis@example.com', '$2y$10$4bLNtpVZMGw6h9Mv5pz1JbZ9PAhkm8LRc46gh4.NQFzWg8dhA82wS', '2024-11-13 11:42:28'),
(10, 'Linda', 'Martinez', 'linda.martinez@example.com', '$2y$10$vlzYtP4bKkA2g9f8jcW3hK67Yssg9kpHt9B6tD6PQmFzDF1SGD8Xq', '2024-11-13 11:42:28'),
(11, 'demo', 'demo', 'demo@gmail.com', '$2y$10$QQgJPmjf1vgXCCWk/BHODe/N73kEQ4Z349oMNVSchGfIfffTR9FuG', '2024-11-13 11:43:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
