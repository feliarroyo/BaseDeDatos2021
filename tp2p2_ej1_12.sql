SELECT *
FROM unc_esq_peliculas.pelicula pe
WHERE pe.codigo_pelicula NOT IN (
	SELECT DISTINCT re.codigo_pelicula
	FROM unc_esq_peliculas.distribuidor d
	JOIN unc_esq_peliculas.entrega e ON (d.id_distribuidor = e.id_distribuidor)
	JOIN unc_esq_peliculas.renglon_entrega re ON (e.nro_entrega = re.nro_entrega)
	WHERE d.tipo = 'N'
);
--unc_esq_peliculas