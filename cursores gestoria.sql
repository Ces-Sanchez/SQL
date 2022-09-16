use gestoria;

show tables;

use gestoria;
set @vendedor = 2;
set @producto = 5;
set @fecha = '2020-12-12';
set @unidades = 5;
set @precio = (select precio from producto where idproducto = @producto);
set @importe = @precio * @unidades;
insert into detalle_factura values (@vendedor,@producto,@fecha,@unidades,@importe);

--------------------------------------------------

use gestoria;
drop table if exists temp_ventas;
create table temp_ventas(
	id int primary key auto_increment,
    vendedor int, importe int);

use gestoria;
drop procedure if exists proc_mejor_vendedor;
create procedure proc_mejor_vendedor(in fecha_inicio date, in fecha_fin date)
begin
	-- declaracion de variables
    declare done boolean default false;
	-- declaracion de variables temporales 
    declare vendedor_actual int;
    declare importe_actual int;
    declare fecha_actual date;
    declare importe1 int default 0;
    declare importe2 int default 0;
    declare importe3 int default 0;
    declare importe4 int default 0;
    declare importe5 int default 0;
    -- declarar cursor para la consulta
    declare suma_ventas cursor for select idvendedor, fecha, importe from detalle_factura; 
    -- declarar el manejador de error tipo "NOT FOUND"
    declare continue handler for not found set done = true;
        -- setear la mayor suma de importes para un vendedor
    set @Mayor_Venta = (select sum(importe) from detalle_factura group by idvendedor order by sum(importe) desc limit 1 where fecha between fecha_inicio and fecha_fin);
    Select concat("Mayor Venta al inicio de todo: ", @Mayor_Venta);
    -- Abrir el cursor
    open suma_ventas;
    -- lectura de filas mediante bucle
    loop_lectura: loop
		-- lectura de la primera fila
        fetch suma_ventas into vendedor_actual, fecha_actual, importe_actual;
        select vendedor_actual, fecha_actual, importe_actual;
        -- Si el cursor detecta que no hay fila para leer, salimos
        -- del loop
        if done then
            CASE    
                WHEN importe1=@Mayor_Venta then insert into temp_ventas values (default, 1, importe1);
                WHEN importe2=@Mayor_Venta then insert into temp_ventas values (default, 2, importe2);
                WHEN importe3=@Mayor_Venta then insert into temp_ventas values (default, 3, importe3);
                WHEN importe4=@Mayor_Venta then insert into temp_ventas values (default, 4, importe4);
                WHEN importe5=@Mayor_Venta then insert into temp_ventas values (default, 5, importe5);
                ELSE select "importes no coinciden con mayor venta";
			END CASE;
            leave loop_lectura;
		end if;
		-- gestion de la mejor nota (con variable temporal)
        if fecha_actual between fecha_inicio AND fecha_fin then
            CASE vendedor_actual
                WHEN "1" then set importe1 = importe1 + importe_actual;
                WHEN "2" then set importe2 = importe2 + importe_actual;
                WHEN "3" then set importe3 = importe3 + importe_actual;
                WHEN "4" then set importe4 = importe4 + importe_actual;
                WHEN "5" then set importe5 = importe5 + importe_actual;
                ELSE select "vendedor actual no encontrado";
            END CASE;
        end if;
    end loop;
    -- cerrar el cursor
    close suma_ventas;
end

-- comprobacion

use gestoria;
select idvendedor, fecha, importe from detalle_factura;
select * from detalle_factura;

use gestoria;
call proc_mejor_vendedor('2020-01-01','2020-12-31');
Select * from temp_ventas; 


