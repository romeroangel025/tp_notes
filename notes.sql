-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema tp_notas
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `create_date` DATE NULL,
  `modify_date` DATE NULL,
  `description` TEXT NULL,
  `delete` TINYINT NULL,
  `id_category` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notes_categories` (
  `id` INT NOT NULL,
  `id_notes` INT NOT NULL,
  `id_categories` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_categories_idx` (`id_notes` ASC) VISIBLE,
  INDEX `fk_catagories_notes_idx` (`id_categories` ASC) VISIBLE,
  CONSTRAINT `fk_notes_categories`
    FOREIGN KEY (`id_notes`)
    REFERENCES `mydb`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catagories_notes`
    FOREIGN KEY (`id_categories`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`notes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notes_categories` (
  `id` INT NOT NULL,
  `id_notes` INT NOT NULL,
  `id_categories` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_categories_idx` (`id_notes` ASC) VISIBLE,
  INDEX `fk_catagories_notes_idx` (`id_categories` ASC) VISIBLE,
  CONSTRAINT `fk_notes_categories`
    FOREIGN KEY (`id_notes`)
    REFERENCES `mydb`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catagories_notes`
    FOREIGN KEY (`id_categories`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
