#criar uma procedure para cadastrar novos cursos:

Delimiter $
create procedure pc_cursos(nome varchar(100), horas int(3), preco decimal(10,2))
begin
insert into pc_cursos values(null, nome, horas, preco);
end $
delimiter ;