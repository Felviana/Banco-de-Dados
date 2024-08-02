#Aplicação OR
#Exemplo 2 - A empresa está com uma parceria com as empresas da marca Dell s Samsung, isso significa que os produtos dessas marcas receberão um desconto de 15% em seu custo de aquisição.
#faça uma consulta que retorne uma coluna  extra de desconto no custo de aquisição de cada produto
# custo_unit = X
#Custo_unit = -15% de x

Select 
*,
Case
when Marca_Produto = 'dell' or Marca_Produto = 'samsung' then 'Recebe desconto de 15%'
else 'Não  recebe desconto'
End as 'desconto'
from 
produtos;


  
