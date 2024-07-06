#fazer um join com a tabela telefone
on idcliente da tabela endereco = id_cliente da tabela telefone
select c.nome, c.sexo, c.email,	t.tipo,	t.numero, e.bairro,	e.cidade, e.estado
from cliente c
join telefone t
on c.idcliente = t.id_cliente
join endereco e
on c.idcliente = e.id_cliente;

create view v_relatorio as 
select c.nome,c.sexo,c.email,t.tipo,t.numero,e.bairro,e.cidade, e.estado
from cliente c
join telefone t
on c.idcliente=t.id_cliente
join endereco e
on c.idcliente=e.id_cliente;
select*from v_relatorio;

#para saber quais bancos de dados temos, utilizamos o comando 
show databases;
#para saber quais tabelas e consultas, utilizamos o comando 
show tables;

#Para excluir uma view, utilizamos o comando Drop View "nome";
#crie uma view para mostrar o nome, numero e estado

create view view_relatorio as 
select c.nome,t.numero,e.estado
from cliente c
join telefone t
on c.idcliente=t.id_cliente
join endereco e
on c.idcliente=e.id_cliente;

select*from view_relatorio;

#faça uma atualização: Mude o nome do Jorge para Jose.
UPDATE v_relatorio
SET nome = 'Jose'
WHERE nome = 'Jorge';

	#Faça uma consulta na view v_relatorio para mostrar todos os campos das mulheres
    SELECT nome, email, tipo, numero, bairro, cidade, estado
	FROM comercio.v_relatorio
	WHERE sexo = 'f';
    
    #crie uma view mostrando os dados dos clientes : v_dados
    #delete o nome ana julia da view v_dados
    use ti;
    
create view v_dados as
SELECT * FROM ti.v_dados;
    
show tables;
 
DELETE FROM v_dados
WHERE nome = 'Ana Julia';

insert into v_dados 
values ('33002285811', 'Daniel Silveira', '2001-07-01', 'Av dos Minuanos', '03931010', 'Vila Dalila', 'São Paulo', 'SP', '2024-01-05', 'celular');

select * from v_dados;
    


