#Criação da Base de dados do Siga-me

create database if not exists Siga_me;

#Tabela dos professores
CREATE TABLE IF NOT EXISTS Professores (
  pk_professor_cpf VARCHAR(14) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  data_nascimento DATETIME,
  CONSTRAINT pk_professor PRIMARY KEY (pk_professor_cpf)
);

CREATE TABLE IF NOT EXISTS Alunos (
  pk_aluno_cpf VARCHAR(14) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  data_nascimento DATE,
  CONSTRAINT pk_aluno PRIMARY KEY (pk_aluno_cpf)
);

CREATE TABLE IF NOT EXISTS Materiais (
  pk_material_id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  area VARCHAR(50) NOT NULL,
  fk_professor_cpf VARCHAR(14),
  CONSTRAINT pk_material PRIMARY KEY (pk_material_id),
  CONSTRAINT fk_material_professor FOREIGN KEY (fk_professor_cpf) 
  REFERENCES Professores(pk_professor_cpf)
);

/*
CREATE TABLE IF NOT EXISTS Aulas (
  #pk_aula_id INT NOT NULL AUTO_INCREMENT,
  data_horario DATETIME NOT NULL,
  fk_professor_cpf VARCHAR(14) NOT NULL,
  fk_material_id INT NOT NULL,
  CONSTRAINT pk_aula PRIMARY KEY (pk_aula_id),
  CONSTRAINT fk_aula_professor FOREIGN KEY (fk_professor_cpf) 
  REFERENCES Professores(pk_professor_cpf),
  CONSTRAINT fk_aula_material FOREIGN KEY (fk_material_id) 
  REFERENCES Materiais(pk_material_id)
);

CREATE TABLE IF NOT EXISTS Alunos_Aulas (
  fk_aluno_cpf VARCHAR(14) NOT NULL,
  fk_aula_id INT NOT NULL,
  CONSTRAINT pk_alunos_aulas PRIMARY KEY (fk_aluno_cpf, fk_aula_id),
  CONSTRAINT fk_alunos_aulas_aluno FOREIGN KEY (fk_aluno_cpf) 
  REFERENCES Alunos(pk_aluno_cpf),
  CONSTRAINT fk_alunos_aulas_aula FOREIGN KEY (fk_aula_id) 
  REFERENCES Aulas(pk_aula_id)
);
*/

CREATE TABLE IF NOT EXISTS Notas (
  pk_nota_id INT NOT NULL AUTO_INCREMENT,
  nota DECIMAL(5, 2) NOT NULL,
  fk_aluno_cpf VARCHAR(14) NOT NULL,
  fk_material_id INT NOT NULL,
  CONSTRAINT pk_nota PRIMARY KEY (pk_nota_id),
  CONSTRAINT fk_nota_aluno FOREIGN KEY (fk_aluno_cpf) 
  REFERENCES Alunos(pk_aluno_cpf),
  CONSTRAINT fk_nota_material FOREIGN KEY (fk_material_id)
  REFERENCES Materiais(pk_material_id)
);


