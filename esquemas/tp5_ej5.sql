CREATE VIEW CIUDAD_KP_2 AS
SELECT id_ciudad, nombre_ciudad, C.id_pais, nombre_pais
FROM unc_esq_peliculas.ciudad C NATURAL JOIN unc_esq_peliculas.pais P;

CREATE VIEW ENTREGAS_KP_3 AS
SELECT nro_entrega, RE.codigo_pelicula, cantidad, titulo
FROM unc_esq_peliculas.renglon_entrega RE NATURAL JOIN unc_esq_peliculas.pelicula P;