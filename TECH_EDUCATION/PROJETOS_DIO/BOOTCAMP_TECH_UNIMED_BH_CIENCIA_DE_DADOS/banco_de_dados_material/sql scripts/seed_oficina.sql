use oficina_refinado;

INSERT INTO COR
( nome_cor 
)
VALUES
 ('azul'),
 ('vermelho'),
 ('cinza'),
 ('verde'),
 ('preto'),
 ('branco');
 
 select * from COR;
 
 INSERT INTO cargos
( Nome_car,
  Descricao_car
)
VALUES
 ('diretor',
  'direcao executiva'),
 ('secretario',
  'secretaria geral'),
 ('atendente',
  'atendimento no balcao'),
 ('mecânico',
  'servicos de mecanica em geral'),
 ('lanterneiro',
  'servicos de lanternagem geral'),
 ('auxiliar',
  'auxiliar de servicos gerais'),
  ('telefonista',
   'atendimento telefonico');
 
 desc cargos;
 select * from cargos;
 
 
INSERT INTO setor
(Nome_set,
 Descricao 
)
VALUES
 ('Administrativo',
  'Servicos administrativos em geral'),
 ('Operacional',
  'Servicos especializados de manutencao e correcao');
 
 desc setor;
 select * from setor;
 
 INSERT INTO estados
( Nome_est,
  UF_est
)
VALUES
 ('Minas Gerais',
  'MG'),
 ('São Paulo',
  'SP'),
 ('Bahia',
  'BA'),
 ('Goias',
  'GO'),
 ('Paraná',
  'PR'),
 ('Rio Grande do Sul',
  'RS'),
  ('Ceará',
   'CE');
 desc estados;
 select * from estados;
 
 INSERT INTO cidades
( Estados_idEstados,
  Nome_cid
)
VALUES
 (1,'Belo Horizonte'),
 (2,'São Paulo'),
 (3,'Salvador'),
 (4,'Goiania'),
 (5,'Curitiba'),
 (1,'Três Corações');
 
 desc cidades;
 select * from cidades;
 
 INSERT INTO Pessoas
( Nome_psa,
  Tipo_psa,
  Cliente_psa,
  Fornecedor_psa,
  Email_psa
)
VALUES
 ('Geraldo Eustaquio',
  '1',
  'N',
  'N',
  'xxxx@yahoo.com.br'),
 ('Geraldo Branco',
  '1',
  'S',
  'N',
  'yyyy@yahoo.com.br'),
 ('Marcio Azul',
  '1',
  'S',
  'N',
  'ssssss@yahoo.com.br'),
 ('Marcio Branco Ltda',
  '2',
  'N',
  'S',
  'sssssss@yahoo.com.br'),
 ('Otavio Mesquita',
  '1',
  'S',
  'N',
  'm1m1m1m1@yahoo.com.br'),
  ('Otavio Mesquita',
  '1',
  'N',
  'S',
  'm1m1m1m1@yahoo.com.br'),
  ('Joel Santana',
  '1',
  'N',
  'N',
  'lllllll@yahoo.com.br'),
  ('Loca Carros ltda',
  '2',
  'S',
  'N',
  'ghghghgh@yahoo.com.br');
 
 desc Pessoas;
 select * from Pessoas;
 
 
 INSERT INTO pessoa_fisica
( Pessoas_idPessoas,
  CPF_fis,
  Datanas_fis,
  Genero_fis,
  Nacionalidade_fis,
  Naturalidade_fis
)
VALUES
 (1001,
  '23946369120',
  '2000-12-03',
  'M',
  'Brasileira',
  'Três Corações'),
  (1002,
  '23676378120',
  '1990-11-05',
  'M',
  'Brasileira',
  'Belo Horizonte'),
  (1003,
  '23941289120',
  '1945-08-14',
  'F',
  'Brasileira',
  'Fortaleza'),
  (1005,
  '24786369120',
  '2000-12-03',
  'M',
  'Brasileira',
  'São Paulo'),
  (1006,
  '84379584325',
  '2006-01-03',
  'M',
  'Brasileira',
  'Três Corações');
  
 desc pessoa_fisica;
 select * from pessoa_fisica;
 
 INSERT INTO pessoa_juridica
( Pessoas_idPessoas,
  CNPJ_jur,
  NomeFantasia_jur,
  Inscricao_Estadual_jur,
  Inscricao_Municipal_jur
  )
VALUES
 (1004,
  '23946369000124',
  'Zum Zum autopeças',
  'xxxxxxxxxxxx',
  '1212121212121'
  ),
  (1008,
  '23454765245423',
  'Car Express Show',
  'xxxxxxxxxxxx',
  '1212121212121'
  );
  
 desc pessoa_juridica;
 select * from pessoa_juridica;
 
 INSERT INTO montadora
( Nome 
)
VALUES
 ('Fiat'),
 ('Volkswagen'),
 ('General Motors'),
 ('Hyundai'),
 ('Toyota');
  
  desc montadora;
 select * from montadora;
 
 INSERT INTO modelo
( Nome_mod,
  Tipo_mod,
  Modelo_idModelo
)
VALUES
 ('Fiat Strada','2020',1),
 ('Chevrolet Onix','2018',2),
 ('Volkswagen Polo','2019',3),
 ('Volkswagen Gol','2015',4),
 ('Fiat Toro','2020',5);
    
 desc modelo;
 select * from modelo;
 
 
 INSERT INTO veiculo
( Modelo_idModelo,
  Montadora_idMontadora,
  COR_idCOR,
  Placa_vec,
  Km_vec
)
VALUES
 (2,3,1,'GKO-1234',23800),
 (4,2,3,'GKK-1587',21800),
 (2,3,2,'GLI-3334',32380),
 (5,1,1,'MGO-1564',33860),
 (2,3,4,'KOJ-1423',237600);
 
 desc veiculo;
 select * from veiculo;
 
 INSERT INTO colaborador
( Pessoas_idPessoas,
  Cargos_idCargos,
  Setor_idSetor,
  Matricula_col,
  DataCadastro_col,
  DataAdmissao_col,
  DataDemissao_col
)
VALUES
 (1001,2,1,'ADM-0004','2002-10-05','2002-10-03',NULL),
 (1007,4,2,'OPR-0003','2002-12-05','2002-12-03',NULL);
  
 desc colaborador;
 select * from colaborador;
 select * from pessoas;
 
 INSERT INTO equipe
( Descricao)
VALUES
 ('Equipe Administrativa'),
 ('Equipe mecânica'),
 ('Equipe lanternagem');
 
 desc equipe;
 select * from equipe;
 
 INSERT INTO colaborador_has_Equipe
( Colaborador_idColaborador,
  Equipe_idEquipe)
VALUES
 (1,1),
 (2,2),
 (2,3);
  
  desc colaborador_has_Equipe;
 select * from colaborador_has_Equipe;
select * from colaborador;
 
 INSERT INTO clientes
( Pessoas_idPessoas,
  DESDE_cli,
  DataCadastro_cli
)
VALUES
 (1002,'2000-01-05','2003-01-07'),
 (1003,'2000-01-06','2003-01-08'),
 (1005,'2003-01-06','2003-01-06'),
 (1008,'2000-01-06','2003-01-05');
 
 desc clientes;
 select * from clientes;
 
 
 
 INSERT INTO ordem
( Clientes_idClientes,
  Veiculo_idVeiculo,
  Concluida_ord,
  Paga_ord,
  Datareg_ord,
  Datapag_ord
)
VALUES
 (1,2,'1','1','2003-01-10','2003-01-12'),
 (2,4,'1','1','2003-01-10','2003-01-17'),
 (3,5,'0','0','2003-01-11',NULL),
 (4,1,'1','0','2003-01-15',NULL),
 (4,3,'0','0','2003-01-15',NULL);
 
 desc ordem;
 select * from ordem;
 
 
  INSERT INTO ordem_has_colaborador_has_equipe
( Ordem_idOrdem,
  Colaborador_has_Equipe_Equipe_idEquipe)
VALUES
 (1,2),
 (1,3),
 (2,3),
 (3,2),
 (4,2),
 (4,3),
 (5,2);
 
 desc ordem_has_colaborador_has_equipe;
 select * from ordem_has_colaborador_has_equipe;
 
 INSERT INTO servico
( Nome_ser,
  Valor_ser)
VALUES
 ('Servico lanternagem (hora)', 65.00),
 ('Servico mecânica (hora)', 45.00);
 
 desc servico;
 select * from servico;
 
 INSERT INTO ordem_servico
( Ordem_idOrdem,
  Servico_id_Servico,
  Descricao,
  Valor_os,
  Data_os,
  Status_os)
VALUES
 (1,2,'Servico Mecanica', 450.00,'2020-01-12',1),
 (1,1,'Servico lanternagem', 650.00,'2020-01-12',1),
 (2,1,'Servico lanternagem', 1450.00,'2020-01-12',1),
 (3,2,'Servico Mecanica', 350.00,'2020-01-11',0),
 (4,1,'Servico lanternagem', 1150.00,'2020-01-11',1),
 (4,2,'Servico Mecanica', 1350.00,'2020-01-15',1),
 (5,2,'Servico Mecanica', 1150.00,'2020-01-15',0);
 
 desc ordem_servico;
 select * from ordem_servico;
 
 INSERT INTO fornecedor
( Pessoas_idPessoas,
  Data_cadastro,
  DESDE,
  Observacao)
VALUES
 (1004,'2000-01-01','2012-01-01','fornededor de tintas automotivas'),
 (1006,'2000-01-19','2012-01-01','fornecedor de autopeças multimarcas');
  
 desc fornecedor;
 select * from fornecedor;
 
 INSERT INTO nota_fiscal
( Fornecedor_idFornecedor,
  Data_Compra_nf,
  Data_Entrada_nf)
VALUES
 (1,'2020-01-13','2020-01-13'),
 (2,'2020-01-13','2020-01-13'),
 (1,'2020-01-13','2020-01-13'),
 (2,'2020-01-13','2020-01-13'),
 (1,'2020-01-13','2020-01-13'),
 (2,'2020-01-16','2020-01-16'),
 (2,'2020-01-16','2020-01-16');
  
 desc nota_fiscal;
 select * from nota_fiscal;

 INSERT INTO estoque
( Nota_Fiscal_idNota_Fiscal,
  Nome_est,
  Valor_est,
  Quant_est,
  Codigo_est)
VALUES
 (1,'Tinta automotiva',550.00,2,12333567),
 (2,'Homocinetica',150.00,4,1234567),
 (3,'Tinta automotiva',550.00,2,134367),
 (4,'Maçanetas',70.00,4,12231567),
 (5,'Tinta automotiva',550.00,1,12345467),
 (6,'Bico injetor',550.00,2,12898567),
 (7,'Farol',250.00,4,12457567);
  
 desc estoque;
 select * from estoque;
 
 INSERT INTO estoque_has_ordem_servico
( Estoque_idEstoque,
  Ordem_Servico_idOrdem)
VALUES
 (1,1),
 (2,1),
 (3,2),
 (4,3),
 (5,4),
 (6,4),
 (7,5);
 
 desc  estoque_has_ordem_servico;
 select * from estoque_has_ordem_servico;
 
 
 
 
 
 desc estados;
 select * from estados;
 desc cidades;
 select * from cidades;
 