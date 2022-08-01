-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tienda_Online
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tienda_Online` ;

-- -----------------------------------------------------
-- Schema Tienda_Online
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tienda_Online` DEFAULT CHARACTER SET utf8 ;
USE `Tienda_Online` ;

-- -----------------------------------------------------
-- Table `Tienda_Online`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda_Online`.`Cliente` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda_Online`.`Almacén`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda_Online`.`Almacén` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda_Online`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda_Online`.`Productos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Precio` DECIMAL(5,2) NULL,
  `Almacén_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Productos_Almacén1`
    FOREIGN KEY (`Almacén_ID`)
    REFERENCES `Tienda_Online`.`Almacén` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda_Online`.`Cesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda_Online`.`Cesta` (
  `Cliente_ID` INT NOT NULL,
  `Productos_ID` INT NOT NULL,
  `Cantidad` INT(5) NULL,
  PRIMARY KEY (`Cliente_ID`, `Productos_ID`),
  CONSTRAINT `fk_Cliente_has_Productos_Cliente`
    FOREIGN KEY (`Cliente_ID`)
    REFERENCES `Tienda_Online`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Productos_Productos1`
    FOREIGN KEY (`Productos_ID`)
    REFERENCES `Tienda_Online`.`Productos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
