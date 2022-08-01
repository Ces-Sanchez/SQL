Use empleados;

-- 1. Lista el primer apellido de todos los empleados.
Select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
Select DISTINCT apellido1 from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
Select * from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
Select nombre,apellido1,apellido2 from empleado;

-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
Select Código_Departamento from empleado;

-- 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado,
-- eliminando los códigos que aparecen repetidos.
Select DISTINCT Código_Departamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
Select concat_ws(' ',nombre,apellido1,apellido2) from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
Select upper(concat_ws(' ',nombre,apellido1,apellido2)) from empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
Select lower(concat_ws(' ',nombre,apellido1,apellido2)) from empleado;

-- 10. Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas,
-- una mostrará únicamente los dígitos del nif y la otra la letra.
Select código,left(nif,8),right(nif,1) from empleado;

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone.
-- Para calcular este dato tendrá que restar:
-- al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos).
-- Tenga en cuenta que en algunos casos pueden existir valores negativos.
-- Utilice un alias apropiado para la nueva columna  que está calculando.
Select nombre, presupuesto-gastos as 'actual' from departamento;

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
Select nombre, presupuesto-gastos as 'actual' from departamento order by actual asc;

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre asc;

-- 14. Lista el nombre de todos los departamentos ordenados de forma desscendente.
select nombre from departamento order by nombre desc;

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética
-- teniendo en cuenta en primer lugar sus apellidos y luego su nombre.
Select apellido1, apellido2, nombre from empleado order by 1,2,3 asc;

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
Select nombre, presupuesto from departamento order by presupuesto desc limit 3;

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
Select nombre, presupuesto from departamento order by presupuesto limit 3;

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
Select nombre, gastos from departamento order by gastos desc limit 3;

-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
Select nombre, gastos from departamento order by gastos limit 2;

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado.
-- La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
select * from empleado limit 2,5;

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto
-- mayor o igual a 150000 euros.
Select nombre, presupuesto from departamento where presupuesto>=150000;

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
Select nombre, gastos from departamento where gastos<5000;

-- 23. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que no tienen un presupuesto entre 100000 y 200000 euros.
-- Sin utilizar el operador BETWEEN.
Select nombre from departamento where presupuesto>=100000 AND presupuesto<=200000;

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
-- Sin utilizar el operador BETWEEN.
Select nombre from departamento where not (presupuesto>=100000 AND presupuesto<=200000);

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros.
-- Utilizando el operador BETWEEN. 
Select nombre, presupuesto from departamento where presupuesto BETWEEN 100000 AND 200000;

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
-- Utilizando el operador BETWEEN.
Select nombre, presupuesto from departamento where presupuesto NOT BETWEEN 100000 AND 200000;

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, 
-- de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
Select nombre, presupuesto, gastos from departamento where gastos>presupuesto;

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
Select nombre, presupuesto, gastos from departamento where gastos<presupuesto;

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
Select nombre, presupuesto from departamento where gastos=presupuesto;

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
Select * from empleado where apellido2 is null;

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
Select * from empleado where apellido2 is not null;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
Select * from empleado where apellido2='López';

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
Select * from empleado where apellido2='López' or apellido2='Moreno';

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
Select * from empleado where apellido2 in ('López','Moreno');

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3
Select * from empleado where Código_departamento=3;

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
Select * from empleado where Código_departamento in (2,4,5);

-- ADDENDUM

Select nombre from empleado where nombre like '[SMC]%';

Select nombre from empleado;