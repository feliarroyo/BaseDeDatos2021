SELECT MIN(horas_aportadas), MAX(horas_aportadas), AVG(horas_aportadas)
FROM voluntario
WHERE EXTRACT(year from age(fecha_nacimiento)) > 25;