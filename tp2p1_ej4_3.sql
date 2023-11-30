SELECT id_empleado, fecha_nacimiento, sueldo
FROM unc_esq_peliculas.empleado
WHERE EXTRACT(YEAR FROM fecha_nacimiento)=1960 AND (sueldo > 1500)
ORDER BY id_empleado;