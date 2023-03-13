-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 13 mars 2023 à 09:25
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinehall`
--

-- --------------------------------------------------------

--
-- Structure de la table `halls`
--

CREATE TABLE `halls` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `movie` int(11) NOT NULL,
  `is_full` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `halls`
--

INSERT INTO `halls` (`id`, `label`, `movie`, `is_full`) VALUES
(1, 'Hall 1', 16, 0),
(2, 'Hall 2', 25, 0),
(3, 'Hall 3', 26, 0),
(4, 'Hall 4', 33, 0);

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `Mdate` date DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `title`, `Mdate`, `price`, `image`, `description`) VALUES
(1, 'The Imitation Game', '2023-03-09', 200, 'https://m.media-amazon.com/images/M/MV5BOTgwMzFiMWYtZDhlNS00ODNkLWJiODAtZDVhNzgyNzJhYjQ4L2ltYWdlXkEyXkFqcGdeQXVyNzEzOTYxNTQ@._V1_.jpg', 'Benedict Cumberbatch, Keira Knightley'),
(2, 'Game Night', '2023-03-08', 100, 'https://m.media-amazon.com/images/M/MV5BMjI3ODkzNDk5MF5BMl5BanBnXkFtZTgwNTEyNjY2NDM@._V1_.jpg', 'Jason Bateman, Rachel McAdams'),
(3, 'Game of Thrones', '2023-03-08', 150, 'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_.jpg', 'Emilia Clarke, Peter Dinklage'),
(4, 'The Game', '2023-03-09', 150, 'https://m.media-amazon.com/images/M/MV5BNWQ2ODFhNWItNTA4NS00MzkyLTgyYzUtZjlhYWE5MmEzY2Q1XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg', 'Michael Douglas, Deborah Kara Unger'),
(5, 'Squid Game', '2023-03-09', 100, 'https://m.media-amazon.com/images/M/MV5BYWE3MDVkN2EtNjQ5MS00ZDQ4LTliNzYtMjc2YWMzMDEwMTA3XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg', 'Lee Jung-jae, Park Hae-soo'),
(6, 'Game-Show', '2023-03-09', 200, 'https://m.media-amazon.com/images/I/314t8YNB69L.png', 'Top 50 Game-Show Movies and TV Shows'),
(7, 'The Game', '2023-03-09', 120, 'https://m.media-amazon.com/images/M/MV5BZjYyMDVhMzEtNmM4ZS00YzliLWExOWEtMzRjZmFkZTk2YjI0XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg', 'Wendy Raquel Robinson, Hosea Chanchez'),
(8, 'Molly\'s Game', '2023-03-09', 130, 'https://m.media-amazon.com/images/M/MV5BNTkzMzRlYjEtMTQ5Yi00OWY3LWI0NzYtNGQ4ZDkzZTU0M2IwXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Jessica Chastain, Idris Elba'),
(9, 'How to Train Your Dragon', '2023-03-10', 300, 'https://m.media-amazon.com/images/M/MV5BMjA5NDQyMjc2NF5BMl5BanBnXkFtZTcwMjg5ODcyMw@@._V1_.jpg', 'Jay Baruchel, Gerard Butler'),
(10, 'How to Train Your Dragon: Homecoming', '2023-03-10', 140, 'https://m.media-amazon.com/images/M/MV5BMTlkZjM1MDctZTZlOC00NDQwLTg3ZGEtNTJhMWQ2YWIxNGViXkEyXkFqcGdeQXVyMjQ5MjYwNDE@._V1_.jpg', 'Jay Baruchel, America Ferrera'),
(11, 'How to Train Your Dragon 2', '2023-03-10', 120, 'https://m.media-amazon.com/images/M/MV5BMzMwMTAwODczN15BMl5BanBnXkFtZTgwMDk2NDA4MTE@._V1_.jpg', 'Jay Baruchel, Cate Blanchett'),
(12, 'How to Train Your Dragon: Snoggletog Log', '2023-03-10', 200, 'https://m.media-amazon.com/images/M/MV5BNDhjZWY0ZTMtOGY0Yy00ZWY2LTg1MzMtNjE0YzhjZmUyY2Y2XkEyXkFqcGdeQXVyMTEwNTU2NzM3._V1_.jpg', ''),
(13, 'How to Train Your Dragon: The Hidden World', '2023-03-08', 120, 'https://m.media-amazon.com/images/M/MV5BMjIwMDIwNjAyOF5BMl5BanBnXkFtZTgwNDE1MDc2NTM@._V1_.jpg', 'Jay Baruchel, America Ferrera'),
(14, 'Dreamworks How to Train Your Dragon Legends', '2023-03-08', 130, 'https://m.media-amazon.com/images/M/MV5BMTQzMjE5NDQwMl5BMl5BanBnXkFtZTgwMjI2NzA2MDE@._V1_.jpg', 'Jay Baruchel, Gerard Butler'),
(15, 'Dreamworks How to Train Your Dragon Legends', '2023-03-10', 200, 'https://m.media-amazon.com/images/M/MV5BODdhMzNjNGItYmUzMC00NWM5LTgyYmEtNzI3YjFlNGY5MTkyXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_.jpg', 'Christopher Mintz-Plasse, Jay Baruchel'),
(16, 'How to Train Your Dragon: Viking-Sized Cast', '2023-03-12', 190, 'https://m.media-amazon.com/images/M/MV5BYzY1M2RjZGEtMGI5NS00YmJjLWFiN2MtMDgxYTk1ODNkNzljXkEyXkFqcGdeQXVyNDQ5MDYzMTk@._V1_.jpg', 'Bonnie Arnold, Jay Baruchel'),
(25, 'Avatar: The Way of Water', '2023-03-12', 150, 'https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg', 'Sam Worthington, Zoe Saldana'),
(26, 'Morocco', '2023-03-12', 160, 'https://m.media-amazon.com/images/M/MV5BOWNiYzgxZjMtZTI5NC00MmZkLThkNTgtZGJmZTA0OTZmOGJiXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_.jpg', 'Gary Cooper, Marlene Dietrich'),
(32, 'Avengers: Endgame', '2023-03-13', 120, 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg', 'Robert Downey Jr., Chris Evans'),
(33, 'The Avengers', '2023-03-12', 130, 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Robert Downey Jr., Chris Evans'),
(34, 'Avengers: Age of Ultron', '2023-03-13', 200, 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_.jpg', 'Robert Downey Jr., Chris Evans'),
(35, 'The Avengers', '2023-03-13', 230, 'https://m.media-amazon.com/images/M/MV5BZWQwZTdjMDUtNTY1YS00MDI0LWFkNjYtZDA4MDdmZjdlMDRlXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg', 'Patrick Macnee, Diana Rigg'),
(36, 'Avengers: Quantum Encounter', '2023-03-13', 190, 'https://m.media-amazon.com/images/M/MV5BOTRlM2QwYjAtMjg1Yy00MmYwLTk3OTItMjBmMTM4YzI4M2VmXkEyXkFqcGdeQXVyMTA4Mzg1NzM5._V1_.jpg', 'Anthony Mackie, Kerry Condon'),
(37, 'Avengers: Secret Wars', '2023-02-13', 110, 'https://m.media-amazon.com/images/M/MV5BZWE0MjkyNGQtMjgwMS00NGIwLTg5YmEtYThlOTQ1NTZmNWFmXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg', 'Jonathan Majors, Kathryn Newton'),
(38, 'Avengers: Infinity War', '2023-03-12', 150, 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg', 'Robert Downey Jr., Chris Hemsworth'),
(39, 'Avengers: The Kang Dynasty', '2023-03-12', 170, 'https://m.media-amazon.com/images/M/MV5BMTMyMTMwYTctMjExYi00NTc3LWEwYjAtZWJmODVkZDU1NTZiXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg', 'Jonathan Majors, Kathryn Newton');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `costumer` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `hall` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `costumer`, `seat`, `hall`, `date`, `created_at`, `updated_at`) VALUES
(115, 1, 6, 1, '2023-03-06', '2023-03-06 08:27:26', '2023-03-06 08:27:26'),
(116, 1, 4, 1, '2023-03-07', '2023-03-07 12:56:19', '2023-03-07 12:56:19'),
(117, 20, 21, 2, '2023-03-10', '2023-03-09 09:55:47', '2023-03-09 09:55:47'),
(118, 20, 27, 2, '2023-03-10', '2023-03-09 09:55:50', '2023-03-09 09:55:50'),
(120, 21, 23, 2, '2023-03-10', '2023-03-09 09:56:57', '2023-03-09 09:56:57'),
(121, 21, 5, 1, '2023-03-09', '2023-03-09 09:57:25', '2023-03-09 09:57:25'),
(122, 21, 7, 1, '2023-03-09', '2023-03-09 09:57:27', '2023-03-09 09:57:27'),
(123, 1, 36, 2, '2023-03-10', '2023-03-10 13:51:56', '2023-03-10 13:51:56'),
(124, 1, 56, 3, '2023-03-10', '2023-03-10 13:52:10', '2023-03-10 13:52:10'),
(125, 18, 25, 2, '2023-03-13', '2023-03-12 14:51:28', '2023-03-12 14:51:28'),
(126, 18, 30, 2, '2023-03-13', '2023-03-12 14:51:38', '2023-03-12 14:51:38'),
(127, 17, 3, 1, '2023-03-12', '2023-03-12 14:53:17', '2023-03-12 14:53:17');

-- --------------------------------------------------------

--
-- Structure de la table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `hall` int(11) NOT NULL,
  `is_booked` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seats`
--

INSERT INTO `seats` (`id`, `hall`, `is_booked`) VALUES
(1, 1, '0'),
(2, 1, '0'),
(3, 1, '2023-03-12'),
(4, 1, '2023-03-07'),
(5, 1, '2023-03-09'),
(6, 1, '2023-03-06'),
(7, 1, '2023-03-09'),
(8, 1, '0'),
(9, 1, '0'),
(10, 1, '0'),
(11, 1, '0'),
(12, 1, '0'),
(13, 1, '0'),
(14, 1, '0'),
(15, 1, '0'),
(16, 1, '0'),
(17, 1, '0'),
(18, 1, '0'),
(19, 1, '0'),
(20, 1, '0'),
(21, 2, '2023-03-10'),
(22, 2, '0'),
(23, 2, '2023-03-10'),
(24, 2, '0'),
(25, 2, '2023-03-13'),
(26, 2, '0'),
(27, 2, '2023-03-10'),
(28, 2, '0'),
(29, 2, '0'),
(30, 2, '2023-03-13'),
(31, 2, '0'),
(32, 2, '0'),
(33, 2, '0'),
(34, 2, '0'),
(35, 2, '0'),
(36, 2, '2023-03-10'),
(37, 2, '0'),
(38, 2, '0'),
(39, 2, '0'),
(40, 2, '0'),
(41, 3, '0'),
(42, 3, '0'),
(43, 3, '0'),
(44, 3, '0'),
(45, 3, '0'),
(46, 3, '0'),
(47, 3, '0'),
(48, 3, '0'),
(49, 3, '0'),
(50, 3, '0'),
(51, 3, '0'),
(52, 3, '0'),
(53, 3, '0'),
(54, 3, '0'),
(55, 3, '0'),
(56, 3, '2023-03-10'),
(57, 3, '0'),
(58, 3, '0'),
(59, 3, '0'),
(60, 3, '0'),
(61, 4, '0'),
(62, 4, '0'),
(63, 4, '0'),
(64, 4, '0'),
(65, 4, '0'),
(66, 4, '0'),
(67, 4, '0'),
(68, 4, '0'),
(69, 4, '0'),
(70, 4, '0'),
(71, 4, '0'),
(72, 4, '0'),
(73, 4, '0'),
(74, 4, '0'),
(75, 4, '0'),
(76, 4, '0'),
(77, 4, '0'),
(78, 4, '0'),
(79, 4, '0'),
(80, 4, '0');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `identifier`, `full_name`, `email`, `password`, `image`, `role`) VALUES
(1, 'eec47fc02ccbda3f1bca255e6be99efc', 'Fadwa Qarchi', 'fadwa@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', 'assets/images/profilee.jpg', 'client'),
(17, 'd1bb226b9e4391c9df2b6d1684d732ff', 'alae ElOula', 'alaa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', 'client'),
(18, '93e0a8301dc7eef3739317696b29dd52', 'admin d', 'admin@gmail.com', '1a1dc91c907325c69271ddf0c944bc72', '', 'admin'),
(19, '5346867b44152cffdcb2e1d0eb1f30ed', 'asiyya elbouhali', 'asiyya@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', 'client'),
(20, '45ec02df009851a25964ae3c5665e291', 'yousef', 'test@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'client'),
(21, '732fcd1fa62aa9d955a3165159494150', 'abdo', 'admin@gmail.com', 'c92b51b2f4d93d4e1081670bd9273402', '', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movie` (`movie`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `costumer` (`costumer`),
  ADD KEY `hall` (`hall`);

--
-- Index pour la table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hall` (`hall`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `halls`
--
ALTER TABLE `halls`
  ADD CONSTRAINT `halls_ibfk_1` FOREIGN KEY (`movie`) REFERENCES `movies` (`id`);

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`costumer`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`hall`) REFERENCES `halls` (`id`);

--
-- Contraintes pour la table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`hall`) REFERENCES `halls` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
