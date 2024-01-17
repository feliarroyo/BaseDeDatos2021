SELECT id_institucion, COUNT(nro_voluntario) voluntarios
FROM voluntario
GROUP BY id_institucion
HAVING COUNT(nro_voluntario) > 10;