#crie uma procedure para atualizar os preços da tabela p_curso
delimiter $
create procedure atualizar_valor_produto(in valor_parametro int, in id_parametro int)
begin
-- atualizar o valor_produto da tabela p_curso
update p_curso
set preco_curso = preco_curso*(1+(valor_parametro/100))
where id_curso = id_parametro;
select 'Preço atualizado com sucesso!';
end $;
delimiter ;

select * from p_curso;
call atualizar_valor_produto(10,2);
