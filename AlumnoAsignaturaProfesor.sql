create database AlumnoAsignaturaProfesor;
use AlumnoAsignaturaProfesor;

create table Alumno (
-- El auto_increment va aquí
Num_matrícula varchar (20) auto_increment,
Nombre  varchar (20),
Fecha_Nacimiento  varchar (20),
Teléfono  varchar (20),
-- Y NO AQUÏ.
primary key (Num_matrícula)
);

create table Profesor (
ID_P int(10),
NIF_P  varchar (20),
Nombre  varchar (20),
Teléfono  varchar (20),
Especialidad  varchar (20),
primary key(ID_P)
);

create table Asignatura (
Código_Asignatura  varchar (20),
Nombre  varchar (20),
AsignaturaProfesor int(10),
primary key (Código_Asignatura),
constraint foreign key (AsignaturaProfesor) references Profesor (ID_P)
);

create table matrícula (
Código_Asignatura varchar (20),
Num_matrícula varchar (20),
-- Por defecto lleva solo hasta aquí, pero se le pueden añadir campos, como el Curso.
Curso varchar (100),
-- Si no hay que relacionar una tabla con otra, no necesita primary key.
constraint foreign key (Código_Asignatura) references Asignatura (Código_Asignatura),
constraint foreign key (Num_matrícula) references Alumno (Num_matrícula)
);

-- El tipo DATE va con año-mes-día
-- La cantidad de algo es count(*)

