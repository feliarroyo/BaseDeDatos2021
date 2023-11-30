SELECT apellido, nombre, id_empleado
FROM unc_esq_peliculas.empleado
WHERE porc_comision IS NULL
	OR porc_comision = 0
ORDER BY 1;