CREATE DATABASE BANCO_JOIN;
USE BANCO_JOIN;

CREATE TABLE TabelaA (
	Nome VARCHAR(50) NULL
);

	CREATE TABLE TabelaB (
	Nome VARCHAR(50) NULL
);

--Insert na Tabela A
INSERT INTO TabelaA VALUES ('Fernanda')
INSERT INTO TabelaA VALUES ('Josefa')
INSERT INTO TabelaA VALUES ('Luiz')
INSERT INTO TabelaA VALUES ('Fernando')

--Insert na Tabela B 
INSERT INTO TabelaB VALUES ('Carlos')
INSERT INTO TabelaB VALUES ('Manoel')
INSERT INTO TabelaB VALUES ('Luiz')
INSERT INTO TabelaA VALUES ('Fernando')

SELECT * FROM TabelaA;
SELECT * FROM TabelaB;

-- INNER JOIN  - E usado para  voce ver apenas quem realmente tem ligação entre as tabelas.
SELECT A.Nome, B.Nome	-- PARA BUSCAR um atribulto igual ou dentro de duas ou mais tabelas 
FROM TabelaA A  
INNER JOIN TabelaB B ON A.Nome = B.Nome 

-- LEFT JOIN  - E usado para ver tudo na tabela principal, mesmo que falte informação da outra
SELECT A.Nome, B.Nome
FROM TabelaA A
LEFT JOIN TabelaB B ON A.Nome = B.Nome

-- RIGHT JOIN  -- 
SELECT A.Nome, B.Nome
FROM TabelaA A
RIGHT JOIN TabelaB B ON A.Nome = B.Nome 

-- FULL JOIN 
SELECT A.Nome, B.Nome
FROM TabelaA A 
FULL JOIN TabelaB B ON A.Nome = B.Nome

-- CROSS JOIN -- nunca e usado - mais serve para criar combinações, montar tabelas de horário
SELECT A.Nome, B.Nome
FROM TabelaA A 
CROSS JOIN TabelaB B 

-- SELF JOIN  -- Para comparar registros dentro da mesma tabela
-- Relaciona a TabelaA com ela mesma 
-- Comparar os nomes e retorna os registros correspondentes 
SELECT A.Nome, B.Nome
FROM TabelaA A 
INNER JOIN TabelaA B ON A.Nome = B.Nome 

-- ON SERVE PARA COMPARAR 


