SELECT e.apellido, e.nombre
FROM unc_esq_peliculas.empleado e
JOIN unc_esq_peliculas.departamento d ON (
	(e.id_departamento = d.id_departamento) AND (e.id_distribuidor = d. id_distribuidor)
)
JOIN unc_esq_peliculas.ciudad ci ON (d.id_ciudad = ci.id_ciudad)
WHERE d.jefe_departamento IN (
	SELECT id_empleado
	FROM unc_esq_peliculas.empleado em
	WHERE (em.porc_comision > 0.40)
)
AND (id_pais = 'AR');
--unc_esq_peliculas