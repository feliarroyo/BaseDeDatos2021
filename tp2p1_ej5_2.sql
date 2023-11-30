SELECT id_institucion, COUNT(*) voluntarios
FROM voluntario
GROUP BY id_institucion
ORDER BY id_institucion;