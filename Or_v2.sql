#Aplicação OR
#Exemplo 2 - A empresa está com uma parceria com as empresas da marca Dell s Samsung, isso significa que os produtos dessas marcas receberão um desconto de 15% em seu custo de aquisição.
#faça uma consulta que retorne uma coluna  extra de desconto no custo de aquisição de cada produto
# custo_unit = X
#Custo_unit = -15% de x 
  
  #Aplicando desconto e colocando o valor na coluna Desconto
  Select 
*,
Case
when Marca_Produto = 'dell' or Marca_Produto = 'samsung' then ROUND(custo_unit * 0.85, 2)
else custo_unit
End as 'desconto'
from 
produtos;
