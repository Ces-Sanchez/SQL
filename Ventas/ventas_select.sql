-- Consultas sobre una tabla
-- 1. 	Devuelve un listado con todos los pedidos que se han realizado.
-- Los pedidos deben estar ordenados por la fecha de realización, 
-- mostrando en primer lugar los pedidos más recientes.
use ventas;
Select * from pedido order by 3 desc;

-- 2. 	Devuelve todos los datos de los dos pedidos de mayor valor.
use ventas;
Select * from pedido order by cantidad desc limit 2;

-- 3. 	Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
use ventas;
Select DISTINCT C.id from cliente C join pedido P ON
C.id = P.id_cliente;

-- 4. 	Devuelve un listado de todos los pedidos que se realizaron durante el año 2017,
-- cuya cantidad total sea superior a 500€.
use ventas;
Select * from pedido P where fecha like '%2017%' and cantidad > 500; 

-- 5. 	Devuelve un listado con el nombre y los apellidos de los comerciales
-- que tienen una comisión entre 0.05 y 0.11.
use ventas;
Select nombre, apellido1, apellido2 from comercial
where comisión between 0.05 and 0.11;


-- 6. 	Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
use ventas;
Select max(comisión) from comercial;


-- 7. 	Devuelve el identificador, nombre y primer apellido de aquellos clientes
-- cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
use ventas;
Select id, nombre, apellido1 from cliente
where apellido2 is not null
order by apellido1, apellido2, nombre;


-- 8. 	Devuelve un listado de los nombres de los clientes que empiezan por A
-- y terminan por n y también los nombres que empiezan por P.
-- El listado deberá estar ordenado alfabéticamente.
use ventas;
Select nombre from cliente where nombre like 'A%' and nombre like '%n'
union
Select nombre from cliente where nombre like 'P%'
order by nombre asc;


-- 9. 	Devuelve un listado de los nombres de los clientes que no empiezan por A.
-- El listado deberá estar ordenado alfabéticamente.
use ventas;
Select nombre from cliente where nombre not like 'A%'
order by nombre asc;

-- 10.  	Devuelve un listado con los nombres de los comerciales que terminan por el o o.
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
use ventas;
Select distinct nombre from cliente where nombre like '%el' or nombre like '%o';


-- Consultas multitabla (Composición interna)
 
-- 1. 	Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes
-- que han realizado algún pedido. El listado debe estar ordenado alfabéticamente
-- y se deben eliminar los elementos repetidos.
use ventas;
Select DISTINCT C.id, C.nombre, C.apellido1, C.apellido2 from cliente C join pedido P ON
C.id = P.id_cliente
order by C.nombre;


-- 2. 	Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
-- El resultado debe mostrar todos los datos de los pedidos y del cliente.
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
use ventas;
Select * from pedido P
join cliente C on C.id = P.id_cliente
order by C.nombre;


-- 3. 	Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial.
-- El resultado debe mostrar todos los datos de los pedidos y de los comerciales.
-- El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
use ventas;
Select * from pedido P
join comercial C ON
P.id_comercial = C.id
order by C.nombre asc;


-- 4. 	Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado
--  y con los datos de los comerciales asociados a cada pedido.
use ventas;
Select * from pedido P
join cliente C on C.id = P.id_cliente
join comercial Co ON
P.id_comercial = Co.id;


-- 5. 	Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017,
-- cuya cantidad esté entre 300 € y 1000 €.
use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, P.cantidad from cliente C join pedido P ON
C.id = P.id_cliente
where P.fecha like '%2017%' and P.cantidad between 300 and 1000;


-- 6. 	Devuelve el nombre y los apellidos de todos los comerciales que han participado en algún pedido
-- realizado por María Santana Moreno.
use ventas;
Select DISTINCT Co.nombre, Co.apellido1, Co.apellido2 from comercial Co
join pedido P ON
P.id_comercial = Co.id
join cliente C ON
P.id_cliente = C.id 
where concat_ws(' ', C.nombre, C.apellido1, C.apellido2) = 'María Santana Moreno';

-- 7. 	Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial
-- Daniel Sáez Vega.
use ventas;
Select DISTINCT C.nombre, C.apellido1, C.apellido2 from comercial Co
join pedido P ON
P.id_comercial = Co.id
join cliente C ON
P.id_cliente = C.id 
where concat_ws(' ', Co.nombre, Co.apellido1, Co.apellido2) = 'Daniel Sáez Vega';


-- Consultas multitabla (Composición externa)
 
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN ó RIGHT JOIN.
-- 1. 	Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado.
-- Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido
-- y nombre de los clientes.
use ventas;
Select * from cliente C
left join pedido P on C.id = P.id_cliente
order by apellido1, apellido2, nombre;


-- 2.   Devuelve un listado con todos los comerciales
-- junto con los datos de los pedidos que han realizado.
-- Este listado también debe incluir los comerciales que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido
-- y nombre de los comerciales.
use ventas;
Select * from comercial C
left join pedido P ON
P.id_comercial = C.id
order by apellido1, apellido2, nombre;


-- 3. 	Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
use ventas;
Select * from cliente C left join pedido P ON
C.id = P.id_cliente
where P.id_cliente is NULL;


-- 4.	Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
use ventas;
Select * from comercial C
left join pedido P ON
P.id_comercial = C.id
where P.id_comercial is NULL;


-- 5. 	Devuelve un listado con los clientes que no han realizado ningún pedido
-- y de los comerciales que no han participado en ningún pedido.
-- Ordene el listado alfabéticamente por los apellidos y el nombre.
-- En el listado deberá diferenciar de algún modo los clientes y los comerciales.
use ventas;
Select concat_ws(' ', '[CLI]', C.nombre) as Nombre, 
    concat_ws(' ', '[CLI]', C.apellido1) as Apellido1,
    concat_ws(' ', '[CLI]', C.apellido2) as Apellido2
    from cliente C 
left join pedido P ON
C.id = P.id_cliente
where P.id_cliente is NULL

UNION ALL

Select concat_ws(' ', '[COM]', Co.nombre), 
    concat_ws(' ', '[COM]', Co.apellido1),
    concat_ws(' ', '[COM]', Co.apellido2)
    from comercial Co
left join pedido P ON
P.id_comercial = Co.id
where P.id_comercial is NULL;
*/

--  Consultas resumen
 
-- 1. 	Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
use ventas;
Select sum(cantidad) from pedido;


-- 2. 	Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
use ventas;
Select avg(cantidad) from pedido;


-- 3. 	Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
use ventas;
Select count(id) from comercial;

-- 4. 	Calcula el número total de clientes que aparecen en la tabla cliente.
use ventas;
Select count(id) from cliente;

-- 5. 	Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
use ventas;
Select max(cantidad) from pedido;


-- 6. 	Calcula cuál es la menor cantidad que aparece en la tabla pedido.
use ventas;
Select max(cantidad) from pedido;


-- 7. 	Calcula cuál es el valor máximo de categoría
-- para cada una de las ciudades que aparece en la tabla cliente.
use ventas;
Select ciudad, max(categoria) from cliente
group by ciudad;

-- 8. 	Calcula cuál es el máximo valor de los pedidos realizados
-- durante el mismo día para cada uno de los clientes.
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el pedido de máximo valor
-- para cada uno de los días en los que un cliente ha realizado un pedido.
-- Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
use ventas;
Select * from pedido order by fecha;

use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, P.cantidad
FROM pedido P
JOIN cliente C on C.id = P.id_cliente
WHERE (P.fecha, P.cantidad) IN
(SELECT P.fecha, max(P.cantidad)
FROM pedido P
GROUP BY P.fecha)
ORDER BY P.fecha;

use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, P.cantidad
FROM pedido P
JOIN cliente C on C.id = P.id_cliente
GROUP BY C.id, P.fecha
ORDER BY P.fecha;

-- 9. 	Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día
-- para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos
-- que superen la cantidad de 2000 €.
use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, P.cantidad
FROM pedido P
JOIN cliente C on C.id = P.id_cliente
WHERE (P.fecha, P.cantidad) IN
(SELECT P.fecha, max(P.cantidad)
FROM pedido P
GROUP BY P.fecha)
AND P.cantidad > 2000
ORDER BY P.fecha;

-- 10.  	Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales
-- durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
use ventas;
Select Co.id, Co.nombre, Co.apellido1, Co.apellido2, P.cantidad
from comercial Co
join pedido P ON
P.id_comercial = Co.id
Where (P.id_comercial, P.cantidad) IN
    (SELECT P.id_comercial, max(P.cantidad)
    from pedido where P.fecha = '2016-08-17');


-- 11.  	Devuelve un listado con el identificador de cliente, nombre y apellidos
-- y el número total de pedidos que ha realizado cada uno de los clientes.
-- Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, count(P.id_cliente)
FROM cliente C
LEFT JOIN pedido P on C.id = P.id_cliente
group by C.id;


-- 12.  	Devuelve un listado con el identificador de cliente, nombre y apellidos
-- y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
use ventas;
Select C.id, C.nombre, C.apellido1, C.apellido2, P.fecha, count(P.id_cliente)
FROM cliente C
LEFT JOIN pedido P on C.id = P.id_cliente
WHERE P.fecha like '%2017%'
group by C.id;


-- 13.  	Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido
-- y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes.
-- El resultado debe mostrar aquellos clientes que no han realizado ningún pedido
-- indicando que la máxima cantidad de sus pedidos realizados es 0.
-- Puede hacer uso de la función IFNULL.


-- 14.  	Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
-- 15.  	Devuelve el número total de pedidos que se han realizado cada año.
 

-- Subconsultas 
-- Con operadores básicos de comparación
 
-- 1. 	Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
-- 2. 	Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
-- 3. 	Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
-- 4. 	Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
-- 5. 	Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
 

-- Subconsultas con ALL y ANY
 
-- 6. 	Devuelve el pedido más caro que existe en la tabla pedido sin hacer uso de MAX, ORDER BY ni LIMIT.
-- 7. 	Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
-- 8. 	Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
 
-- Subconsultas con IN y NOT IN
 
-- 9. 	Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
-- 10.  	Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
 
--  Subconsultas con EXISTS y NOT EXISTS
 
-- 11.  	Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
-- 12.  	Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
