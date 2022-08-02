Select nombre_apellidos, cantidad_total, codigo_pedido from listado_pedidos_clientes
where (nombre_apellidos, codigo_pedido) in
	(Select nombre_apellidos, codigo_pedido from listado_pedidos_clientes
		where (nombre_apellidos,cantidad_total) in 
			(select nombre_apellidos, max(cantidad_total) from listado_pedidos_clientes
			group by nombre_apellidos)
group by codigo_pedido)
order by nombre_apellidos;



	Select nombre_apellidos, cantidad_total, codigo_pedido from listado_pedidos_clientes
		where (nombre_apellidos,cantidad_total) in 
			(select nombre_apellidos, max(cantidad_total) from listado_pedidos_clientes
			group by nombre_apellidos)
order by nombre_apellidos;




