SELECT apellido, nombre, id_tarea, to_char(fecha_nacimiento, 'YYYY-MM-DD') AS "Fecha Nacimiento"
FROM voluntario
WHERE EXTRACT(MONTH FROM fecha_nacimiento) = 5;