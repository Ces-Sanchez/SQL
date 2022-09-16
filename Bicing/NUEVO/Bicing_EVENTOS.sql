-- EVENTO
set global event_scheduler = ON;


drop event if exists backup_taules_bicing_Event;
create event backup_taules_bicing_Event
on schedule every 1 week starts '2022-09-15 20:24:00'

do
	call copiar_taules_bicing();

-- PROC
drop procedure if exists copiar_taules_bicing;
delimiter //
create procedure copiar_taules_bicing()
begin 
	drop table if exists estacion_backup;
    drop table if exists bicicleta_backup;
    drop table if exists tarifa_backup;
    drop table if exists usuario_backup;
    drop table if exists servicio_backup;
    drop table if exists bicicleta_has_estacion;
    -- crea una tabla "backup" con la misma estructura sin DATOS!
    create table estacion_backup like estacion;
    create table bicicleta_backup like bicicleta;
    create table tarifa_backup like tarifa;
    create table usuario_backup like usuario;
    create table servicio_backup like servicio;
    create table bicicleta_has_estacion_backup;
    
    -- inserta datos
    insert estacion_backup select * from estacion;
    insert bicicleta_backup select * from bicicleta;
    insert tarifa_backup select * from tarifa;
    insert usuario_backup select * from usuario;
    insert servicio_backup select * from servicio;
    insert bicicleta_has_estacion_backup select * from bicicleta_has_estacion;
end //

delimiter ;