SELECT e.id_empleado, e.nombre, e.apellido, j.apellido as "apellido_jefe"
FROM unc_esq_peliculas.empleado e
LEFT OUTER JOIN unc_esq_peliculas.empleado j ON (e.id_jefe = j.id_empleado);