-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `login` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`theme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `text` VARCHAR(200) NULL,
  `creation_date` DATETIME NOT NULL,
  `creator_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `creator_id`),
  INDEX `fk_theme_user_idx` (`creator_id` ASC) VISIBLE,
  CONSTRAINT `fk_theme_user`
    FOREIGN KEY (`creator_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(200) NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `theme_id` INT NOT NULL,
  `creator_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `theme_id`, `creator_id`),
  INDEX `fk_messages_theme1_idx` (`theme_id` ASC) VISIBLE,
  INDEX `fk_messages_user1_idx` (`creator_id` ASC) VISIBLE,
  CONSTRAINT `fk_messages_theme1`
    FOREIGN KEY (`theme_id`)
    REFERENCES `mydb`.`theme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_user1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`logs` (
  `id` INT NOT NULL,
  `user_id` INT UNSIGNED NULL,
  `theme_id` INT NULL,
  `messages_id` INT NULL,
  `actions_id` INT NULL,
  `time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_logs_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_logs_theme1_idx` (`theme_id` ASC) VISIBLE,
  INDEX `fk_logs_messages1_idx` (`messages_id` ASC) VISIBLE,
  INDEX `fk_logs_actions1_idx` (`actions_id` ASC) VISIBLE,
  CONSTRAINT `fk_logs_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_theme1`
    FOREIGN KEY (`theme_id`)
    REFERENCES `mydb`.`theme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_messages1`
    FOREIGN KEY (`messages_id`)
    REFERENCES `mydb`.`messages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logs_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `mydb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;