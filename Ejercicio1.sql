-- Ejercicio 1 -> Enviar a un procedimiento el color del semáforo y mostrar si puede pasar,
-- extremar la precaución o no pasar.


drop database if exists test;
create database test;
use test;

drop procedure if exists semaforo;

create procedure semaforo(in color varchar(5))
begin
	CASE color
		WHEN "rojo" THEN select "No puedes pasar";
		WHEN "ambar" THEN select "Precaución";
		WHEN "verde" THEN select "Puedes pasar";
        -- el caso "else" (no ha entrado en ningun when anterior, NO ES OBLIGATORIO
        ELSE select "Color erroneo";
	END CASE;
end

use test;
call semaforo("ambar");
