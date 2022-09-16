-- Procedimiento que aplica un descuento en (%), 
-- enviando ese descuento el nombre de la editorial
-- Si recibe, el string "todos", aplica el descuento a todos
    -- los libros
-- El proc. me devuelve el número de libros afectados
    -- por el descuento en @cant

use libreria;


drop procedure if exists p_libreria;
create procedure p_libreria(in cantidad int, in p_editorial varchar(10), out cant int)
begin

IF p_editorial="Todas" THEN
    update libros set precio = precio * (1-cantidad/100);
    set cant = (select count (*) from libros);
ELSEIF (Select count (*) from libros where editorial = p_editorial) > 0 THEN
    update libros set precio = precio * (1-cantidad/100) where editorial = p_editorial; 
    set cant = (select count (*) from libros where editorial = p_editorial);
ELSE
    Select "Editorial incorrecta";
    set cant = 0;
END IF;

end

use libreria;
call p_libreria(5, "Planeta", @cant);
Select concat("Se han actualizado ", @cant, " libro/s");