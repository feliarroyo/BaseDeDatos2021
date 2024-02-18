CREATE VIEW peliculas_entregadas AS
	SELECT codigo_pelicula, SUM(cantidad)
	FROM unc_esq_peliculas.renglon_entrega
	GROUP BY codigo_pelicula
--	WITH CHECK OPTION --(NO ES AUTOMATICAMENTE ACTUALIZABLE)