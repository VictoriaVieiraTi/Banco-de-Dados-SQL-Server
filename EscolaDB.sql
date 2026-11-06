CREATE DATABASE Escola; 

USE Escola;

CREATE TABLE Cursos (
	CursoID INT PRIMARY KEY, 
	NomeCurso VARCHAR(100)
);

CREATE TABLE Alunos (
	AlunoID INT PRIMARY KEY, 
	NomeAluno VARCHAR (100),
	CursoID INT, 
	FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

--Criando a tabela de matricula com chave primária composta 
CREATE TABLE Matriculas (
	AlunoID INT, 
	CursoID INT,
	DataMatricula DATE,
	PRIMARY KEY (AlunoID, CursoID),  --Chave primária composta
	FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID),
	FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);


