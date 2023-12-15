SELECT e.id_empleado, e.nombre, e.apellido
FROM unc_esq_peliculas.empleado e
JOIN unc_esq_peliculas.departamento d ON (
	(e.id_departamento = d.id_departamento) 
	AND (e.id_distribuidor = d.id_distribuidor)
)
JOIN unc_esq_peliculas.ciudad c ON (d.id_ciudad = c.id_ciudad)
WHERE (c.nombre_ciudad = 'Rawalpindi') 
AND id_empleado IN (
	SELECT DISTINCT id_jefe
	FROM unc_esq_peliculas.empleado
);
--unc_esq_peliculas