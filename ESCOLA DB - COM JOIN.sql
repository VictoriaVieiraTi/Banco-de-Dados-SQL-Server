-- 1. CRIAÇÃO DO BANCO DE DADOS
 

 
CREATE DATABASE Escola_DB;
GO
 
USE Escola_DB;
GO
 
-- 2. CRIAÇÃO DA TABELA
CREATE TABLE Alunos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
 
    -- UNIQUE: impede o cadastro de e-mails repetidos
    Email VARCHAR(100) UNIQUE,
 
    -- DEFAULT: define 'Ativo' quando nenhum status é informado
    StatusAluno VARCHAR(20) DEFAULT 'ATIVO', 
 
    -- CONSTRAINT: atribui um nome à restrição (CK_Idade)
    -- CHECK: permite cadastrar apenas alunos com 18 anos ou mais
    Idade INT,
    CONSTRAINT CK_Idade CHECK (Idade >=18)
);
GO
 
-- 3. INSERÇÃO DE DADOS VÁLIDOS
INSERT INTO Alunos (ID, Nome, Email, Idade)
VALUES
(1, 'Fernanda', 'fernanda@gmail.com', 20),
(2, 'Carlos', 'carlos@gmail.com', 25),
(3, 'Luiz', 'luiz@gmail.com', 19);
 
-- 4. CONSULTANDO OS DADOS
SELECT * FROM Alunos;
 
 
-- 5. TESTANDO UNIQUE
-- ERRO: o e-mail já está cadastrado
INSERT INTO Alunos (ID, Nome, Email, Idade)
 VALUES (4, 'Josefa', 'josefa@gmail.com', 22);

 
-- 6. TESTANDO DEFAULT
-- O status será preenchido automaticamente como 'Ativo'
INSERT INTO Alunos (ID, Nome, Email, Idade)
VALUES (5, 'Mariana', 'mariana@gmail.com', 23);

 
 
-- 7. TESTANDO CHECK E CONSTRAINT
-- ERRO: a idade é menor que 18 anos
-- O SQL Server informa a restrição CK_Idade
 INSERT INTO Alunos (ID, Nome, Email, Idade)
 VALUES (6, 'Pedro', 'pedro@gmail.com', 16);

 
-- 8. CONSULTA FINAL
SELECT * FROM Alunos;

