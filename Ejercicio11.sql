-- Enviar a un procedimiento en qué planta se encuentra una persona: 0, 1, 2.
-- Y también enviar cuántos pisos quiere subir/bajar: 1 o 2.
-- Indicar en qué planta está, teniendo en cuenta que solo hay 3 plantas.

use test;

drop procedure if exists ascensor;

create procedure ascensor(in actual int, in sentido varchar(10), in plantas int)
begin
Select concat("Estás en la planta ", actual);
    CASE
		WHEN sentido = 'arriba' AND actual >= 0 AND actual < 3 AND actual + plantas < 4
            THEN select concat("Estás en la planta ", actual + plantas);
		WHEN sentido = 'abajo' AND actual > 0 AND actual < 3 AND actual - plantas > 0
            THEN select concat("Estás en la planta ", actual - plantas);
        ELSE
            SELECT "Operación incorrecta";
	END CASE;
end

use test;
call ascensor(0,'arriba',4);
