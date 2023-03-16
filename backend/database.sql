-- MySQL Script generated by MySQL Workbench
-- Wed Mar 15 17:12:21 2023
-- Model: New Model    Version: 1.0
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


LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,'Wiko','View 4 (v830)',6.52,'4G',10,92411,3,64,'https://www.indicereparabilite.fr/wp-content/uploads/2021/01/Wiko-View-4.png'),(2,'Samsung','GALAXY S10',6.1,'4G',9,415000,8,128,'https://www.indicereparabilite.fr/wp-content/uploads/2021/02/4-a-59-12.png'),(3,'Huawei',' P20 Lite',5.84,'4G',8,74399,4,64,'https://www.indicereparabilite.fr/wp-content/uploads/2021/06/4-a-59-12.png'),(4,'XiamiI','MI 10',6.67,'5G',10,571288,8,256,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-56.png'),(5,'Nokia','7.2',6.3,'4G',9,148113,6,128,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-47.png'),(6,'Honor','9X Midnight Black',6.59,'4G',9,136599,4,128,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-46.png'),(7,'Oppo','A72',6.5,'4G',10,150413,4,128,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-39.png'),(8,'One plus','Nord n100',6.52,'4G',10,142188,4,64,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-35.png'),(9,'Huawei','Mate 30 pro',6.53,'5G',10,508699,8,256,'https://www.indicereparabilite.fr/wp-content/uploads/2021/06/4-a-59-10.png'),(10,'Wiko','Y61',6,'4G',10,50000,1,16,'https://www.indicereparabilite.fr/wp-content/uploads/2021/08/6-a-79-42.png');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;


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
