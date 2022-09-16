-- Enviar a un procedimiento dos números (base, exponente). Mostrar la potencia.

use test;

drop procedure if exists potencia;

create procedure potencia(in base int, in exponente int)
begin
declare contador int default 1;
declare temporal int default base;
	while contador < exponente do
		set temporal = temporal * base;
        set contador = contador + 1;
	end while;
select temporal;
end

use test;
call potencia(2,3)