
CREATE DATABASE Agencia_Vuelos;

USE Agencia_Vuelos;

drop database Agencia_Vuelos;

create table Pais(
IdPais char(50) primary key not null,
Nombre varchar(60) not null
)auto_increment=1;

create table Pasajero 
(
IdPasajero int auto_increment primary key,
Nombre varchar(60),
Apellido varchar(60),
Tipo_Documento varchar(60),
Num_Documento varchar(20),
Fecha_Nacimiento date,
IdPais char(50),
Telefono char(9),
Email varchar(50)
)auto_increment=1;

create table Pago
(
IdPago int auto_increment primary key,
IdReserva int,
Fecha date,
IdPasajero int,
Monto decimal(8,2),
Tipo_Comprobante varchar(60),
Num_Comprobante varchar(60)
)auto_increment=1;


create table Reserva(
IdReserva int auto_increment primary key,
Costo decimal(8,2),
Observacion varchar(60)
)auto_increment=1;


create table Vuelo
(
IdAvion int,
IdReserva int,
Nombre_Aeropuerto varchar(60),
Pais_Aeropuerto varchar(50),
Tarifa decimal(8,2),
Asiento varchar(10)
);

create table Avion(
IdAvion int auto_increment primary key,
Aerolinea varchar(50),
Tipo varchar(60),
Capacidad varchar(40)
)auto_increment=1;


create table Usuario(
IdUsuario int auto_increment primary key,
Nombres varchar(60),
Apellidos varchar(60),
Fecha_Nacimiento date,
Direccion varchar(70),
Telefono varchar(60),
User varchar(60),
Contraseña varchar(60)
)auto_increment=1;

insert into Usuario(Nombres,Apellidos,Fecha_Nacimiento,Direccion,Telefono,User,Contraseña) values 
('Miguel','Apellidos','1995-05-18','Av.Manzanilla 256','963258741','Miguel','123');

select * from Usuario;

alter table Pasajero add foreign key (IdPais) references Pais(IdPais);
alter table Pago add foreign key (IdPasajero) references Pasajero(IdPasajero);
alter table Pago add foreign key (IdReserva) references Reserva(IdReserva);
alter table Vuelo add foreign key (IdAvion) references Avion(IdAvion);
alter table Vuelo add foreign key (IdReserva) references Reserva(IdReserva);

insert Pais value ('PER','Perú');
insert Pais value ('CHI','Chile');

select * from Pais;

insert Pasajero value (null,'Miguel','Mora','DNI','25896378','2009-05-19','PER','987125874','Mora@gmail.com');
insert Pasajero value ('Pas100','Nicole','Quispe','DNI','97896382','1996-12-24','CHI','897125874','Nicole@hotmail.com');

Insert into Pasajero (Nombre,Apellido,Tipo_Documento,Num_Documento,Fecha_Nacimiento,IdPais,Telefono,Email) values
('Miguel','Mora','DNI','25896378','1996-05-19','PER','987125874','Mora@gmail.com');

delete from pasajero where IdPasajero =13 ;

select * from Pasajero;

select * from Pago;

select * from Vuelo;

select Nombre from pais;

DELETE FROM Pais WHERE IdPais='BOL';

