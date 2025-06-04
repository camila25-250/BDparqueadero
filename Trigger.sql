DELIMITER //
CREATE TRIGGER antes_insertar_vehiculo
BEFORE INSERT ON Vehiculo
FOR EACH ROW
BEGIN
IF EXISTS (SELECT 1 FROM Vehiculo WHERE Placa = NEW.Placa) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'La placa ya está registrada';
END IF;
END; //
DELIMITER ;

/*-----------------------------------------------------------------------------------------------------------------*/
DELIMITER //
CREATE TRIGGER antes_ingreso_control_cupo BEFORE INSERT ON Ingresos
FOR EACH ROW BEGIN DECLARE id_parq INT;

SELECT ID_Parqueadero INTO id_parq
FROM espacio e
JOIN Vehiculo v ON v.ID_Tip_Vehi = e.ID_Tip_Vehi
WHERE v.ID_Vehiculo = NEW.ID_Vehiculo
LIMIT 1;

IF NOT hay_cupo(id_parq) THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'No hay cupo disponible en el parqueadero.';
END IF;

CALL reducir_cupo(id_parq);

END;//
DELIMITER ;