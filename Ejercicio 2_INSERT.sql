SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Dineros`.`Banco`
-- -----------------------------------------------------
START TRANSACTION;
USE `Dineros`;
INSERT INTO `Dineros`.`Banco` (`idBanco`, `Noimbre`) VALUES (DEFAULT, 'ING');
INSERT INTO `Dineros`.`Banco` (`idBanco`, `Noimbre`) VALUES (DEFAULT, 'TRIODOS');
INSERT INTO `Dineros`.`Banco` (`idBanco`, `Noimbre`) VALUES (DEFAULT, 'LaCaixa');
INSERT INTO `Dineros`.`Banco` (`idBanco`, `Noimbre`) VALUES (DEFAULT, 'BBVA');
INSERT INTO `Dineros`.`Banco` (`idBanco`, `Noimbre`) VALUES (DEFAULT, 'Caja_ingenieros');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Dineros`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Dineros`;
INSERT INTO `Dineros`.`Cliente` (`idCliente`, `Nombre`) VALUES (DEFAULT, 'Carla');
INSERT INTO `Dineros`.`Cliente` (`idCliente`, `Nombre`) VALUES (DEFAULT, 'Dama');
INSERT INTO `Dineros`.`Cliente` (`idCliente`, `Nombre`) VALUES (DEFAULT, 'Marta');
INSERT INTO `Dineros`.`Cliente` (`idCliente`, `Nombre`) VALUES (DEFAULT, 'Sara');
INSERT INTO `Dineros`.`Cliente` (`idCliente`, `Nombre`) VALUES (DEFAULT, 'Ces');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Dineros`.`Cuenta_Corriente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Dineros`;
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (1, 2, 'ES547453875408264864', 20000);
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (1, 3, 'ES437638742974576352', 45000);
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (2, 5, 'ES427659273598523754', 2500);
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (4, 5, 'ES658593467345720174', 14500);
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (3, 4, 'ES672458295389201546', 12000);
INSERT INTO `Dineros`.`Cuenta_Corriente` (`Banco_idBanco`, `Cliente_idCliente`, `IBAN`, `Saldo`) VALUES (5, 1, 'ES872463096481284673', 8900);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Dineros`.`Transacción`
-- -----------------------------------------------------
START TRANSACTION;
USE `Dineros`;
INSERT INTO `Dineros`.`Transacción` (`idTransacción`, `Fecha`, `IBAN_Destino`, `Importe`, `Cuenta_Corriente_Banco_idBanco`, `Cuenta_Corriente_Cliente_idCliente`, `Cuenta_Corriente_IBAN`) VALUES (DEFAULT, NULL, 'ES872463096481284673', 500, 2, 5, 'ES427659273598523754');
INSERT INTO `Dineros`.`Transacción` (`idTransacción`, `Fecha`, `IBAN_Destino`, `Importe`, `Cuenta_Corriente_Banco_idBanco`, `Cuenta_Corriente_Cliente_idCliente`, `Cuenta_Corriente_IBAN`) VALUES (DEFAULT, NULL, 'ES437638742974576352 ', 2000, 4, 5, 'ES658593467345720174');
INSERT INTO `Dineros`.`Transacción` (`idTransacción`, `Fecha`, `IBAN_Destino`, `Importe`, `Cuenta_Corriente_Banco_idBanco`, `Cuenta_Corriente_Cliente_idCliente`, `Cuenta_Corriente_IBAN`) VALUES (DEFAULT, NULL, 'ES437638742974576352', 650, 1, 2, 'ES547453875408264864');
INSERT INTO `Dineros`.`Transacción` (`idTransacción`, `Fecha`, `IBAN_Destino`, `Importe`, `Cuenta_Corriente_Banco_idBanco`, `Cuenta_Corriente_Cliente_idCliente`, `Cuenta_Corriente_IBAN`) VALUES (DEFAULT, NULL, 'ES672458295389201546', 200, 2, 5, 'ES427659273598523754');
INSERT INTO `Dineros`.`Transacción` (`idTransacción`, `Fecha`, `IBAN_Destino`, `Importe`, `Cuenta_Corriente_Banco_idBanco`, `Cuenta_Corriente_Cliente_idCliente`, `Cuenta_Corriente_IBAN`) VALUES (DEFAULT, NULL, 'ES872463096481284673', 3000, 1, 2, 'ES547453875408264864');

COMMIT;