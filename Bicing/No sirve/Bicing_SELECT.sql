-- -----------------------------------------------------
-- Schema bicing
-- -----------------------------------------------------
use bicing;

-- 0. Muestra el contenido de todas las tablas
Select * from servicio;
Select * from tarifa;
Select * from usuario;
Select * from bicicleta;
Select * from estacion;

-- 1. Muestra los usuarios activos
Select nombre from usuario where corriente_de_pago=1;

-- 2. Muestra el estado de cada estación
Select estacion.id_estacion as 'ID', estacion.direccion as 'Dirección', estacion.numero_plazas as 'Número de Plazas',
COUNT(bicicleta.id_bici) as 'Número de bicis'
from estacion
left outer join bicicleta on estacion.id_estacion=bicicleta.estacion_id_estacion
group by estacion.id_estacion;

-- 3. Muestra dónde están las bicicletas averiadas
Select bicicleta.id_bici, estacion.direccion
from bicicleta
join estacion on bicicleta.estacion_id_estacion=estacion.id_estacion
where bicicleta.estado_bici=0;

-- 4. Xavi coge una bicicleta en el bicing de la Calle Mallorca 220
-- a) Poner la bici en movimiento
-- b) Cambiar el número de estación
-- c) Crear el insert en 'servicio'

-- 5. Xavi deja esa misma bicicleta en el bicing de Valldaura 145
-- a) Poner la bici como parada
-- b) Cambiar el número de estación
-- c) Update del campo 'servicio_finalizado' de la tabla 'Servicio'.
-- d) Actualizar la tarifa en la tabla 'Servicio'
-- e) Calcular el importe