SELECT v.nro_voluntario, v.nombre, v.apellido, count(h.id_tarea)
FROM voluntario v, historico h
WHERE v.nro_voluntario = h.nro_voluntario
GROUP BY v.nro_voluntario;