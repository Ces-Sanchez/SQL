-- Enviar a un procedimiento la edad de una persona.
-- En función de esta mostrar: 
	-- Si tiene 0 -> Acabas de nacer
	-- Si tiene más de 0 y menos de 18 -> Eres menor de edad
	-- Si tiene 18 o más y menos de 65 -> Eres mayor de edad
	-- Si tiene más de 65 -> Ya puedes jubilarte.

use test;

drop procedure if exists edad;

create procedure edad(in años int)
begin
    CASE
		WHEN años = 0 THEN select "Acabas de nacer";
		WHEN años > 0 AND años < 18 THEN select "Eres menor de edad";
		WHEN años > 18 AND años < 65 THEN select "Eres mayor de edad";
        WHEN años > 65 THEN select "Ya puedes jubilarte.";
        -- el caso "else" (no ha entrado en ningun when anterior, NO ES OBLIGATORIO
        ELSE select "Aún no has nacido";
	END CASE;
end

use test;
call edad(25);