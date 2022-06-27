select * from v$database; -- Seleciona a base dados

----------------------- Perfil_tb ----------------------------------------------
--- Criando a tabela ----
CREATE TABLE perfil_tb (
  idperfil INTEGER NOT NULL,
  descricao_perfil VARCHAR2(20) UNIQUE NOT NULL,
  data_cadastro_perfil DATE NULL
); 

SELECT * FROM perfil_tb; --ok seleciona a tabela e exibe os resultados

ALTER TABLE perfil_tb ADD CONSTRAINT idperfil_PK PRIMARY KEY (idperfil); -- ok adiciona a chave primária do id

CREATE SEQUENCE idperfil START WITH 1; -- ok cria a função sequencia para inserção dos dados

-- inseri os dados na tabela perfil_tb --
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'DIRETOR', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'GERENTE', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'OPERADOR', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'TECNICO', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'CONFERENTE', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO perfil_tb VALUES (idperfil.NEXTVAL,'ADM', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
--------------------------- Perfil_tb ------------------------------------------

------------------------- Departamento -----------------------------------------
--- Criando a tabela --
CREATE TABLE departamento_tb (
  iddepartamento INTEGER NOT NULL,
  descricao_departamento VARCHAR2(30) UNIQUE NOT NULL,
  data_cadastro_departamento DATE NULL
);

SELECT * FROM departamento_tb; --ok seleciona a tabela e exibe os resultados

ALTER TABLE departamento_tb ADD CONSTRAINT iddepartamento_PK PRIMARY KEY (iddepartamento); -- ok adiciona a chave primária do id

CREATE SEQUENCE iddepartamento START WITH 1; -- ok cria a função sequencia para inserção dos dados

--- inseri os dados na tabela departamento_tb ---
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'RECURSOS HUMANOS', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'PRODUÇÃO', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'ALMOXARIFADO', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'COMPRAS', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'DIRETORIA', TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO departamento_tb VALUES (iddepartamento.NEXTVAL,'ADMINISTRATIVO', TO_DATE('24-06-2022', 'DD/MM/YYYY'));

----------------------------- departamento_tb ----------------------------------

----------------------------- modulo_tb ----------------------------------------
-- Criando tabela
CREATE TABLE modulo_tb (
  idmodulo INTEGER NOT NULL,
  descricao_modulo VARCHAR2(50) UNIQUE NOT NULL,
  status_modulo CHAR(1) NOT NULL,
  data_cadastro_modulo DATE NULL
);

SELECT * FROM modulo_tb;

ALTER TABLE modulo_tb ADD CONSTRAINT idmodulo_PK PRIMARY KEY (idmodulo); -- ok adiciona a chave primária do id

CREATE SEQUENCE idmodulo START WITH 1; -- ok cria a função sequencia para inserção dos dados

ALTER TABLE modulo_tb ADD CONSTRAINT ck_status_modulo CHECK (status_modulo in('0','1')) ENABLE; -- Altera o campo para receber somente 0 e 1, onde 0 = INATIVO e 1 = ATIVO

--- inseri os dados na tabela modulo_tb ---
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'FATURAMENTO' , 1, TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'FINANCEIRO' , 1, TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'EXPEDIÇÃO' , 1, TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'PRODUÇÃO' , 1, TO_DATE('24-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'ESTOQUE' , 1, TO_DATE('25-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'DOCUMENTOS' , 1, TO_DATE('25-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'COMPRAS' , 1, TO_DATE('25-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'ENGENHARIA' , 1, TO_DATE('25-06-2022', 'DD/MM/YYYY'));
INSERT INTO modulo_tb VALUES (idmodulo.NEXTVAL, 'PROJETOS' , 1, TO_DATE('25-06-2022', 'DD/MM/YYYY'));

----------------------------- modulo_tb ----------------------------------------

----------------------------- perfil_tb_has_modulo_tb --------------------------
-- cria a tabela de relacionamentos de muitos para muitos
CREATE TABLE perfil_tb_has_modulo_tb (
  perfil_tb_idperfil INTEGER NOT NULL,
  modulo_tb_idmodulo INTEGER NOT NULL
);

SELECT * FROM perfil_tb_has_modulo_tb;

ALTER TABLE perfil_tb_has_modulo_tb ADD CONSTRAINT perfil_tb_idperfil_fk FOREIGN KEY (perfil_tb_idperfil) REFERENCES perfil_tb(idperfil);
ALTER TABLE perfil_tb_has_modulo_tb ADD CONSTRAINT modulo_tb_idmodulo_fk FOREIGN KEY (modulo_tb_idmodulo) REFERENCES modulo_tb(idmodulo);

--- inseri os dados na tabela perfil_tb_has_modulo_tb ---
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 3);
INSERT INTO perfil_tb_has_modulo_tb VALUES (62, 3);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 5);
INSERT INTO perfil_tb_has_modulo_tb VALUES (67, 5);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 6);
INSERT INTO perfil_tb_has_modulo_tb VALUES (67, 6);
INSERT INTO perfil_tb_has_modulo_tb VALUES (63, 6);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 7);
INSERT INTO perfil_tb_has_modulo_tb VALUES (63, 7);
INSERT INTO perfil_tb_has_modulo_tb VALUES (62, 7);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 8);
INSERT INTO perfil_tb_has_modulo_tb VALUES (66, 8);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 9);
INSERT INTO perfil_tb_has_modulo_tb VALUES (67, 9);
INSERT INTO perfil_tb_has_modulo_tb VALUES (64, 9);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 10);
INSERT INTO perfil_tb_has_modulo_tb VALUES (62, 10);
INSERT INTO perfil_tb_has_modulo_tb VALUES (67, 10);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 11);
INSERT INTO perfil_tb_has_modulo_tb VALUES (62, 11);
INSERT INTO perfil_tb_has_modulo_tb VALUES (61, 12);
INSERT INTO perfil_tb_has_modulo_tb VALUES (67, 12);
INSERT INTO perfil_tb_has_modulo_tb VALUES (64, 12);
INSERT INTO perfil_tb_has_modulo_tb VALUES (62, 12);

----------------------------- perfil_tb_has_modulo_tb --------------------------

----------------------------- usuario_tb ---------------------------------------
-- cria a tabela usuario_tb --
CREATE TABLE usuario_tb (
  idusuario INTEGER NOT NULL,
  departamento_tb_iddepartamento INTEGER NOT NULL,
  perfil_tb_idperfil INTEGER NOT NULL,
  nome VARCHAR2(50) NOT NULL,
  login VARCHAR2(30) UNIQUE NOT NULL,
  email VARCHAR2(60) UNIQUE NOT NULL,
  senha VARCHAR2(60) NOT NULL,
  datacadastro DATE NULL,
  data_ultimo_acesso DATE NOT NULL,
  status_usuario VARCHAR2(9) NOT NULL,
  editando_usuario CHAR(1) NOT NULL,
  excluindo_usuario CHAR(1) NOT NULL
);

SELECT *FROM usuario_tb;

ALTER TABLE usuario_tb ADD CONSTRAINT idusuario_PK PRIMARY KEY (idusuario); -- ok adiciona a chave primária do id

ALTER TABLE usuario_tb ADD CONSTRAINT usuario_tb_departamento_tb_fk FOREIGN KEY (departamento_tb_iddepartamento) REFERENCES departamento_tb(iddepartamento); -- ok adiciona a chave estrangeira da tabela modulo_tb para perfil_tb
ALTER TABLE usuario_tb ADD CONSTRAINT usuario_tb_perfil_tb_fk FOREIGN KEY (perfil_tb_idperfil) REFERENCES perfil_tb(idperfil); -- ok adiciona a chave estrangeira da tabela modulo_tb para perfil_tb

CREATE SEQUENCE idusuario START WITH 1; -- ok cria a função sequencia para inserção dos dados

ALTER TABLE usuario_tb ADD CONSTRAINT ck_status_usuario CHECK (status_usuario in('INATIVADO','ATIVADO')) ENABLE; -- Altera o campo para receber somente 0 e 1, onde 0 = INATIVO e 1 = ATIVO
ALTER TABLE usuario_tb ADD CONSTRAINT ck_editando_usuario CHECK (editando_usuario in('0','1')) ENABLE; -- Altera o campo para receber somente 0 e 1, onde 0 = INATIVO e 1 = ATIVO
ALTER TABLE usuario_tb ADD CONSTRAINT ck_excluindo_usuario CHECK (excluindo_usuario in('0','1')) ENABLE; -- Altera o campo para receber somente 0 e 1, onde 0 = INATIVO e 1 = ATIVO

--- inseri os dados na tabela usuario_tb ---
INSERT INTO usuario_tb VALUES (idusuario.NEXTVAL, 41 , 61, 'JOSE ALDENI', 'JOSE', 'jose.aldeni18@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', TO_DATE('24-06-2022', 'DD/MM/YYYY'), TO_DATE('26-06-2022', 'DD/MM/YYYY'), 'ATIVADO', 1, 1);
INSERT INTO usuario_tb VALUES (idusuario.NEXTVAL, 22 , 66, 'JOÃO SILVA', 'JOÃO', 'joao_silva@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', TO_DATE('24-06-2021', 'DD/MM/YYYY'), TO_DATE('26-06-2022', 'DD/MM/YYYY'), 'ATIVADO', 1, 1);

SELECT departamento_tb.iddepartamento,descricao_departamento, usuario_tb.idusuario,departamento_tb_iddepartamento,usuario_tb.perfil_tb_idperfil,usuario_tb.nome,usuario_tb.status_usuario, perfil_tb.idperfil,perfil_tb.descricao_perfil, perfil_tb_has_modulo_tb.*, modulo_tb.idmodulo,modulo_tb.descricao_modulo FROM departamento_tb INNER JOIN usuario_tb ON departamento_tb.iddepartamento = usuario_tb.departamento_tb_iddepartamento INNER JOIN perfil_tb ON usuario_tb.perfil_tb_idperfil = perfil_tb.idperfil INNER JOIN perfil_tb_has_modulo_tb ON perfil_tb_has_modulo_tb.perfil_tb_idperfil = perfil_tb.idperfil INNER JOIN modulo_tb ON perfil_tb_has_modulo_tb.modulo_tb_idmodulo = modulo_tb.idmodulo WHERE usuario_tb.idusuario = 2; -- aqui busca mais dados 

SELECT departamento_tb.descricao_departamento, usuario_tb.nome,usuario_tb.status_usuario, perfil_tb.idperfil, perfil_tb_has_modulo_tb.*, modulo_tb.descricao_modulo FROM departamento_tb INNER JOIN usuario_tb ON departamento_tb.iddepartamento = usuario_tb.departamento_tb_iddepartamento INNER JOIN perfil_tb ON usuario_tb.perfil_tb_idperfil = perfil_tb.idperfil INNER JOIN perfil_tb_has_modulo_tb ON perfil_tb_has_modulo_tb.perfil_tb_idperfil = perfil_tb.idperfil INNER JOIN modulo_tb ON perfil_tb_has_modulo_tb.modulo_tb_idmodulo = modulo_tb.idmodulo WHERE usuario_tb.idusuario = 2; -- seleciona os dados Sql

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"SYSTEM"."VERIFICARACESSOUSUARIO"',
            job_type => 'PLSQL_BLOCK',
            job_action => '',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'Verifica a data do ultimo acesso do usuário do sistema para INATIVALO');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"SYSTEM"."VERIFICARACESSOUSUARIO"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
  
    
    DBMS_SCHEDULER.enable(
             name => '"SYSTEM"."VERIFICARACESSOUSUARIO"');
END;
