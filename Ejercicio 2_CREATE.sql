-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Dineros
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Dineros` ;

-- -----------------------------------------------------
-- Schema Dineros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Dineros` DEFAULT CHARACTER SET utf8 ;
USE `Dineros` ;

-- -----------------------------------------------------
-- Table `Dineros`.`Banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dineros`.`Banco` (
  `idBanco` INT NOT NULL AUTO_INCREMENT,
  `Noimbre` VARCHAR(45) NULL,
  PRIMARY KEY (`idBanco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dineros`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dineros`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dineros`.`Cuenta_Corriente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dineros`.`Cuenta_Corriente` (
  `Banco_idBanco` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `IBAN` VARCHAR(45) NOT NULL,
  `Saldo` INT NULL,
  PRIMARY KEY (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`),
  CONSTRAINT `fk_Banco_has_Usuario_Banco1`
    FOREIGN KEY (`Banco_idBanco`)
    REFERENCES `Dineros`.`Banco` (`idBanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Banco_has_Usuario_Usuario1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Dineros`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dineros`.`Transacción`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dineros`.`Transacción` (
  `idTransacción` INT NOT NULL AUTO_INCREMENT,
  `Fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IBAN_Destino` VARCHAR(45) NULL,
  `Importe` DECIMAL(9,2) NULL,
  `Cuenta_Corriente_Banco_idBanco` INT NOT NULL,
  `Cuenta_Corriente_Cliente_idCliente` INT NOT NULL,
  `Cuenta_Corriente_IBAN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTransacción`),
  CONSTRAINT `fk_Movimiento_Cuenta_Corriente1`
    FOREIGN KEY (`Cuenta_Corriente_Banco_idBanco` , `Cuenta_Corriente_Cliente_idCliente` , `Cuenta_Corriente_IBAN`)
    REFERENCES `Dineros`.`Cuenta_Corriente` (`Banco_idBanco` , `Cliente_idCliente` , `IBAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

