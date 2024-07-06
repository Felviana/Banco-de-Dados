delimiter $
create procedure sp_atualiza_preco(novo_preco decimal(10,2), id int)
begin
update p_curso
set preco_curso = novo_preco
where id_curso = id;

select 'Preço atualizado com sucesso';
end $
delimiter ;

call sp_atualiza_preco(400,1);
select * from  p_curso;

call sp_atualiza_preco(180,2);
call sp_atualiza_preco(100,3);
select * from  p_curso;