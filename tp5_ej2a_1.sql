CREATE VIEW empleado_dist_20_chk AS
	SELECT id_empleado, nombre, apellido, sueldo, fecha_nacimiento
	FROM unc_esq_peliculas.empleado
	WHERE id_distribuidor=20
--	WITH CHECK OPTION --(es automaticamente actualizable)