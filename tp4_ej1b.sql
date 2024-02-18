--Suponga la existencia de las siguientes tuplas en las respectivas tablas 
--(sólo se incluyen los atributos que se consideran relevantes para el ejercicio):

--Empleado (A, 1,…) ; (B, 2,…) ; (A, 2,…)
--Proyecto: (1,…) ; (2,…) ; (3,…)
--Trabaja_En (A, 1, 1, ….); (A, 2, 2, …)
--Auspicio: (2, ..., A, 2)

--Indique el resultado de las siguientes operaciones teniendo en cuenta las acciones referenciales e instancias dadas. 
--En caso de que la operación no se pueda realizar, determine qué regla/s entra/n en conflicto y cuál es la causa. 
--De ser aceptada, comente el resultado que produciría. 

--NOTA: En cada caso considere el efecto sobre la instancia original de la BD; los resultados no son acumulativos.

delete from Proyecto where IdProy = 3; -- Como no se utiliza id_proy=3, podemos borrar sin problema.

update Proyecto set IdProy = 7 where IdProy = 3; -- Como no se utiliza id_proy = 7 en ninguna relación, podemos actualizar el id.

delete from Proyecto where IdProy = 1;  -- No podemos hacer el borrado, ya que una tupla en trabaja_en tiene id_proy=1 y la baja
                                        -- es de RIR restrict.

delete from Empleado where TipoE = A and NroE= 2; -- En trabaja_en, al ser baja por cascada, se borra la tupla (A,2,2,...); 
                                                  -- en auspicio, al ser baja set null, la tupla (2,...,A,2) se convierte en (2,...,NULL,NULL).
                                                  -- El empleado puede ser borrado.

update TrabajaEn set IdProy= 3 where IdProy=1; -- Como R2 es de modificación en Cascada, se cambia el id_proy a 1.

update Proyecto set IdProy = 5 where IdProy=2; -- Como una tupla en Auspicio usa IdProy=2, y la RIR de modificación es restricta, 
                                               -- no se puede actualizar el proyecto.
