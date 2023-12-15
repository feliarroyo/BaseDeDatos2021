SELECT DISTINCT i.nombre_institucion, i.id_institucion, d.calle, d.ciudad, d.provincia
FROM institucion i
JOIN direccion d ON (i.id_direccion = d.id_direccion)
WHERE NOT EXISTS (
	SELECT 1
	FROM voluntario v
	JOIN tarea ta ON (v.id_tarea = ta.id_tarea)
	WHERE (v.horas_aportadas >= ta.max_horas) 
		AND (i.id_institucion = v.id_institucion)
);