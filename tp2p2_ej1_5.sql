SELECT *
FROM tarea ta
WHERE ta.id_tarea NOT IN (
	SELECT v.id_tarea FROM voluntario v
);