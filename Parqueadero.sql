DROP DATABASE IF EXISTS parqueadero;
CREATE DATABASE parqueadero;
USE parqueadero;

CREATE TABLE Usuarios(
ID_Usuarios INT PRIMARY KEY auto_increment,
Nombre VARCHAR(40) NOT NULL,
Apellidos VARCHAR(40) NOT NULL,
Telefono VARCHAR(30) NOT NULL,
Correo VARCHAR(50) NOT NULL,
Num_Doc INT NOT NULL,
ID_Tip_Doc INT,
ID_Rol INT
);

CREATE TABLE Tip_Doc(
ID_Tip_Doc INT PRIMARY KEY auto_increment,
Tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Rol(
ID_Rol INT PRIMARY KEY auto_increment,
Nom VARCHAR(30) NOT NULL
);

CREATE TABLE Marca_Vehi(
ID_Marca_Vehi INT PRIMARY KEY auto_increment,
Marca VARCHAR(50)
);

CREATE TABLE Tip_Vehi(
ID_Tip_Vehi INT PRIMARY KEY auto_increment,
Tipo VARCHAR(30) NOT NULL,
Val_Hora DECIMAL (10,2) NOT NULL,
Val_Dia DECIMAL (10,2) NOT NULL
);

CREATE TABLE Vehiculo(
ID_Vehiculo INT PRIMARY KEY auto_increment,
Placa VARCHAR(20) NOT NULL UNIQUE,
Color VARCHAR(20) NOT NULL,
ID_Marca_Vehi INT,
ID_Usuarios INT,
ID_Tip_Vehi INT
);

CREATE TABLE Tip_Pago(
ID_Tip_Pago INT PRIMARY KEY auto_increment,
Tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Ingresos(
ID_Ingresos INT PRIMARY KEY auto_increment,
Fech_Hor_Ing timestamp NOT NULL DEFAULT current_timestamp,
Fech_Hor_Sal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Val_Pagado DECIMAL (10,2) NOT NULL,
ID_Usuarios INT,
ID_Vehiculo INT,
ID_Tip_Pago INT
);

CREATE TABLE Barrio(
ID_Barrio INT PRIMARY KEY auto_increment,
Nom VARCHAR(50) NOT NULL
);

CREATE TABLE Vias(
ID_Vias INT PRIMARY KEY auto_increment,
Vias VARCHAR(20) NOT NULL
);

CREATE TABLE Direccion(
ID_Direccion INT PRIMARY KEY auto_increment,
Numero INT NOT NULL,
Complemento VARCHAR(50) NOT NULL,
ID_Barrio INT,
ID_Vias INT
);

CREATE TABLE Parqueadero(
ID_Parqueadero INT PRIMARY KEY auto_increment,
Nombre VARCHAR(40) NOT NULL,
Cap_Disp INT NOT NULL,
Cap_Total INT NOT NULL,
ID_Direccion INT
);

CREATE TABLE Sector(
ID_Sector INT PRIMARY KEY auto_increment,
Color VARCHAR(20) NOT NULL
);

CREATE TABLE espacio(
ID_espacio INT PRIMARY KEY auto_increment,
Numero INT NOT NULL,
Estado BINARY(1) NOT NULL,
ID_Tip_Vehi INT,
ID_Sector INT,
ID_Parqueadero INT
);

/*Foreign Key*/
ALTER TABLE Usuarios
ADD CONSTRAINT FK_Tip_Doc
FOREIGN KEY (ID_Tip_Doc) REFERENCES Tip_Doc(ID_Tip_Doc);
ALTER TABLE Usuarios
ADD CONSTRAINT FK_Rol
FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol);

ALTER TABLE Vehiculo 
ADD CONSTRAINT FK_Marca_Vehi
FOREIGN KEY (ID_Marca_Vehi) REFERENCES Marca_Vehi(ID_Marca_Vehi);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Usuarios
FOREIGN KEY (ID_Usuarios) REFERENCES Usuarios(ID_Usuarios);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Tip_Vehi
FOREIGN KEY (ID_Tip_Vehi) REFERENCES Tip_Vehi(ID_Tip_Vehi);

ALTER TABLE Ingresos
ADD CONSTRAINT Usuarios
FOREIGN KEY (ID_Usuarios) REFERENCES Usuarios(ID_Usuarios);
ALTER TABLE Ingresos
ADD CONSTRAINT ID_Vehiculo
FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo);
ALTER TABLE Ingresos
ADD CONSTRAINT FK_Tip_Pago
FOREIGN KEY (ID_Tip_Pago) REFERENCES Tip_Pago(ID_Tip_Pago);

ALTER TABLE Direccion
ADD CONSTRAINT FK_Barrio
FOREIGN KEY (ID_Barrio) REFERENCES Barrio(ID_Barrio);
ALTER TABLE Direccion
ADD CONSTRAINT FK_Vias
FOREIGN KEY (ID_Vias) REFERENCES Vias(ID_Vias);

ALTER TABLE Parqueadero
ADD CONSTRAINT FK_Direccion
FOREIGN KEY (ID_Direccion) REFERENCES Direccion(ID_Direccion);

ALTER TABLE espacio
ADD CONSTRAINT FK_Tip_Vehic
FOREIGN KEY (ID_Tip_Vehi) REFERENCES Tip_Vehi(ID_Tip_Vehi);
ALTER TABLE espacio
ADD CONSTRAINT FK_Sector
FOREIGN KEY (ID_Sector) REFERENCES Sector(ID_Sector);
ALTER TABLE espacio
ADD CONSTRAINT FK_Parqueadero
FOREIGN KEY (ID_Parqueadero) REFERENCES Parqueadero(ID_Parqueadero);

ALTER TABLE Ingresos ADD Observaciones VARCHAR(50);
ALTER TABLE Ingresos CHANGE COLUMN Observaciones Comentarios VARCHAR(50);

ALTER TABLE Tip_Vehi ADD Val_Mes Decimal (10,2) NOT NULL;