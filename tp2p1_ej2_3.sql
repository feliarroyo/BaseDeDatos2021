SELECT DISTINCT (apellido, ' ', nombre) AS "Apellido y nombre", e_mail AS "Dirección de mail"
FROM voluntario
WHERE (telefono LIKE '+11%');