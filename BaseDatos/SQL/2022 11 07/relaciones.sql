--ejercicio
/**
*tabla direcciones 
*id, nombre, numero, ciudad
*
*agregar a todas las tablas la relacion
*
*2 inserciones en las tablas 
*
*administrativos,estudiantes, directivos
*/

CREATE TABLE generationc2.direcciones (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT null,
	numero int not null,
	ciudad varchar(100) not null
);

insert into direcciones
(nombre, numero,ciudad )
values ("pedro de valdivia",111, "osorno"),
("manuel montt",222,"santiago"),
("dimantes",333,"Valparaiso"),
("Almirante Riveros",444,"Coquimbo")
;

--estudiantes

alter table estudiantes 
add direccionId int;

alter table estudiantes 
add foreign key(direccionId) references direcciones(id);

insert into estudiantes 
(nombre, apellido, cursoId, direccionId)
values ("carlos", "ancapi", 2, 2),
("Pedro", "gonzales", 3, 1),
("Gonzalo", "ancapi", 2, 4)
;

select * from estudiantes;
--------------------------------------------------

--administartivos

alter table administrativos
add direccionId int;

alter table administrativos 
add foreign key(direccionId) references direcciones(id);

insert into administrativos 
(nombre, apellido, direccionId)
values ("carlos", "ancapi", 2),
("Pedro", "gonzales",  1),
("Gonzalo", "ancapi", 4)
;
select * from administrativos;
---------------------------------------------------

--directivos

alter table directivos
add direccionId int;

alter table directivos
add foreign key(direccionId) references direcciones(id);

insert into directivos 
(nombre, apellido, direccionId)
values ("carlos", "ancapi", 2),
("Pedro", "gonzales",  1),
("Gonzalo", "ancapi", 4)
;

select * from directivos;