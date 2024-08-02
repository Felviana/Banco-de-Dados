#Aplicação in  = quando a marca do produto for igual à sselecione
#Exemplo 3 - A empresa está com uma parceria com as empresas da marca Dell s Samsung, isso significa que os produtos dessas marcas receberão um desconto de 15% em seu custo de aquisição.
#faça uma consulta que retorne uma coluna  extra de desconto no custo de aquisição de cada produto
# custo_unit = X
#Custo_unit = -15% de x

Select 
*,
Case
when Marca_Produto in ('dell', 'samsung') then custo_unit * 0.85
else custo_unit
End as 'desconto'
from 
produtos;