USE mayorista;
-- 1a consulta del nostre exemple: Obtenir totes les dades dels articles del majorista:
-- 2a consulta: Obtenir les descripcions i els preus dels articles.
-- 3a consulta: Obtenir la descripció dels productes que tinguin un preu menor o igual a 200€.
-- 4a consulta: Obtenir totes les dades dels articles que tinguin un preu entre els 40€ i els 150€
-- (ambdues quantitats incloses).
-- 5a consulta: Obtenir el preu mig de tots els productes.

-- 6a consulta: Obtenir el preu mig dels articles que tinguin com a codi de fabricant 2.

-- 7a consulta: Obtenir el número d’articles que tinguin un preu igual o més gran a 180€.
-- 8a consulta: Obtenir la descripció i el preu dels articles que tinguin un preu major o igual
-- a 70€ i ordenar-los descendentment per preu i, posteriorment, ascendentment per
-- descripció.
-- 9a consulta: Obtenir un llistat complet d’articles, incloent per cada articles les seves dades i
-- la del seu fabricant.

-- 10a consulta: Obtenir un llistat d’articles, incloent la descripció de l’article, el seu preu i el
-- nom del seu fabricant.
-- 11a consulta: Obtenir el preu mig dels articles de cada fabricant, mostrant només el codi del
-- fabricant.
-- 12a consulta: Obtenir el preu mig dels articles de cada fabricant, mostrant el nom del
-- fabricant.
-- 13a consulta: Obtenir els noms del fabricants que ofereixen productes amb un preu mig
-- major o igual a 150€.
-- 14a consulta: Obtenir la descripció i el preu del article més econòmic.
-- 15a consulta: Obtenir la descripció i el preu de l’article més car (incloent el nom del
-- fabricant).
-- 16a consulta: Afegir un nou article amb codi 10, altaveus, de 70 € (del fabricant 2).
-- 17a consulta: Canviar la descripció del producte 4 a “armari”;

-- Select 1
select * from artículo;

-- Select 2
select descripción,precio FROM artículo;

-- Select 3
select descripción FROM artículo WHERE precio<=2000;

-- Select 4
select descripción FROM artículo WHERE precio between 40 AND 150;

-- Select 5
select avg (precio) from artículo;

-- Select 6
select avg (precio) from artículo where fabricante=2;

-- Select 7
select avg (precio) from artículo where precio>=180;

-- Select 8
select descripción,precio FROM artículo where precio >=80 order by precio,descripción;

-- Select 9
select * from artículo inner join fabricante where artículo.fabricante=fabricante.código;

-- Select 10
select artículo.descripción,artículo.precio,fabricante.nombre from artículo inner join fabricante on artículo.fabricante=fabricante.código;

-- Select 11
 select fabricante.código,avg(artículo.precio) from fabricante inner join artículo on artículo.fabricante=fabricante.código; 


