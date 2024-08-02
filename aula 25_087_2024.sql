--Exercício 1
-- Declaração das variáveis
DECLARE @valor1 float = 10,
		@valor2 float = 5,
		@valor3 float = 34,
		@valor4 float = 7

-- a) Soma entre valor1 e valor2
declare @soma float
SET @soma = @valor1 + @valor2
select @soma as soma

-- b) Subtração entre valor3 e valor4
DECLARE @subtracao float
SET @subtracao = @valor3 - @valor4
select @subtracao AS subtracao

-- c) Multiplicação entre valor1 e valor4
DECLARE @multiplicacao float
SET @multiplicacao = @valor1 * @valor4
select @multiplicacao AS multiplicacao

-- d) Divisão de valor3 por valor4 (resultado em decimal)
DECLARE @divisao DECIMAL(18, 2); -- ajuste o tamanho conforme necessário
SET @divisao = CAST(@valor3 AS DECIMAL(18, 2)) / @valor4;
select @divisao AS divisao

-- e) Arredondamento do resultado da letra d) para 2 casas decimais
DECLARE @divisao_arredondada DECIMAL(18, 2);
SET @divisao_arredondada = ROUND(@divisao, 2);
select @divisao_arredondada AS divisao_arredondada

  


	--Exercício 2
	--2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de 
--dado que deverá ser especificado. 
--a) Declare uma variável chamada 'produto' e atribua o valor de 'Celular'. 

--b) Declare uma variável chamada 'quantidade' e atribua o valor de 12. 

--c) Declare uma variável chamada 'preco' e atribua o valor 9.99. 

--d) Declare uma variável chamada 'faturamento' e atribua o resultado da 
--multiplicação entre 'quantidade' e 'preco'. 

--e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do 
--SELECT. 

DECLARE @produto varchar(50)
DECLARE	@quan int
DECLARE	@preco float 
declare @faturamento float 
SET @produto = 'CELULAR'
SET @quan = 12
SET @preco = 9.99
set @faturamento= @quan * @preco
select 
@produto as 'Produto',
@quan as 'Quantidade',
@preco as 'Preço Unitário',
@faturamento as 'Faturamento'

--3. Você é responsável por gerenciar um banco de dados onde são recebidos 
--dados externos usuários. Em resumo, esses dados são: - Nome do usuário - Data de nascimento - Quantidade de pets que aquele usuário possui 
--Você precisará criar um código em SQL capaz de juntar as informações 
--fornecidas por este usuário. Para simular estes dados, crie 3 variáveis, 
--chamadas: nome, data_nascimento e num_pets. Você deverá armazenar os 
--valores 'André', '10/02/1998' e 2, respectivamente.


DECLARE @varNome VARCHAR(30)
DECLARE @varDataNascimento DATETIME
DECLARE @varNumPets INT
SET @varNome = 'André'
SET @varDataNascimento = '10/02/1998'
SET @varNumPets = 2

SELECT 'Meu nome é ' + CAST(@varNome AS VARCHAR(30)) + ', nasci em ' + FORMAT(@varDataNascimento, 'dd/MM/yyyy') + ' e tenho ' +  CAST(@varNumPets AS VARCHAR(30)) + ' pets.';


--4. Você acabou de ser promovido e o seu papel será realizar um controle de 
--qualidade sobre as lojas da empresa. 
--A primeira informação que é passada a você é que o ano de 2008 foi bem 
--complicado para a empresa, pois foi quando duas das principais lojas fecharam. 
--O seu primeiro desafio é descobrir o nome dessas lojas que fecharam no ano de 
--2008, para que você possa entender o motivo e mapear planos de ação para 
--evitar que outras lojas importantes tomem o mesmo caminho. 
--O seu resultado deverá estar estruturado em uma frase, com a seguinte 
--estrutura: 
--'As lojas fechadas no ano de 2008 foram:_' + nome das lojas 
--Obs: utilize o comando PRINT (e não o SELECT!) para mostrar o resultado.

select * from dbo.DimStore
select storename, closedate from DimStore where format (closedate, 'yyyy') = 2008
declare @varlistalojas varchar(50)
set @varlistalojas = ''
select @varlistalojas = @varlistalojas + storename + ' , ' 
from
DimStore
where format (CloseDate, 'yyyy') = 2008
print 'as lojas fechadas no ano de 2008 foram' + @varlistalojas
