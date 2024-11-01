CREATE DATABASE pizzeria;

USE pizzeria;

create table CLIENTE(
id_cliente int primary key auto_increment,
nombre_cliente varchar(30) not null,
telefono_cliente varchar(30) not null,
direccion_cliente varchar(100) not null
);

create table ADICIONES(
id_adicion int primary key auto_increment,
tipo_adicion varchar(30),
cantidad_adicion int
);

create table PEDIDOS(
id_pedido int primary key auto_increment not null,
consumir varchar(30) not null
);

create table PANZAROTTIS(
id_panzarotti int primary key auto_increment,
id_adicion int,
nombre_panzarotti varchar(30) not null,
cantidad_panzarotti int not null,
foreign key (id_adicion) references ADICIONES (id_adicion)
);

create table PIZZA(
id_pizza int primary key auto_increment,
id_adicion int,
id_pedido int,
tamaño_pizza varchar(10) not null,
nombre_pizza varchar(30) not null,
cantidad_pizza int not null,
precio_pizza int,
foreign key (id_adicion) references ADICIONES (id_adicion),
foreign key (id_pedido) references PEDIDOS (id_pedido)
);

create table BEBIDAS(
id_bebida int primary key auto_increment,
id_pedido int,
nombre_bebida varchar(30) not null,
cantidad_bebida int not null,
precio_bebida int not null,
foreign key (id_pedido) references PEDIDOS (id_pedido)
);

create table COMBO(
id_combo int primary key auto_increment,
nombre_combo varchar(30) not null,
id_pedido int,
tamaño_combo varchar(20) not null,
cantidad_combo int not null,
precio_combo int not null,
foreign key (id_pedido) references PEDIDOS (id_pedido)
);

create table POSTRES(
id_postre int primary key auto_increment,
id_pedido int,
nombre_postre varchar(30) not null,
cantidad_postre int not null,
precio_postre int,
foreign key (id_pedido) references PEDIDOS (id_pedido)
);

create table PRODUCTOS(
id_producto int primary key auto_increment,
id_pizza int,
id_panzarotti int,
id_combo int,
id_bebida int,
id_postre int,
foreign key (id_pizza) references PIZZA (id_pizza),
foreign key (id_panzarotti) references PANZAROTTIS (id_panzarotti),
foreign key (id_combo) references COMBO (id_combo),
foreign key (id_bebida) references BEBIDAS (id_bebida),
foreign key (id_postre) references POSTRES (id_postre)
);


create table INVENTARIO(
id_inventario int primary key auto_increment,
id_producto int,
cantidad_inventario int,
foreign key (id_producto) references PRODUCTOS (id_producto)
);

create table VENTAS(
id_venta int primary key auto_increment,
id_cliente int,
id_pizza int null,
id_panzarotti int null,
id_combo int null,
id_bebida int null,
id_postre int null,
fecha_venta date,
id_pedido int,
total_venta int,
foreign key (id_cliente) references CLIENTE (id_cliente),
foreign key (id_pizza) references PIZZA (id_pizza),
foreign key (id_panzarotti) references PANZAROTTIS (id_panzarotti),
foreign key (id_combo) references COMBO (id_combo),
foreign key (id_bebida) references BEBIDAS (id_bebida),
foreign key (id_postre) references POSTRES (id_postre),
foreign key (id_pedido) references PEDIDOS (id_pedido)
);

-- Inserts para la tabla CLIENTE
INSERT INTO CLIENTE (nombre_cliente, telefono_cliente, direccion_cliente) VALUES 
('Juan Pérez', '1234567890', 'Calle 1, Ciudad A'),
('María López', '0987654321', 'Calle 2, Ciudad B'),
('Carlos Martínez', '2345678901', 'Calle 3, Ciudad C'),
('Laura García', '3456789012', 'Calle 4, Ciudad D'),
('Pedro Sánchez', '4567890123', 'Calle 5, Ciudad E');

-- Inserts para la tabla ADICIONES
INSERT INTO ADICIONES (tipo_adicion, cantidad_adicion) VALUES 
('Extra Queso', 5),
('Aceitunas', 3),
('Jalapeños', 2),
('Cebolla', 4),
('Champiñones', 6);

-- Inserts para la tabla PEDIDOS
INSERT INTO PEDIDOS (id_pedido, consumir) VALUES 
(1, 'Para recoger'),
(2, 'Para comer'),
(3, 'Para recoger'),
(4, 'Para comer'),
(5, 'Para recoger');

-- Inserts para la tabla PANZAROTTIS
INSERT INTO PANZAROTTIS (id_adicion, nombre_panzarotti, cantidad_panzarotti) VALUES 
(1, 'Panzarotti de Queso', 10),
(2, 'Panzarotti de Jamón', 15),
(3, 'Panzarotti Vegetariano', 5);

-- Inserts para la tabla PIZZA
INSERT INTO PIZZA (id_adicion, id_pedido, tamaño_pizza, nombre_pizza, cantidad_pizza, precio_pizza) VALUES 
(1, 1, 'Mediana', 'Pizza de Queso', 2, 15),
(2, 2, 'Grande', 'Pizza Pepperoni', 1, 20),
(1, 3, 'Pequeña', 'Pizza Vegetariana', 3, 12),
(3, 4, 'Grande', 'Pizza BBQ', 1, 22);

-- Inserts para la tabla BEBIDAS
INSERT INTO BEBIDAS (id_pedido, nombre_bebida, cantidad_bebida, precio_bebida) VALUES 
(1, 'Coca Cola', 2, 5),
(2, 'Sprite', 1, 3),
(3, 'Agua', 3, 2),
(4, 'Fanta', 1, 4);

-- Inserts para la tabla COMBO
INSERT INTO COMBO (nombre_combo, id_pedido, tamaño_combo, cantidad_combo, precio_combo) VALUES 
('Combo Familiar', 1, 'Grande', 2, 25),
('Combo Individual', 2, 'Pequeño', 1, 12),
('Combo Doble', 3, 'Mediano', 1, 18);

-- Inserts para la tabla POSTRES
INSERT INTO POSTRES (id_pedido, nombre_postre, cantidad_postre, precio_postre) VALUES 
(1, 'Tarta de Queso', 1, 6),
(2, 'Helado', 1, 4),
(3, 'Brownie', 2, 5);

-- Inserts para la tabla PRODUCTOS
INSERT INTO PRODUCTOS (id_pizza, id_panzarotti, id_combo, id_bebida, id_postre) VALUES 
(1, NULL, NULL, 1, NULL),
(2, NULL, 1, NULL, NULL),
(NULL, 1, NULL, NULL, NULL),
(NULL, 2, NULL, 2, NULL),
(NULL, NULL, 2, NULL, 3);

-- Inserts para la tabla INVENTARIO
INSERT INTO INVENTARIO (id_producto, cantidad_inventario) VALUES 
(1, 50),
(2, 30),
(3, 20),
(4, 100),
(5, 25);

-- Inserts para la tabla VENTAS
INSERT INTO VENTAS (id_venta, id_cliente, id_pizza, id_panzarotti, id_combo, id_bebida, id_postre, fecha_venta, id_pedido, total_venta) VALUES 
(1, 1, 1, NULL, NULL, 1, NULL, '2024-10-01', 1, 27),
(2, 2, 2, NULL, 1, 2, 1, '2024-10-02', 2, 38),
(3, 3, 3, 1, NULL, NULL, 2, '2024-10-03', 3, 30),
(4, 4, NULL, 2, 2, NULL, 3, '2024-10-04', 4, 34),
(5, 5, NULL, 3, NULL, 1, NULL, '2024-10-05', 5, 20);

select nombre_combo, sum(precio_combo* cantidad_combo) as total_x_combo from COMBO group by nombre_combo; -- 2

SELECT consumir, COUNT(consumir) AS cantidad_pedidos FROM PEDIDOS GROUP BY consumir; -- 3


select count(*) FROM VENTAS ;

select * from ADICIONES; 
select tipo_adicion, cantidad_adicion from ADICIONES order by cantidad_adicion desc limit 1; -- 4

SELECT AVG(cantidad_pizza) AS promedio_pizzas_por_pedido FROM PIZZA;

SELECT id_cliente, COUNT(*) AS cantidad_pedidos
FROM VENTAS
GROUP BY id_cliente
HAVING COUNT(*) > 5;

SELECT nombre_pizza as producto,cantidad_pizza as cantidad FROM PIZZA
UNION ALL
SELECT nombre_bebida,cantidad_bebida FROM BEBIDAS;

SELECT VENTAS.id_venta, CLIENTE.nombre_cliente
FROM VENTAS
JOIN CLIENTE ON VENTAS.id_cliente = CLIENTE.id_cliente;

SELECT id_cliente,
       CASE
           WHEN total_venta > 100 THEN 'Cliente VIP'
           ELSE 'Cliente Regular'
       END AS tipo_cliente
FROM VENTAS;

SELECT * FROM VENTAS
WHERE fecha_venta;