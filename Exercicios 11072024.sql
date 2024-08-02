#1-	Determine a situação do aluno: Nota >=6 “Aprovado”, caso contrário: “Reprovado”

SET @nota_aluno = 6.5;

SELECT
    IF(@nota_aluno >= 6, 'Aprovado', 'Reprovado') AS Situacao;
    
    
#2-	A data de vencimento de um produto é no dia 10/06/23. Faça um teste lógico para verificar se um produto passou da validade ou não. Compare com a data do dia 10/05/2023.

SET @data_vencimento = '2023-06-10';
SET @data_referencia = '2023-05-10';

SELECT
    IF(@data_vencimento = @data_referencia , 'Vencido', 'Dentro da Validade') AS Situacao;
    
    
# 3-Crie um código para verificar a nota do aluno e determinar a situação:
#Aprovado: nota maior ou igual a 6
#Recuperação: nota entre 4 e 5
#Reprovado: nota abaixo de 4

SET @nota_aluno = 3;

SELECT 
    CASE 
        WHEN @nota_aluno >= 6 THEN 'Aprovado'
        WHEN @nota_aluno >= 4 THEN 'Recuperação'
        ELSE 'Reprovado'
    END AS status_aluno;
    
    
#4-	Classifique o produto de acordo com o preço:
#Preço >= 40000: Luxo
#Preço >= 10000: Econômico
#Preço < 10000: Básico

SET @preco = 41000;

SELECT 
    CASE 
        WHEN @preco >= 40000 THEN 'Luxo'
        WHEN @preco >= 10000 THEN 'Econômico'
        ELSE 'Básico'
    END AS status_preco;
    
    
# Exercício 5: Aplique um bônus de acordo com a situação abaixo:
# Use a Tabela Clientes do Banco de Dados: Diversas_Tabelas 
# Faça para as colunas abaixo:
# ID_Cliente, Nome, Estado_Civil, Renda_Anual, 
#Renda acima de 80000 recebe um bonus de 7% se for casado, se não recebe 5%
#Renda >= 60000 recebe um bonus de 10%
#Renda >= 40000 recebe um bonus de 15%
#Renda abaixo de < 40000 recebe um bonus de 20%


Select 
*,
Id_Cliente, 
Nome,
Estado_civil, 
Renda_Anual,
    CASE 
        WHEN Renda_Anual >= 80000 AND Estado_Civil = 'C' then 'Bonus de 7%'
        WHEN Renda_Anual >= 80000 THEN 'Bonus de 5%'
        WHEN Renda_Anual >= 60000 THEN 'Bonus de 10%'
        WHEN Renda_Anual >= 40000 THEN 'Bonus de 15%'
        when Renda_Anual < 40000 THEN 'Bonus de 20%'
    END as 'Bonus'
    FROM Clientes;


#Exercício 6:
#Utilizando o exercício nº 5, faça uma coluna para mostrar o valor do preço com bônus. Exemplo: Bônus de 10% 

Select 
Id_Cliente, 
Nome,
Estado_civil, 
Renda_Anual,
    CASE 
        WHEN Renda_Anual >= 80000 AND Estado_Civil = 'C' then ('Bonus de 7%')
        WHEN Renda_Anual >= 80000 THEN ('Bonus de 5%')
        WHEN Renda_Anual >= 60000 THEN ('Bonus de 10%')
        WHEN Renda_Anual >= 40000 THEN ('Bonus de 15%')
        when Renda_Anual < 40000 THEN ('Bonus de 20%')
    END as 'Bonus'
    FROM Clientes;

#Exercício 7:
#Utilizando o exercício nº 5, faça uma coluna para mostrar o valor da renda_anual com Bônus. Exemplo: 66000.0



Select 
	*,
    case
		WHEN Renda_Anual >= 80000 then
		CASE 
			WHEN Estado_Civil = 'C' then (1.07) * renda_anual 
			else (1.05) * renda_anual 
        end
        WHEN Renda_Anual >= 60000 THEN (1.10) * renda_anual 
        WHEN Renda_Anual >= 40000 THEN (1.15) * renda_anual 
        when Renda_Anual < 40000 THEN (1.20) * renda_anual 
    END as 'Preço com Bonus'
    FROM Clientes;

 