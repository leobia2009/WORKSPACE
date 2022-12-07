---  Query 01 - Relacao para controle de Ordens de Serviços ------
 
select Datareg_ord as Data_Expedição,COUNT(idOrdem) as Ordens_Expedidas,
	   SUM(Concluida_ord) as Ordens_Fechadas, SUM(Paga_ord) as Ordens_Quitadas from ordem
GROUP BY Datareg_ord;

select Ordem_Servico_idOrdem from estoque_has_ordem_servico as id_Ordem;
select * from estoque_has_ordem_servico;
select * from estoque;
select * from ordem_servico;
select * from ordem;
select * from clientes;
