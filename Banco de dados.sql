create database projeto;
Use projeto;

create table pc_cursos(
idcurso int primary key auto_increment,
nome varchar (100) not null,
horas int(3) not null,
preco decimal(10,2) not null);

insert into pc_cursos values (null, 'java', 30, 500.00);
insert into pc_cursos values (null, 'banco de dados', 30, 700.00);


