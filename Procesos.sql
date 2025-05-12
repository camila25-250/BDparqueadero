CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios`(
IN ID_Usuarios INT,
IN Nom VARCHAR(40),
IN Ape VARCHAR(40),
IN Tel VARCHAR(30),
IN Corr VARCHAR(50),
IN N_doc INT,
IN ID_tido INT,
IN ID_ro INT
)
BEGIN
INSERT INTO Usuarios (ID_Usuarios,Nombre,Apellidos,Telefono,Correo,Num_Doc,ID_Tip_Doc,ID_Rol)
VALUES (ID_Usuarios,Nom,Ape,Tel,Corr,N_doc,ID_tido,ID_ro);
END