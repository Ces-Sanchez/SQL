SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `La tienda Informática`.`Fabricantes`
-- -----------------------------------------------------
START TRANSACTION;
USE `La tienda Informática`;
INSERT INTO `La tienda Informática`.`Fabricantes` (`Código`, `Nombre`) VALUES (DEFAULT, 'HP');
INSERT INTO `La tienda Informática`.`Fabricantes` (`Código`, `Nombre`) VALUES (DEFAULT, 'Seagate');
INSERT INTO `La tienda Informática`.`Fabricantes` (`Código`, `Nombre`) VALUES (DEFAULT, 'Nvidia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `La tienda Informática`.`Artículos`
-- -----------------------------------------------------
START TRANSACTION;
USE `La tienda Informática`;
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Impresora', 50, 1);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Disco Duro', 30, 2);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Tarjeta Gráfica', 45, 2);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Tarjeta de Sonido', 200, 3);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Portátil', 15, 1);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Tablet', 60, 3);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'SSD', 25, 2);
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Pantalla', 70, 3);

COMMIT;