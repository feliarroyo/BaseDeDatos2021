SELECT id_institucion
FROM voluntario
WHERE id_institucion IS NOT NULL
GROUP BY id_institucion
HAVING COUNT(nro_voluntario) = 1
EXCEPT
SELECT id_institucion 
FROM historico;