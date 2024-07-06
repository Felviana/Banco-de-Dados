
#como criar uma procedure com parametro - criar uma procedure para somar 

delimiter $
create procedure soma(n1 int, n2 int)
begin
	select n1 + n2 as soma;
    end $
delimiter ;
    call soma (20,500);
    call soma (30,60);
    call soma (40,900);
    call soma (25,1000);
    call soma (10,1010);
    
    #para excluir uma procedure  use o comando abaixo
    drop procedure soma;
