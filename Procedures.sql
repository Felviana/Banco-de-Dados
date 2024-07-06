#Alterar o delimiter é necessario para que o banco não pare no meio da leitura de uma procedure, para criar uma procedure faça:

delimiter $
create procedure nome_senai()
begin
select 'escola senai' as senai;
end $
delimiter ;

#para chamar a procedure
call nome_senai;
