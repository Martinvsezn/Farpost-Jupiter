create database log_db;
use log_db;

CREATE TABLE IF NOT EXISTS `log_db`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `login` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

LOAD DATA INFILE '/var/lib/mysql-files/user_data.csv' INTO TABLE user
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;

CREATE TABLE IF NOT EXISTS `log_db`.`theme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(2000) NULL,
  `creation_date` DATETIME NOT NULL,
  `creator_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `creator_id`),
  INDEX `fk_theme_user_idx` (`creator_id` ASC) VISIBLE);

LOAD DATA INFILE '/var/lib/mysql-files/theme_data.csv' INTO TABLE theme
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;

CREATE TABLE IF NOT EXISTS `log_db`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(2000) NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `theme_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`id`, `theme_id`, `creator_id`),
  INDEX `fk_messages_theme1_idx` (`theme_id` ASC) VISIBLE,
  INDEX `fk_messages_user1_idx` (`creator_id` ASC) VISIBLE);

LOAD DATA INFILE '/var/lib/mysql-files/messages_data.csv' INTO TABLE messages
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;

CREATE TABLE IF NOT EXISTS `log_db`.`logs` (
  `id` INT NOT NULL,
  `user_id` INT UNSIGNED NULL,
  `action` VARCHAR(150) NULL,
  `time` DATETIME NOT NULL,
  `response` VARCHAR(150) NULL,
  `anonym` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_logs_user1_idx` (`user_id` ASC) VISIBLE);

LOAD DATA INFILE '/var/lib/mysql-files/logs_data.csv' INTO TABLE logs
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;