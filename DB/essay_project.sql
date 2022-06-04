-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema essay_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema essay_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `essay_project` DEFAULT CHARACTER SET utf8 ;
USE `essay_project` ;

-- -----------------------------------------------------
-- Table `essay_project`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `essay_project`.`user` (
  `id` VARCHAR(20) NOT NULL,
  `pw` VARCHAR(64) NOT NULL,
  `nickname` VARCHAR(20) NOT NULL,
  `age` INT NOT NULL,
  `school` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `essay_project`.`follow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `essay_project`.`follow` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `target_id` VARCHAR(20) NOT NULL,
  `following_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `essay_project`.`essay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `essay_project`.`essay` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `company` VARCHAR(20) NOT NULL,
  `dept` VARCHAR(20) NOT NULL,
  `question` VARCHAR(100) NOT NULL,
  `content` VARCHAR(3000) NOT NULL,
  `recommend` INT NOT NULL DEFAULT 0,
  `open` INT NOT NULL DEFAULT 0,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_essay_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_essay_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `essay_project`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
