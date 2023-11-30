SELECT (nombre, ', ', apellido) AS "Nombre y apellido", to_char(fecha_nacimiento, 'DD-MM') AS "Fecha Nacimiento"
FROM voluntario
ORDER BY EXTRACT(MONTH FROM fecha_nacimiento), EXTRACT(DAY FROM fecha_nacimiento);