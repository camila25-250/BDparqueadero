DELIMITER //
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
END //
DELIMITER ;

/*-----------------------------------------------------------------------------------------------------------------*/
USE `parqueadero`;
DROP procedure IF EXISTS `registrar_ingreso`;

DELIMITER $$
USE `parqueadero`$$
CREATE PROCEDURE registrar_ingreso(
IN p_id_usuario INT,
IN p_id_vehiculo INT,

IN p_id_tip_pago INT,
IN p_fech_hor_ing TIMESTAMP,
IN p_fech_hor_sal TIMESTAMP
)
BEGIN
DECLARE tipo_vehiculo INT;
DECLARE valor_pagado DECIMAL(10,3);
SELECT ID_Tip_Vehi INTO tipo_vehiculo
FROM Vehiculo
WHERE ID_Vehiculo = p_id_vehiculo
LIMIT 1;

SET valor_pagado = calcular_valor(p_fech_hor_ing, p_fech_hor_sal,
tipo_vehiculo);

INSERT INTO Ingresos (Fech_Hor_Ing, Fech_Hor_Sal, Val_Pagado, ID_Usuarios,
ID_Vehiculo, ID_Tip_Pago, Comentarios)
VALUES (p_fech_hor_ing, p_fech_hor_sal, valor_pagado, p_id_usuario,
p_id_vehiculo, p_id_tip_pago, 'Registro automático');
END;$$

DELIMITER ;

/*-----------------------------------------------------------------------------------------------------------------*/

USE `parqueadero`;
DROP procedure IF EXISTS `reducir_cupo`;

DELIMITER $$
USE `parqueadero`$$
CREATE PROCEDURE reducir_cupo(
IN id_parq INT
) 
BEGIN
UPDATE Parqueadero SET Cap_Disp = Cap_Disp - 1 WHERE ID_Parqueadero = id_parq; 
END$$

DELIMITER ;

