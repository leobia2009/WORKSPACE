-- --------------------------------------------------------------------------------
--  Script   create_mysql_ecommerce.sql
--  Data de criação:  novembro-2022
-- --------------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0; 

-- Conditionally drop objects.
SELECT 'usuario_dba' AS 'Drop Table';
DROP TABLE IF EXISTS usuario_dba;

-- ------------------------------------------------------------------
-- Create usuario table.
-- ------------------------------------------------------------------
SELECT 'usuario_dba' AS 'Create Table';

CREATE TABLE usuario_dba
( usuario_dba_id                  INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, usuario_dba_name                CHAR(20)     NOT NULL
, usuario_dba_tipo                INT UNSIGNED NOT NULL
, first_name                  CHAR(20)
, middle_name                 CHAR(20)
, last_name                   CHAR(20)
, KEY usuario_dba_fk1 (usuario_dba_tipo)
, CONSTRAINT usuario_dba_fk1 FOREIGN KEY (usuario_dba_tipo) REFERENCES usuario_dba_tipo (usuario_dba_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE usuario_dba AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'usuario_dba_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS usuario_dba_tipo;

CREATE TABLE usuario_dba_tipo
( usuario_dba_tipo_id					INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, usuario_dba_tipo 						CHAR(30)	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE usuario_dba_tipo AUTO_INCREMENT = 1001;

-- first insert into usuario_tipo, then insert into usuario

INSERT INTO usuario_dba_tipo
( usuario_dba_tipo 
)
VALUES
 ('administrador'),
 ('dev_database');
  
INSERT INTO usuario_dba
( usuario_dba_name
, usuario_dba_tipo
)
VALUES
('leobia2009_admin',1),
('leobia2009_dev',2); 

 
-- Conditionally drop objects.
SELECT 'contas' AS 'Drop Table';
DROP TABLE IF EXISTS contas;


-- ------------------------------------------------------------------
-- Create CONTAS table.
-- ------------------------------------------------------------------
SELECT 'contas' AS 'Create Table';

CREATE TABLE contas
( contas_id           	   		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contas_tipo               	INT UNSIGNED
, contas_number         	CHAR(10)     			NOT NULL
, password 						INT UNSIGNED 		NOT NULL
, KEY contas_fk1 (contas_tipo)
, CONSTRAINT contas_fk1 FOREIGN KEY (contas_tipo) REFERENCES contas_tipo (contas_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE contas AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'contas_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS contas_tipo;

SELECT 'contas_tipo' AS 'create_table';

CREATE TABLE contas_tipo
( contas_tipo_id 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contas_tipo 					CHAR(30) 			NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE contas_tipo AUTO_INCREMENT = 1001;


-- create default contas tipos
INSERT INTO contas_tipo
( contas_tipo 
)
VALUES
('administrator')
,('user')
,('group')
,('individual');


-- Conditionally drop objects.
SELECT 'CONTATOS' AS 'Drop Table';
DROP TABLE IF EXISTS contatos;

-- ------------------------------------------------------------------
-- Create CONTATOS table.
-- ------------------------------------------------------------------
SELECT 'CONTATOS' AS 'Create Table';

CREATE TABLE contatos
( contatos_id                  	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contas_id                   	INT UNSIGNED 	NOT NULL
, contatos_tipo                	INT UNSIGNED 
, email 							CHAR(30)			NOT NULL
, first_name                  	CHAR(30)     		NOT NULL
, middle_name               	CHAR(30)	
, last_name                   	CHAR(30)     		NOT NULL
, KEY contatos_fk1 (contas_id)
, CONSTRAINT contatos_fk1 FOREIGN KEY (contas_id) REFERENCES contas (contas_id)
, KEY contatos_fk2 (contatos_tipo)
, CONSTRAINT contatos_fk2 FOREIGN KEY (contatos_tipo) REFERENCES contatos_tipo (contatos_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE contatos AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'contatos_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS contatos_tipo;

SELECT 'contatos_tipo' AS 'CREATE TABLE';

CREATE TABLE contatos_tipo
( contatos_tipo_id 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contatos_tipo 						CHAR(30)				NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE contatos_tipo AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'telefone' AS 'Drop Table';
DROP TABLE IF EXISTS telefone;

SELECT 'telefone' AS 'create table';

CREATE TABLE telefone
( telefone_id 					INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contatos_id                    INT UNSIGNED NOT NULL
, area_code 		            CHAR(3)	        NOT NULL
, telefone_number 		    	CHAR(20)				NOT NULL
, telefone_tipo 				INT UNSIGNED		NOT NULL
, KEY telefone_fk1 (contatos_id)
, CONSTRAINT telefone_fk1 FOREIGN KEY (contatos_id) REFERENCES contatos (contatos_id)
, KEY telefone_fk2 (telefone_tipo)
, CONSTRAINT telefone_fk2 FOREIGN KEY (telefone_tipo) REFERENCES telefone_tipo (telefone_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE telefone AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'telefone_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS telefone_tipo;

SELECT 'telefone_tipo' AS 'create table';

CREATE TABLE telefone_tipo
( telefone_tipo_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, telefone_tipo 				CHAR(30)			NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE telefone_tipo AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'cartao_de_credito' AS 'Drop Table';
DROP TABLE IF EXISTS cartao_de_credito;

SELECT 'cartao_de_credito' AS 'create table';

CREATE TABLE cartao_de_credito
( cartao_de_credito_id 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contas_id 					INT UNSIGNED 		NOT NULL
, cartao_de_credito_number 		CHAR(16)		 		NOT NULL
, cartao_de_credito_tipo 			INT UNSIGNED 		NOT NULL
, expiration_date 			DATE 		 				NOT NULL
, cvv 								CHAR(6)
, KEY cartao_de_credito_fk1 (contas_id)
, CONSTRAINT cartao_de_credito_fk1 FOREIGN KEY (contas_id) REFERENCES contas (contas_id)
, KEY cartao_de_credito_fk2 (cartao_de_credito_tipo)
, CONSTRAINT cartao_de_credito_fk2 FOREIGN KEY (cartao_de_credito_tipo) REFERENCES cartao_de_credito_tipo (cartao_de_credito_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE cartao_de_credito AUTO_INCREMENT = 1001;


-- Conditionally drop objects.
SELECT 'cartao_de_credito_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS cartao_de_credito_tipo;

SELECT 'cartao_de_credito_tipo' AS 'create table';

CREATE TABLE cartao_de_credito_tipo
( cartao_de_credito_tipo_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, cartao_de_credito_tipo 				CHAR(30)			NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE cartao_de_credito_tipo AUTO_INCREMENT = 1001;

-- create endereco table
-- Conditionally drop objects.
SELECT 'endereco' AS 'Drop Table';
DROP TABLE IF EXISTS endereco;

SELECT 'endereco' AS 'create table';

CREATE TABLE endereco
( endereco_id				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, endereco_tipo	 		INT UNSIGNED
, contas_id 				INT UNSIGNED		NOT NULL
, logradouro_endereco 			CHAR(50) 				NOT NULL
, cidade_estado_id				INT UNSIGNED 		NOT NULL
, CEP_id			INT UNSIGNED 		NOT NULL
, KEY endereco_fk1 (endereco_tipo)
, CONSTRAINT endereco_fk1 FOREIGN KEY (endereco_tipo) REFERENCES endereco_tipo (endereco_tipo_id)
, KEY endereco_fk2 (contas_id)
, CONSTRAINT endereco_fk2 FOREIGN KEY (contas_id) REFERENCES contas (contas_id)
, KEY endereco_fk3 (cidade_estado_id)
, CONSTRAINT endereco_fk3 FOREIGN KEY (cidade_estado_id) REFERENCES cidade_estado (cidade_estado_id)
, KEY endereco_fk4 (CEP_id)
, CONSTRAINT endereco_fk4 FOREIGN KEY (CEP_id) REFERENCES CEP (CEP_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE endereco AUTO_INCREMENT = 1001;

-- create endereco_tipo table
-- Conditionally drop objects.
SELECT 'endereco_tipo' AS 'Drop Table';
DROP TABLE IF EXISTS endereco_tipo;

SELECT 'endereco_tipo' AS 'create table';

CREATE TABLE endereco_tipo
( endereco_tipo_id	 		INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, endereco_tipo 				INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE endereco_tipo AUTO_INCREMENT = 1001;

-- create cidade table
-- Conditionally drop objects.
SELECT 'cidade' AS 'Drop Table';
DROP TABLE IF EXISTS cidade;

SELECT 'cidade' AS 'create table';

CREATE TABLE cidade
( cidade_id 						INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, cidade 							CHAR(200)				NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE cidade AUTO_INCREMENT = 1001;

-- create estado table
-- Conditionally drop objects.
SELECT 'estado' AS 'Drop Table';
DROP TABLE IF EXISTS estado;

SELECT 'estado' AS 'create table';

CREATE TABLE estado
( estado_id 				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, estado 						INT UNSIGNED
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE estado AUTO_INCREMENT = 1001;

-- create cidade_estado table
-- Conditionally drop objects.
SELECT 'cidade_estado' AS 'Drop Table';
DROP TABLE IF EXISTS cidade_estado;

SELECT 'cidade_estado' AS 'create table';

CREATE TABLE cidade_estado
( cidade_estado_id 				INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, cidade_id 						INT UNSIGNED 		NOT NULL
, estado_id 					INT UNSIGNED 		NOT NULL
, KEY cidade_estado_fk1 (cidade_id)
, CONSTRAINT cidade_estado_fk1 FOREIGN KEY (cidade_id) REFERENCES cidade (cidade_id)
, KEY cidade_estado_fk2 (estado_id)
, CONSTRAINT cidade_estado_fk2 FOREIGN KEY (estado_id) REFERENCES estado (estado_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE cidade_estado AUTO_INCREMENT = 1001;

-- create CEP table
SELECT 'CEP' AS 'Drop Table';
DROP TABLE IF EXISTS CEP;

SELECT 'CEP' AS 'create table';

CREATE TABLE CEP
( CEP_id 			INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, CEP 				INT UNSIGNED 		NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE CEP AUTO_INCREMENT = 1001;


-- create item_categoria table
SELECT 'item_categoria' AS 'Drop Table';
DROP TABLE IF EXISTS item_categoria;

SELECT 'item_categoria' AS 'create table';

CREATE TABLE item_categoria
( item_categoria_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, item_categoria 				CHAR(50)				NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE item_categoria AUTO_INCREMENT = 1001;

-- create item_subcategoria table

SELECT 'item_subcategoria' AS 'Drop Table';
DROP TABLE IF EXISTS item_subcategoria;

SELECT 'item_subcategoria' AS 'create table';

CREATE TABLE item_subcategoria
( item_subcategoria_id 	INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, categoria_id 					INT UNSIGNED 		NOT NULL
, item_subcategoria 			CHAR(50)				NOT NULL
, KEY item_subcategoria_fk1 (categoria_id)
, CONSTRAINT item_subcategoria_fk1 FOREIGN KEY (categoria_id) REFERENCES item_categoria (item_categoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE item_subcategoria AUTO_INCREMENT = 1001;



-- create item table
SELECT 'item' AS 'Drop Table';
DROP TABLE IF EXISTS item;

SELECT 'item' AS 'create table';

CREATE TABLE item
( item_id 							INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, item_titulo 						CHAR(255) 			NOT NULL
, item_subtitulo 					CHAR(255) 
, item_categoria_id 			INT UNSIGNED		NOT NULL
, item_subcategoria_id 	INT UNSIGNED
, KEY item_fk1 (item_categoria_id)
, CONSTRAINT item_fk1 FOREIGN KEY (item_categoria_id) REFERENCES item_categoria (item_categoria_id)
, KEY item_fk2 (item_subcategoria_id)
, CONSTRAINT item_fk2 FOREIGN KEY (item_subcategoria_id) REFERENCES item_subcategoria (item_subcategoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE item AUTO_INCREMENT = 1001;



-- Create transacao Table
SELECT 'transacao' AS 'drop Table';
DROP TABLE IF EXISTS transacao;

SELECT 'transacao' AS 'create table';

CREATE TABLE transacao
( transacao_id 			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, contas_id 				INT UNSIGNED 		NOT NULL
, transacao_tipo 		INT UNSIGNED
, transacao_date 		DATE 						NOT NULL
, amount 						INT UNSIGNED 		NOT NULL
, KEY transacao_fk1 (contas_id)
, CONSTRAINT transacao_fk1 FOREIGN KEY (contas_id) REFERENCES contas (contas_id)
, KEY transacao_fk2 (transacao_tipo)
, CONSTRAINT transacao_fk2 FOREIGN KEY (transacao_tipo) REFERENCES transacao_tipo (transacao_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE transacao AUTO_INCREMENT = 1001;


-- Create transacao_tipo table
SELECT 'transacao_tipo' AS 'drop table';
DROP TABLE IF EXISTS transacao_tipo;

SELECT 'transacao_tipo' AS 'create table';

CREATE TABLE transacao_tipo
( transacao_tipo_id 		INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, transacao_tipo 			CHAR(50) 				NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE transacao_tipo AUTO_INCREMENT = 1001;


-- create transacao_item table
SELECT 'transacao_item' AS 'drop table';
DROP TABLE IF EXISTS transacao_item;

SELECT 'transacao_item' AS 'create table';

CREATE TABLE transacao_item
( transacao_item_id 		INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, transacao_id 				INT UNSIGNED 		NOT NULL
, item_id 							INT UNSIGNED 		NOT NULL
, KEY transacao_item_fk1 (transacao_id)
, CONSTRAINT transacao_item_fk1 FOREIGN KEY (transacao_id) REFERENCES transacao (transacao_id)
, KEY transacao_item_fk2 (item_id)
, CONSTRAINT transacao_item_fk2 FOREIGN KEY (item_id) REFERENCES item (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE transacao_item AUTO_INCREMENT = 1001;


-- create preco table
SELECT 'preco' AS 'drop table';
DROP TABLE IF EXISTS preco;

SELECT 'preco' AS 'create table';

CREATE TABLE preco
( preco_id 					INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, item_id 						INT UNSIGNED 		NOT NULL
, preco_tipo 				INT UNSIGNED 		
, active_flag 				TEXT 						NOT NULL
, data_ini 					DATE 						NOT NULL
, data_fim 					DATE
, amount 						INT UNSIGNED 		NOT NULL
, KEY preco_fk1 (item_id)
, CONSTRAINT preco_fk1 FOREIGN KEY (item_id) REFERENCES item (item_id)
, KEY preco_fk2 (preco_tipo)
, CONSTRAINT preco_fk2 FOREIGN KEY (preco_tipo) REFERENCES preco_tipo (preco_tipo_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE preco AUTO_INCREMENT = 1001;


-- create preco_tipo table
SELECT 'preco_tipo' AS 'drop table';
DROP TABLE IF EXISTS preco_tipo;

SELECT 'preco_tipo' AS 'create table';

CREATE TABLE preco_tipo
( preco_tipo_id 			INT UNSIGNED 	PRIMARY KEY AUTO_INCREMENT
, preco_tipo 				CHAR(50) 				NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE preco_tipo AUTO_INCREMENT = 1001;
-- Commit inserts.
COMMIT;

-- Display tables.
SHOW TABLES;

-- Close log file.
-- NOTEE
