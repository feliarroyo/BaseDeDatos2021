SELECT nro_voluntario, COUNT(DISTINCT id_tarea)
FROM historico
GROUP BY nro_voluntario;