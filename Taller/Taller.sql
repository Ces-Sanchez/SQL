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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Taller`.`Pieza`
-- -----------------------------------------------------
START TRANSACTION;
USE `Taller`;
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (10, 'Tornillo TRL');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (11, 'Motor MLT');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (12, 'Rueda IZQ');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (13, 'Tuerca TRC');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (14, 'Rueda DRC');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (DEFAULT, '');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (DEFAULT, '');
INSERT INTO `Taller`.`Pieza` (`Código`, `Nombre`) VALUES (DEFAULT, '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Taller`.`Proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Taller`;
INSERT INTO `Taller`.`Proveedor` (`identificador`, `Nombre`) VALUES ('A2TH ', 'Tus piezas al momento, S.L');
INSERT INTO `Taller`.`Proveedor` (`identificador`, `Nombre`) VALUES ('SHG4 ', 'Recambios y piezas, S.L');
INSERT INTO `Taller`.`Proveedor` (`identificador`, `Nombre`) VALUES ('KFI3 ', 'Gran proveedor de piezas, S.A');
INSERT INTO `Taller`.`Proveedor` (`identificador`, `Nombre`) VALUES ('DG34', 'Las piezas de la calle 34, S.L');
INSERT INTO `Taller`.`Proveedor` (`identificador`, `Nombre`) VALUES ('TGLR ', 'Super piezas, SCP.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Taller`.`Compra`
-- -----------------------------------------------------
START TRANSACTION;
USE `Taller`;
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (10, 'A2TH', 1.25);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (11, 'KFI3', 124.50);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (12, 'SHG4', 46.78);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (13, 'TGLR', 2.34);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (14, 'KFI3', 44.34);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (10, 'SHG4', 1.09);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (11, 'SHG4', 129.69);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (13, 'DG34', 2.28);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (10, 'DG34', 1.19);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (12, 'KFI3', 46.80);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (14, 'TGLR', 45.59);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (11, 'TGLR', 127.34);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (11, 'A2TH', 131.50);
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (12, 'TGLR', 49.90);

COMMIT;

