 
-- Se crea la base de datos --

CREATE DATABASE [Base1]  

-- Trabajar en la base creada anteriormente --
USE Base1

-- Creacion de Tablas --

CREATE TABLE Proveedor(
Cedula BIGINT NOT NULL CONSTRAINT ced PRIMARY KEY,
num_telf INT NOT NULL,
Correo_elecp VARCHAR(25) NOT NULL,
Nombrep VARCHAR(25) NOT NULL,
Tipo_Cedulap VARCHAR(20) NOT NULL)

CREATE TABLE Territorio(
ID_Territorio INT NOT NULL IDENTITY(1,1) CONSTRAINT id_terri PRIMARY KEY,
Provincia VARCHAR(15) NOT NULL,
Distrito VARCHAR(15) NOT NULL,
Canton VARCHAR(15) NOT NULL)

CREATE TABLE Cliente(
Cedula_c BIGINT NOT NULL CONSTRAINT ced_c PRIMARY KEY,
Correo_elec VARCHAR(20) NOT NULL,
Nombre VARCHAR(20) NOT NULL,
Direccion VARCHAR(20) NOT NULL,
Tipo_Cedula VARCHAR(20) NOT NULL)

CREATE TABLE Factura(
Num_Fact INT NOT NULL IDENTITY(1,1) CONSTRAINT id_fact PRIMARY KEY,
Percent_imp FLOAT NOT NULL,
Percent_des FLOAT NOT NULL,
Info VARCHAR(50) NOT NULL,
Num_Units INT NOT NULL,
Precio FLOAT NOT NULL,
Fecha DATE NOT NULL,
-- Clave Foranea --
Cedula_c BIGINT,
--  Relacion uno a muchos con la tabla Clientes--
CONSTRAINT R_FC FOREIGN KEY(Cedula_c) REFERENCES Cliente(Cedula_c))

CREATE TABLE Categoria(
ID_Categoria INT NOT NULL IDENTITY(1,1) CONSTRAINT id_cat PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL)

CREATE TABLE Subcategoria(
ID_Subcategoria INT NOT NULL IDENTITY(1,1) CONSTRAINT id_subcat PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
P_cat VARCHAR(20) NOT NULL,
-- Clave Foranea --
ID_Categoria INT,
--  Relacion uno a muchos con la tabla Categoria--
CONSTRAINT R_CS FOREIGN KEY(ID_Categoria) REFERENCES Categoria(ID_Categoria))

CREATE TABLE Producto(
ID_Universal INT NOT NULL IDENTITY(1,1) CONSTRAINT id_u PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Color VARCHAR(20) NOT NULL,
Precio FLOAT NOT NULL,
Tam_fisc FLOAT NOT NULL,
-- Clave Foranea --
ID_Subcategoria INT,
--  Relacion uno a muchos con la tabla Subcategoria --
CONSTRAINT R_SP FOREIGN KEY(ID_Subcategoria) REFERENCES Subcategoria(ID_Subcategoria))

--- Relaciones de muchos a muchos ---

CREATE TABLE Ubicaciones(
ID_Ubicacion INT NOT NULL IDENTITY(1,1) CONSTRAINT id_ub PRIMARY KEY,
-- Clave Foranea --
ID_Territorio INT,
Cedula BIGINT,
-- Relacion Territorio-Proveedor --
CONSTRAINT R_TP FOREIGN KEY(ID_Territorio) REFERENCES Territorio(ID_Territorio),
CONSTRAINT R_PT FOREIGN KEY(Cedula) REFERENCES Proveedor(Cedula)
)

CREATE TABLE Abastecimiento(
ID_Abast INT NOT NULL IDENTITY(1,1) CONSTRAINT id_aba PRIMARY KEY,
-- Clave Foranea --
ID_Universal INT,
Cedula BIGINT,
-- Relacion Producto-Proveedor --
CONSTRAINT R_PoPr FOREIGN KEY(ID_Universal) REFERENCES Producto(ID_Universal),
CONSTRAINT R_PrPo FOREIGN KEY(Cedula) REFERENCES Proveedor(Cedula)
)

CREATE TABLE Compras(
ID_Compra INT NOT NULL IDENTITY(1,1) CONSTRAINT id_comp PRIMARY KEY,
-- Clave Foranea --
ID_Universal INT,
Num_Fact INT,
-- Relacion Producto-Factura --
CONSTRAINT R_FP FOREIGN KEY(ID_Universal) REFERENCES Producto(ID_Universal),
CONSTRAINT R_PF FOREIGN KEY(Num_Fact) REFERENCES Factura(Num_Fact)
)

--- Introducir Informacion ---

Use Base1

INSERT INTO Territorio (Canton, Provincia, Distrito) VALUES
('San José', 'San José', 'San José'),
('Escazú', 'San José', 'Escazú'),
('Heredia', 'Heredia', 'Heredia'),
('Barva', 'Heredia', 'Barva'),
('Alajuela', 'Alajuela', 'Alajuela'),
('Grecia', 'Alajuela', 'Grecia'),
('Cartago', 'Cartago', 'Cartago'),
('Paraíso', 'Cartago', 'Paraíso'),
('Puntarenas', 'Puntarenas', 'Puntarenas'),
('Quepos', 'Puntarenas', 'Quepos'),
('Limón', 'Limón', 'Limón'),
('Guápiles', 'Limón', 'Guápiles');

INSERT INTO Proveedor (Cedula, num_telf, Correo_elecp, Nombrep, Tipo_Cedulap) VALUES
('5045980854', '12345678', 'proveedor1@email.com', 'Proveedor 1', 'Cedula Personal'),
('3059820490', '23456789', 'proveedor2@email.com', 'Proveedor 2', 'Cedula Personal'),
('2037640823', '34567890', 'proveedor3@email.com', 'Proveedor 3', 'Cedula Personal'),
('1038880427', '45678901', 'proveedor4@email.com', 'Proveedor 4', 'Cedula Personal'),
('1088390999', '56789012', 'proveedor5@email.com', 'Proveedor 5', 'Cedula Personal'),
('1046780983', '67890123', 'proveedor6@email.com', 'Proveedor 6', 'Cedula Personal'),
('3010234587', '78901234', 'proveedor7@email.com', 'Proveedor 7', 'Cedula Juridica'),
('3011937585', '89012345', 'proveedor8@email.com', 'Proveedor 8', 'Cedula Juridica'),
('3012748597', '90123456', 'proveedor9@email.com', 'Proveedor 9', 'Cedula Juridica'),
('3013892756', '01234567', 'proveedor10@email.com', 'Proveedor 10', 'Cedula Juridica'),
('4000938475', '12345674', 'proveedor11@email.com', 'Proveedor 11', 'Cedula Juridica'),
('5001498658', '23456789', 'proveedor12@email.com', 'Proveedor 12', 'Cedula Juridica');

INSERT INTO Cliente (Cedula_c, Correo_elec, Tipo_Cedula, Direccion, Nombre) VALUES 
('3010984888','cliente1@email.com', 'Juridica', 'Dirección 1', 'Cliente 1'),
('7078408633','cliente2@email.com', 'Fisica', 'Dirección 2', 'Cliente 2'),
('4056670897','cliente3@email.com', 'Fisica', 'Dirección 3', 'Cliente 3'),
('3012740879','cliente4@email.com', 'Juridica', 'Dirección 4', 'Cliente 4'),
('3084780812','cliente5@email.com', 'Fisica', 'Dirección 5', 'Cliente 5'),
('3013234128','cliente6@email.com', 'Juridica', 'Dirección 6', 'Cliente 6'),
('4098750691','cliente7@email.com', 'Fisica', 'Dirección 7', 'Cliente 7'),
('5001450212','cliente8@email.com', 'Juridica', 'Dirección 8', 'Cliente 8'),
('2034260876','cliente9@email.com', 'Fisica', 'Dirección 9', 'Cliente 9'),
('5001648955','cliente10@email.com', 'Juridica', 'Dirección 10', 'Cliente 10'),
('1087620144','cliente11@email.com', 'Fisica', 'Dirección 11', 'Cliente 11'),
('4000284775','cliente12@email.com', 'Juridica', 'Dirección 12', 'Cliente 12');

INSERT INTO Factura (Percent_imp, Percent_des, Precio, Info, Num_Units, Fecha, Cedula_c) VALUES 
(15.3, 10.0, 100.00, 'Descripción del Producto 1', 5, '2022-01-22',  '3010984888'),
(8.7, 5.0, 75.50, 'Descripción del Producto 2', 3, '2022-01-23',     '7078408633'),
(12.75, 7.5, 220.75, 'Descripción del Producto 3', 8, '2022-01-24',  '4056670897'),
(9.75, 0.0, 45.25, 'Descripción del Producto 4', 2, '2022-01-25',    '3012740879'),
(18.0, 15.0, 180.00, 'Descripción del Producto 5', 6, '2022-01-26',  '3084780812'),
(6.5, 2.0, 65.00, 'Descripción del Producto 6', 4, '2022-01-27',     '3013234128'),
(11.0, 8.0, 110.50, 'Descripción del Producto 7', 7, '2022-01-28',   '4098750691'),
(14.75, 12.5, 33.75, 'Descripción del Producto 8', 1, '2022-01-29',  '5001450212'),
(10.25, 3.0, 78.25, 'Descripción del Producto 9', 9, '2022-01-30',   '2034260876'),
(7.0, 0.0, 57.00, 'Descripción del Producto 10', 5, '2022-01-31',    '5001648955'),
(13.5, 6.0, 95.75, 'Descripción del Producto 11', 3, '2022-02-01',   '1087620144'),
(16.25, 9.0, 145.50, 'Descripción del Producto 12', 4, '2022-02-02', '4000284775'),
(15.5, 10.0, 100.00, 'Descripción del Producto 12', 18, '2022-01-27',  '3010984888'),
(8.0, 5.0, 75.50, 'Descripción del Producto 11', 23, '2022-01-25',     '7078408633'),
(12.25, 7.5, 220.75, 'Descripción del Producto 10', 11, '2022-01-14',  '4056670897'),
(9.13, 1.0, 450.25, 'Descripción del Producto 9', 7, '2022-01-15',    '3012740879'),
(18.9, 12.0, 18.00, 'Descripción del Producto 8', 5, '2022-01-16',  '3084780812'),
(6.1, 2.4, 15.00, 'Descripción del Producto 7', 1, '2022-01-25',     '3013234128'),
(18.0, 8.7, 10.50, 'Descripción del Producto 6', 8, '2022-01-18',   '4098750691'),
(12.75, 9.5, 93.75, 'Descripción del Producto 5', 2, '2022-01-23',  '5001450212'),
(11.25, 7.0, 18.25, 'Descripción del Producto 4', 1, '2022-01-20',   '2034260876'),
(9.0, 0.9, 572.00, 'Descripción del Producto 3', 4, '2022-01-12',    '5001648955'),
(14.5, 11.0, 9.75, 'Descripción del Producto 2', 6, '2022-02-08',   '1087620144'),
(16.45, 4.0, 13.50, 'Descripción del Producto 1', 6, '2022-02-07', '4000284775');

INSERT INTO Categoria (Nombre) VALUES
('Electrónica'),
('Ropa'),
('Hogar'),
('Deportes'),
('Juguetes'),
('Electrodomésticos'),
('Alimentos'),
('Belleza'),
('Libros'),
('Muebles'),
('Automóviles'),
('Electrodomésticos');

INSERT INTO SubCategoria (Nombre, P_cat, ID_Categoria) VALUES
('Subcategoria 1', 1, 1),
('Subcategoria 2', 2, 2),
('Subcategoria 3', 3, 3),
('Subcategoria 4', 4, 4),
('Subcategoria 5', 5, 5),
('Subcategoria 6', 6, 6),
('Subcategoria 7', 7, 7),
('Subcategoria 8', 8, 8),
('Subcategoria 9', 9, 9),
('Subcategoria 10', 10, 10),
('Subcategoria 11', 11, 11),
('Subcategoria 12', 12, 12),
('Subcategoria 13', 1, 1),
('Subcategoria 14', 2, 2),
('Subcategoria 15', 3, 3),
('Subcategoria 16', 4, 4),
('Subcategoria 17', 5, 5),
('Subcategoria 18', 6, 6),
('Subcategoria 19', 7, 7),
('Subcategoria 20', 8, 8),
('Subcategoria 21', 9, 9),
('Subcategoria 22', 10, 10),
('Subcategoria 23', 11, 11),
('Subcategoria 24', 12, 12);

INSERT INTO Producto (Nombre, Color, Precio, Tam_fisc, ID_Subcategoria ) VALUES
('Producto 1', 'Rojo', 25.99, 36, 1),
('Producto 2', 'Azul', 19.95, 38, 2),
('Producto 3', 'Verde', 34.50, 40, 3),
('Producto 4', 'Negro', 42.75, 42, 4),
('Producto 5', 'Blanco', 29.99, 36, 5),
('Producto 6', 'Amarillo', 17.50, 38, 6),
('Producto 7', 'Gris', 39.95, 40, 7),
('Producto 8', 'Morado', 27.25, 42, 8),
('Producto 9', 'Naranja', 21.50, 36, 9),
('Producto 10', 'Rosa', 31.99, 35, 10),
('Producto 11', 'Marrón', 23.75, 40, 11),
('Producto 12', 'Celeste', 38.50, 42, 12),
('Producto 13', 'Rojo', 28.99, 36, 1),
('Producto 14', 'Azul', 14.95, 38, 2),
('Producto 15', 'Verde', 22.50, 40, 3),
('Producto 16', 'Negro', 35.75, 42, 4),
('Producto 17', 'Blanco', 33.99, 36, 5),
('Producto 18', 'Amarillo', 19.50, 38, 6),
('Producto 19', 'Gris', 29.95, 40, 7),
('Producto 20', 'Morado', 25.25, 42, 8),
('Producto 21', 'Naranja', 20.50, 36, 9),
('Producto 22', 'Rosa', 27.99, 38, 10),
('Producto 23', 'Marrón', 18.75, 40,11),
('Producto 24', 'Celeste', 32.50, 42, 12);

-- Tablas intermedias -- 

INSERT INTO Ubicaciones (Cedula, ID_Territorio) VALUES 
('5045980854', '1'),
('3059820490', '2'),
('2037640823', '3'),
('1038880427', '4'),
('1088390999', '5'),
('1046780983', '6'),
('3010234587', '7'),
('3011937585', '8'),
('3012748597', '9'),
('3013892756', '10'),
('4000938475', '11'),
('5001498658', '12'),
('5045980854', '12'),
('3059820490', '11'),
('2037640823', '10'),
('1038880427', '9'),
('1088390999', '8'),
('1046780983', '7'),
('3010234587', '6'),
('3011937585', '5'),
('3012748597', '4'),
('3013892756', '3'),
('4000938475', '2'),
('5001498658', '1');

INSERT INTO Abastecimiento(Cedula, ID_Universal) VALUES 
('5045980854', '1'),
('3059820490', '2'),
('2037640823', '3'),
('1038880427', '4'),
('1088390999', '5'),
('1046780983', '6'),
('3010234587', '7'),
('3011937585', '8'),
('3012748597', '9'),
('3013892756', '10'),
('4000938475', '11'),
('5001498658', '12'),
('5045980854', '12'),
('3059820490', '11'),
('2037640823', '10'),
('1038880427', '9'),
('1088390999', '8'),
('1046780983', '7'),
('3010234587', '6'),
('3011937585', '5'),
('3012748597', '4'),
('3013892756', '3'),
('4000938475', '2'),
('5001498658', '1');

INSERT INTO Compras(Num_Fact, ID_Universal) VALUES 
('24', '1'),
('23', '2'),
('22', '3'),
('21', '4'),
('20', '5'),
('19', '6'),
('18', '7'),
('17', '8'),
('16', '9'),
('15', '10'),
('14', '11'),
('13', '12'),
('12', '13'),
('11', '14'),
('10', '15'),
('9', '16'),
('8', '17'),
('7', '18'),
('6', '19'),
('5', '20'),
('4', '21'),
('3', '22'),
('2', '23'),
('1', '24');

