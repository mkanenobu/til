CREATE TABLE `cities` (
	`id` varchar(255) PRIMARY KEY NOT NULL,
	`name` text NOT NULL
);

CREATE TABLE `users` (
	`id` varchar(255) PRIMARY KEY NOT NULL,
	`email` varchar(255) NOT NULL,
	`city_id` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT (now()),
	`updated_at` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `users` ADD CONSTRAINT `users_city_id_cities_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`);