-----------
-- alquila
-----------

use bicing;

drop trigger if exists alquila;
create trigger alquila after insert on servicio
for each row
begin 
	delete from bicicleta_has_estacion where bicicleta_id_bicicleta=new.servicio_id_bicicleta;
end



-------------
-- comprobare
-------------

use bicing;
Select * from bicicleta;
Select * from bicicleta_has_estacion;
Select * from servicio;

use bicing;
INSERT INTO `bicing`.`servicio` (`servicio_id_usuario`, `servicio_id_bicicleta`, `servicio_finalizado`) VALUES (1, 1, 0);

-----------------------------------------------------------------

-----------
-- devuelve
-----------

use bicing;

drop trigger if exists devuelve;
create trigger devuelve after insert on bicicleta_has_estacion
for each row
begin 
	update servicio set servicio_finalizado = 1 where servicio_id_bicicleta = new.bicicleta_id_bicicleta;
end


-------------
-- comprobare
-------------

use bicing;
insert into bicicleta_has_estacion values (1,5);

use bicing;
Select * from bicicleta_has_estacion;
Select * from servicio;

-----------------------------------------------------------------

---------
-- repara
---------

use bicing;
drop trigger if exists repara;
create trigger repara after insert on incidencias
for each row
begin 
	update bicicleta set estado_bicicleta = 'averiada' where id_bicicleta = new.bicicleta_id_bicicleta;
	DELETE FROM bicicleta_has_estacion where bicicleta_id_bicicleta = new.bicicleta_id_bicicleta;
end

-------------
-- comprobare
-------------

use bicing;
Select * from bicicleta;
Select * from incidencias;
Select * from bicicleta_has_estacion;

use bicing;
INSERT INTO `bicing`.`incidencias` (`bicicleta_id_bicicleta`, `descripción`,`estado`) VALUES (1, 'rueda pinchada', 'En reparación'); 

use bicing;
Select * from bicicleta;
Select * from incidencias;
Select * from bicicleta_has_estacion;


--------------
-- Ya reparada
--------------

use bicing;
drop trigger if exists ya_reparada;
create trigger ya_reparada after update on incidencias
for each row
begin 
	update bicicleta set estado_bicicleta = 'funcionando' where id_bicicleta = old.bicicleta_id_bicicleta;
end