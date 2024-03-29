--R1
ALTER TABLE trabaja_en ADD CONSTRAINT fk_trabaja_en_Empleado
FOREIGN KEY (TipoE, NroE)
REFERENCES empleado(TipoE, NroE)
MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;

--R2
ALTER TABLE trabaja_en ADD CONSTRAINT fk_trabaja_en_Proyecto
FOREIGN KEY(idProy)
REFERENCES proyecto (idProy)
MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;

--R3
ALTER TABLE auspicio ADD CONSTRAINT fk_auspicio_proyecto
FOREIGN KEY (idProy)
REFERENCES proyecto (idProy)
MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT;

--R4
ALTER TABLE auspicio ADD CONSTRAINT fk_auspicio_empleado
FOREIGN KEY (TipoE,NroE)
REFERENCES empleado (TipoE, NroE)
MATCH FULL ON UPDATE RESTRICT ON DELETE SET NULL;