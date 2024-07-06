select alunos.nome, cursos.nome from alunos
join aluno_assiste_curso
on alunos.id = aluno_assiste_curso.idalunos
join cursos
on cursos.idcurso = aluno_assiste_curso.idcurso
order by alunos.nome;

select * from aluno_assiste_curso;