-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Botiga
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Botiga` ;

-- -----------------------------------------------------
-- Schema Botiga
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Botiga` DEFAULT CHARACTER SET utf8 ;
USE `Botiga` ;

-- -----------------------------------------------------
-- Table `Botiga`.`Fabricants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Botiga`.`Fabricants` (
  `Id_fabricant` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NULL,
  PRIMARY KEY (`Id_fabricant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Botiga`.`Artículos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Botiga`.`Artículos` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NULL,
  `Preu` INT NULL,
  `Id_fabricant` INT NOT NULL,
  PRIMARY KEY (`id_article`),
  CONSTRAINT `fk_Artículos_Fabricants`
    FOREIGN KEY (`Id_fabricant`)
    REFERENCES `Botiga`.`Fabricants` (`Id_fabricant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Botiga`.`Fabricants`
-- -----------------------------------------------------
START TRANSACTION;
USE `Botiga`;
INSERT INTO `Botiga`.`Fabricants` (`Id_fabricant`, `Nom`) VALUES (DEFAULT, 'Kingston');
INSERT INTO `Botiga`.`Fabricants` (`Id_fabricant`, `Nom`) VALUES (DEFAULT, 'HP');
INSERT INTO `Botiga`.`Fabricants` (`Id_fabricant`, `Nom`) VALUES (DEFAULT, 'Logitech');
INSERT INTO `Botiga`.`Fabricants` (`Id_fabricant`, `Nom`) VALUES (DEFAULT, 'Nvidia');
INSERT INTO `Botiga`.`Fabricants` (`Id_fabricant`, `Nom`) VALUES (DEFAULT, 'Seagate');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Botiga`.`Artículos`
-- -----------------------------------------------------
START TRANSACTION;
USE `Botiga`;
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Teclat', 20, 3);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Disc Dur 3TB', 200, 5);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Mouse', 15, 3);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Altaveu', 50, 3);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Memoria RAM', 180, 1);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Disc Extern 2TB', 150, 2);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Pendrive', 35, 1);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Targeta de Xarxa', 40, 5);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Targeta de Vídeo', 180, 4);
INSERT INTO `Botiga`.`Artículos` (`id_article`, `Nom`, `Preu`, `Id_fabricant`) VALUES (DEFAULT, 'Pantalla 21\'\'', 230, 2);

COMMIT;

