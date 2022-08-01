use empleados;

-- 1. 	Calcula la suma del presupuesto de todos los departamentos.
Select * from departamento;

Select sum(departamento.presupuesto) from departamento;

-- 2. 	Calcula la media del presupuesto de todos los departamentos.
Select avg(departamento.presupuesto) from departamento;

-- 3. 	Calcula el valor mínimo del presupuesto de todos los departamentos.
Select min(departamento.presupuesto) from departamento;

-- 4. 	Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
Select * from departamento;
Select departamento.nombre, departamento.presupuesto from departamento where departamento.presupuesto =
(Select min(departamento.presupuesto) from departamento);

-- 5. 	Calcula el valor máximo del presupuesto de todos los departamentos.
Select max(departamento.presupuesto) from departamento;

-- 6. 	Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
Select departamento.nombre, departamento.presupuesto from departamento where departamento.presupuesto =
(Select max(departamento.presupuesto) from departamento);

-- 7. 	Calcula el número total de empleados que hay en la tabla empleado.
Select count(*) from empleado;

-- 8. 	Calcula el número de empleados que no tienen NULL en su segundo apellido.
Select count(apellido2) from empleado;

-- 9. 	Calcula el número de empleados que hay en cada departamento.
-- Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
Select * from empleado;
select departamento.nombre, count(*)
from empleado
join departamento on departamento.código = empleado.código_departamento
group by departamento.nombre;

-- 10.  Calcula el nombre de los departamentos que tienen más de 2 empleados.
-- El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
Select * from empleado;
select departamento.nombre, count(*) as números
from empleado
join departamento on departamento.código = empleado.código_departamento
group by departamento.nombre
having números >2;

-- 11.  	Calcula el número de empleados que trabajan en cada uno de los departamentos.
-- El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.
Select * from empleado right join departamento on departamento.código = empleado.código_departamento;
select departamento.nombre, count(código_departamento)
from empleado
right join departamento on departamento.código = empleado.código_departamento
group by departamento.nombre;

-- 12.     Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
Select * from departamento;
select departamento.nombre, departamento.presupuesto, count(*)
from empleado
right join departamento on departamento.código = empleado.código_departamento
group by departamento.nombre
having departamento.presupuesto>20000;