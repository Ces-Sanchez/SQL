-- Ejercicio 3 -> Enviar a un procedimiento
-- 3 números. Indicar si el tercero es la suma
-- de los dos primeros o no.

drop database if exists test;
create database test;
use test;

drop procedure if exists tercero;

create procedure tercero(in uno int, in dos int, in tres int)
begin
	IF uno + dos = tres then
		select "Es su suma";
    ELSE
    	select "No es su suma";
    END IF;
end

use test;
call tercero(1,3,3);
