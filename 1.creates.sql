CREATE TABLE Alunos (
	cpf varchar(11) PRIMARY KEY,
  nome varchar(255) NOT NULL
);

CREATE TABLE Professores (
	cpf varchar(11) PRIMARY KEY,
  nome varchar(255) NOT NULL
);

CREATE TABLE Disciplinas (
  id int PRIMARY KEY,
	nome varchar(255) NOT NULL
);

CREATE TABLE Turmas (
  numero int PRIMARY KEY,
	cpf_professor varchar(11) NOT NULL,
  id_disciplina int NOT NULL,
	
  FOREIGN KEY (cpf_professor) REFERENCES Professores(cpf),
  FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id)
);

CREATE TABLE Matriculas (
  id int PRIMARY KEY,
	cpf_aluno varchar(11) NOT NULL,
  numero_turma int NOT NULL,
	
  FOREIGN KEY (cpf_aluno) REFERENCES Alunos(cpf),
  FOREIGN KEY (numero_turma) REFERENCES Turmas(numero)
);

CREATE TABLE Provas (
  id int PRIMARY KEY,
	cpf_aluno varchar(11) NOT NULL,
  numero_turma int NOT NULL,
  nota int NOT NULL,
	
  FOREIGN KEY (cpf_aluno) REFERENCES Alunos(cpf),
  FOREIGN KEY (numero_turma) REFERENCES Turmas(numero)
);