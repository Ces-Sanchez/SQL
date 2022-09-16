-- Mediante un bucle, guardar en una tabla la tabla de multiplicar de 10 x 10

use test;

drop procedure if exists tablas;

create procedure tablas(in numero int)
begin
declare contador int default 1;
drop table if exists test.noreservada;
create table test.noreservada (primero int,segundo int,resultado int);


	while contador <= 10 do
        insert into test.noreservada (primero, segundo, resultado) values (numero, contador,(numero*contador));
		set contador = contador + 1;
	end while;
end

use test;
call tablas(6)

use test;
select * from noreservada;