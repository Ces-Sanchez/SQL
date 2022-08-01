use taller;

-- 1 Obtener el nombre de todas las piezas.
Select Nombre from Pieza;

-- 2 Obtener todos los datos de todos los proveedores.
Select * from Proveedor;

-- 3 Obtener el precio medio al que se nos suministran las piezas.
Select avg(Precio) from Compra;

-- 4  Obtener los nombres de los proveedores que suministran la pieza 10.
Select Proveedor.Nombre from Compra 
JOIN
Proveedor ON Compra.Identificador_proveedor=Proveedor.Identificador
where Código_pieza=10;

-- 5 Obtener los nombres de las piezas suministradas por el proveedor cuyo código es TGLR.
Select Pieza.nombre from Compra
JOIN
Pieza ON Compra.Código_pieza=Pieza.Código
where Identificador_proveedor=TGLR;

-- 6 Obtener los nombres de los proveedores que suministran las piezas más caras, indicando el precio al que la suministran.
Select Compra.Código_pieza, Proveedor.Nombre, Pieza.Nombre, min(Compra.Precio) from Compra
JOIN Pieza ON Compra.Código_pieza=Pieza.Código
JOIN Proveedor ON Compra.Identificador_proveedor=Proveedor.Identificador
group by Pieza.Nombre;

-- 7 -- Hacer constar en la base de datos que la empresa
-- “Tus piezas al momento, S.L.” va a empezar a suministrarnos
-- Tuerca TRC a 2,19 cada una.
INSERT INTO `Taller`.`Compra` (`Código_pieza`, `Identificador_proveedor`, `Precio`) VALUES (13, 'A2TH', 2.19);

-- 8 -- Aumentar los precios en diez céntimos.
update compra set precio = precio +0.10;

-- 9 -- Hacer constar en la base de datos que la empresa “Las piezas de la calle 34, S.L.”
-- no va a suministrarnos ninguna pieza (aunque la empresa sí va a seguir constando en nuestra
-- base de datos).
DELETE from compra
where Identificador_proveedor=(
	Select identificador from proveedor
	where nombre = 'Las piezas de la calle 34, S.L');
    
-- 10 -- Hacer constar en la base de datos que la empresa “Recambios y piezas, S.L.”
-- ya no va a suministrarnos Motor MLT.
DELETE from compra
where Identificador_proveedor=(
	Select identificador from proveedor
	where nombre = 'Recambios y piezas, S.L')
	AND
    Código_pieza = (Select Código from Pieza where Nombre = 'Motor MLT');
    
-- 11 -- Obtener un listado con el nombre de los proveedores y
-- la cantidad de piezas que nos suministra cada uno.
Select proveedor.nombre, count(*) from compra
join proveedor on compra.identificador_proveedor=proveedor.identificador
group by proveedor.nombre;

-- 12 -- Ver un listado con todos los datos de los proveedores, incluyendo los datos de las piezas
-- que suministran y a qué precio, ordenado por nombre de proveedor.
Select proveedor.*, pieza.*, compra.Precio from compra
join proveedor on compra.identificador_proveedor=proveedor.identificador
join pieza on compra.Código_pieza=Pieza.Código
order by proveedor.nombre;

-- 13 -- -- Ver el nombre del proveedor, nombre de la pieza
-- y precio de todas las piezas que han sido suministradas
-- , ordenado por pieza en ascendente y por precio en descendente. 
Select proveedor.nombre, pieza.nombre, compra.precio from compra
join proveedor on compra.identificador_proveedor=proveedor.identificador
join pieza on compra.Código_pieza=Pieza.Código
order by pieza.nombre asc, compra.precio desc;

-- 14  -- Mostrar el nombre de los proveedores que no suministran ninguna pieza.

Select * from compra group by identificador_proveedor;

Select nombre from proveedor
WHERE nombre NOT IN
	(Select DISTINCT proveedor.nombre from compra
	WHERE compra.identificador_proveedor=proveedor.identificador);

Select proveedor.nombre from compra
	right join proveedor on compra.identificador_proveedor=proveedor.Identificador
    where compra.identificador_proveedor is null;

show variables where variable_name like '%safe%';