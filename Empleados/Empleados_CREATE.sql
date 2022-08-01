-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Empleados
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Empleados` ;

-- -----------------------------------------------------
-- Schema Empleados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Empleados` DEFAULT CHARACTER SET utf8 ;
USE `Empleados` ;

-- -----------------------------------------------------
-- Table `Empleados`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empleados`.`Departamento` (
  `Código` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NULL,
  `Presupuesto` DOUBLE NULL,
  `Gastos` DOUBLE NULL,
  PRIMARY KEY (`Código`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Empleados`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Empleados`.`Empleado` (
  `Código` INT NOT NULL AUTO_INCREMENT,
  `NIF` VARCHAR(9) NULL,
  `Nombre` VARCHAR(100) NULL,
  `Apellido1` VARCHAR(100) NULL,
  `Apellido2` VARCHAR(100) NULL,
  `Código_Departamento` INT,
  PRIMARY KEY (`Código`),
  CONSTRAINT `fk_Empleado_Departamento`
    FOREIGN KEY (`Código_Departamento`)
    REFERENCES `Empleados`.`Departamento` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;