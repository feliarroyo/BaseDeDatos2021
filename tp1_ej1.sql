drop table if exists tp1_ej1_articulo cascade;
drop table if exists tp1_ej1_palabra cascade;
drop table if exists tp1_ej1_contiene cascade;

CREATE TABLE tp1_ej1_articulo (
id_articulo int[4] NOT NULL,
titulo varchar[120] NOT NULL UNIQUE,
autor varchar[30] NOT NULL,
fecha date NOT NULL,
CONSTRAINT pk_articulo PRIMARY KEY (id_articulo)
);

CREATE TABLE tp1_ej1_palabra (
cod_p int[4] NOT NULL,
idioma char[2] NOT NULL,
descripcion varchar[25] NOT NULL,
CONSTRAINT pk_palabra PRIMARY KEY (cod_p, idioma)
);

CREATE TABLE tp1_ej1_contiene (
palabra_cod_p int[4] NOT NULL,
palabra_idioma char[2] NOT NULL,
articulo_id_articulo int[4] NOT NULL,
CONSTRAINT pk_contiene
	PRIMARY KEY (palabra_cod_p, palabra_idioma, articulo_id_articulo),
CONSTRAINT fk_contiene_palabra 
	FOREIGN KEY (palabra_cod_p, palabra_idioma)
	REFERENCES tp1_ej1_palabra (cod_p, idioma),
CONSTRAINT fk_contiene_articulo
	FOREIGN KEY (articulo_id_articulo)
	REFERENCES tp1_ej1_articulo (id_articulo)
);