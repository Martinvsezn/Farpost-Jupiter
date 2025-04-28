create database log_db;
use log_db;

CREATE TABLE IF NOT EXISTS `log_db`.`logs` (
  `id` INT NOT NULL,
  `user_id` INT UNSIGNED NULL,
  `action` VARCHAR(150) NULL,
  `time` DATETIME NOT NULL,
  `response` VARCHAR(150) NULL,
  `anonym` INT NULL,
  PRIMARY KEY (`id`));

LOAD DATA INFILE '/var/lib/mysql-files/logs_data.csv' INTO TABLE logs
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;