DROP TABLE IF EXISTS tp1_ej3_producto CASCADE;
DROP TABLE IF EXISTS tp1_ej3_proveedor CASCADE;
DROP TABLE IF EXISTS tp1_ej3_sucursal CASCADE;
DROP TABLE IF EXISTS tp1_ej3_provee CASCADE;

CREATE TABLE tp1_ej3_producto(
cod_prod integer NOT NULL,
descripcion varchar(40) NOT NULL,
tipo char(10) NOT NULL,
CONSTRAINT pk_producto PRIMARY KEY (cod_prod)
);

CREATE TABLE tp1_ej3_proveedor(
cod_prov integer NOT NULL,
razon_social varchar(40) NOT NULL,
calle varchar(60) NOT NULL,
altura integer NOT NULL,
piso_dpto varchar(10) NOT NULL,
ciudad varchar(30) NOT NULL,
fecha_nac date,
CONSTRAINT pk_proveedor PRIMARY KEY (cod_prov)
);

CREATE TABLE tp1_ej3_sucursal(
cod_suc char(6) NOT NULL,
nombre varchar(40) NOT NULL,
localidad varchar(30) NOT NULL,
CONSTRAINT PK_SUCURSAL PRIMARY KEY (cod_suc)
);

CREATE TABLE tp1_ej3_provee(
cod_prod integer NOT NULL,
cod_prov integer NOT NULL,
cod_suc char(6) NOT NULL,
CONSTRAINT pk_provee PRIMARY KEY (cod_prod, cod_prov)
);

ALTER TABLE tp1_ej3_provee
ADD CONSTRAINT fk_provee_producto
FOREIGN KEY (cod_prod)
REFERENCES tp1_ej3_producto (cod_prod);

ALTER TABLE tp1_ej3_provee
ADD CONSTRAINT fk_provee_proveedor
FOREIGN KEY (cod_prov)
REFERENCES tp1_ej3_proveedor (cod_prov);

ALTER TABLE tp1_ej3_provee
ADD CONSTRAINT fk_provee_sucursal
FOREIGN KEY (cod_suc)
REFERENCES tp1_ej3_sucursal (cod_suc);