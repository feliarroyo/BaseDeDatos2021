-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-03-02 16:29:01.708

-- tables
-- Table: CONTACTO
CREATE TABLE CONTACTO (
    nro_doc int  NOT NULL,
    tipo_doc char(3)  NOT NULL,
    nom_apell varchar(50)  NOT NULL,
    fecha_alta date  NOT NULL,
    e_mail varchar(25)  NULL,
    domicilio varchar(50)  NOT NULL,
    zona varchar(10)  NOT NULL,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (nro_doc,tipo_doc)
);

-- Table: ESPACIO
CREATE TABLE ESPACIO (
    id_espacio int  NOT NULL,
    tipo_esp char(10)  NOT NULL,
    nro_doc int  NULL,
    tipo_doc char(3)  NULL,
    ubicacion varchar(40)  NOT NULL,
    costo_diario decimal(10,2)  NOT NULL,
    CONSTRAINT PK_POSICION PRIMARY KEY (id_espacio,tipo_esp)
);

-- Table: RESERVA
CREATE TABLE RESERVA (
    nro_reserva int  NOT NULL,
    nro_doc int  NOT NULL,
    tipo_doc char(3)  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    importe decimal(10,2)  NOT NULL,
    confirmada boolean  NOT NULL,
    CONSTRAINT PK_ALQUILER PRIMARY KEY (nro_reserva)
);

-- Table: RESERVA_ESPACIO
CREATE TABLE RESERVA_ESPACIO (
    nro_reserva int  NOT NULL,
    tipo_esp char(10)  NOT NULL,
    id_esp int  NOT NULL,
    ocupado boolean  NOT NULL,
    CONSTRAINT PK_ALQUILER_POSICIONES PRIMARY KEY (tipo_esp,nro_reserva,id_esp)
);

-- Table: TIPO_ESPACIO
CREATE TABLE TIPO_ESPACIO (
    tipo_esp char(10)  NOT NULL,
    descrip varchar(50)  NOT NULL,
    superf_max decimal(10,2)  NOT NULL,
    volum_max decimal(10,2)  NULL,
    CONSTRAINT PK_FILA PRIMARY KEY (tipo_esp)
);

-- foreign keys
-- Reference: ESPACIO_CONTACTO (table: ESPACIO)
ALTER TABLE ESPACIO ADD CONSTRAINT ESPACIO_CONTACTO
    FOREIGN KEY (nro_doc, tipo_doc)
    REFERENCES CONTACTO (nro_doc, tipo_doc)
    ON DELETE  SET NULL 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_ESPACIO_TIPO (table: ESPACIO)
ALTER TABLE ESPACIO ADD CONSTRAINT FK_ESPACIO_TIPO
    FOREIGN KEY (tipo_esp)
    REFERENCES TIPO_ESPACIO (tipo_esp)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_RESERVA_CONTACTO (table: RESERVA)
ALTER TABLE RESERVA ADD CONSTRAINT FK_RESERVA_CONTACTO
    FOREIGN KEY (nro_doc, tipo_doc)
    REFERENCES CONTACTO (nro_doc, tipo_doc) 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_RESERVA_ESPACIO_RESERVA (table: RESERVA_ESPACIO)
ALTER TABLE RESERVA_ESPACIO ADD CONSTRAINT FK_RESERVA_ESPACIO_RESERVA
    FOREIGN KEY (nro_reserva)
    REFERENCES RESERVA (nro_reserva)
    ON DELETE  CASCADE 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RESERVA_ESPACIO_ESPACIO (table: RESERVA_ESPACIO)
ALTER TABLE RESERVA_ESPACIO ADD CONSTRAINT RESERVA_ESPACIO_ESPACIO
    FOREIGN KEY (id_esp, tipo_esp)
    REFERENCES ESPACIO (id_espacio, tipo_esp) 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

