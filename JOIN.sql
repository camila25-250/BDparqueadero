SELECT u.Nombre, u.Apellidos, t.tipo FROM Usuarios as u
JOIN Tip_Doc as t on u.ID_Tip_Doc = t.ID_Tip_Doc;

SELECT u.Nombre, u.Apellidos, r.Nom FROM Usuarios as u
JOIN Rol as r on u.ID_Rol = r.ID_Rol;

SELECT t.tipo FROM Usuarios as u
RIGHT JOIN Tip_Doc as t on u.ID_Tip_Doc = t.ID_Tip_Doc
WHERE u.ID_Tip_Doc is null;

SELECT u.Nombre, u.Apellidos, t.ID_Tip_Doc FROM Usuarios as u
LEFT JOIN Tip_Doc as t on u.ID_Tip_Doc = t.ID_Tip_Doc
WHERE u.ID_Tip_Doc = "2";