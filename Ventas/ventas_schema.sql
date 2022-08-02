-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema VENTAS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `VENTAS` ;

-- -----------------------------------------------------
-- Schema VENTAS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VENTAS` DEFAULT CHARACTER SET utf8 ;
USE `VENTAS` ;

-- -----------------------------------------------------
-- Table `VENTAS`.`COMERCIAL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VENTAS`.`COMERCIAL` ;

CREATE TABLE IF NOT EXISTS `VENTAS`.`COMERCIAL` (
  `id` INT(10) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido1` VARCHAR(100) NOT NULL,
  `Apellido2` VARCHAR(100) NULL,
  `Ciudad` VARCHAR(100) NULL,
  `Comisión` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VENTAS`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VENTAS`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `VENTAS`.`CLIENTE` (
  `id` INT(10) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido1` VARCHAR(100) NOT NULL,
  `Apellido2` VARCHAR(100) NULL,
  `Ciudad` VARCHAR(100) NULL,
  `Categoria` INT(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VENTAS`.`PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VENTAS`.`PEDIDO` ;

CREATE TABLE IF NOT EXISTS `VENTAS`.`PEDIDO` (
  `id` INT(10) NOT NULL,
  `Cantidad` DOUBLE NOT NULL,
  `Fecha` DATE NULL,
  `id_cliente` INT(10) NOT NULL,
  `id_comercial` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_PEDIDO_COMERCIAL`
    FOREIGN KEY (`id_comercial`)
    REFERENCES `VENTAS`.`COMERCIAL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_CLIENTE1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `VENTAS`.`CLIENTE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
