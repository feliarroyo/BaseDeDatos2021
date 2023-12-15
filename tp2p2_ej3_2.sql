SELECT v.nro_voluntario, v.nombre, v.apellido
FROM voluntario v
JOIN institucion i ON (v.nro_voluntario = i.id_director)
INTERSECT(
	SELECT v.nro_voluntario, v.nombre, v.apellido
	FROM voluntario v
	JOIN institucion i ON (v.id_institucion = i.id_institucion)
	JOIN direccion d ON (i.id_direccion = d.id_direccion)
	JOIN pais pa ON (d.id_pais = pa.id_pais)
	JOIN continente co ON (pa.id_continente = co.id_continente)
	WHERE (nombre_continente = 'Europeo')
	UNION
	SELECT v.nro_voluntario, v.nombre, v.apellido
	FROM voluntario v
	WHERE EXISTS (
		SELECT id_coordinador
		FROM voluntario
		WHERE (v.nro_voluntario = id_coordinador)
	)
)
ORDER BY apellido, nombre;