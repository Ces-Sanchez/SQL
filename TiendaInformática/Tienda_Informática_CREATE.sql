-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema La tienda Informática
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `La tienda Informática` ;

-- -----------------------------------------------------
-- Schema La tienda Informática
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `La tienda Informática` DEFAULT CHARACTER SET utf8 ;
USE `La tienda Informática` ;

-- -----------------------------------------------------
-- Table `La tienda Informática`.`Fabricantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `La tienda Informática`.`Fabricantes` (
  `Código` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `La tienda Informática`.`Artículos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `La tienda Informática`.`Artículos` (
  `Código` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  `Precio` INT NULL,
  `Fabricante` INT NOT NULL,
  PRIMARY KEY (`Código`),
  CONSTRAINT `fk_Artículos_Fabricantes`
    FOREIGN KEY (`Fabricante`)
    REFERENCES `La tienda Informática`.`Fabricantes` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;