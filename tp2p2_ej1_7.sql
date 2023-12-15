SELECT *
FROM direccion d
WHERE d.id_direccion IN (
    SELECT 1
    FROM direccion d
    JOIN institucion i ON (d.id_direccion = i.id_direccion)
    JOIN historico h ON (i.id_institucion = h.id_institucion)
    JOIN voluntario v ON (h.id_tarea = v.id_tarea)
    WHERE (i.id_director IS NOT NULL) AND (i.id_institucion != v.id_institucion)
);