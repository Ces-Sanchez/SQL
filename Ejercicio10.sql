-- Si tiene dolores de cabeza preguntar si tiene problemas estomacales.
-- Si los tiene mostrar que ha de tomar paracetamol, sino aspirina.
-- Si tiene tos preguntar cuántos años tiene, si es menor de 12
-- mostrar que debe tomar caramelos de miel, sino de eucalipto.
-- Si no tiene ninguno de los síntomas anteriores mostrar que tiene que acudir a la consulta.

use test;

drop procedure if exists malito;

create procedure malito(in cabeza varchar(3), in estómago varchar(3),in tos varchar(3), in edad int)
begin
    CASE
		WHEN cabeza = 'sí' AND estómago = 'sí' AND tos = 'no' THEN select "Paracetamol";
		WHEN cabeza = 'sí' AND estómago = 'no' AND tos = 'no' THEN select "Aspirina";
        WHEN tos = 'sí' AND edad < 12 THEN select "Caramelos de miel";
        WHEN tos = 'sí' AND edad >= 12 THEN select "Caramelos de eucalipto";
        WHEN cabeza = 'no' AND estómago = 'no' AND tos = 'no' THEN select "Acuda a la consulta";
	END CASE;
end

use test;
call malito('no','no','no',10);
