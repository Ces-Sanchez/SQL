drop database if exists test;
create database test;
use test;

drop procedure if exists imprime_impares;

create procedure imprime_impares(in cuanto int)
begin
declare i int default 1;
while i <= cuanto do
	if mod(i,2) then
        select i;
	end if;
    set i = i + 1;
end while;
end

use test;
call imprime_impares(12);