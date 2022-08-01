create database Empleado_Departamento;
use Empleado_Departamento;

create table Departamento (
Código_D int (5),
Nombre varchar (20) not null,
Localización varchar (50),
-- Para que el auto increment funcione, si el campo es null o default, ha de ser numérico.
primary key auto_increment (Código_D)
);

create table Empleado (
ID_E int (5),
DNI_E varchar (15),
Nombre varchar (15),
Salario int (10),
Teléfono varchar (15),
Departamento_Empleado int (5),
primary key auto_increment (ID_E),
-- De esta manaera, cada entrada de Empleado tiene 1 departamento. Si fuera en el Departamento,
-- necesitaríamos una entrada por cada uno de los empleados.
constraint foreign key (Departamento_Empleado) references Departamento(Código_D)
);


-- Los autoincrement numéricos funcionan tanto con default como con null.
Insert into Departamento values
(default,un_nombre,una_localización);

Insert into Empleado values
(null,00000000J,un_nombre,23432142,2352352,1);


Select * from Empleado;
Select * from Departamento;
Select * from Departamento WHERE localización='Barcelona';
-- MYSQL usa LIMIT, que es el TOP de SQL Server
Select Nombre from Empleado order by salario desc limit 1;