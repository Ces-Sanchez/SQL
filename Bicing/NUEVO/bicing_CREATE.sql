-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bicing
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bicing` ;

-- -----------------------------------------------------
-- Schema bicing
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bicing` DEFAULT CHARACTER SET utf8 ;
USE `bicing` ;

-- -----------------------------------------------------
-- Table `bicing`.`bicicleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`bicicleta` (
  `id_bicicleta` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_de_alta` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado_bicicleta` ENUM('funcionando', 'averiada') NULL DEFAULT NULL,
  `tipo_bicicleta` ENUM('mecánica', 'eléctrica') NULL DEFAULT NULL,
  `reservada_o_disponible` ENUM('reservada', 'disponible') NULL DEFAULT NULL,
  PRIMARY KEY (`id_bicicleta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`estacion` (
  `id_estacion` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `numero_plazas` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`bicicleta_has_estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`bicicleta_has_estacion` (
  `bicicleta_id_bicicleta` INT(11) NOT NULL,
  `estacion_id_estacion` INT(11) NOT NULL,
  PRIMARY KEY (`bicicleta_id_bicicleta`),
  CONSTRAINT `fk_bicicleta_has_estacion_bicicleta1`
    FOREIGN KEY (`bicicleta_id_bicicleta`)
    REFERENCES `bicing`.`bicicleta` (`id_bicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bicicleta_has_estacion_estacion1`
    FOREIGN KEY (`estacion_id_estacion`)
    REFERENCES `bicing`.`estacion` (`id_estacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`tarifa` (
  `id_tarifa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_tarifa` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `importe` DECIMAL(4,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tarifa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_de_alta` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `dni` VARCHAR(45) NULL DEFAULT NULL,
  `corriente_de_pago` ENUM('sí', 'no') NULL DEFAULT NULL,
  `usuario_id_tarifa` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuario`, `usuario_id_tarifa`),
  CONSTRAINT `fk_usuario_id_tarifa`
    FOREIGN KEY (`usuario_id_tarifa`)
    REFERENCES `bicing`.`tarifa` (`id_tarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`servicio` (
  `servicio_id_usuario` INT(11) NOT NULL,
  `servicio_id_bicicleta` INT(11) NOT NULL,
  `tiempo_inicio` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `tiempo_devolucion` TIMESTAMP NOT NULL DEFAULT '1971-01-01 00:00:01' ON UPDATE CURRENT_TIMESTAMP(),
  `servicio_finalizado` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`servicio_id_usuario`, `servicio_id_bicicleta`, `tiempo_inicio`, `tiempo_devolucion`, `servicio_finalizado`),
  CONSTRAINT `fk_usuario_has_bicicleta_bicicleta`
    FOREIGN KEY (`servicio_id_bicicleta`)
    REFERENCES `bicing`.`bicicleta` (`id_bicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_bicicleta_usuario`
    FOREIGN KEY (`servicio_id_usuario`)
    REFERENCES `bicing`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`Incidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`Incidencias` (
  `idIncidencias` INT NOT NULL AUTO_INCREMENT,
  `bicicleta_id_bicicleta` INT(11) NOT NULL,
  `Fecha_entrada` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `Fecha salida` TIMESTAMP NOT NULL DEFAULT '1971-01-01 00:00:01' ON UPDATE CURRENT_TIMESTAMP(),
  `Descripción` VARCHAR(200) NULL,
  `Estado` ENUM ('En reparación','reparada') NULL,
  PRIMARY KEY (`idIncidencias`),
  CONSTRAINT `fk_Incidencias_bicicleta1`
    FOREIGN KEY (`bicicleta_id_bicicleta`)
    REFERENCES `bicing`.`bicicleta` (`id_bicicleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;