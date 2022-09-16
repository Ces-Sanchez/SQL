-- Ejercicio 4 -> Enviar a un procedimiento un precio a pagar
-- y el dinero disponible y mostrar si le falta dinero,
-- indicarle cuanto, si le sobra indicar cuánto
-- y si esta justo mostrar gracias por la compra

drop database if exists test;
create database test;
use test;

drop procedure if exists compra;

create procedure compra(in precio decimal, in disponible decimal)
begin 
	IF disponible < precio THEN
		select concat("Te faltan ",precio - disponible);
    ELSEIF disponible > precio THEN
    	select concat("Te sobran ",disponible - precio);
    ELSE
        select "Muchas gracias por su compra";
    END IF;
end

use test;
call compra(2562,23465);