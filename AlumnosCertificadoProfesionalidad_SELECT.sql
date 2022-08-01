use ifcd_0112 ;

-- 1. Obtener el total de horas del módulo MF0226_3
Select total NúmeroHoras from Módulos where Código_Módulos=MF0226_3;

-- 2. Obtener la cantidad de alumnos suspendidos en la UF2175
Select count Alumnos_DNI_Alumnos from Notas where Nota_Alumnos_has_Asignaturas<5;

-- 3. Obtener el promedio de las notas del curso
Select avg(Nota_Alumnos_has_Asignaturas) from Notas;

-- 4. Obtener los nombres de los módulos que son transversales
Select Código_Módulos from Módulos where Transversal=True;

