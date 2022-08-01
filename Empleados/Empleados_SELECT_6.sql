use empleados;

-- 1. 	Devuelve un listado con todos los empleados que tiene el departamento 
-- de Sistemas. (Sin utilizar INNER JOIN).
Select * from empleado, departamento where empleado.Código_Departamento=departamento.Código;
Select nombre from empleado where código_departamento = (select código from departamento where departamento.nombre="Sistemas");
-- 2. 	Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
Select nombre,presupuesto from departamento where presupuesto=(select max(Presupuesto) from departamento);
-- 3. 	Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
Select nombre,presupuesto from departamento where presupuesto=(select min(Presupuesto) from departamento);

---------------------------------  
--    Subconsultas con ALL y ANY
-- ------------------------------

-- 4. 	Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
-- Sin hacer uso de MAX, ORDER BY ni LIMIT.
Select nombre,presupuesto from departamento where presupuesto >= ALL (Select presupuesto from departamento);

-- 5. 	Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.
Select nombre,presupuesto from departamento where presupuesto <= ALL (Select presupuesto from departamento);

-- 6. 	Devuelve los nombres de los departamentos que tienen empleados asociados. 
-- (Utilizando ALL o ANY).
Select nombre from departamento where código = ANY (Select código_departamento from empleado);

-- 7. 	Devuelve los nombres de los departamentos que no tienen empleados asociados. 
-- (Utilizando ALL o ANY).
Select nombre from departamento where código != ALL (
Select código_departamento from empleado where código_departamento is not null)
;

-------------------------------- 
-- Subconsultas con IN y NOT IN
--------------------------------
  
-- 8. 	Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
Select nombre from departamento where código IN (Select código_departamento from empleado);

-- 9. 	Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
Select nombre from departamento where código NOT IN (
Select código_departamento from empleado where código_departamento is not null);

---------------------------------------  
-- Subconsultas con EXISTS y NOT EXISTS
---------------------------------------
  
-- 10.  	Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
Select nombre from departamento where EXISTS (
Select código_departamento from empleado where código_departamento = departamento.código);

-- 11.  	Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
Select nombre from departamento where NOT EXISTS (
Select código_departamento from empleado where código_departamento = departamento.código);
