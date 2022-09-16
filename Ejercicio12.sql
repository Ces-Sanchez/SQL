-- Enviar a un procedimiento un número. Mostrar todos los números pares en formato decreciente.

use test;

drop procedure if exists haciabajo;

create procedure haciabajo(in numero int)
begin
declare contador int default 2;
select concat(numero,",");
	IF MOD(numero,2) THEN
		set numero = numero + 1; 
	END IF;
	
	while (numero - contador) > 1 do
		select concat(numero - contador,",");
		set contador = contador + 2;
	end while;
end

use test;
call haciabajo(21)