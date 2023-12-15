SELECT n.id_distribuidor, n.nro_inscripcion
FROM unc_esq_peliculas.nacional n
JOIN unc_esq_peliculas.entrega e ON (n.id_distribuidor = e.id_distribuidor)
JOIN unc_esq_peliculas.renglon_entrega re ON (e.nro_entrega = re.nro_entrega)
JOIN unc_esq_peliculas.pelicula pe on (re.codigo_pelicula = pe.codigo_pelicula)
WHERE (pe.idioma = 'Español') AND (EXTRACT(YEAR FROM e.fecha_entrega) > 2010);