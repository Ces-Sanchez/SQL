drop database if exists test;
create database test;
use test;

drop procedure if exists es_primo;
create procedure es_primo(in numero int)
begin

declare contador int default 2;


IF numero > 1 then
    comprueba: WHILE contador < numero do
        IF numero % contador = 0 then 
            Select "No es primo";
            LEAVE comprueba;
        END IF;            
        set contador = contador + 1;
    END WHILE;
    Select "Es primo";
ELSEIF numero < 1 then
    Select "No es primo";
ELSEIF numero = 1 then
    Select "Es primo";
END IF;

end

use test;
call es_primo(7);

