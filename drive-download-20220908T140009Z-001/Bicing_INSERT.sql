-- -----------------------------------------------------
-- Data for table `bicing`.`estacion`
-- -----------------------------------------------------

START TRANSACTION;
USE `bicing`;

INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Mallorca 220', 14);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Viladomat 63', 16);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Valldaura 145', 20);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Ramblas 58', 12);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Pelayo 64', 16);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Diagonal 473', 12);
INSERT INTO `bicing`.`estacion` (`id_estacion`, `direccion`, `numero_plazas`) VALUES (DEFAULT, 'Brasil 175', 20);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bicing`.`tarifa`
-- -----------------------------------------------------

START TRANSACTION;
USE `bicing`;
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES
(DEFAULT, 'Anual', 'Tarifa Plana Anual', 50);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'Uso', 'Tarifa de uso', 35);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Mecánica_30', 'Anual + Mecánica primeros 30 minutos', 0);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Eléctrica_30', 'Anual + Eléctrica primeros 30 minutos', 0.35);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Mecánica_30', 'Uso + Mecánica primeros 30 minutos', 0.35);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Eléctrica_30', 'Uso + Eléctrica primeros 30 minutos', 0.55);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Mecánica_120', 'Anual + Mecánica hasta 2h', 0.70);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Eléctrica_120', 'Anual + Eléctrica hasta 2h', 0.9);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Mecánica_120', 'Uso + Mecánica hasta 2h', 0.7);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Eléctrica_120', 'Uso + Eléctrica hasta 2h', 0.9);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Mecánica_150', 'Anual + Mecánica más de 2h', 5);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'A.Eléctrica_150', 'Anual + Eléctrica más de 2h', 5);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Mecánica_150', 'Uso + Mecánica más de 2h', 5);
INSERT INTO `bicing`.`tarifa` (`id_tarifa`, `nombre_tarifa`, `descripcion`, `importe`) VALUES 
(DEFAULT, 'U.Eléctrica_150', 'Uso + Eléctrica más de 2h', 5);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bicing`.`usuario`
-- -----------------------------------------------------

START TRANSACTION;
USE `bicing`;
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Xavi', '11111111A', 'sí', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Mari', '22222222B', 'sí', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'César', '33333333C', 'sí', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Amid', '44444444D', 'sí', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Antonia', '55555555E', 'no', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Dani', '66666666F', 'sí', 1);
INSERT INTO `bicing`.`usuario` (`id_usuario`, `nombre`, `dni`, `corriente_de_pago`, `usuario_id_tarifa`) VALUES (DEFAULT, 'Lluis', '77777777G', 'no', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bicing`.`bicicleta`
-- -----------------------------------------------------

START TRANSACTION;
USE `bicing`;
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
INSERT INTO `bicing`.`bicicleta` (
`id_bicicleta`, `fecha_de_alta`, `estado_bicicleta`, `tipo_bicicleta`, `reservada_o_disponible`) 
VALUES (DEFAULT, DEFAULT, 'funcionando', 'mecánica', 'disponible');
COMMIT;

-- -----------------------------------------------------
-- Data for table `bicing`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `bicing`;

-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (3, 3, 1, 0);
-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (6, 7, 2, 0);
-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (4, 2, 1, 0);
-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (2, 6, 3, 0);
-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (1, 2, 4, 0);
-- INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (2, 5, 2, 0);
COMMIT;


-- -----------------------------------------------------
-- Data for table `bicing`.`bicicleta_has_estacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `bicing`;

INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (1, 7)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (2, 7)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (3, 5)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (4, 2)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (5, 1)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (6, 2)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (7, 4)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (8, 2)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (9, 3)
INSERT INTO `bicing`.`bicicleta_has_estacion` (`bicicleta_id_bicileta`, `estacion_id_estacion`) VALUES (10, 1)
