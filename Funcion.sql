USE `parqueadero`;
DROP function IF EXISTS `calcular_valor`;

DELIMITER $$
USE `parqueadero`$$

CREATE FUNCTION calcular_valor(
hora_ingreso TIMESTAMP,
hora_salida TIMESTAMP,
id_tip_vehi INT
) RETURNS DECIMAL(10,3)
DETERMINISTIC
BEGIN
DECLARE horas INT;
DECLARE valor_hora DECIMAL(10,3);
DECLARE total DECIMAL(10,3);
SET horas = TIMESTAMPDIFF(HOUR, hora_ingreso, hora_salida);
IF horas = 0 THEN
SET horas = 1;
END IF;

SELECT Val_Hora INTO valor_hora
FROM Tip_Vehi
WHERE ID_Tip_Vehi = id_tip_vehi
LIMIT 1;

SET total = horas * valor_hora;
RETURN total;
END;$$

DELIMITER ;

/*--------------------------------------------------------------------*/
USE `parqueadero`;
DROP function IF EXISTS `hay_cupo`;

DELIMITER $$
USE `parqueadero`$$
CREATE FUNCTION hay_cupo(id_parqueadero INT) 
RETURNS BOOLEAN
DETERMINISTIC BEGIN 
DECLARE cupo INT; 
SELECT Cap_Disp INTO cupo
FROM Parqueadero WHERE ID_Parqueadero = id_parqueadero;

RETURN cupo > 0;

END;$$

DELIMITER ;

