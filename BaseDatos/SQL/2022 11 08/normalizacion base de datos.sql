/*
 * relaciones
 *//

create table proveedores(
	id int primary key not null auto_increment, 
	nombre varchar(100) not null,
	rut varchar(100) not null
);

/**
 * Proveedor
 * 
 * */

create table direcciones(
	id int primary key not null auto_increment,
	calle varchar(100) not null,
	numero int not null,
	sector varchar(100) not null,
	ciudad varchar(100) not null,
	region varchar(100) not null,
	codigo_postal int,
	proveedor_id int not null
);

/*añadir una clave foranea creando a la misma vez la columnad de la clave foranea 
 * 
*alter table direcciones add constraint fk_proveedor_id foreign key (proveedor_id) references proveedor(id);
*/

alter table direcciones add foreign key (proveedor_id) references proveedores(id);


insert into generationc2.proveedores 
(nombre,rut)
values('fran spa','111111-1'),
('Carlos spa' ,'2222222-2'),
('Teresa spa' ,'3333333-3'),
('Manuel spa' ,'4444444-4')
;

select * from proveedores;

insert into generationc2.direcciones 
(calle,numero,sector,ciudad,region,codigo_postal,proveedor_id)
values
("pasaje manzanillon",111,"san bernardo","santiago","metropolitana",111,1),
("pasaje peral",222,"san bernardo","santiago","metropolitana",222,2),
("pasaje naranjo",333,"san bernardo","santiago","metropolitana",333,3),
("pasaje palto",444,"san bernardo","santiago","metropolitana",444,4)
;

select * from direcciones d ;






