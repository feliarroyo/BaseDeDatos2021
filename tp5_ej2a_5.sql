CREATE VIEW distrib_nac AS
	SELECT n.id_distribuidor, nro_inscripcion, encargado, id_distrib_mayorista
	FROM unc_esq_peliculas.nacional n
	JOIN unc_esq_peliculas.internacional int 
		ON (n.id_distrib_mayorista = int.id_distribuidor)
	WHERE (int.codigo_pais LIKE 'AR')
--	WITH CHECK OPTION --(NO ES AUTOMATICAMENTE ACTUALIZABLE)