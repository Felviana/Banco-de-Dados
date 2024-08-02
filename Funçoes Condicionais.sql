#funções condicionais no MySQL
# IF: Função que premite tratar consições no MYSQL
#IF (teste lógico, valor verdadeiro, valor se falso)
#IF (teste lógico1, valor verdadeiro1 , valor se falso)
#IF (teste lógico1, valor verdadeiro1 ,--IF (teste lógico2, valor verdadeiro2 , valor se falso) 
#exemplo 1:

select 
if(10 > 5, 'verdadeiro', 'falso');


select 
if(10 > 12, 'verdadeiro', 'falso');

#exemplo 2: uma empresa vai oferecer um bonus de 10% para todos os funcionários que tiveram uma avaliação do RH  de acordo com a seguinte regra:
#nota desempenho >=7 = Bonus de 10%
#nota desempenho <7 = não recebe Bonus

set @vardesempenho = 8.5;
select
if(@vardesempenho >=7, 0.1, 'Sem Bonus');

set @vardesempenho = 5;
select
if(@vardesempenho >=7, 0.1, 'Sem Bonus');

#
Exemplo 3
#uma empresa oferece um bonus de 10% e 5% para todos os funcionarios que tiveram uma avaliação do RH  de acordo com a seguinte regra:
#nota desempenho >=7 = Bonus de 10%
#nota desempenho >=5 = Bonus de 5%
#nota desempenho <7 = não recebe Bonus

SET @vardesempenho = 3;
SELECT
    IF(@vardesempenho >= 7, 1.10,
       IF(@vardesempenho >= 5, 1.05,
          'Sem Bonus')) AS Resultado
       #exemplo 4
       #As lojas da nossa empresa que tiverem mais que 20 funcionarios receberão uma reforma de ampliação
       #utilize a função IF para cria uma coluna na tabela lojas que informe quais lojas receberão reforma.
       
       
       select * from lojas;           
       select 
       *,
       if (num_funcionarios >= 20, 'Recebe reforma', 'Não recebe reforma')	as 'Status' from lojas;
          
          
# Funções condicionais MySQL IFNULL, ISNULL E NULLIF
# IFNULL : Retorna o valor alternativo caso a expressão seja Null
#Ifnull(expressão, valor_alternativo)
#Exemplo 1: Utilize a função IFNULL para retornar um valor alternativo para o valor abaixo:

select
	ifnull(null, 'Valor Alternativo');
    
    Select 
		Ifnull(100, 'Valor Alternativo');
        
        select * from lojas;
        select 
        *,
			Ifnull(telefone, '0800-999-9999') as 'telefone corrigido'
            from lojas;
			     select * from lojas;
                 
#Isnull: Testa se um determinado valor é nulo. Caso deja nulo, retorna 1, caso contrario Zero
#exemplo 1: Alguns clientes não cadastraram o telefone de contato, faça uma consulta com uma coluna extra  que identifique esses clientes de alguma forma.

select
*,
isnull(telefone) as 'check'
from clientes;

          
#exemplo 2: Caso tenha telefone aparece OK
select
*,
if(isnull(telefone), 'verificar', 'OK') as 'Status'
from clientes;
select * from clientes;

#exemplo 3
#Nullif: Compara duas expressões e retorna null se as duas forem iguais. Se forem, retorna Null, caso contrario, retorna a primeira expressão

set @var1 = 100;
Set @var2 = 100;

select
nullif (@var1, @var2);   

select 
	nullif(@var1, @var2);
    
    # Funções condicionais CASE / THEN
    #CASE / THEN: A função CASE é uma outra estrutura para tratar condiçoes dentro do SQL
    #Sintaxe
    
    /*
    case
    when condicao1 then resultado1
    when condicao2 then resultado2
    when condicao3 then resultado3
    else resultado
    end;
*/;

#Exemplo 1: Utilize a estrutura CASE para criar uma consulta na tabela de clientes que substitui o valor 'M' por 'Masculino' e 'F' para 'Feminino'

select
	*,
    case 
		when sexo = 'M' then 'Masculino'
		else 'Feminino'
	end as 'sexo2'
from clientes;

#exemplo 2: Na tela pedidos, crie uma estrutura Case parta avaliar as seguintes situações de Receita_venda:
#Caso Receita_venda >= 3500 ---> 'Faturamento alto'
#Caso Receita_venda >= 1000 ---> 'Faturamento médio'
#Caso Receita_venda < 1000 ---> 'Faturamento baixo'

select
	*,
    case 
		when Receita_Venda >= 3500 then 'Faturamento alto' 
        when Receita_Venda >= 1000 then 'Faturamento alto' 
		else 'Faturamento baixo'
	end as 'pedidos'
from Pedidos;



