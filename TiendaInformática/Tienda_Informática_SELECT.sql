use `La tienda Informática`;

-- 1 -- Obtener los nombres de los productos de la tienda.
Select nombre from artículos;	
			
-- 2  Obtener los nombres y los precios de los productos de la tienda.
Select nombre,precio from artículos;

-- 3  Obtener el nombre de los productos cuyo precio sea menor o igual a 200.
Select nombre,precio from artículos where precio <=200;

-- 4  Obtener todos los datos de los artículos cuyo precio esté entre
-- los 60 y los 120€ (ambas cantidades incluidas).
Select nombre,precio from artículos where precio between 60 and 120;			
		
-- 1.5  Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166’386).
Select nombre,round(precio*166.386) from artículos;
				
-- 1.6  Seleccionar el precio medio de todos los productos.
Select avg(precio) from artículos;			
		
-- 1.7  Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
Select avg(precio) from artículos where fabricante=2;

-- 1.8  Obtener el número de artículos cuyo precio sea mayor o igual a 180€.
Select count(*) from artículos where precio >=180;

-- 1.9  Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 €
--  y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
Select nombre,precio from artículos where precio >=180 order by precio desc, nombre asc;

-- 1.10  Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante.
Select * from artículos
join fabricantes on artículos.fabricante=fabricantes.código;

-- 1.11  Obtener un listado de artículos, mostrando solamente el nombre del artículo, su precio, y el nombre de su fabricante.
-- -- sin JOIN:
select ARTÍCULOS.nombre, ARTÍCULOS.precio, FABRICANTES.nombre from ARTÍCULOS, FABRICANTES
where FABRICANTES.Código = ARTÍCULOS.Fabricante;

-- 1.12  Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
Select fabricante, avg(precio) from artículos
group by fabricante;

-- 1.13  Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
Select fabricantes.nombre, avg(artículos.precio) from artículos,fabricantes where artículos.fabricante=fabricantes.código
group by fabricante;

-- 1.14  Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €.
Select fabricantes.nombre, artículos.nombre, avg(artículos.precio) from artículos,fabricantes where artículos.fabricante=fabricantes.código
group by fabricantes.nombre
HAVING avg(artículos.precio)>=150;

-- 1.15  Obtener el nombre y precio del artículo más barato.
Select nombre, precio from artículos order by precio asc
limit 1;

-- 1.16  Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
-- Aquí hay explicación, porque tiene telita. Parece que el campo A.Precio te lo construyes en una subconsulta. Telita.

SELECT A.Nombre, A.Precio, F.Nombre
FROM ARTÍCULOS A, FABRICANTES F
WHERE A.Fabricante = F.Código
AND A.Precio = (
 SELECT MAX(A2.Precio)
 FROM ARTÍCULOS A2
 WHERE A2.Fabricante = F.Código);
 
-- 1.17  Añadir un nuevo producto: Pendrive de 70 € (del fabricante 2).
INSERT INTO `La tienda Informática`.`Artículos` (`Código`, `Nombre`, `Precio`, `Fabricante`) VALUES (DEFAULT, 'Pendrive', 70, 2);

-- 1.18  Cambiar el nombre del producto 8 a ’Teclado’
Update artículos set nombre='Teclado' where código=8;

-- 1.19  Aplicar un descuento del 10% a todos los productos.
Update artículos set precio=precio*0.9;

-- 1.20  Aplicar un descuento de 10€ mayor o igual a 120€.
Update artículos set precio=precio-10 where precio>=120;

Select * from fabricantes;
Select * from artículos;
Select * from artículos, fabricantes;
Select * from artículos, fabricantes
where artículos.fabricante=fabricantes.Código;