CREATE VIEW empleado_dist_20_70 AS
	SELECT *
	FROM empleado_dist_20
	WHERE 
		extract(year from fecha_nacimiento) > 1970 and
		extract(year from fecha_nacimiento) < 1979
--	WITH CHECK OPTION --(es automaticamente actualizable)