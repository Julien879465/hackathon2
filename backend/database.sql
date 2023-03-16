-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hackathon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hackathon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hackathon` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema baby_db
-- -----------------------------------------------------
USE `hackathon` ;

-- -----------------------------------------------------
-- Table `hackathon`.`phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackathon`.`phone` (
  `idphone` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `screen_size` FLOAT NOT NULL,
  `network` ENUM('2G', '3G', '4G', '5G') NOT NULL,
  `android_system` FLOAT NULL,
  `antutu_indice` INT NOT NULL,
  `ram` INT NOT NULL,
  `storage` INT NOT NULL,
  `url` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idphone`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;





-- -----------------------------------------------------
-- Table `hackathon`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackathon`.`state` (
  `idstate` INT NOT NULL AUTO_INCREMENT,
  `name` ENUM('DEEE', 'REPARABLE', 'BLOQUE', 'RECONDITIONNABLE', 'RECONDITIONNE') NOT NULL,
  `weighting` ENUM('-100%', '-50%', '-10%', '-5%', '0%', '5%', '10%') NULL DEFAULT NULL,
  `phone_idphone` INT NOT NULL,
  PRIMARY KEY (`idstate`, `phone_idphone`),
  INDEX `fk_state_phone1_idx` (`phone_idphone` ASC) VISIBLE,
  CONSTRAINT `fk_state_phone1`
    FOREIGN KEY (`phone_idphone`)
    REFERENCES `hackathon`.`phone` (`idphone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `hackathon`.`total`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackathon`.`total` (
  `idtotal` INT NOT NULL AUTO_INCREMENT,
  `ram_value` INT NULL DEFAULT NULL,
  `storage_value` INT NULL DEFAULT NULL,
  `antutu_value` INT NULL DEFAULT NULL,
  `total` INT NULL DEFAULT NULL,
  `total_weighted` INT NULL DEFAULT NULL,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  `phone_idphone` INT NOT NULL,
  PRIMARY KEY (`idtotal`, `phone_idphone`),
  INDEX `fk_total_phone_idx` (`phone_idphone` ASC) VISIBLE,
  CONSTRAINT `fk_total_phone`
    FOREIGN KEY (`phone_idphone`)
    REFERENCES `hackathon`.`phone` (`idphone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `hackathon`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackathon`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(155) NOT NULL,
  `password` LONGTEXT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `hackathon`.`file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hackathon`.`file` (
  `idfile` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(155) NULL,
  `filename` LONGTEXT NOT NULL,
  PRIMARY KEY (`idfile`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
