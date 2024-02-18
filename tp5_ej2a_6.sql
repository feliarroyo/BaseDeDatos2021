CREATE VIEW distrib_nac_mas2emp AS
	SELECT *
	FROM distrib_nac nac
	WHERE EXISTS (
		SELECT 1
		FROM unc_esq_peliculas.empleado e
		WHERE (e.id_distribuidor=nac.id_distribuidor)
		GROUP BY id_departamento
		HAVING count(*) > 2
	)
--	WITH CHECK OPTION --(NO ES AUTOMATICAMENTE ACTUALIZABLE)