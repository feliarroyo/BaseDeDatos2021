DROP TABLE IF EXISTS tp1_ej4_grabacion CASCADE;
DROP TABLE IF EXISTS tp1_ej4_grabacion_no_propia CASCADE;
DROP TABLE IF EXISTS tp1_ej4_grabacion_comercial CASCADE;
DROP TABLE IF EXISTS tp1_ej4_equipo CASCADE;

CREATE TABLE tp1_ej4_grabacion(
	nro_grabacion integer NOT NULL,
	casa_discografica varchar(50) NOT NULL,
	fecha_grabacion date NOT NULL,
	tipo char(1) NOT NULL,
	CONSTRAINT pk_grabacion PRIMARY KEY (nro_grabacion)
);

CREATE TABLE tp1_ej4_grabacion_no_propia(
	nro_grabacion integer NOT NULL,
	duracion integer NOT NULL,
	CONSTRAINT pk_grabacion_no_propia PRIMARY KEY (nro_grabacion)
);

CREATE TABLE tp1_ej4_grabacion_comercial(
	nro_grabacion integer NOT NULL,
	nro_equipo	integer NOT NULL,
	CONSTRAINT pk_grabacion_comercial PRIMARY KEY (nro_grabacion)
);

CREATE TABLE tp1_ej4_equipo(
	nro_equipo integer NOT NULL,
	descripcion varchar(50) NOT NULL,
	CONSTRAINT pk_equipo PRIMARY KEY (nro_equipo)
);

ALTER TABLE tp1_ej4_grabacion_no_propia
ADD CONSTRAINT fk_grabacion_no_propia_grabacion
FOREIGN KEY (nro_grabacion)
REFERENCES tp1_ej4_grabacion (nro_grabacion);

ALTER TABLE tp1_ej4_grabacion_comercial
ADD CONSTRAINT fk_grabacion_comercial_grabacion
FOREIGN KEY (nro_grabacion)
REFERENCES tp1_ej4_grabacion (nro_grabacion);

ALTER TABLE tp1_ej4_grabacion_comercial
ADD CONSTRAINT fk_grabacion_comercial_equipo
FOREIGN KEY (nro_equipo)
REFERENCES tp1_ej4_equipo (nro_equipo);