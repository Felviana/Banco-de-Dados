create table aluno_assiste_curso(
 id int not null auto_increment,
data date,
idalunos int,
idcurso int,
primary key (id),
foreign key (idalunos) references alunos(id),
foreign key (idalunos) references cursos (idcurso)
);

select * from aluno_assiste_curso;


-- Agora vamos inserir os valores 
INSERT INTO aluno_assiste_curso  (data, idalunos, idcurso) values
('2014-03-01', 1, 2),
('2015-12-22', 3, 6),
('2014-01-01', 22, 12),
('2016-05-12', 1, 19);

-- Finalmente, selecionamos os dados para verificar se foram inseridos corretamente
SELECT * FROM aluno_assiste_curso;

