use jardinería;

-- 1. Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los
-- clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas:
-- nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la
-- transacción.

drop view if exists listado_pagos_clientes;
create view listado_pagos_clientes (nombre_apellidos, telefono, ciudad, pais, fecha_pago, total, id_transaccion) as
Select concat_ws(' ', nombre_contacto, apellido_contacto), telefono, ciudad, pais, fecha_pago, total, id_transaccion
from cliente
join pago
ON cliente.codigo_cliente=pago.codigo_cliente;

Select * from listado_pagos_clientes;

-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos
-- los clientes y los pedidos que ha realizado cada uno de ellos. La vista debe tener las siguientes
-- columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, país, código del pedido, fecha
-- del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto
-- de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
drop view if exists listado_pedidos_clientes;
Create view listado_pedidos_clientes (nombre_apellidos, telefono, ciudad, pais, codigo_pedido,
	fecha_pedido, fecha_esperada, fecha_entrega, cantidad_total) as
Select concat_ws(' ', nombre_contacto, apellido_contacto), 
	telefono, ciudad, pais, pedido.codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega,
    sum(cantidad*precio_unidad) as cantidad_total
from cliente
join pedido
ON cliente.codigo_cliente=pedido.codigo_cliente
join detalle_pedido
ON pedido.codigo_pedido=detalle_pedido.codigo_pedido
group by pedido.codigo_pedido;

Select * from listado_pedidos_clientes;

-- 3. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad
-- de Madrid que han realizado pagos.
Select * from listado_pagos_clientes where ciudad='Madrid';

-- 4. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía
-- no han recibido su pedido.
Select * from listado_pedidos_clientes where fecha_entrega is null;

-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha
-- realizado cada uno de los clientes.
Select nombre_apellidos, count(nombre_apellidos)
from listado_pedidos_clientes
group by nombre_apellidos;

Select count(*) from listado_pedidos_clientes where nombre_apellidos='Akane Tendo';

-- 6. Utilice las vistas que ha creado en los pasos anteriores
-- para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.
select * from listado_pedidos_clientes;

select nombre_apellidos, cantidad_total from listado_pedidos_clientes
where nombre_apellidos like '%Antonio%'; order by nombre_apellidos, cantidad desc;

(select codigo_pedido, max(cantidad_total) from listado_pedidos_clientes
					group by nombre_apellidos);



Select nombre_apellidos, cantidad_total from listado_pedidos_clientes
where cantidad_total >= ALL (select max(cantidad_total) from listado_pedidos_clientes
					group by nombre_apellidos)
group by nombre_apellidos;

Select nombre_apellidos, cantidad_total from listado_pedidos_clientes
where codigo_pedido = ALL
	(Select codigo_pedido from listado_pedidos_clientes
		where cantidad_total in 
			(select max(cantidad_total) from listado_pedidos_clientes
			group by nombre_apellidos)
group by nombre_apellidos)
order by nombre_apellidos;
-- 7. Modifique el nombre de las vista listado_pagos_clientesy asígnele el nombre listado_de_pagos.Una vez que
-- haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para
-- comprobar que sigue funcionando correctamente.

-- 8. Elimine las vistas que ha creado en los pasos anteriores.