CREATE DATABASE migrupot2; -- crear base de datos

USE migrupoT2; -- utilizar mi BBDD

CREATE TABLE VEHICULOS( 
Vin int not null primary key,
Año int not null,
Precio int not null,
Tipo_Combustible varchar(45) not null,
Tipo_Transmision varchar(45) not null,
Estado_Vehiculo varchar(45) not null,
Id_Color int not null,
Id_Marca int not null,
FOREIGN KEY (Id_Color) REFERENCES COLOR (Id_Color),
FOREIGN KEY (Id_Marca) REFERENCES Marca_Vehiculo (Id_Marca)
);

CREATE TABLE COLOR (
Id_Color int not null primary key,
Nombre_Color varchar(20) not null
);

CREATE TABLE Marca_Vehiculo(Id_Marca int not null primary key,
Nombre_Marca varchar(30) not null,
Modelo varchar(30) not null
);

CREATE TABLE CLIENTES(
Id_Cliente int not null primary key auto_increment,
Nombre_Cliente varchar(45) not null,
Telefono_Cliente int not null,
Direccion_Cliente varchar(150) not null,
E_Mail_Cliente varchar(50) not null
);

CREATE TABLE SERVICIO(
Id_Servicio int not null primary key auto_increment,
Tipo_Servicio varchar(100) not null
);

CREATE TABLE MANTENIMIENTO(
Id_Mantenimiento int not null primary key auto_increment,
Costo_servicio int not null,
Fecha_servicio date not null,
Id_Servicio int not null,
FOREIGN KEY (Id_Servicio) REFERENCES SERVICIO (Id_Servicio)
);

CREATE TABLE DISPONIBILIDAD(
Id_Disponible int not null primary key auto_increment,
Vendido varchar(15) not null,
Vin int not null,
id_Cliente int not null,
FOREIGN KEY (Vin) REFERENCES VEHICULOS (Vin),
FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES (Id_Cliente)
);

CREATE TABLE VENDEDORES(
Numero_Empleado int not null primary key auto_increment,
Nombre_Vendedor varchar(45) not null,
Fecha_Contratacion date not null
);

CREATE TABLE VENTAS(
Id_Venta int not null primary key auto_increment,
Fecha_Venta date not null,
Total_Transaccion int not null,
Metodo_Pago int not null,
Id_Cliente int not null,
Numero_Empleado int not null,
Vin int not null,
FOREIGN KEY (Id_Cliente) REFERENCES CLIENTES (Id_Cliente),
FOREIGN KEY (Numero_Empleado) REFERENCES VENDEDORES (Numero_Empleado)
);


DESCRIBE VEHICULOS;
DESCRIBE COLOR;
DESCRIBE Marca_Vehiculo;
SHOW TABLES;
DROP TABLE Marca_Vehiculo;
DROP TABLE COLOR;
DROP TABLE VEHICULOS;