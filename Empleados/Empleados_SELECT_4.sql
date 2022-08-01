use empleados;

-- 1. 	Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

update empleado set código_departamento=5 where código_departamento=1;
update empleado set código_departamento=NULL where código=2;
Select * from empleado left join departamento on empleado.código_departamento=departamento.código;

-- 2. 	Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
Select * from empleado left join departamento on empleado.código_departamento=departamento.código where código_departamento is null;

-- 3. 	Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
Select * from empleado right join departamento on empleado.código_departamento=departamento.código
where empleado.nombre is null;

-- 4. 	Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- El listado debe incluir los empleados que no tienen ningún departamento asociado
-- y los departamentos que no tienen ningún empleado asociado.
-- Ordene el listado alfabéticamente por el nombre del departamento.
Select * from empleado
right join departamento on empleado.código_departamento=departamento.código
UNION
Select * from empleado
left join departamento on empleado.código_departamento=departamento.código
order by 8;

-- 5. 	Devuelve un listado con los empleados que no tienen ningún departamento asociado
-- y los departamentos que no tienen ningún empleado asociado.
-- Ordene el listado alfabéticamente por el nombre del departamento.

Select * from empleado
right outer join departamento on empleado.código_departamento=departamento.código;

Select * from empleado
right outer join departamento on empleado.código_departamento=departamento.código
where empleado.código is null
UNION
Select * from empleado
left outer join departamento on empleado.código_departamento=departamento.código
where departamento.código is null;