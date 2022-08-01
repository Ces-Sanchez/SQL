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
  `Código_Departamento` INT NOT NULL,
  PRIMARY KEY (`Código`),
  CONSTRAINT `fk_Empleado_Departamento`
    FOREIGN KEY (`Código_Departamento`)
    REFERENCES `Empleados`.`Departamento` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Empleados`.`Departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `Empleados`;
INSERT INTO `Empleados`.`Departamento` (`Código`, `Nombre`, `Presupuesto`, `Gastos`) VALUES (DEFAULT, 'Pentesting', 10000, 2000);
INSERT INTO `Empleados`.`Departamento` (`Código`, `Nombre`, `Presupuesto`, `Gastos`) VALUES (DEFAULT, '0Day', 2000, 1200);
INSERT INTO `Empleados`.`Departamento` (`Código`, `Nombre`, `Presupuesto`, `Gastos`) VALUES (DEFAULT, 'BlueTeam', 30000, 4500);
INSERT INTO `Empleados`.`Departamento` (`Código`, `Nombre`, `Presupuesto`, `Gastos`) VALUES (DEFAULT, 'RedTeam', 4000, 200);
INSERT INTO `Empleados`.`Departamento` (`Código`, `Nombre`, `Presupuesto`, `Gastos`) VALUES (DEFAULT, 'BootCamps', 15000, 14500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Empleados`.`Empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `Empleados`;
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '11111111A', 'Francisco', 'Sánchez', 'Martínez', 2);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '22222222B', 'Sergio', 'López', 'Sánhez', 3);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '33333333C', 'Mario', 'Fernández', 'López', 1);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '44444444D', 'Carlos', 'Gutiérrez', 'Martínez', 2);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '55555555E', 'Rafael', 'Fuentes', 'Pulido', 4);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '66666666F', 'Xwn', 'Fortúnez', 'Rodríguez', 5);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '77777777G', 'Azahara', 'Martínez', 'Ródenas', 2);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '88888888H', 'Manuel', 'Benítez', 'Sánchez', 1);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '99999999I', 'Lara', 'López', 'Vélez', 3);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '00000000J', 'María', 'Sánchez', 'Martínez', 2);

COMMIT;

