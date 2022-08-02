Select * from listado_pedidos_clientes;
where nombre_apellidos like 'Antonio%'
order by 1;

-- Akane Tendo -> 10.850 y 1640
-- Antonio Romero son 700 todos
-- 


select nombre_apellidos, cantidad_total from listado_pedidos_clientes
where nombre_apellidos like '%Antonio%'; order by nombre_apellidos, cantidad desc;

(select codigo_pedido, max(cantidad_total) from listado_pedidos_clientes
					group by nombre_apellidos);



Select nombre_apellidos, cantidad_total from listado_pedidos_clientes
where cantidad_total >= ALL (select max(cantidad_total) from listado_pedidos_clientes
					group by nombre_apellidos)
group by nombre_apellidos;

Select nombre_apellidos, cantidad_total, codigo_pedido from listado_pedidos_clientes
where (nombre_apellidos, codigo_pedido) in
	(Select nombre_apellidos, codigo_pedido from listado_pedidos_clientes
		where (nombre_apellidos,cantidad_total) in 
			(select nombre_apellidos, max(cantidad_total) from listado_pedidos_clientes
			group by nombre_apellidos)
group by codigo_pedido)
order by nombre_apellidos;

Select nombre_apellidos, cantidad_total, codigo_pedido from listado_pedidos_clientes
where (nombre_apellidos, codigo_pedido) in
	(Select nombre_apellidos, codigo_pedido from listado_pedidos_clientes
		where (nombre_apellidos,cantidad_total) in 
			(select nombre_apellidos, max(cantidad_total) from listado_pedidos_clientes
			group by nombre_apellidos)
group by codigo_pedido)
order by nombre_apellidos;
