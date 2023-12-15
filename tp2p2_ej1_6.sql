SELECT id_tarea, nombre_tarea, max_horas
FROM tarea ta
WHERE ta.id_tarea IN (
    SELECT v.id_tarea
    FROM voluntario v
    JOIN institucion i ON (v.id_institucion = i.id_institucion)
    JOIN direccion d ON (i.id_direccion = d.id_direccion)
    WHERE (d.ciudad='Munich')
    GROUP BY v.id_tarea
    HAVING (COUNT(v.id_tarea)=1)
)
ORDER BY id_tarea;
