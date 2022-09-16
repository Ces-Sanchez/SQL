-- 2- ACTUALIZACIÓN DE UN REGISTRO
-- Cada vez que se cree o elimine una relación
-- Categoría-Video, añadiremos o disminuiremos
-- una unidad en el registro “categoryCount”
-- comprobación INSERT
-- comprobación DELETE

use Videoclub;

drop trigger if exists actualiza;

create trigger actualiza after insert on relvideocategory
for each row
begin 
	update category set categoryCount = categoryCount + 1 WHERE idCategory = new.idCategory;
end

use Videoclub;
Select * from video;
Select * from actor;
Select * from relvideoactor;
use Videoclub;
Select * from category;
Select * from RelVideoCategory;

use Videoclub;
SET FOREIGN_KEY_CHECKS = 0;
INSERT into relvideocategory values (1,5);

use Videoclub;
Select * from category;

-------------------------------------------------

use Videoclub;
drop trigger if exists actualiza;

create trigger actualiza before delete on relvideocategory
for each row
begin 
	update category set categoryCount = categoryCount - 1 WHERE idCategory = old.idCategory;
end

use Videoclub;
Delete from RelVideoCategory where idVideo = 1 AND idCategory = 5;


use Videoclub;
Select * from video;
Select * from actor;
Select * from relvideoactor;

use Videoclub;
Select * from category;
Select * from RelVideoCategory;

use Videoclub;
SET FOREIGN_KEY_CHECKS = 0;
INSERT into relvideocategory values (1,5);

use Videoclub;
Select * from category;

-------------------------------------------------

-- 3- AUTODESTRUCCIÓN
-- Borra el actor que no tenga asignado
-- ninguna película.
-- Si se borra una relación de un actor
-- con una película, se resta una unidad
-- en el campo “actorCount” y, si es igual a cero,
-- se borra el actor.
-- comprobación

use Videoclub;
Select * from actor;
Select * from relvideoactor;

use Videoclub;
drop trigger if exists despedido;
create trigger despedido before delete on relvideoactor
for each row
begin 
	update actor set ActorCount = ActorCount - 1 WHERE idActor = old.idactor;
    IF (Select ActorCount from actor where idactor = old.idactor) = 0 then
        delete from actor where idactor = old.idactor;
    END IF;
end

use Videoclub;
SET FOREIGN_KEY_CHECKS = 0;
Delete from relvideoactor where idActor=5;