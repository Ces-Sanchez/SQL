-- Ejercicio 2 -> Enviar a un procedimiento un número.
-- Mostrar si es par o impar

drop database if exists test;
create database test;
use test;

drop procedure if exists par_impar;

create procedure par_impar(in numero int)
begin
	IF mod(numero,2) THEN
		select "Es impar";
    ELSE
    	select "Es par";
    END IF;
end

use test;
call par_impar(5);
