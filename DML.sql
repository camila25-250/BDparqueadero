/*Tablas Fuertes*/
INSERT INTO Tip_Doc  (ID_Tip_Doc,Tipo) values (1,"Cedula,de,ciudadania"),(2,"Tarjeta,de,Identidad"),(3, "Tarjeta,de,Extranjeria"),(4,"Pasaporte"),(5,"Carne,Diplomatico");
INSERT INTO Rol (ID_Rol,Nom) values (1,"Selador"),(2,"Cliente");
INSERT INTO Tip_Pago  (ID_Tip_Pago,Tipo) values (1,"Pse"),(2,"Tarjeta,Credito"),(3, "Tarjeta,Debito"),(4,"Nequi"),(5,"Efectivo");
INSERT INTO Barrio  (ID_Barrio,Nom) values (1,"Madelena"),(2,"Quirigua"),(3,"Patio,Bonito"),(4,"Candelaria"),(5,"Villa,Mayor");
INSERT INTO Vias  (ID_Vias,Vias) values (1,"carrera"),(2,"calle"),(3,"Autopista"),(4,"Transversal");
INSERT INTO Tip_Vehi (ID_Tip_Vehi,Tipo,Val_Hora,Val_Dia,Val_Mes) values (1,"Automoviles","3.000","20.000","200.000"),(2,"Motos","2.300","11.200","90.000"),(3,"Autobuses-Camiones","4.500","30.000","250.000"),(4,"Bicicleta","700","50.000","30.000");
INSERT INTO Sector (ID_Sector,Color) values (1,"Blanco"), (2,"Rojo"),(3,"Verde"),(4,"Azul");
INSERT INTO Marca_Vehi (ID_Marca_Vehi,Marca) Values (1,"Renault"),(2,"Chevrolet"),(3,"Mazda"),(4,"Toyota"),(5,"Nissan"),(6,"Suzuki"),(7,"Honda"),(8,"Yamaha"),(9,"Suzuki"),(10,"Volvo");

/*Tablas Debiles*/
INSERT INTO Usuarios (ID_Usuarios,Nombre,Apellidos,Telefono,Correo,Num_Doc,ID_Tip_Doc,ID_Rol) values (1,"Lucia","Castañeda Lozano","3202189375","lcicastañeda@gmail.com","1234567892",1,2);
INSERT INTO Vehiculo (ID_Vehiculo,Placa,Color,ID_Usuarios,ID_Tip_Vehi,ID_Marca_Vehi) values(1,"VKO34D","Rojo",1,2,6);
INSERT INTO Ingresos (ID_Ingresos,Fech_Hor_Ing,Fech_Hor_Sal,Val_Pagado,ID_Usuarios,ID_Vehiculo,ID_Tip_Pago,Comentarios) values (1,"2025-05-06 12:05:00","2025-05-06 15:20:04","2.800",1,1,5,"Buen estado");
INSERT INTO Direccion (ID_Direccion,ID_Vias,Numero,Complemento,ID_Barrio) values (1,2,"45","28 D-08",3);
INSERT INTO Parqueadero (ID_Parqueadero,Nombre,Cap_Disp,Cap_Total,ID_Direccion) values (1,"ParkZone 24","20","25",1);
INSERT INTO espacio (ID_espacio,Numero,Estado,ID_Tip_Vehi,ID_Sector,ID_Parqueadero) Values (1,"250",1,3,2,1);