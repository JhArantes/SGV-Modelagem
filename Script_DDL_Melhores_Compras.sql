-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-23 15:49:55 BRT
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c



DROP TABLE mc_bairro CASCADE CONSTRAINTS;

DROP TABLE mc_categoria_prod CASCADE CONSTRAINTS;

DROP TABLE mc_cidade CASCADE CONSTRAINTS;

DROP TABLE mc_classificacao_video CASCADE CONSTRAINTS;

DROP TABLE mc_cliente CASCADE CONSTRAINTS;

DROP TABLE mc_cliente_pf CASCADE CONSTRAINTS;

DROP TABLE mc_cliente_pj CASCADE CONSTRAINTS;

DROP TABLE mc_depto CASCADE CONSTRAINTS;

DROP TABLE mc_end_cliente CASCADE CONSTRAINTS;

DROP TABLE mc_end_func CASCADE CONSTRAINTS;

DROP TABLE mc_estado CASCADE CONSTRAINTS;

DROP TABLE mc_funcionario CASCADE CONSTRAINTS;

DROP TABLE mc_logradouro CASCADE CONSTRAINTS;

DROP TABLE mc_produto CASCADE CONSTRAINTS;

DROP TABLE mc_sgv_sac CASCADE CONSTRAINTS;

DROP TABLE mc_video_do_produto CASCADE CONSTRAINTS;

DROP TABLE mc_visualizacao_do_video CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE mc_bairro (
    cd_bairro      INTEGER NOT NULL,
    cd_cidade      INTEGER NOT NULL,
    nm_bairro      VARCHAR2(50) NOT NULL,
    nm_zona_bairro VARCHAR2(255) NOT NULL
);

ALTER TABLE mc_bairro ADD CONSTRAINT pk_mc_bairro PRIMARY KEY ( cd_bairro );

CREATE TABLE mc_categoria_prod (
    cd_categoria INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tp_categoria VARCHAR2(50) NOT NULL,
    ds_categoria VARCHAR2(255) NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_termino   DATE,
    st_categoria CHAR(1) NOT NULL
);

ALTER TABLE mc_categoria_prod ADD CONSTRAINT ck_mc_cat_prod_st CHECK ( st_categoria IN ( 'A', 'I' ) );
ALTER TABLE mc_categoria_prod ADD CONSTRAINT un_mc_cat_prod_ds UNIQUE ( ds_categoria );

INSERT INTO mc_categoria_prod (tp_categoria, ds_categoria, dt_inicio, dt_termino, st_categoria)  
VALUES ('Alimentos', 'Produtos alimentícios', SYSDATE, NULL, 'A');  

SELECT * FROM mc_categoria_prod;

CREATE TABLE mc_cidade (
    cd_cidade INTEGER NOT NULL,
    cd_estado INTEGER NOT NULL,
    nm_cidade VARCHAR2(50) NOT NULL,
    cd_ibge   INTEGER NOT NULL,
    nr_ddd    VARCHAR2(2) NOT NULL
);

ALTER TABLE mc_cidade ADD CONSTRAINT pk_mc_cidade PRIMARY KEY ( cd_cidade );

ALTER TABLE mc_cidade ADD CONSTRAINT un_mc_cidade_cd_ibge UNIQUE ( cd_ibge );

CREATE TABLE mc_classificacao_video (
    cd_classificacao       INTEGER NOT NULL,
    cd_video               INTEGER NOT NULL,
    ds_classificacao_video VARCHAR2(50) NOT NULL
);

ALTER TABLE mc_classificacao_video ADD CONSTRAINT pk_mc_class_vd PRIMARY KEY ( cd_classificacao );

CREATE TABLE mc_cliente (
    cd_cliente      INTEGER NOT NULL,
    nm_cliente      VARCHAR2(100) NOT NULL,
    qnt_estrelas    SMALLINT,
    vl_medio_compra NUMBER(10, 2) NOT NULL,
    st_cliente      CHAR(1) NOT NULL,
    ds_email        VARCHAR2(100),
    nr_telefone     VARCHAR2(20),
    ds_login        VARCHAR2(50) NOT NULL,
    ds_senha        VARCHAR2(60) NOT NULL,
    dt_cadastro     DATE NOT NULL
);

ALTER TABLE mc_cliente ADD CONSTRAINT pk_mc_cliente PRIMARY KEY ( cd_cliente );

ALTER TABLE mc_cliente ADD CONSTRAINT un_mc_cliente_email UNIQUE ( ds_email );

ALTER TABLE mc_cliente ADD CONSTRAINT un_mc_cliente_telefone UNIQUE ( nr_telefone );

ALTER TABLE mc_cliente ADD CONSTRAINT un_mc_cliente_login UNIQUE ( ds_login );

CREATE TABLE mc_cliente_pf (
    cd_cliente        INTEGER NOT NULL,
    nm_cliente        VARCHAR2(100) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1) NOT NULL,
    ds_genero         VARCHAR2(50),
    nr_cpf            VARCHAR2(14) NOT NULL,
    qnt_estrelas      SMALLINT,
    st_cliente        CHAR(1) NOT NULL,
    nr_telefone       VARCHAR2(20),
    ds_login          VARCHAR2(50) NOT NULL,
    ds_senha          VARCHAR2(60) NOT NULL
);

ALTER TABLE mc_cliente_pf ADD CONSTRAINT pk_mc_cliente_pf PRIMARY KEY ( cd_cliente );

ALTER TABLE mc_cliente_pf ADD CONSTRAINT un_mc_cliente_pf_cpf UNIQUE ( nr_cpf );

ALTER TABLE mc_cliente_pf ADD CONSTRAINT un_mc_cliente_pf_telefone UNIQUE ( nr_telefone );

ALTER TABLE mc_cliente_pf ADD CONSTRAINT un_mc_cliente_pf_login UNIQUE ( ds_login );

CREATE TABLE mc_cliente_pj (
    cd_cliente   INTEGER NOT NULL,
    nm_cliente   VARCHAR2(100) NOT NULL,
    qnt_estrelas SMALLINT,
    nr_cnpj      VARCHAR2(18),
    nr_inscr_est VARCHAR2(20),
    dt_fundacao  DATE,
    st_cliente   CHAR(1) NOT NULL,
    nr_telefone  VARCHAR2(20),
    ds_login     VARCHAR2(50) NOT NULL,
    ds_senha     VARCHAR2(60) NOT NULL
);

ALTER TABLE mc_cliente_pj ADD CONSTRAINT pk_mc_cliente_pj PRIMARY KEY ( cd_cliente );

ALTER TABLE mc_cliente_pj ADD CONSTRAINT un_mc_cliente_pj_cnpj UNIQUE ( nr_cnpj );

ALTER TABLE mc_cliente_pj ADD CONSTRAINT un_mc_cliente_pj_inscr_est UNIQUE ( nr_inscr_est );

ALTER TABLE mc_cliente_pj ADD CONSTRAINT un_mc_cliente_pj_login UNIQUE ( ds_login );

ALTER TABLE mc_cliente_pj ADD CONSTRAINT un_mc_cliente_pj_telefone UNIQUE ( nr_telefone );

CREATE TABLE mc_depto (
    cd_depto INTEGER NOT NULL,
    nm_depto VARCHAR2(50) NOT NULL,
    st_depto CHAR(1) NOT NULL
);

ALTER TABLE mc_depto ADD CONSTRAINT pk_mc_depto PRIMARY KEY ( cd_depto );

ALTER TABLE mc_depto ADD CONSTRAINT un_mc_depto_nm UNIQUE ( nm_depto );

CREATE TABLE mc_end_cliente (
    cd_endereco   INTEGER NOT NULL,
    cd_cliente    INTEGER NOT NULL,
    cd_logradouro INTEGER NOT NULL,
    ds_comp_end   VARCHAR2(50),
    dt_inicio     DATE NOT NULL,
    dt_termino    DATE NOT NULL,
    st_endereco   CHAR(1) NOT NULL
);

ALTER TABLE mc_end_cliente ADD CONSTRAINT pk_mc_end_cliente PRIMARY KEY ( cd_endereco );

CREATE TABLE mc_end_func (
    nr_end         VARCHAR2(20) NOT NULL,
    cd_logradouro  INTEGER NOT NULL,
    cd_funcionario INTEGER NOT NULL,
    ds_comp_end    VARCHAR2(50) NOT NULL,
    dt_inicio      DATE NOT NULL,
    dt_termino     DATE NOT NULL,
    st_end         CHAR(1) NOT NULL
);

ALTER TABLE mc_end_func ADD CONSTRAINT pk_mc_end_func PRIMARY KEY ( nr_end );

CREATE TABLE mc_estado (
    cd_estado INTEGER NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL,
    nm_estado VARCHAR2(50) NOT NULL
);

ALTER TABLE mc_estado ADD CONSTRAINT pk_mc_estado PRIMARY KEY ( cd_estado );

ALTER TABLE mc_estado ADD CONSTRAINT un_mc_estado_sg UNIQUE ( sg_estado );

ALTER TABLE mc_estado ADD CONSTRAINT un_mc_estado_nm UNIQUE ( nm_estado );

CREATE TABLE mc_funcionario (
    cd_funcionario    INTEGER NOT NULL,
    cd_gerente        INTEGER,
    cd_depto          INTEGER NOT NULL,
    nm_funcionario    VARCHAR2(100) NOT NULL,
    nr_cpf            VARCHAR2(14) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    nr_telefone       VARCHAR2(15) NOT NULL,
    ds_email          VARCHAR2(100) NOT NULL,
    ds_cargo          VARCHAR2(50) NOT NULL,
    fl_sexo_biologico CHAR(1) NOT NULL,
    ds_genero         VARCHAR2(50),
    vl_salario        NUMBER(10, 2) NOT NULL,
    st_funcionario    CHAR(1) NOT NULL,
    dt_cadastramento  DATE NOT NULL,
    dt_desligamento   DATE NOT NULL
);

ALTER TABLE mc_funcionario ADD CONSTRAINT pk_mc_func PRIMARY KEY ( cd_funcionario );

ALTER TABLE mc_funcionario ADD CONSTRAINT un_mc_func_cpf UNIQUE ( nr_cpf );

ALTER TABLE mc_funcionario ADD CONSTRAINT un_mc_func_telefone UNIQUE ( nr_telefone );

ALTER TABLE mc_funcionario ADD CONSTRAINT un_mc_func_email UNIQUE ( ds_email );

CREATE TABLE mc_logradouro (
    cd_logradouro INTEGER NOT NULL,
    cd_bairro     INTEGER NOT NULL,
    nm_logradouro VARCHAR2(100) NOT NULL,
    nr_cep        VARCHAR2(10) NOT NULL
);

ALTER TABLE mc_logradouro ADD CONSTRAINT pk_mc_log PRIMARY KEY ( cd_logradouro );

ALTER TABLE mc_logradouro ADD CONSTRAINT un_mc_log_cep UNIQUE ( nr_cep );

CREATE TABLE mc_produto (
    cd_produto        INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cd_categoria      INTEGER NOT NULL,
    nr_cd_barras      VARCHAR2(13),
    ds_produto        VARCHAR2(255) NOT NULL,
    vl_preco_unitario NUMBER(12, 2) NOT NULL,
    tp_embalagem      VARCHAR2(50) NOT NULL,
    st_produto        CHAR(1) NOT NULL,
    vl_perc_lucro     NUMBER(6, 2) NOT NULL,
    ds_completa_prod  VARCHAR2(1000) NOT NULL
);

ALTER TABLE mc_produto ADD CONSTRAINT un_mc_prod_ds UNIQUE ( ds_produto );

ALTER TABLE mc_produto ADD CONSTRAINT un_mc_prod_cd_barras UNIQUE ( nr_cd_barras );

SELECT * FROM mc_categoria_prod;

INSERT INTO mc_produto (cd_categoria, nr_cd_barras, ds_produto, vl_preco_unitario, tp_embalagem, st_produto, vl_perc_lucro, ds_completa_prod)
VALUES (1, '7891234567890', 'Chocolate Amargo', 12.50, 'Caixa', 'A', 20.00, 'Chocolate 70% cacau, embalado em caixa de papelão.');

CREATE TABLE mc_sgv_sac (
    cd_sac                   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cd_cliente               INTEGER NOT NULL,
    cd_funcionario           INTEGER NOT NULL,
    cd_produto               INTEGER NOT NULL,
    dt_hr_abertura_chamado   DATE NOT NULL,
    ds_detalhada_sac         CLOB NOT NULL,
    dt_hr_atendimento_sac    DATE,
    nr_tempo_total_sac       NUMBER(5, 2) NOT NULL,
    ds_detalhada_retorno_sac VARCHAR2(4000) NOT NULL,
    st_sac                   CHAR(1) NOT NULL,
    nr_indice_satisfacao     SMALLINT,
    tp_sac                   VARCHAR2(35) NOT NULL,
    dt_conclusao_chamado     DATE
);

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_st
        CHECK ( st_sac IN ( 'A', 'E', 'C', 'F', 'X' ) );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_indice_satisf CHECK ( nr_indice_satisfacao BETWEEN 1 AND 10 );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_tp CHECK ( tp_sac IN ( '1', '2' ) );
    
INSERT INTO mc_sgv_sac (cd_cliente, cd_funcionario, cd_produto, dt_hr_abertura_chamado, ds_detalhada_sac,
dt_hr_atendimento_sac, nr_tempo_total_sac, ds_detalhada_retorno_sac, st_sac, dt_conclusao_chamado) VALUES(1, 1, 1, DATE,
'Cliente relatou defeito no produto', DATE, 24, 'Produto será substituído sem custo', 'A', NULL);

CREATE TABLE mc_video_do_produto (
    cd_video    INTEGER NOT NULL,
    url_video   VARCHAR2(512) NOT NULL,
    ds_video    VARCHAR2(255) NOT NULL,
    dt_upload   DATE NOT NULL,
    nm_video    VARCHAR2(50) NOT NULL,
    dt_cadastro DATE NOT NULL,
    st_video    CHAR(1) NOT NULL
);

ALTER TABLE mc_video_do_produto
    ADD CONSTRAINT ck_mc_video_prod_st CHECK ( st_video IN ( 'A', 'I' ) );

ALTER TABLE mc_video_do_produto ADD CONSTRAINT pk_mc_vd_prod PRIMARY KEY ( cd_video );

CREATE TABLE mc_visualizacao_do_video (
    cd_visualizacao    INTEGER NOT NULL,
    cd_video           INTEGER NOT NULL,
    cd_cliente         INTEGER NOT NULL,
    dt_hr_visualizacao DATE NOT NULL
);

ALTER TABLE mc_visualizacao_do_video ADD CONSTRAINT pk_mc_visu_vd PRIMARY KEY ( cd_visualizacao );

ALTER TABLE mc_bairro
    ADD CONSTRAINT fk_mc_bairro_cidade FOREIGN KEY ( cd_cidade )
        REFERENCES mc_cidade ( cd_cidade );

ALTER TABLE mc_cidade
    ADD CONSTRAINT fk_mc_cidade_estado FOREIGN KEY ( cd_estado )
        REFERENCES mc_estado ( cd_estado );

ALTER TABLE mc_classificacao_video
    ADD CONSTRAINT fk_mc_class_vd_vd_prod FOREIGN KEY ( cd_video )
        REFERENCES mc_video_do_produto ( cd_video );

ALTER TABLE mc_cliente_pf
    ADD CONSTRAINT fk_mc_cliente_pf_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES mc_cliente ( cd_cliente );

ALTER TABLE mc_cliente_pj
    ADD CONSTRAINT fk_mc_cliente_pj_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES mc_cliente ( cd_cliente );

ALTER TABLE mc_end_cliente
    ADD CONSTRAINT fk_mc_end_cliente_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES mc_cliente ( cd_cliente );

ALTER TABLE mc_end_cliente
    ADD CONSTRAINT fk_mc_end_cliente_log FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_func FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_log FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_func_depto FOREIGN KEY ( cd_depto )
        REFERENCES mc_depto ( cd_depto );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_func_func FOREIGN KEY ( cd_gerente )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_logradouro
    ADD CONSTRAINT fk_mc_log_bairro FOREIGN KEY ( cd_bairro )
        REFERENCES mc_bairro ( cd_bairro );

ALTER TABLE mc_produto
    ADD CONSTRAINT fk_mc_prod_cat_prod FOREIGN KEY ( cd_categoria )
        REFERENCES mc_categoria_prod ( cd_categoria );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_sgv_sac_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES mc_cliente ( cd_cliente );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_sgv_sac_func FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT fk_mc_sgv_sac_prod FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_visualizacao_do_video
    ADD CONSTRAINT fk_mc_visu_vd_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES mc_cliente ( cd_cliente );

ALTER TABLE mc_visualizacao_do_video
    ADD CONSTRAINT fk_mc_visu_vd_vd_prod FOREIGN KEY ( cd_video )
        REFERENCES mc_video_do_produto ( cd_video );

CREATE OR REPLACE TRIGGER arc_cliente_hera_mc_cliente_pf BEFORE
    INSERT OR UPDATE OF cd_cliente ON mc_cliente_pf
    FOR EACH ROW
DECLARE
    d INTEGER;
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.cd_cliente = :new.cd_cliente;

    IF ( d IS NULL
         OR d <> cd_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_PF_CLIENTE in Table MC_CLIENTE_PF violates Arc constraint on Table MC_CLIENTE - discriminator column CD_CLIENTE doesn''t have value CD_CLIENTE'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_cliente_hera_mc_cliente_pj BEFORE
    INSERT OR UPDATE OF cd_cliente ON mc_cliente_pj
    FOR EACH ROW
DECLARE
    d INTEGER;
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.cd_cliente = :new.cd_cliente;

    IF ( d IS NULL
         OR d <> cd_cliente ) THEN
        raise_application_error(-20223, 'FK FK_MC_CLIENTE_PJ_CLIENTE in Table MC_CLIENTE_PJ violates Arc constraint on Table MC_CLIENTE - discriminator column CD_CLIENTE doesn''t have value CD_CLIENTE'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             61
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
