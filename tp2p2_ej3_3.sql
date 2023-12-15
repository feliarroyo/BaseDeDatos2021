SELECT *
FROM voluntario
EXCEPT
	SELECT *
	FROM voluntario
	WHERE id_institucion NOT IN (
		SELECT id_institucion
		FROM institucion i
		JOIN direccion d ON (i.id_direccion = d. id_direccion)
		JOIN pais pa ON (d.id_pais = pa.id_pais)
		JOIN continente co ON (pa.id_continente = co.id_continente)
		WHERE (nombre_continente = 'Europeo')
	)