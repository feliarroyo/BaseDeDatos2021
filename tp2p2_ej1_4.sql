SELECT DISTINCT pa.nombre_pais
FROM pais pa
WHERE NOT EXISTS (
	SELECT 1
	FROM historico v
	JOIN institucion i ON (v.id_institucion = i.id_institucion)
	JOIN direccion d ON (i.id_direccion = d.id_direccion)
	WHERE (pa.id_pais = d.id_pais)
)
ORDER BY pa.nombre_pais;