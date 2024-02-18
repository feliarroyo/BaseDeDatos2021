CREATE VIEW empleado_dist_2000 AS
	SELECT id_empleado, nombre, apellido, sueldo, fecha_nacimiento
	FROM empleado_dist_20
	WHERE sueldo > 2000
--	WITH CHECK OPTION --(es automaticamente actualizable)