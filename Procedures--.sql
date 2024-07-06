#crie uma procedure capaz de receber 2 parametros: Id e Desconto
-- com a informação de id, ela deve aplicar o desconto para o curso de id informado. Alem disso, sua procedure deve retornar as seguintes mensagens:
-- 'Desconto de __ aplicado com sucesso !'
-- 'Curso: ____; Preço Antigo:___; Preço Novo:____.'
-- 'Código finalizado com sucesso!'


DELIMITER $
create procedure sp_AplicaDesconto(ID INT, Desconto decimal(10,2))
begin
# 1º) Declarar algumas variáveis importantes
# Variável para armazenar o preço com desconto
DECLARE varPrecoComDesconto DECIMAL(10,2);
# Variável para armazenar o nome do curso
DECLARE varNomeCurso VARCHAR(100);
# Variável para armazenar o preço antigo do curso
DECLARE varPrecoAntigo DECIMAL(10,2);

# 2º) Atribuir o valor de preço antigo à variável varPrecoAntigo
SET varPrecoAntigo = (SELECT Preco_Curso FROM p_curso WHERE ID_CURSO = ID);

# 3º) Atribuir o valor de preço com desconto à variável varPrecoComDesconto
SET varPrecoComDesconto = (SELECT Preco_Curso FROM p_curso WHERE ID_CURSO = ID) * (1 - Desconto);

# 4º) Atribuir o nome do curso à variável varNomeCurso
SET varNomeCurso = (SELECT Nome_Curso FROM p_curso WHERE ID_Curso = ID);

# 5º) Atualiza a tabela com o novo preço
UPDATE p_curso
SET preco_curso = varPrecoComDesconto
WHERE ID_Curso = ID ;

SELECT CONCAT('Código executado com sucesso!');

End $

Delimiter ;
 
 call sp_AplicaDesconto(1, 0.15);
 
 select * from p_curso;
