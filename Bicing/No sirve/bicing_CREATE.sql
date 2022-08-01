-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
-- Table `bicing`.`estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`estacion` (
  `id_estacion` INT(11) NOT NULL  auto_increment,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `numero_plazas` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`bicicleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`bicicleta` (
  `id_bici` INT(11) NOT NULL auto_increment,
  `estado_bici` TINYINT(4) NULL DEFAULT NULL,
  `tipo_bici` TINYINT(4) NULL DEFAULT NULL,
  `fecha_de_alta` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alquilada_o_libre` TINYINT(4) NULL DEFAULT NULL,
  `reservada_o_no` TINYINT(4) NULL DEFAULT NULL,
  `en_movimiento` TINYINT(4) NULL DEFAULT 0,
  `estacion_id_estacion` INT(11) NOT NULL,
  PRIMARY KEY (`id_bici`, `estacion_id_estacion`),
  CONSTRAINT `fk_bicicleta_estacion`
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
  `id_tarifa` INT(11) NOT NULL auto_increment,
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
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_de_alta` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `dni` VARCHAR(45) NULL DEFAULT NULL,
  `corriente_de_pago` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bicing`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bicing`.`servicio` (
  `usuario_idusuario` INT(11) NOT NULL,
  `bicicleta_id_bici` INT(11) NOT NULL,
  `tarifa_id_tarifa` INT(11) NOT NULL DEFAULT 1,
  `tiempo_inicio` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tiempo_devolucion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `servicio_finalizado` TINYINT(4) NULL DEFAULT 0,
  PRIMARY KEY (`usuario_idusuario`, `bicicleta_id_bici`, `tarifa_id_tarifa`,`tiempo_inicio`,`tiempo_devolucion`, `servicio_finalizado`),
  CONSTRAINT `fk_factura_tarifa1`
    FOREIGN KEY (`tarifa_id_tarifa`)
    REFERENCES `bicing`.`tarifa` (`id_tarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_bicicleta_bicicleta1`
    FOREIGN KEY (`bicicleta_id_bici`)
    REFERENCES `bicing`.`bicicleta` (`id_bici`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_bicicleta_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `bicing`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
