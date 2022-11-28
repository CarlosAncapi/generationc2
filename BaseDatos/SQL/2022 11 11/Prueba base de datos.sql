--tabla proveedores
--tabla producto proveedor
--tabla venta


--informe anual con el total de ganancias de las ventas


---tabla
create database pruebaDB;


--------------------------------------------------------------------------

create table proveedores(
	id_proveedor int primary key not null AUTO_INCREMENT,
	nom_prov Varchar(100) not null,
	rut varchar(13) not null,
	nom_contac varchar(50)not null,
	fono varchar(133) not null,
	celular varchar(12)not null,
	email varchar (50)not null

);

insert into proveedores
(nom_prov, rut, nom_contac, fono, celular, email)
values
("carlos spa", "11.111.111-1", "carlos", "11111111","11111111","carlos@spa.cl"),
("Ivan spa", "22.222.222-2","ivan", "22222222","22222222","ivan@spa.cl"),
("Michel spa", "33.333.333-3","michel", "33333333","33333333","michel@spa.cl"),
("Teresa spa", "44.444.444-4","teresa", "44444444","44444444","Teresa@spa.cl"),
("Ina spa", "55.555.555-1","ignacia", "55555555","55555555","ina@spa.cl")
;

---------------------------------------------------------------------------------------

create table productos_proveedores(
	id_producto_prov int primary key not null AUTO_INCREMENT,
	nom_producto Varchar(100) not null,
	detalle_prod varchar(100) not null,
	precio_prov int not null,
	precio_venta int not null,
	precio_venta_con_iva int not null,
	id_proveedor int not null
);

insert into productos_proveedores
(nom_producto,detalle_prod,precio_prov, precio_venta, precio_venta_con_iva, id_proveedor )
values
("yogurt nestle","100 grs",100, 120, 143, 1 ),
("chocolate fruna","100 grs",1000, 1200, 1428, 2 ),
("mani","200grs",2000, 2400, 2856, 3 ),
("confort noble","8 rollos",2100, 2500, 2975, 4 ),
("leche","1000 grs",5500,7000, 8330, 5 )
;

alter table productos_proveedores add foreign key (id_proveedor) references proveedores(id_proveedor);

--------------------------------------------------------------------------------------

create table ventas(
	id_venta  int primary key not null AUTO_INCREMENT,
	cantidad_producto int not null,
	id_producto_prov int not null,
	id_boleta int not null
);

insert into ventas
(cantidad_producto, id_producto_prov,id_boleta )
values
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5)

;

alter table ventas add foreign key (id_producto_prov) references productos_proveedores(id_producto_prov);
alter table ventas add foreign key (id_boleta) references boleta(id_boleta);
-----------------------------------------------------------------------------------------

create table boleta(
	id_boleta int primary key not null AUTO_INCREMENT,
	subtotal_sin_iva int not null,
	total_con_iva int not null,
	fecha_venta date not null
);

insert into boleta
(subtotal_sin_iva, total_con_iva,fecha_venta )
values
(120, 143,'2021-01-01' ),
(2400, 2856,'2021-03-01' ),
(7200, 8568,'2021-06-01' ),
(10000, 11900,'2021-09-01' ),
(35000, 41650,'2021-12-01' )
;

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--consulta que une todas las tablas
--mostrando la relacion que hay entre todas

select b.id_boleta, b.subtotal_sin_iva,b.total_con_iva,
v.cantidad_producto,
pp.id_producto_prov, pp.nom_producto,pp.precio_venta, pp.precio_venta_con_iva,
p.nom_prov
from boleta as b 
inner join ventas as v
on b.id_boleta = v.id_boleta
inner join productos_proveedores as pp 
on pp.id_producto_prov = v.id_producto_prov
inner join proveedores as p 
on p.id_proveedor = pp.id_proveedor
;




----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


--consulta de la prueba 
--total dinero ganado en un año de ventas 


select sum(pp.precio_prov*v.cantidad_producto) as "total ventas precio proveedor", 
sum(pp.precio_venta*v.cantidad_producto) as "total ventas sin iva",
(sum(pp.precio_venta*v.cantidad_producto)-sum(pp.precio_prov*v.cantidad_producto)) as "total ganado en el año"
from boleta as b 
inner join ventas as v
on b.id_boleta = v.id_boleta
inner join productos_proveedores as pp 
on pp.id_producto_prov = v.id_producto_prov
where b.fecha_venta between'2021-01-01' and '2021-12-31'
;
