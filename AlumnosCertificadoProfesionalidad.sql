-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ifcd0112
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ifcd0112` ;

-- -----------------------------------------------------
-- Schema ifcd0112
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ifcd0112` DEFAULT CHARACTER SET utf8 ;
USE `ifcd0112` ;

-- -----------------------------------------------------
-- Table `ifcd0112`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ifcd0112`.`alumnos` (
  `DNI_Alumnos` VARCHAR(20) NOT NULL,
  `Nombre_Alumnos` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI_Alumnos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifcd0112`.`Módulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ifcd0112`.`Módulos` (
  `Código_Módulos` VARCHAR(8) NOT NULL,
  `Descripción_Módulos` VARCHAR(100) NULL DEFAULT NULL,
  `Transversal` TINYINT NULL,
  PRIMARY KEY (`Código_Módulos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifcd0112`.`UFs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ifcd0112`.`UFs` (
  `Código_UF` VARCHAR(20) NOT NULL,
  `Descripción_UF` VARCHAR(100) NULL DEFAULT NULL,
  `NúmeroHoras_UF` INT(11) NULL DEFAULT NULL,
  `Módulos_Código_UF` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Código_UF`),
   CONSTRAINT `fk_Asignaturas_Módulos1`
    FOREIGN KEY (`Módulos_Código_UF`)
    REFERENCES `ifcd0112`.`Módulos` (`Código_Módulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifcd0112`.`Notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ifcd0112`.`Notas` (
  `Alumnos_DNI_Alumnos` VARCHAR(20) NOT NULL,
  `Asignaturas_Código_Asignaturas` VARCHAR(20) NOT NULL,
  `Nota_Alumnos_has_Asignaturas` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`),
  CONSTRAINT `fk_Alumnos_has_Asignaturas_Alumnos`
    FOREIGN KEY (`Alumnos_DNI_Alumnos`)
    REFERENCES `ifcd0112`.`alumnos` (`DNI_Alumnos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_has_Asignaturas_Asignaturas1`
    FOREIGN KEY (`Asignaturas_Código_Asignaturas`)
    REFERENCES `ifcd0112`.`UFs` (`Código_UF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ifcd0112`.`alumnos`
-- -----------------------------------------------------
START TRANSACTION;
USE `ifcd0112`;
INSERT INTO `ifcd0112`.`alumnos` (`DNI_Alumnos`, `Nombre_Alumnos`) VALUES ('11111111A', 'Mario');
INSERT INTO `ifcd0112`.`alumnos` (`DNI_Alumnos`, `Nombre_Alumnos`) VALUES ('22222222B', 'María');
INSERT INTO `ifcd0112`.`alumnos` (`DNI_Alumnos`, `Nombre_Alumnos`) VALUES ('33333333C', 'Sergio');
INSERT INTO `ifcd0112`.`alumnos` (`DNI_Alumnos`, `Nombre_Alumnos`) VALUES ('44444444D', 'Laura');
INSERT INTO `ifcd0112`.`alumnos` (`DNI_Alumnos`, `Nombre_Alumnos`) VALUES ('55555555E', 'José');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ifcd0112`.`Módulos`
-- -----------------------------------------------------
START TRANSACTION;
USE `ifcd0112`;
INSERT INTO `ifcd0112`.`Módulos` (`Código_Módulos`, `Descripción_Módulos`, `Transversal`) VALUES ('MF0223_3', 'Sistemas operativos y aplicaciones informáticas', 1);
INSERT INTO `ifcd0112`.`Módulos` (`Código_Módulos`, `Descripción_Módulos`, `Transversal`) VALUES ('MF0226_3', 'Programación de bases de datos relacionales', 1);
INSERT INTO `ifcd0112`.`Módulos` (`Código_Módulos`, `Descripción_Módulos`, `Transversal`) VALUES ('MF0227_3', 'Programación orientada a objetos', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ifcd0112`.`UFs`
-- -----------------------------------------------------
START TRANSACTION;
USE `ifcd0112`;
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF1465', 'Computadores para bases de datos', 60, 'MF0223_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF1466', 'Sistemas de almacenamiento', 70, 'MF0223_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF1467', 'Aplicaciones microinformáticas e Internet para consulta y generación de documentación', 40, 'MF0223_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2175', 'Diseño de bases de datos relacionales', 50, 'MF0226_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2176', 'Definición y manipulación de datos', 80, 'MF0226_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2177', 'Desarrollo de programas en el entorno de la base de datos', 80, 'MF0226_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2404', 'Principios de la programación orientada a objetos', 90, 'MF0227_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2405', 'Modelo de programación web y bases de datos', 80, 'MF0227_3');
INSERT INTO `ifcd0112`.`UFs` (`Código_UF`, `Descripción_UF`, `NúmeroHoras_UF`, `Módulos_Código_UF`) VALUES ('UF2406', 'El ciclo de vida de desarrollo de aplicaciones', 80, 'MF0227_3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ifcd0112`.`Notas`
-- -----------------------------------------------------
START TRANSACTION;
USE `ifcd0112`;
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF1465', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF1466', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF1467', 4);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2175', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2176', 5);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2177', 9);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2404', 3);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2405', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('11111111A', 'UF2406', 4);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF1465', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF1466', 3);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF1467', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2175', 4);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2176', 2);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2177', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2404', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2405', 2);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('22222222B', 'UF2406', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF1465', 4);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF1466', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF1467', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2175', 5);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2176', 3);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2177', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2404', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2405', 3);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('33333333C', 'UF2406', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF1465', 5);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF1466', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF1467', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2175', 3);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2176', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2177', 4);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2404', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2405', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('44444444D', 'UF2406', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF1465', 5);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF1466', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF1467', 10);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2175', 7);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2176', 8);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2177', 10);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2404', 6);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2405', 10);
INSERT INTO `ifcd0112`.`Notas` (`Alumnos_DNI_Alumnos`, `Asignaturas_Código_Asignaturas`, `Nota_Alumnos_has_Asignaturas`) VALUES ('55555555E', 'UF2406', 9);

COMMIT;

