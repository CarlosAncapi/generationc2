--creacion de usuario
CREATE USER 'carlos'@'localhost' IDENTIFIED BY 'Admin1234*';
--otorgar todos los permisos al usuario creado
GRANT ALL PRIVILEGES ON *.* TO 'carlos'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


--creacion de usuario para acceso remoto
CREATE USER 'carlos'@'%' IDENTIFIED BY 'Admin1234*';
--otorgar todos los permisos al usuario remoto creado
GRANT ALL PRIVILEGES ON *.* TO 'carlos'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--------------------------------------------------------------------------------

--crear tablas

--tabla profesores
CREATE TABLE generationc2.profesores (
	id BIGINT NOT NULL,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

--tabla administrativos
CREATE TABLE generationc2.administrativos (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
);

--comando para borrar tablas
drop table estudiante;
drop table profesores;

--tabla estudiantes
CREATE TABLE generationc2.estudiantes (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
);

--tabla profesores
CREATE TABLE generationc2.profesores (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
)

--tabla directivos
CREATE TABLE generationc2.directivos (
	id INT PRIMARY KEY NOT null AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
);

--tabla tecnicos
CREATE TABLE generationc2.tecnicos (
	id INT not null,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL
);

--modificando la tabla diciendo que la columna id de la tabla tecnicos ahora sera llave primaria y no sera nula 
alter table generationc2.tecnicos modify column id int primary key auto_increment not null;

--describir tabla 
describe profesores;

--consulta
select * from administrativos;

