#crie uma função fn faturamento, que receba com patrametros de entrada o preço (decimal) e a  quantidade (int) e, retorne o faturamento da venda representado pela multiplicação do preço e quantidade

delimiter $
create function fn_Faturamento(preco decimal(10,2), quantidade int)
returns decimal (10,2) deterministic
begin
return preco * quantidade;
end $
delimiter ;

select fn_faturamento(8.6566,9);