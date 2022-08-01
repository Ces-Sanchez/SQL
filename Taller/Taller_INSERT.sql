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

