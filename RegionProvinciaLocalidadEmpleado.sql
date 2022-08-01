create database RegionProvinciaLocalidadEmpleado;
use RegionProvinciaLocalidadEmpleado;

create table Región(
Nombre_Región varchar (20),
primary key (Nombre_Región)
);

create table Provincia (
Código_Provincia  varchar (20),
Nombre_Provincia  varchar (20),
primary key (Código_Provincia)
);

create table Localidad (
Código_Localidad varchar (20),
Nombre_Localidad varchar (20),
primary key (Código_Localidad)
);
 
create table Empleado (
ID_E varchar (20),
DNI_E varchar (20),
Nombre varchar (20),
Teléfono varchar (20),
Salario varchar (20),
primary key (ID_E)
);

create table nacimiento (
ID_Nacimmiento  varchar (20),
Nacimiento_Código_Localidad varchar (20),
Nacimiento_ID_E varchar (20),
primary key (ID_Nacimmiento),
constraint foreign key (Nacimiento_Código_Localidad) references Localidad (Código_Localidad),
constraint foreign key (Nacimiento_ID_E) references Empleado (ID_E)
);
