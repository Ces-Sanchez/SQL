-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Taller
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Taller` ;

-- -----------------------------------------------------
-- Schema Taller
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Taller` DEFAULT CHARACTER SET utf8 ;
USE `Taller` ;

-- -----------------------------------------------------
-- Table `Taller`.`Pieza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Taller`.`Pieza` (
  `Código` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Taller`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Taller`.`Proveedor` (
  `identificador` CHAR(4) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`identificador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Taller`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Taller`.`Compra` (
  `Código_pieza` INT NOT NULL,
  `Identificador_proveedor` CHAR(4) NOT NULL,
  `Precio` DECIMAL(5,2) NULL,
  PRIMARY KEY (`Código_pieza`, `Identificador_proveedor`),
  CONSTRAINT `fk_table1_has_table1_copy1_table1`
    FOREIGN KEY (`Código_pieza`)
    REFERENCES `Taller`.`Pieza` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_has_table1_copy1_table1_copy11`
    FOREIGN KEY (`Identificador_proveedor`)
    REFERENCES `Taller`.`Proveedor` (`identificador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;