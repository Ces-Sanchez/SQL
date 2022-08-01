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