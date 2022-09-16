-- Enviar a un procedimiento el número del día
-- de la semana. Mostrar que día es. 
-- Ejemplo: 1 -> Lunes


use test;

drop procedure if exists semana;

create procedure semana(in dia int)
begin
CASE dia
		WHEN "1" THEN select "Lunes";
		WHEN "2" THEN select "Martes";
		WHEN "3" THEN select "Miércoles";
        WHEN "4" THEN select "Jueves";
        WHEN "5" THEN select "Viernes";
        WHEN "6" THEN select "Sábado";
        WHEN "7" THEN select "Domingo";
        -- el caso "else" (no ha entrado en ningun when anterior, NO ES OBLIGATORIO
        ELSE select "Día erroneo";
	END CASE;
end

use test;
call semana(1);