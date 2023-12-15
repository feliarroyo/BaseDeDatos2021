SELECT DISTINCT v.nombre, v.apellido, v.e_mail, v.telefono
FROM voluntario v, historico h, tarea ta
WHERE (h.nro_voluntario=v.nro_voluntario) 
	AND (h.id_tarea=ta.id_tarea)
	AND (ta.max_horas-ta.min_horas) <= 5000 
	AND h.fecha_fin < to_date('01/01/2000','DD/MM/YYYY');