DROP TABLE IF EXISTS tp1_ej2_curso CASCADE;
DROP TABLE IF EXISTS tp1_ej2_alumno CASCADE;
DROP TABLE IF EXISTS tp1_ej2_inscripto CASCADE;

CREATE TABLE tp1_ej2_curso(
cod char(4) NOT NULL,
descripcion varchar(40) NOT NULL,
tipo char(1) NOT NULL,
cod_referente char(4),
lu_referente integer,
CONSTRAINT pk_curso PRIMARY KEY (cod) 
);

CREATE TABLE tp1_ej2_alumno(
lu integer NOT NULL,
nombre varchar(40) NOT NULL,
provincia varchar(30) NOT NULL,
CONSTRAINT pk_alumno PRIMARY KEY (lu)
);

CREATE TABLE tp1_ej2_inscripto(
curso_cod char(4) NOT NULL,
alumno_lu integer NOT NULL,
CONSTRAINT pk_inscripto PRIMARY KEY (curso_cod, alumno_lu)
);

ALTER TABLE tp1_ej2_curso ADD CONSTRAINT fk_curso_inscripto
FOREIGN KEY (cod_referente, lu_referente)
REFERENCES tp1_ej2_inscripto (curso_cod, alumno_lu)
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

ALTER TABLE tp1_ej2_inscripto ADD CONSTRAINT fk_inscripto_curso
FOREIGN KEY (curso_cod)
REFERENCES tp1_ej2_curso (cod)
NOT DEFERRABLE
INITIALLY IMMEDIATE
;

ALTER TABLE tp1_ej2_inscripto ADD CONSTRAINT fk_inscripto_alumno
FOREIGN KEY (alumno_lu)
REFERENCES tp1_ej2_alumno (lu)
NOT DEFERRABLE
INITIALLY IMMEDIATE
;