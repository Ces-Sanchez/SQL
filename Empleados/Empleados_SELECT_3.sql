-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

use empleados;

-- 1. 	Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado, departamento where empleado.código_departamento=departamento.código;

Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado join departamento on empleado.código_departamento=departamento.código;

-- 2. 	Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético)
-- y en segundo lugar por los apellidos y el nombre de los empleados.
Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado, departamento where empleado.código_departamento=departamento.código
order by departamento.nombre, apellido1, apellido2, empleado.nombre;

Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado join departamento on empleado.código_departamento=departamento.código
order by departamento.nombre, apellido1, apellido2, empleado.nombre;

-- 3. 	Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
Select departamento.código, departamento.nombre from departamento,empleado where empleado.código_departamento=departamento.código
group by departamento.código;

Select departamento.código, departamento.nombre from departamento join empleado on empleado.código_departamento=departamento.código
group by departamento.código;

-- 4. 	Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone,
-- solamente de aquellos departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular
-- restando al valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
Select departamento.código, departamento.nombre, departamento.presupuesto-departamento.gastos
from departamento,empleado where empleado.código_departamento=departamento.código
group by departamento.código;

Select departamento.código, departamento.nombre, departamento.presupuesto-departamento.gastos
from departamento join empleado on empleado.código_departamento=departamento.código
group by departamento.código;

-- 5. 	Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
Update empleado set nif='38382980M' where código=5;
select departamento.nombre from departamento, empleado
where empleado.código_departamento=departamento.código AND empleado.nif='38382980M';

select departamento.nombre from departamento
join empleado on empleado.código_departamento=departamento.código
where empleado.nif='38382980M';

-- 6. 	Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
Update empleado set nombre='Pepe', apellido1='Ruiz', apellido2='Santana' where código=2;
select departamento.nombre from departamento, empleado
where empleado.código_departamento=departamento.código
AND empleado.nombre='Pepe' and apellido1='Ruiz' and apellido2='Santana';

select departamento.nombre from departamento join empleado
on empleado.código_departamento=departamento.código
where empleado.nombre='Pepe' and apellido1='Ruiz' and apellido2='Santana';

select departamento.nombre from departamento join empleado
on empleado.código_departamento=departamento.código
where concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2)
like 'Pepe Ruiz Santana';

-- 7. 	Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select * from departamento;
update departamento set nombre='I+D' where código=1;
select * from empleado where código_departamento=(select código from departamento where departamento.nombre='I+D');

select * from empleado where código_departamento=(select código from departamento where departamento.nombre='I+D');

-- 8. 	Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D.
-- Ordena el resultado alfabéticamente.
select * from departamento;
update departamento set nombre='Sistemas' where código=2;
update departamento set nombre='Contabilidad' where código=3;
Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado, departamento where empleado.código_departamento=departamento.código
and departamento.nombre in ('Sistemas', 'Contabilidad', 'I+D');

Select empleado.nombre, apellido1, apellido2, departamento.nombre, presupuesto, gastos
from empleado join  departamento
ON empleado.código_departamento=departamento.código
where departamento.nombre in ('Sistemas', 'Contabilidad', 'I+D');

-- 9. 	Devuelve una lista con el nombre de los empleados que tienen los departamentos
-- que no tienen un presupuesto entre 100000 y 200000 euros.
select empleado.nombre from empleado, departamento
where empleado.código_departamento=departamento.código
and departamento.presupuesto not between 100000 and 200000;

select empleado.nombre from empleado JOIN departamento
ON empleado.código_departamento=departamento.código
where departamento.presupuesto not between 100000 and 200000;

-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL.
-- Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
select DISTINCT departamento.nombre from departamento where departamento.código=
(Select departamento.código from empleado where apellido2 is null); 