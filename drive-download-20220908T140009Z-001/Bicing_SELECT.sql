-----------------------------
-- 10 consultas de una tabla.
-----------------------------

select direccion from estacion;
select direccion, numero_plazas from estacion;
select id_bicicleta, en_uso_o_parada from bicicleta;
select id_bicicleta, tipo_bicicleta from bicicleta;
select id_bicicleta, estado_bicicleta from bicicleta;
select nombre_tarifa from tarifa;
select id_tarifa, importe from tarifa;
select dni from usuario;
select nombre from usuario;
select servicio_finalizado from servicio;


--------------------------------------------------
-- 10 consultas varias tablas. Composición interna
--------------------------------------------------

-- 1. Qué usuarios han utilizado la id_bicicleta = 2
Select U.nombre, U.dni from usuario U 
join servicio S on U.id_usuario=S.servicio_id_usuario
join bicicleta B on S.servicio_id_bicicleta=B.id_bicicleta
where B.id_bicicleta=2;


-- 2. Qué bicicletas ha usado cada usuario
select id_usuario, id_bicicleta from usuario U
join servicio S on S.servicio_id_usuario=U.id_usuario
join bicicleta B on S.servicio_id_bicicleta=B.id_bicicleta;

-- 3. Qué estaciones ha usado Mari
select U.nombre, U.dni, E.direccion from usuario U 
join servicio S on U.id_usuario=S.servicio_id_usuario
join bicicleta B on S.servicio_id_bicicleta=B.id_bicicleta
join estacion E on B.estacion_id_estacion=E.id_estacion
where U.id_usuario=2;

-- 4. Qué tarifas estan usando los usuarios al corriente de pago
select U.nombre, T.nombre_tarifa from tarifa T 
join usuario U on U.id_usuario=T.id_tarifa
where U.corriente_de_pago=1;


-- 5 estados de la bici de la estacion 4
select id_bicicleta, estado_bicicleta from bicicleta B join 
estacion E on E.id_estacion= B.estacion_id_estacion
where E.id_estacion=4;


-- 6. Usuarios con bici electrica
select U.nombre, U.dni from usuario U 
join servicio S on U.id_usuario=S.servicio_id_usuario
join bicicleta B on S.servicio_id_bicicleta=B.id_bicicleta
where B.tipo_bicicleta='eléctrica';

-- 7. Usuarios en movimiento
select U.nombre, U.dni from usuario U 
join servicio S on U.id_usuario=S.servicio_id_usuario
join bicicleta B on S.servicio_id_bicicleta=B.id_bicicleta
where B.en_uso_o_parada='en_uso';

-- 8 Nombre y dni de los usuarios tienen la tarifa anual
select U.nombre, U.dni from usuario U
join tarifa T on U.usuario_id_tarifa = T.id_tarifa
where T.nombre_tarifa = 'Anual';

-- 9 tiempo de devolucion de la bicicleta 2 por parte usuario  
select S.tiempo_devolucion from servicio S
join usuario U on U.id_usuario=S.servicio_id_usuario
join bicicleta B on B.id_bicicleta=S.servicio_id_bicicleta
where B.id_bicicleta=2;

-- 10 importe que paga el usuario 2
select U.nombre, T.importe from tarifa T
join usuario U on T.id_tarifa=U.usuario_id_tarifa
where id_usuario=2;

-------------------------------------------------
-- 10 consultas varias tablas composición externa
-------------------------------------------------

-- 11 Servicios de cada usuario
select * from usuario U left join servicio S 
on S.servicio_id_usuario=U.id_usuario;

-- 12 Bicicletas de cada estacion
select * from bicicleta B left join estacion E
on B.estacion_id_estacion=E.id_estacion;

-- 13 Bicicletas que han tenido servicios
select * from bicicleta B left join servicio S 
on B.id_bicicleta=S.servicio_id_bicicleta;

-- 14. Cuántos usuarios tienen cada tarifa
select T.nombre_tarifa, count(U.usuario_id_tarifa)
from tarifa T left join usuario U 
on T.id_tarifa=U.usuario_id_tarifa
group by T.nombre_tarifa;

select * from bicicleta;

-- 15. Bicicletas que ha utilizado un usuario
select S.servicio_id_bicicleta from servicio S
left join bicicleta B
on B.id_bicicleta=S.servicio_id_bicicleta
where S.servicio_id_usuario=2;

-- 16. Importe que paga el usuario 2 
select T.importe from tarifa T left join usuario U 
on T.id_tarifa=U.usuario_id_tarifa
where U.id_usuario=2;

-- 17. Usuarios al corriente de pago
-- que no han contratado aún ningún servicio
Select nombre from usuario u
left join servicio S on U.id_usuario=S.servicio_id_usuario
where U.id_usuario NOT IN (Select S.servicio_id_usuario from servicio);

-- 18. Bicicletas averiadas por estación
Select E.id_estacion, count(B.id_bicicleta) from Bicicleta B
left join estacion E on E.id_estacion=B.estacion_id_estacion
where B.estado_bicicleta='averiada'
group by E.id_estacion;

-- 19. Usuarios que han reservado una bici
Select U.nombre from usuario U
left join servicio S on U.id_usuario = S.servicio_id_usuario
left join bicicleta B on B.id_bicicleta = S.servicio_id_bicicleta
where B.reservada_o_disponible='disponible';

-- 20. Estaciones con bicicletas eléctricas
Select E.direccion from estacion E
right join bicicleta B on E.id_estacion = B.estacion_id_estacion
where B.tipo_bicicleta='eléctrica'
group by E.direccion;
 
----------------------
-- 5 consultas resumen
----------------------

-- 1. Contar el numero de usuarios
select count(id_usuario) from usuario;

-- 2. Contar el numero de bicicletas
select count(id_bicicleta) from bicicleta;

-- 3. Cuántas bicicletas hay en cada estacion
select id_estacion, count(id_bicicleta) 
from bicicleta B
join estacion E on E.id_estacion=B.estacion_id_estacion 
group by id_estacion;

-- 4. Máximo numero de plazas de las estaciones
select max(numero_plazas) from estacion;

-- 5. Mínimo numero de plazas de las estaciones
select min(numero_plazas) from estacion;

-------------------------------
-- 5 consultas con subconsultas
-------------------------------

-- 1. En qué direccion esta la bicicleta 4
select estacion.direccion from estacion 
where id_estacion=
(select bicicleta.estacion_id_estacion from bicicleta where id_bicicleta=4);

-- 2. Qué bicicleta lleva el usuario 4
select id_bicicleta from bicicleta 
where id_bicicleta in 
(select servicio_id_bicicleta from servicio
 where servicio_id_usuario=4 
 );

-- 3. Lista de algun servicio de algun usuario que no
-- este al corriente de pago

select * from servicio where servicio_id_usuario in 
(select id_usuario from usuario where corriente_de_pago = 0); 

-- 4. Máximo numero de plazas por estacion
Select * from estacion where numero_plazas in 
(select max(numero_plazas) from estacion);
select max(numero_plazas) from estacion;

-- 5. Mínimo numero de plazas
Select * from estacion where numero_plazas in (select min(numero_plazas) 
from estacion);
select max(numero_plazas) from estacion;






