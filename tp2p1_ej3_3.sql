SELECT id_departamento, id_distribuidor, nombre
FROM unc_esq_peliculas.departamento
WHERE (jefe_departamento IS NULL);