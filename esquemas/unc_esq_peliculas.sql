
DROP TABLE if exists video cascade;
DROP TABLE if exists tarea cascade;
DROP TABLE if exists internacional cascade;
DROP TABLE if exists entrega cascade;
DROP TABLE if exists pelicula cascade;
DROP TABLE if exists pais cascade;
DROP TABLE if exists empresa_productora cascade;
DROP TABLE if exists ciudad cascade;
DROP TABLE if exists renglon_entrega cascade;
DROP TABLE if exists empleado cascade;
DROP TABLE if exists nacional cascade;
DROP TABLE if exists distribuidor cascade;
DROP TABLE if exists departamento cascade;

--
-- Name: departamento; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table departamento as select * from unc_esq_peliculas.departamento;

--
-- Name: distribuidor; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--
CREATE TABLE distribuidor as select * from unc_esq_peliculas.distribuidor;

--
-- Name: nacional; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--
CREATE TABLE nacional as select * from unc_esq_peliculas.nacional;

--
-- Name: empleado; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--
CREATE TABLE empleado as select * from unc_esq_peliculas.empleado;

--
-- Name: renglon_entrega; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--
CREATE TABLE renglon_entrega as select * from unc_esq_peliculas.renglon_entrega;

--
-- Name: ciudad; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table ciudad as select * from unc_esq_peliculas.ciudad;

--
-- Name: empresa_productora; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table empresa_productora as select * from unc_esq_peliculas.empresa_productora;

--
-- Name: pais; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--
CREATE TABLE pais as select * from unc_esq_peliculas.pais;

--
-- Name: pelicula; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table pelicula as select * from unc_esq_peliculas.pelicula;

--
-- Name: entrega; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table entrega as select * from unc_esq_peliculas.entrega;

--
-- Name: internacional; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table internacional as select * from unc_esq_peliculas.internacional;

--
-- Name: tarea; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table tarea as select * from unc_esq_peliculas.tarea;

--
-- Name: video; Type: TABLE; Schema: unc_esq_peliculas; Owner: postgres
--

create table video as select * from unc_esq_peliculas.video;

--
-- Name: ciudad pk_ciudad; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (id_ciudad);

--
-- Name: departamento pk_departamento; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (id_distribuidor, id_departamento);


--
-- Name: distribuidor pk_distribuidor; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY distribuidor
    ADD CONSTRAINT pk_distribuidor PRIMARY KEY (id_distribuidor);


--
-- Name: empleado pk_empleado; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT pk_empleado PRIMARY KEY (id_empleado);


--
-- Name: empresa_productora pk_empresa_productora; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empresa_productora
    ADD CONSTRAINT pk_empresa_productora PRIMARY KEY (codigo_productora);


--
-- Name: entrega pk_entrega; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT pk_entrega PRIMARY KEY (nro_entrega);


--
-- Name: internacional pk_internacional; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY internacional
    ADD CONSTRAINT pk_internacional PRIMARY KEY (id_distribuidor);


--
-- Name: nacional pk_nacional; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY nacional
    ADD CONSTRAINT pk_nacional PRIMARY KEY (id_distribuidor);


--
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);


--
-- Name: pelicula pk_pelicula; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY pelicula
    ADD CONSTRAINT pk_pelicula PRIMARY KEY (codigo_pelicula);


--
-- Name: renglon_entrega pk_renglon_entrega; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY renglon_entrega
    ADD CONSTRAINT pk_renglon_entrega PRIMARY KEY (nro_entrega, codigo_pelicula);


--
-- Name: tarea pk_tarea; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT pk_tarea PRIMARY KEY (id_tarea);


--
-- Name: video pk_video; Type: CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY video
    ADD CONSTRAINT pk_video PRIMARY KEY (id_video);

--
-- Name: ciudad ciudad_id_pais_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES pais(id_pais);


--
-- Name: departamento departamento_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);


--
-- Name: departamento departamento_id_distribuidor_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_id_distribuidor_fkey FOREIGN KEY (id_distribuidor) REFERENCES distribuidor(id_distribuidor);


--
-- Name: departamento departamento_jefe_departamento_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_jefe_departamento_fkey FOREIGN KEY (jefe_departamento) REFERENCES empleado(id_empleado);


--
-- Name: empleado empleado_id_distribuidor_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_id_distribuidor_fkey FOREIGN KEY (id_distribuidor, id_departamento) REFERENCES departamento(id_distribuidor, id_departamento);


--
-- Name: empleado empleado_id_jefe_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_id_jefe_fkey FOREIGN KEY (id_jefe) REFERENCES empleado(id_empleado);


--
-- Name: empleado empleado_id_tarea_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_id_tarea_fkey FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea);


--
-- Name: empresa_productora empresa_productora_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY empresa_productora
    ADD CONSTRAINT empresa_productora_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad);


--
-- Name: entrega fk_entrega_distribuidor; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT fk_entrega_distribuidor FOREIGN KEY (id_distribuidor) REFERENCES distribuidor(id_distribuidor);


--
-- Name: entrega fk_entrega_video; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY entrega
    ADD CONSTRAINT fk_entrega_video FOREIGN KEY (id_video) REFERENCES video(id_video);


--
-- Name: nacional fk_nacional_distribuidor; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY nacional
    ADD CONSTRAINT fk_nacional_distribuidor FOREIGN KEY (id_distribuidor) REFERENCES distribuidor(id_distribuidor);


--
-- Name: nacional fk_nacional_mayorista; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY nacional
    ADD CONSTRAINT fk_nacional_mayorista FOREIGN KEY (id_distrib_mayorista) REFERENCES internacional(id_distribuidor);


--
-- Name: renglon_entrega fk_re_entrega; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY renglon_entrega
    ADD CONSTRAINT fk_re_entrega FOREIGN KEY (nro_entrega) REFERENCES entrega(nro_entrega);


--
-- Name: renglon_entrega fk_re_pelicula; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY renglon_entrega
    ADD CONSTRAINT fk_re_pelicula FOREIGN KEY (codigo_pelicula) REFERENCES pelicula(codigo_pelicula);


--
-- Name: internacional internacional_id_distribuidor_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY internacional
    ADD CONSTRAINT internacional_id_distribuidor_fkey FOREIGN KEY (id_distribuidor) REFERENCES distribuidor(id_distribuidor) ON DELETE CASCADE;


--
-- Name: pelicula pelicula_codigo_productora_fkey; Type: FK CONSTRAINT; Schema: unc_esq_peliculas; Owner: postgres
--

ALTER TABLE ONLY pelicula
    ADD CONSTRAINT pelicula_codigo_productora_fkey FOREIGN KEY (codigo_productora) REFERENCES empresa_productora(codigo_productora);
