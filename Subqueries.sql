#subqueries
# Introdução
#Podemos resumir uma subquery como um select dentro de outro select, ou seja, uma query dentro de outra query.
#As subqueries podem ser utilizadas em 3 situações:
#1 - Subquery como filtro de uma consulta
#uma subquery pode ser usada para filtrar outras consultas. Para este caso, podemos utilizar as cláusulas where, com os operadores de
# comparação (como, =, >=, <=), IN e Exists.
#Exemplo
# 	Select  colunas from tabela where coluna  = (select colunas from tabela...);



#Observe que será através do ID _Pedido que está nas duas tabelas, que conseguiremos identificar a loja onde Marcelo Castro é o gerente

select * from pedidos
where id_loja = 3;

#porém, a consulta não está automatizada, se tivessemos que procurar em 100 lijas, teriamos muito trabalho, aí que entra a subquery.

select * from pedidos
where id_loja = (select id_loja from lojas 
where gerente = 'Marcelo Castro');

#Exercício 2
#Crie uma variavel para encontrarmos os pedidos das lojas pelo nome do gerente

select * from pedidos;

select * from lojas;

set @varNomeGerente = 'marcelo castro';

select Id_Loja from lojas where gerente = 'marcelo castro';

select * from pedidos where  id_loja - (select ID_Loja from lojas where gerente = @varnomegerente);

#Exercício 3
# quais produtos tem preço unitário acima da média?

select * from produtos;
SELECT AVG(preco_unit) FROM produtos;


#exemplo 4 - Quais os produtos são da categoria notebook


SELECT id_categoria FROM categorias WHERE categoria = 'notebook';

select * from produtos
where id_categoria = 6;


select * from produtos where id_categoria  =  (SELECT id_categoria FROM categorias WHERE categoria = 'notebook');

#exercicio 1 = faça uma subquery para achar o nome_produtos por categoria

select * from produtos;
select * from categorias;
select * from produtos where id_categoria  =  (SELECT id_categoria FROM categorias WHERE categoria = 'microfone');

#Fça uma subquery para achar o nome dos produtos por categoria
select * from produtos;
select * from categorias;
SET @varcategoria = 'monitor';
select * from produtos where id_categoria  =  (SELECT id_categoria FROM categorias WHERE Categoria = @varcategoria);

#Exemplo 5 descubra todas as informações sobre o cliente que gerou mais reeitas para a empresa

select * from clientes;
# where id_cliente = ?
select * from pedidos;


#SUM(Receita_Venda);

    SELECT id_cliente, SUM(Receita_Venda) from pedidos
    group by ID_Cliente order by Receita_Venda;
    
#mostrar a receita de venda mostrando 10 maiores clientes    
SELECT id_cliente, SUM(Receita_Venda) from pedidos
group by id_cliente 
order by sum(Receita_Venda)desc limit 10;#somente os 10 maiores clientes

select * from clientes where ID_Cliente = 72;

#mostrar a receita de venda mostrando 10 maiores clientes    

SELECT id_cliente from pedidos
group by id_cliente 
order by sum(Receita_Venda) desc limit 1;

Select * from clientes where ID_Cliente = (SELECT id_cliente from pedidos group by id_cliente order by sum(Receita_Venda) desc limit 1);

#Exemplo 6 - Descubra qual foi a receita total associada aos produtos da marca dell

select ID_Produto from produtos
where marca_produto = 'dell';
SELECT sum(receita_venda) as 'receita Dell' from pedidos where ID_Produto in (select ID_Produto from produtos where marca_produto = 'dell');

#Exercício 1 - Quais foram os pedidos feitos na região sudeste?

select cidade from locais
where Região = 'sudeste';
select (loja) as 'Lojas' from lojas where loja in (select cidade from locais where Região = 'sudeste');
#Para encontrar o id_loja 
select * from pedidos where id_loja in (select id_loja from lojas where loja in(select cidade from locais where Região = 'sudeste'));

#Exercício 2 - Faça  uma consulta que retorne todas as colunas da tabela produto + uma coluna com a média de preço_unit

select avg(Preco_Unit) from produtos;


select * from produtos;
SELECT *, (SELECT AVG(Preco_Unit) FROM produtos) as 'media_geral' from produtos;

# Exercício 3 - Encontre a quantidade de vendas por produto, desta quantidade, informe a max, min e media

select ID_Produto, count(*) as 'QTD_Vendas' from pedidos
group by ID_Produto
order by QTD_Vendas;

select max(Qtd_vendas) as 'Máximo Vendas',
		min(Qtd_vendas) as 'Mínimo Vendas',
		avg(Qtd_vendas) as 'AVG Vendas' from
(select ID_Produto, count(*) as 'QTD_Vendas' from pedidos
group by ID_Produto
order by QTD_Vendas) as v;


