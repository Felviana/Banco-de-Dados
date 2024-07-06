#crie uma procedure que atualize o preço de um curso com um novo preço
#crie um banco de dados com o nome : exemplo
#crie a tabela p_curso, os dados são:
#id_curso int primary key
#nome curso varchar (100)
#preco curso decimal (10,2)


create database exemplo;

use exemplo;
create table p_curso(
id_curso int Primary Key,
nome_curso varchar (100),
preco_curso decimal (10,2));

select * from p_curso;

insert into p_curso values
('1', 'Excel', 500.00),
('2', 'VBA', 280.00),
('3', 'Power BI', 150.00);

# enviar uma mensagem executado com sucesso



