Create database SV;

use sv;

create table lojas(
id_loja int,
Nome_Loja varchar (100),
Regiao varchar (100),
Qtd_Vendida float);

insert into Lojas(Id_loja, Nome_Loja, Regiao, Qtd_Vendida) values
(1,'Botafogo Praia Mar', 'Sudeste',1800),
(2, 'Lojas Vitoria', 'Sudeste', 800),
(3, 'Emporio Mineiro', 'Sudeste', 2300),
(4,'Central Paulista', 'Sudeste', 1800),
(5,'Rio 90 Graus', 'Sudeste', 700),
(6, 'Casa Flor & Anopolis', 'Sudeste', 1800),
(7, 'Pampa & Co', 'Sul', 990),
(8, 'Paraná Papéis', 'Sul', 2800),
(9, 'Amazonas Prime', 'Norte', 4200),
(10, 'Panamá Móveis', 'Norte', 3200),
(11, 'Tintas Rio Branco', 'Norte', 1500),
(12, 'Bolachas Mirabolo', 'Nordeste', 1910);

#crie uma função que substitua de um texto os caracteres com acentos para caracteres sem acento (ex:'à' por a, "ç" por 'c') e assim sucessivamente

 delimiter $
create function fn_RemoveAcentos(texto varchar(100))
returns varchar (100) deterministic
begin
set texto=replace(texto,'á','a'),
	texto=replace(texto,'é','e'),
	texto=replace(texto,'í','i'),
    texto=replace(texto,'ó','o'),
    texto=replace(texto,'ú','u'),
    texto=replace(texto,'à','a'),
    texto=replace(texto,'è','e'),
    texto=replace(texto,'ì','i'),
    texto=replace(texto,'ò','o'),
    texto=replace(texto,'ù','u');
    return texto;
    end $
    delimiter ;
    
    select
    id_loja,
    fn_RemoveAcentos(nome_loja)
    from lojas;
    
