-- No es automaticamente actualizable, por usar SUM, GROUP BY, y JOIN
CREATE VIEW envios_prov AS
SELECT p.id_proveedor, SUM(cantidad)
FROM proveedor p LEFT JOIN envio e ON (p.id_proveedor=e.id_proveedor)
GROUP BY p.id_proveedor