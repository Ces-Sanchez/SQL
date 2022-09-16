drop database if exists test;
create database test;
use test;

use test;
drop procedure if exists mayor_edad;

create procedure mayor_edad(in edad int)
begin
-- EJEMPLO MAYOR DE EDAD
-- si edad es menor de 18
-- imprime eres menor de edad
-- si no
-- imprime eres mayor de edad
	if edad < 18 then
		select "Eres menor de edad";
	else
		select "Eres mayor de edad";
	end if;
end

delimiter ;

use test;
call mayor_edad(12);