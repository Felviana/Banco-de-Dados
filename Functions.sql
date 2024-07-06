#Crie uma função com o seguinte texto:"como vai ____, tudo bem ____?;

fn_BoasVindasdelimiter $
create function fn_BoasVindas(nome varchar(100))
returns varchar (100) deterministic
begin
return concat('Bem vindo',nome,', tudo bem?');
end$
Delimiter ;

select fn_BoasVindas(' Felipe'); 





