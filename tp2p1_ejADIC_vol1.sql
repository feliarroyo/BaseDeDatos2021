SELECT apellido, nombre, e_mail
FROM unc_esq_peliculas.empleado
WHERE (e_mail LIKE '%@gmail%') AND (sueldo > 1000)
;