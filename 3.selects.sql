SELECT * FROM Alunos;

SELECT nome FROM Professores;

SELECT * FROM Provas
WHERE nota = 10;

SELECT * FROM Provas
WHERE nota >= 5;

SELECT * FROM Provas
WHERE nota <= 5;

SELECT * FROM Provas
WHERE nota BETWEEN 7 AND 10;

SELECT * FROM Provas
WHERE nota IN (1, 3, 5, 7, 9);

SELECT * FROM Alunos
WHERE nome LIKE 'Fay Gentry';

SELECT * FROM Alunos
WHERE nome LIKE 'D%';

SELECT * FROM Alunos
WHERE nome LIKE '%R';

SELECT * FROM Turmas
  INNER JOIN Professores ON Professores.cpf = Turmas.cpf_professor;

SELECT * FROM Turmas
  INNER JOIN Professores ON Professores.cpf = Turmas.cpf_professor
  INNER JOIN Disciplinas ON Disciplinas.id =  Turmas.id_disciplina;

SELECT Turmas.numero, Professores.nome as 'professor', Disciplinas.nome as 'disciplina' FROM Turmas
  INNER JOIN Professores ON Professores.cpf = Turmas.cpf_professor
  INNER JOIN Disciplinas ON Disciplinas.id =  Turmas.id_disciplina;

SELECT t.numero, p.nome as 'professor', d.nome as 'disciplina' FROM Turmas t
  INNER JOIN Professores p ON p.cpf = t.cpf_professor
  INNER JOIN Disciplinas d ON d.id =  t.id_disciplina;

SELECT a.* FROM Alunos a
  INNER JOIN Matriculas m ON m.cpf_aluno = a.cpf
  INNER JOIN Turmas t ON t.numero = m.numero_turma
  INNER JOIN Disciplinas d ON d.id = t.id_disciplina
WHERE d.id = 2;

SELECT MIN(nota), cpf_aluno FROM Provas
WHERE numero_turma = 2;

SELECT MAX(nota), cpf_aluno FROM Provas
WHERE numero_turma = 2;

SELECT AVG(nota) FROM Provas
WHERE numero_turma = 2;

SELECT COUNT(cpf_aluno) FROM Matriculas;

SELECT SUM(nota) FROM Provas;

SELECT AVG(nota), cpf_aluno FROM Provas
GROUP BY cpf_aluno;

SELECT AVG(nota), cpf_aluno FROM Provas
GROUP BY cpf_aluno
  HAVING AVG(nota) < 5;

SELECT AVG(nota), cpf_aluno FROM Provas
GROUP BY cpf_aluno
ORDER BY AVG(nota) ASC;

SELECT AVG(nota), cpf_aluno FROM Provas
GROUP BY cpf_aluno
ORDER BY AVG(nota) DESC;

SELECT cpf_aluno FROM Provas
WHERE numero_turma = 2
AND nota < (
	SELECT AVG(nota) FROM Provas
);

SELECT * FROM Provas
LIMIT 2
OFFSET 0;