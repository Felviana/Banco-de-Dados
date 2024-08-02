#Aplicação AND
# Exemplo 1. A Empresa está com uma ação de dia das mães / Pais e funcionara conforme abaixo:
#Caso o cliente seja do sexo feminino e tenha filhos, receberá uma oferta de dia das mães
#Caso o cliente seja do sexo masculimo e tenha filhos, receberá uma oferta de dia dos pais
#caso contrario, não receberá oferta

#as  Ofertas serão enviadas por e-mail, portanto o setor responsável  precisa de uma tabela identificando facilmente quem receberá qual oferta
#Oferta dia das mães > Mulher com filhos
#Oferta dia dos pais > Homem com filhos
#Sem Oferta > Casal sem filhos
#vocedeve criar uma coluna extra identificando cada status

SELECT *,
    CASE
        WHEN sexo = 'f' AND qtd_filhos >= '1' THEN 'Oferta Dia das Mães'
        WHEN sexo = 'm' AND qtd_filhos >= '1' THEN 'Oferta Dia dos Pais'
        ELSE 'Sem Oferta'
    END AS tipo_oferta
FROM
    clientes;
