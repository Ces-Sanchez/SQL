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
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '66666666F', 'Xen', 'Fortúnez', 'Rodríguez', 5);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '77777777G', 'Azahara', 'Martínez', 'Ródenas', 2);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '88888888H', 'Manuel', 'Benítez', 'Sánchez', 1);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '99999999I', 'Lara', 'López', 'Vélez', 3);
INSERT INTO `Empleados`.`Empleado` (`Código`, `NIF`, `Nombre`, `Apellido1`, `Apellido2`, `Código_Departamento`) VALUES (DEFAULT, '00000000J', 'María', 'Sánchez', 'Martínez', 2);

COMMIT;

