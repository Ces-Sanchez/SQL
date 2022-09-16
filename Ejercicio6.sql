-- Comprobar letra DNI.
-- Enviar a un procedimiento el número del DNI.
drop database if exists test;
create database test;
use test;

drop table if exists dni;
create table dni(
	resto int primary key,
    letra char(1)
);

INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('0', 'T');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('1', 'R');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('2', 'W');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('3', 'A');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('4', 'G');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('5', 'M');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('6', 'Y');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('7', 'F');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('8', 'P');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('9', 'D');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('10', 'X');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('11', 'B');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('12', 'N');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('13', 'J');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('14', 'Z');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('15', 'S');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('16', 'Q');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('17', 'V');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('18', 'H');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('19', 'L');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('20', 'C');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('21', 'K');
INSERT INTO `test`.`dni` (`resto`, `letra`) VALUES ('22', 'E');

use test;

drop procedure if exists p_DNI;
create procedure p_DNI(in mydni varchar(10))
begin

set @myletra = right(mydni,1);
Select concat("La letra del DNI es ", @myletra);
set @numero = left(mydni,8);
Select concat("El número del DNI es ", @numero);
set @myresto = MOD(@numero,23);

Select concat("El resto da ", @myresto);

set @letracorrecta = (Select letra from test.dni where resto=@myresto);
Select concat("La letra en la BBDD es ", @letracorrecta);

IF @letracorrecta = @myletra THEN
    Select concat("la letra ", @letracorrecta, " coincide con la del DNI: ", @myletra);
ELSE
    Select concat("la letra ", @letracorrecta, " no coincide con la del DNI: ", @myletra);     
END IF;
end

use test;
call p_DNI('43453468M');