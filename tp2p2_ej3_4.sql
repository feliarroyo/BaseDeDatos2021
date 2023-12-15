SELECT *
FROM voluntario v
WHERE NOT EXISTS (
	SELECT id_institucion
	FROM institucion
	EXCEPT (
		SELECT h.id_institucion
		FROM historico h
		WHERE (h.id_institucion = v.id_institucion)
	)
)
ORDER BY v.nombre;

-- Me quedo con alumnos para los cuales no existen: Cualquier materia menos las que se inscribió 
--(en criollo, lo acepto si no le queda ninguna materia para inscribirse)

-- Me quedo con voluntarios para los cuales no existe: Cualquier institucion menos las que se inscribió
-- (en criollo, lo acepto si no le queda ninguna institucion para inscribirse en el historico)