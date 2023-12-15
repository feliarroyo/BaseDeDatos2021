SELECT ta.id_tarea
FROM tarea ta
JOIN voluntario v ON (ta.id_tarea = v.id_tarea)
WHERE NOT EXISTS (
	SELECT id_institucion
	FROM institucion
	EXCEPT (
		SELECT id_institucion
		FROM institucion i
		WHERE (i.id_institucion = v.id_institucion)
	)
);

-- Me quedo con alumnos para los cuales no existen: Cualquier materia menos las que se inscribió 
--(en criollo, lo acepto si no le queda ninguna materia para inscribirse)

-- Me quedo con voluntarios para los cuales no existe: Cualquier institucion menos las que se inscribió
-- (en criollo, lo acepto si no le queda ninguna institucion para inscribirse en el historico)