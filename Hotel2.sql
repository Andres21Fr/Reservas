create database Hotel2
create table usuario(
id_usuario NUMERIC not null,
nombre_usuario varchar(20) not null,
contraseña varchar(30) not null,
tipo_de_usuario varchar(45) not null,
primary key (id_usuario))

create table habitacion(
numero_habitacion numeric not null,
tipo_habitacion varchar(30) not null,
precio_habitacion float not null,
estado_habitacion varchar(30) not null,
primary key (numero_habitacion))

create table clientes(
id_cliente NUMERIC not null,
nombre_cliente varchar(20) not null,
apellido_cliente varchar(20) not null,
telefono_cliente numeric,
edad_cliente INT not null, 
correo_cliente varchar(45) not null,
id_usuario NUMERIC not null,
primary key (id_cliente),
foreign key (id_usuario) references usuario)

create table factura(
codigo_factura INT not null,
fecha_factura varchar(30) not null,
hora_factura varchar(20) not null,
valor_factura float not null,
id_usuario NUMERIC not null,
id_cliente int not null,
nombre_cliente varchar(20)not null,
primary key (codigo_factura),
foreign key (id_usuario) references usuario)

create table reserva(
codigo_reserva INT not null,
medio_reserva varchar(50) not null,
cantidad_personas varchar(20)not null,
fecha_inicio varchar(30) not null,
dias_reserva INT not null,
fecha_final varchar(25) not null,
id_usuario NUMERIC not null,
numero_habitacion numeric not null,
id_cliente NUMERIC not null,
primary key (codigo_reserva),
foreign key (id_usuario) references usuario,
foreign key (numero_habitacion) references habitacion,
foreign key (id_cliente) references clientes)

create table servicio(
codigo_servicio INT not null,
tipo_servicio varchar(30) not null,
descripcion_servicio varchar(100) not null,
valor_servicio float not null,
fecha_servicio varchar(20) not null,
primary key (codigo_servicio))

create table habitacion_servicio(
numero_habitacion numeric not null,
codigo_servicio INT not null)
----------------------------------------------------------------------
insert into usuario (id_usuario, nombre_usuario,contraseña, tipo_de_usuario)
values (11,'Cristobal','Cristobal11','recepcionista')

insert into usuario (id_usuario, nombre_usuario,contraseña, tipo_de_usuario)
values (12,'Alvaro','Alvaro12','recepcionista')

insert into usuario (id_usuario, nombre_usuario,contraseña, tipo_de_usuario)
values (13,'Daniel','Daniel13','administrador')
--------------------------------------------------------------------------
insert into habitacion (numero_habitacion, tipo_habitacion, precio_habitacion,estado_habitacion)
values (21,'Estandar',80000,'Ocupado')

insert into habitacion (numero_habitacion, tipo_habitacion, precio_habitacion,estado_habitacion)
values (22,'Familiar',120000,'Ocupado')

insert into habitacion (numero_habitacion,tipo_habitacion,precio_habitacion,estado_habitacion)
values (23,'Estandar',80000,'Disponible')
--------------------------------------------------------------------------------------------------
insert into clientes (id_cliente, nombre_cliente, apellido_cliente, telefono_cliente, edad_cliente, correo_cliente,id_usuario)
values (31,'Oscar','campo',30245168,18,'Oscar@gmail.com',11)

insert into clientes (id_cliente,nombre_cliente, apellido_cliente, telefono_cliente, edad_cliente, correo_cliente,id_usuario)
values (32,'Mariana','jimenez',33014528,29,'Mariana@gmail.com',12)

insert into clientes (id_cliente,nombre_cliente, apellido_cliente, telefono_cliente, edad_cliente, correo_cliente,id_usuario)
values (33,'Antonio','barrera',330143444,25,'Antonio@gmail.com',12)
------------------------------------------------------------------------------------------------
insert into factura(codigo_factura, fecha_factura,hora_factura, valor_factura,id_usuario,id_cliente,nombre_cliente)
values (41,'15/06/2022','1:36pm', 480000,11,31,'Oscar')

insert into factura(codigo_factura, fecha_factura,hora_factura, valor_factura,id_usuario,id_cliente,nombre_cliente)
values (42,'20/02/2022','2:26pm', 600000,12,32,'Mariana')

insert into factura(codigo_factura, fecha_factura,hora_factura, valor_factura,id_usuario,id_cliente,nombre_cliente)
values (43,'25/07/2022','5:36pm', 320000,11,33,'Antonio')
-----------------------------------------------------------------------------------------------------------------
insert into reserva (codigo_reserva, medio_reserva,cantidad_personas, fecha_inicio,dias_reserva, fecha_final, id_usuario, numero_habitacion, id_cliente)
values (1024,'Telefono',2,'14/06/2022',6,'20/06/2022',11, 21, 31)

insert into reserva (codigo_reserva, medio_reserva,cantidad_personas, fecha_inicio,dias_reserva, fecha_final, id_usuario, numero_habitacion, id_cliente)
values (1025,'Web',4,'15/02/2022',5,'20/02/2022', 12, 22, 32)

insert into reserva (codigo_reserva, medio_reserva,cantidad_personas, fecha_inicio,dias_reserva, fecha_final, id_usuario, numero_habitacion, id_cliente)
values (1026,'Presencial',2,'21/07/2022',4,'25/07/2022', 11, 23, 33)
------------------------------------------------------------------------------------------------------
insert into servicio (codigo_servicio, tipo_servicio, descripcion_servicio, valor_servicio, fecha_servicio)
values (601,'Exclusivo','Television por cable, desalluno y almuerzo gratis, servicio al cuarto, Wifi',100000, '15/02/2022')

insert into servicio (codigo_servicio, tipo_servicio, descripcion_servicio, valor_servicio, fecha_servicio)
values (602,'Corriente','tv,internet,close pequeño',50000,'21/07/2022') 
------------------------------------------------------------------------------------------------------------

----------------------------------------------consultas SQL-----------------------------------------------------

1. mostrar el tipo y precio de la habitacion, el nombre y apellido del cliente registrado en la reserva 1025

select tipo_habitacion,precio_habitacion,nombre_cliente,apellido_cliente
from habitacion,clientes,reserva
where habitacion.numero_habitacion = reserva.numero_habitacion and clientes.id_cliente = reserva.id_cliente  and reserva.codigo_reserva = 1025
------------------------------------------------------------------------------------------------------------------------------------------------------------
2. mostrar el valor de la factura y el nombre del usuario que registro la reserva en la fecha 23/05/2022

select valor_factura,nombre_usuario
from factura,usuario,reserva
where factura.codigo_factura = reserva.codigo_factura and usuario.id_usuario = reserva.id_usuario and fecha_reserva = '23/05/2022'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. mostrar el tipo de habitacion y el valor servicio, fecha y hora, medio de la reserva, nombre y apellido del cliente y el nombre de usuario que realizo la reserva 3456

select tipo_habitacion,valor_servicio,fecha_servicio,hora_servicio,medio_reserva,nombre_cliente,apellido_cliente,nombre_usuario
from habitacion,servicio,reserva,clientes,usuario,habitacion_servicio
where habitacion.numero_habitacion = reserva.numero_habitacion  and clientes.id_cliente = reserva.id_cliente and usuario.id_usuario = reserva.id_usuario and 
servicio.codigo_servicio = habitacion_servicio.codigo_servicio and  habitacion.numero_habitacion = habitacion_servicio.numero_habitacion and reserva.codigo_reserva = 3456

select * from habitacion

ALTER TABLE habitacion
ADD estado_habitacion varchar(20)

update habitacion set estado_habitacion = 'Disponible'
where numero_habitacion = 503

 

update reserva set numero_habitacion = 503
where codigo_reserva = 1025

select * from clientes

select codigo_reserva
from reserva

select * from servicio

Select id_usuario, contraseña,tipo_de_usuario from usuario where id_usuario =   contraseña 
select * from clientes

select *from servicio  

update servicio set tipo_servicio='Exclusivo',descripcion_servicio ='pepe flow',valor_servicio =543 where   codigo_servicio = 603

select * from habitacion
update habitacion set tipo_habitacion = 'Familiar',precio_habitacion=1,estado_habitacion='Disponible' where numero_habitacion = 24
delete habitacion set tipo_habitacion = 'Familiar',precio_habitacion=1,estado_habitacion='Disponible' where numero_habitacion = 24