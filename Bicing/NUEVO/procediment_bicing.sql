use bicing;
drop procedure if exists proc_bicing;
delimiter //
create procedure proc_bicing(in nombre_tarifa_proc varchar(45), out informacio varchar(45))
begin
	declare descripcio_tarifa varchar(45);
	case nombre_tarifa_proc
		when "Anual" then
			set informacio = "Tarifa Plana Anual"; 
			
		when "Uso" then
			set informacio = "Tarifa de us"; 
			
		when "A.Mecánica_30" then
			set informacio = "Anual + Mecánica primeros 30 minutos"; 
	        
        when "A.Eléctrica_30" then
			set informacio = "Anual + Eléctrica primeros 30 minutos"; 
			
        when "U.Mecánica_30" then
			set informacio = "Uso + Mecánica primeros 30 minutos"; 
			
        when "U.Eléctrica_30" then
			set informacio = "Uso + Eléctrica primeros 30 minutos"; 
			
        when "A.Mecánica_120" then
			set informacio = "Anual + Mecánica hasta 2h"; 
			
        when "A.Eléctrica_120" then
		    set informacio = "Anual + Eléctrica hasta 2h"; 
			
        when "U.Mecánica_120" then
			set informacio = "'Uso + Mecánica hasta 2h"; 
		
        when "U.Eléctrica_120" then
			set informacio = "Uso + Eléctrica hasta 2h"; 
			
        when "A.Mecánica_150" then
			set informacio = "Anual + Mecánica más de 2h";  
			
        when "A.Eléctrica_150" then
			set informacio = "Anual + Eléctrica más de 2h";  
		
        when "U.Mecánica_150" then
			set informacio = "Uso + Mecánica más de 2h"; 
		
        when "U.Eléctrica_150" then
			set informacio = "Uso + Eléctrica más de 2h";  
		
              
            
		else
			set informacio = "no hi ha cap tarifa";  
			
	end case;
    
end //

call proc_bicing("U.Mecánica_150", @informacio);
select @informacio;