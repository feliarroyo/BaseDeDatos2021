SELECT *
FROM institucion
WHERE id_institucion IN(
	SELECT id_institucion
	FROM tarea
	GROUP BY id_institucion
	HAVING (COUNT(1) * 100.0 / (SELECT COUNT(1) FROM tarea)) > 10.0
)
