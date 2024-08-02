create or alter trigger tgclientealterado
on dcliente
after insert, update, delete
as 
begin

	print 'os dados da tabela dcliente foram alterados!'
	end
	select * from dCliente
	insert into dCliente(nome_cliente, genero, data_de_nascimento, cpf) values
	('Zacarias Neto', 'm', '13/02/1999', '139.543.189-00')
	update dcliente 
	set cpf = '130.451.892-10'
	where id_cliente = 11
	select * from dCliente

	update dcliente 
	set genero = 'M'
	where id_cliente = 11
	select * from dCliente

	delete from dcliente 
	where id_cliente= 11
	select * from dCliente
	drop trigger tgclientealterado
		select * from dCliente


			   
	create or alter trigger tgclientealterado
on dcliente
after insert, update, delete
as 
begin
	-- Identificando na Trigger o evento dnl selecionado
if exists (select * from inserted) and exists(select * from deleted)
		print ('Dados foram atualizados na Tabela')
else if exists(select * from inserted)
		Print ('Dados foram atualizados na Tabela')
else if exists(select * from deleted)
		print ('Dados foram atualizados na Tabela')
		end
	

insert into dCliente(nome_cliente, genero, data_de_nascimento, cpf) values
	('Eleonora Batista', 'F', '13/02/2003', '453.543.189-00')
select * from dCliente

delete from dCliente
where id_cliente = 12
select * from dCliente

update dcliente
set cpf = '678.333.111-11'
where id_cliente = 1

select * from dCliente

-- Criando uma triggeur para controle de permissao de cadastro
--Crie uma trigger que seja disparada sempre que tentarem inserir um dado na tabela , essa trigger deverá informar que não é possível inserir dados na terça-feira ou domingo
select * from dbo.cliente

create or alter trigger tgrecusartabelas
on dcliente
instead of insert
as 
begin

		if format(getdate(), 'dddd') in ('sábado', 'domingo')
		begin
				raiserror ('O cadastro de clientes não pode ser feito de
				sábado- ou domingo',1,1)
				rollback
			end
			else
			begin
				insert into dcliente(nome_cliente, genero, data_de_nascimento, cpf)
				select i.nome_cliente, i.genero, i.data_de_nascimento, i.cpf from
				inserted i
						end
				end
	select format(getdate(), 'dddd') 


	insert into dcliente(nome_cliente, genero, data_de_nascimento, cpf)
	values
	('Fernanda Lima', 'F', '28/10/1988', '145.333.252-00')

	drop trigger tgrecusartabelas

	-- Criando uma tabela DDL Simples

	create or alter trigger tgrecusaraltaracao
on database
for create_table, alter_table, drop_table
as
begin
		print 'Não é permitido criação ou exclusão de tabelas'
		rollback
end

create table test (id int)
drop table dbo.FContratos

drop trigger tgrecusaraltaracao

-- desabilite todas as TRIGGERS

DISABLE TRIGGER ALL ON DATABASE

--com a trigger desabilitada crie uma tabela teste2

create table teste2 (id int)

--Exclua a tabela teste2

drop table teste2

--habilite todas as triggers

ENABLE TRIGGER ALL ON DATABASE

create table teste3 (id int)

--Criando database e tabela para construção de trigger
--before - after
--insert - delete - update
/* triggers*/

create database empresa
use empresa
create table produtos(
	nome varchar (50) not null,
	categoria varchar (30) not null,
	preco numeric (10,2) not null
	)

	create table historico(
	idoperacao int primary key identity,
	produto varchar(50) not null,
	categoria varchar(30) not null,
	precoantigo numeric (10,2) not null,
	preconovo numeric (10,2) not null,
	data datetime,
	usuario varchar(30),
	mensagem varchar(100)
	)

	insert into produtos values ('livro sql server', 'livros',98.00)
	insert into produtos values ('livro oracle', 'livros',50.00)
	insert into produtos values ('licença powercenter', 'softwares',4500.00)
	insert into produtos values ('notebook I7', 'computadores',3150.00)
	insert into produtos values ('livro business inteligence', 'livros',90.00)

	select * from produtos
	select * from historico
	
	/* verificando o usuário*/

select suser_name()

--trigger de dados - data manipulation language

create trigger trg_atualiza_preco
on dbo.produtos
for update
as
		declare @idproduto int
		declare @produto varchar(30)
		declare @categoria varchar(10)
		declare @preco numeric(10,2)
		declare @preconovo numeric(10,2)
		declare @data datetime
		declare @usuario varchar(30)
		declare @acao varchar(100)

--primeiro bloco
select @idproduto = idproduto from inserted
select  @produto = nome from inserted
select @categoria = categoria from inserted
select @preco = PRECO FROM DELETED
select @preconovo = PRECO from inserted
-- SEGUNDO BLOCO
SET @DATA = GETDATE()
SET @USUARIO = SUSER_NAME()
SET @ACAO = 'Valor inserido pela trigger trg_atualiza_preco'
-- Para boas práticas utilizaremos os comandos select e set
--Valores vindos de tabelas são inseridos utiliando o comando select
--Valores vindos de funçoes ou valores literais devem ser atribuidos utilizando o comando set

insert into historico(produto, categoria, precoantigo, preconovo, data, usuario, mensagem)
values
(@produto, @categoria, @preco, @preconovo, @data, @usuario, @acao)
print 'Trigger executada com sucesso'

--Executando um update
update produtos set preco = 100.00
where idproduto = 1

select * from produtos
select * from historico

update produtos set nome = 'livro c#'
where idproduto = 1
select * from produtos
select * from historico

-- Para corrigir esta falha
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create trigger trg_atualiza_preco
on dbo.produtos
for update
as 
if update (preco)
begin
		declare @idproduto int
		declare @produto varchar(30)
		declare @categoria varchar(10)
		declare @preco numeric(10,2)
		declare @preconovo numeric(10,2)
		declare @data datetime
		declare @usuario varchar(30)
		declare @acao varchar(100)

--primeiro bloco
select @idproduto = idproduto from inserted
select  @produto = nome from inserted
select @categoria = categoria from inserted
select @preco = PRECO FROM DELETED
select @preconovo = PRECO from inserted
-- SEGUNDO BLOCO
SET @DATA = GETDATE()
SET @USUARIO = SUSER_NAME()
SET @ACAO = 'Valor inserido pela trigger trg_atualiza_preco'
-- Para boas práticas utilizaremos os comandos select e set
--Valores vindos de tabelas são inseridos utiliando o comando select
--Valores vindos de funçoes ou valores literais devem ser atribuidos utilizando o comando set

insert into historico(produto, categoria, precoantigo, preconovo, data, usuario, mensagem)
values
(@produto, @categoria, @preco, @preconovo, @data, @usuario, @acao)
print 'Trigger executada com sucesso'
end

---2 comando 
drop trigger trg_atualiza_preco
--3 comando faça as atualizações mo código, após AS digite
if update (preco)
begin
--após a linha de comando print digite:
end

update produtos set preco = 300.00
where idproduto = 2
 select * from historico

 --vamos trocar o nome do livro

 update produtos set nome = 'Livro Java'
 where idproduto = 2

 select * from historico
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  Create table tbsaldos
(
	produto varchar (10),
	saldo_inicial numeric(10),
	Saldo_final numeric(10),
	data_ult_mov datetime
	);
	go
	insert into tbsaldos (produto, saldo_inicial, saldo_final, data_ult_mov)
	values ('produto A', 0, 100, getdate());
	go

select * from tbsaldos

create table tbvendas
(
	id_vendas int,
	produto varchar(10),
	Quantidade int,
	Data datetime
);
go
select * from tbvendas

create sequence seq_tbvendas
	as numeric
	start with 1
	increment by 1;

create table tbhistoricovendas
(
	produto varchar(10),
	quantidade int,
	data_venda datetime
);
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create trigger trg_ajustasaldo
on tbvendas
for insert
as begin
	declare @quantidade int,
			@data datetime,
			@produto varchar (10)
	select @data = data, @quantidade = quantidade,
@produto = produto from inserted 
	update tbsaldos
	set saldo_final = saldo_final - @quantidade,
		data_ult_mov = @data
	where produto = @produto;
	insert into tbhistoricovendas(produto, quantidade, data_venda)
	values(@produto, @quantidade, @data);
end;
go

insert into tbvendas(id_vendas, produto, quantidade, data)
values(next value for seq_tbvendas,'produto a', 11,getdate());

insert into tbvendas(id_vendas, produto, quantidade, data)
values(next value for seq_tbvendas,'produto a', 09,getdate());
select * from tbvendas
select * from tbsaldos
select * from tbhistoricovendas


-- tsql é um bloco de linguagem de programação
begin
print'primeiro bloco'
end
go

declare
@contador int
begin
set @contador = 5
print @contador
end 
go

create table carros(
carro varchar (20),
fabricante varchar (30))
go

insert into carros values ('ka', 'ford')
insert into carros values ('fiesta', 'ford')
insert into carros values ('prisma', 'chevrolet')
insert into carros values ('clio', 'renault')
insert into carros values ('chevete', 'chevrolet')
insert into carros values ('omega', 'chevrolet')
insert into carros values ('palio', 'fiat')
insert into carros values ('doblo', 'fiat')
insert into carros values ('gol', 'volkswagen')
go

select * from carros

declare
@v_cont_ford int,
@v_cont_fiat int,
begin

--metodo 1 - O select precisa retornar uma simples coluna
--e um só resultado
set @v_cont_ford = (select count (*) from carros
where fabricante = 'ford')
print 'quantidade ford:' + cast(@v_cont_ford as varchar)

--método 2
select @v_cont_fiat = count(*) from carros where fabricante = 'fiat'
print 'quantidade fiat:' + convert (varchar, @v_cont_fiat) 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Blocos IF e Else
declare
@numero int = 5
begin
if @numero = 5 --expressão boleana - true
print 'O valor é verdadeiro.'
else
print 'O valor é falso.'
end
go

declare
@contador int
begin
select --o case representa uma coluna
case
when fabricante = 'fiat' then 'faixa 1'
when fabricante = 'chevrolet' then 'faixa 2'
else 'outras faixas'
end as 'informações',
*
from carros
end
go