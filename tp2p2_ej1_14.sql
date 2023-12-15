SELECT d.nombre, d.id_distribuidor, d.id_departamento
FROM unc_esq_peliculas.departamento d
WHERE EXISTS (
	SELECT e.id_departamento, e.id_distribuidor, COUNT(id_empleado)
	FROM unc_esq_peliculas.empleado e
	JOIN unc_esq_peliculas.tarea ta ON (e.id_tarea = ta.id_tarea)
	WHERE (ta.sueldo_minimo < 6000)
		AND (d.id_departamento = e.id_departamento)
		AND (d.id_distribuidor = e.id_distribuidor)
	GROUP BY e.id_departamento, e.id_distribuidor
	HAVING COUNT(id_empleado) > 3
)
ORDER BY d.id_distribuidor;
--unc_esq_peliculas