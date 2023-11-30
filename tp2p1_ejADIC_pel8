-- codigos de peliculas de entre 3 y 5 entregas ENTREGAS NO PELIS ENTREGADAS
SELECT id_video, COUNT(nro_entrega)
FROM unc_esq_peliculas.entrega
GROUP BY id_video
HAVING COUNT(nro_entrega) BETWEEN 3 AND 5;