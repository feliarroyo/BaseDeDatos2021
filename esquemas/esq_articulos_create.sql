-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-10-06 21:42:41.102

-- tables
-- Table: ARTICULO
CREATE TABLE ARTICULO (
    id_articulo varchar(10)  NOT NULL,
    descripcion varchar(30)  NOT NULL,
    precio decimal(8,2)  NOT NULL,
    peso decimal(5,2)  NULL,
    ciudad varchar(30)  NOT NULL,
    CONSTRAINT ARTICULO_pk PRIMARY KEY (id_articulo)
);

-- Table: ENVIO
CREATE TABLE ENVIO (
    id_proveedor varchar(10)  NOT NULL,
    id_articulo varchar(10)  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT ENVIO_pk PRIMARY KEY (id_proveedor,id_articulo)
);

-- Table: PROVEEDOR
CREATE TABLE PROVEEDOR (
    id_proveedor varchar(10)  NOT NULL,
    nombre varchar(30)  NOT NULL,
    rubro varchar(15)  NOT NULL,
    ciudad varchar(30)  NOT NULL,
    CONSTRAINT PROVEEDOR_pk PRIMARY KEY (id_proveedor)
);

-- foreign keys
-- Reference: ENVIO_ARTICULO (table: ENVIO)
ALTER TABLE ENVIO ADD CONSTRAINT ENVIO_ARTICULO
    FOREIGN KEY (id_articulo)
    REFERENCES ARTICULO (id_articulo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ENVIO_PROVEEDOR (table: ENVIO)
ALTER TABLE ENVIO ADD CONSTRAINT ENVIO_PROVEEDOR
    FOREIGN KEY (id_proveedor)
    REFERENCES PROVEEDOR (id_proveedor)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

