#criar uma procedure para cadastrar novos cursos:

Delimiter $
create procedure pc_cursos(nome varchar(100), horas int(3), preco decimal(10,2))
begin
insert into pc_cursos values(null, nome, horas, preco);
end $
delimiter ;
call pc_cursos('My SQL', 100, 1000.00);
#cadastre mais tres cursos

call pc_cursos('Bolador', 20, 100.00);
call pc_cursos('Vendedor', 80, 1000.00);
select * from  pc_cursos;




