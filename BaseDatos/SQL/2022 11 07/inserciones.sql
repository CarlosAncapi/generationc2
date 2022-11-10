--insertar datos en tabla de un registro a la vez

insert into administrativos (id,nombre, apellido) 
values(1, "Manuel", "perez");
----------------------------------------------------

insert into directivos (nombre, apellido) 
values("Maggie", "Fernandez");

insert into directivos (nombre, apellido) 
values("Rafael", "Guerrero");
--------------------------------------------------------

insert into estudiantes (id,nombre, apellido) 
values(1,"Pedro","Hernandez");

insert into estudiantes (nombre, apellido) 
values("Carlos ","Ancapi");
----------------------------------------------------

insert into profesores (id,nombre, apellido) 
values(1,"Jorge","Palma");
----------------------------------------------------

insert into tecnicos (id,nombre, apellido) 
values(1,"Anays","Espinoza");
----------------------------------------------------

--insercion de datos de multiples registros a la vez
insert into directivos(nombre, apellido)
values ("Lau","Soto"),("Andrea","Montecinos");


select * from estudiantes;

select *from directivos;

select *from directivos
where id =2
;

------------------------------------------------------------------------------------------------
--tarea crear tabla mascotas, minimo 4 columnas, minimo 4 inserciones
CREATE TABLE generationc2.mascotas (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT null,
	patas int not null,
	anno_nacimiento int not null
);

insert into mascotas (nombre, patas, anno_nacimiento)
values ("Perrito",4,2010), ("Gatito", 4,2014), ("Patito",2,2020),("Cuyito",4,2021) ;

select * from mascotas;

select *from mascotas
where id =2
;

select *from mascotas
where nombre ="Cuyito"
;


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
--modificar los datos

--eliminar una tabla junto a sus registros
drop table directivos;
-------------------------------------------

--eliminar todos los registros de una tabla pero manteniendo la tabla 
truncate table directivos;
-------------------------------------------

--modificar el  dato de una columna especifica
update nombre_tabla set nombre_columna = el_nuevo_dato where condicion 
--ejem
update directivos set nombre = "Laura" where nombre ="Lau";
select * from directivos;

--aqui haremos un error y setearemos todos los datos de una columa omitiendo la condicion wheere aqui dejaremos todos los registros con el nombre Laura
update directivos set nombre = "Laura";
select * from directivos;

--borraremos los datos de la tabla, y como ya tenemos los inserts mas arriba los agregaremos otra vez para recuperar los datos
truncate table directivos;

--luego de agreagar los inserts mas el seteo del valor de lau a laura comprobamos si recuperamos los datos con la siguiente consulta
select * from directivos;
---------------------------------------------------------------------------------------

--mostrar columnas especificas con un orden especificos con alias
select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.id<4 and d.id>1
order by d.id desc ;

select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.nombre="andrea" and d.apellido = "montecinos" ;

INSERT into directivos ( nombre, apellido) 
values ("Andres","Soto");
INSERT into directivos ( nombre, apellido) 
values ("Andrea","Montina");
INSERT into directivos ( nombre, apellido) 
values ("Andrea","Carrasco");
INSERT into directivos ( nombre, apellido) 
values ("Ana","Rubio");

--busca la concidencia en cualquier parte de la palabra dependiendo pongo el sigo porcentaje o si uso dos signos porcentajes en el wheere
select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.nombre like "an%" ;

select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.nombre like "%e" ;

select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.nombre like "%an%" ;

select d.nombre as first_name, d.id as numero_identificador
from directivos d
where d.nombre like "%an%" and d.apellido like "%o"
;

------------------------------------------------------------------------


--crear tabla cursos

CREATE TABLE generationc2.cursos (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT null,
	cantidad_alumnos int not null,
	especialidad varchar(100) not null
);

insert into cursos 
(nombre, cantidad_alumnos,especialidad)
value ("cohorte 1",30,"Java"),
("cohorte 2",34,"Java"),
("cohorte 3",35,"Java")
;

select * from cursos;

--ahora grego la clave foranea alterando la tabla estudiantes
alter table estudiantes 
add cursoId int;

--relacionando las tablas de estuciantes y cursos
alter table estudiantes 
add foreign key(cursoId) references cursos(id);

select * from estudiantes;

--agregando registros ahora con la nueva columna de la llave foranea recien añadida

insert into estudiantes 
(nombre, apellido, cursoId)
values ("Jhon", "Doe", 1),
("Jane", "Doe", 2),
("Ayun", "Doe", 2),
("Zoe", "Doe", 3),
("Frank", "Doe", 3)
;

select * from estudiantes;






