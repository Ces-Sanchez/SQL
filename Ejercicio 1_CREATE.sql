-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Botiga
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Botiga` ;

-- -----------------------------------------------------
-- Schema Botiga
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Botiga` DEFAULT CHARACTER SET utf8 ;
USE `Botiga` ;

-- -----------------------------------------------------
-- Table `Botiga`.`Fabricants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Botiga`.`Fabricants` (
  `Id_fabricant` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NULL,
  PRIMARY KEY (`Id_fabricant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Botiga`.`Artículos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Botiga`.`Artículos` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NULL,
  `Preu` INT NULL,
  `Id_fabricant` INT NOT NULL,
  PRIMARY KEY (`id_article`),
  CONSTRAINT `fk_Artículos_Fabricants`
    FOREIGN KEY (`Id_fabricant`)
    REFERENCES `Botiga`.`Fabricants` (`Id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;