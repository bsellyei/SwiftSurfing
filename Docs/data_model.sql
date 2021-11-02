CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `couches` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `owner_id` int,
  `name` varchar(255),
  `address` varchar(255),
  `city` varchar(255),
  `country` varchar(255),
  `latitude` double,
  `longitude` double,
  `max_guests` int,
  `description` varchar(255),
  `image_url` varchar(255),
  `tags` varchar(255),
  `ratingsAverage` int,
  `ratingsCount` int
);

CREATE TABLE `ratings` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `couch_id` int,
  `value` int,
  `comment` varchar(255),
  `user_id` int
);

CREATE TABLE `reservations` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `couch_id` int,
  `guest_id` int,
  `owner_id` int,
  `guests_number` int,
  `fromDate` datetime,
  `toDate` datetime
);

CREATE TABLE `conversations` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `last_message` int,
  `from_id` int,
  `to_id` int
);

CREATE TABLE `messages` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `conversations_id` int,
  `sender` int,
  `when` datetime,
  `message` varchar(255)
);

ALTER TABLE `couches` ADD FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

ALTER TABLE `ratings` ADD FOREIGN KEY (`couch_id`) REFERENCES `couches` (`id`);

ALTER TABLE `ratings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`couch_id`) REFERENCES `couches` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`guest_id`) REFERENCES `users` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

ALTER TABLE `conversations` ADD FOREIGN KEY (`last_message`) REFERENCES `messages` (`id`);

ALTER TABLE `conversations` ADD FOREIGN KEY (`from_id`) REFERENCES `users` (`id`);

ALTER TABLE `conversations` ADD FOREIGN KEY (`to_id`) REFERENCES `users` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`conversations_id`) REFERENCES `conversations` (`id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`sender`) REFERENCES `users` (`id`);
