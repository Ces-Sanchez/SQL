-- Ejercicio 5 -> Enviar a un procedimiento 3 números.
-- Ordenar descendentemente.

drop database if exists test;
create database test;
use test;

drop procedure if exists ordena;

create procedure ordena(in uno int, in dos int, in tres int)
begin
IF uno > dos then
    IF dos > tres then
        select concat(uno,", ",dos,", ",tres);
    ELSEIF tres > uno then
        select concat(tres,", ",uno,", ",dos);
    ELSE 
        select concat(uno,", ",tres,", ",dos);
    END IF;
ELSE
    IF uno > tres then
        select concat(dos,", ",uno,", ",tres);
    ELSEIF dos > tres then
        select concat(dos,", ",tres,", ",uno);
    ELSE
        select concat(tres,", ",dos,", ",uno);
    END IF;
END IF;
end

use test;
call ordena(142,85,28957);