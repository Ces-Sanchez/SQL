-- Ejercicio 7 -> Enviar a un procedimiento
-- un día, mes, año (numéricos).
-- Comprobar que sean correctos.

use test;

drop procedure if exists calendario;

create procedure calendario(in dia int, in mes int, in año int)
begin
IF dia > 0 AND dia < 31 and mes > 0 AND mes <13 AND año < 2023 then 
    IF mes != 2 then
        if mes = 1 OR mes = 3 OR mes = 5 OR mes = 7 OR mes = 8 OR mes = 10 OR mes = 12 then
            if dia > 0 AND dia < 32 then
                if año <=2022 then
                    SELECT "La fecha es correcta";
                ELSE
                    SELECT "La fecha es incorrecta";
                END IF;
            END IF;
        ELSE
            if dia > 0 AND dia < 31 then
                if año <=2022 then
                    SELECT "La fecha es correcta";
                ELSE
                    SELECT "La fecha es incorrecta"; 
                END IF;
            END IF;
        END IF;
    ELSE
        if dia > 0 AND dia < 29 then
            if año <=2022 then
                SELECT "La fecha es correcta";
            ELSE
                SELECT "La fecha es incorrecta";
            END IF;
        END IF;
    END IF;
ELSE
    SELECT "La fecha es incorrecta";
END IF;
end

use test;
call calendario(1,1,2020);