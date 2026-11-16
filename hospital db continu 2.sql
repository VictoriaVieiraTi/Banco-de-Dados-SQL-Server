USE HospitalDB;

SELECT * FROM Pacientes;
SELECT * FROM Consultas;
SELECT * FROM Medicos;

-- 5. ATUALIZAÇÃO DE DADOS (UPDATE)
--Atualizar o telefone da paciente Carla
UPDATE Pacientes
SET telefone = '98888-0000'
WHERE Nome = 'Carla Mendes';
Go

--Atualizar Valor da consulta que está nulo
UPDATE Consultas
SET valor = 180.00
WHERE valor IS NULL; -- WHERE id_paciente '3';
GO 

-- 6. EXCLUSÃO DE DADOS (DELETE)
-- Deletar Consultas sem diagnósticos(IS NULL)
DELETE FROM Consultas
WHERE diagnostico IS NULL;
GO

--Deletar pacientes sem convênio (IS NULL)
DELETE FROM Pacientes 
WHERE convenio IS NULL;
GO

-- 7. ALTER TABLE (DDL - ALTER)
-- Adicionar uma nova coluna
ALTER TABLE Pacientes 
ADD email VARCHAR(80) NULL;
GO 

-- Alterar tipo de dado de uma coluna
ALTER TABLE Pacientes
ALTER COLUMN telefone VARCHAR(30) NULL;
GO

-- Excluir uma coluna
ALTER TABLE Pacientes
DROP COLUMN email;
GO

-- 8. ORDER BY - Ordenação de Resultados
-- Ordenar pacientes em ordem alfabética
SELECT * FROM Pacientes
ORDER BY Nome ASC;

-- Ordenar consultas do valor mais alto para o mais baixo
SELECT * FROM Consultas
ORDER BY valor DESC;

-- ORDER por convênio e nome (USANDO O ASC)
SELECT Nome,convenio  FROM Pacientes
ORDER BY convenio ASC, Nome ASC;
GO

-- 9. Funções de consulta
/*AVG() → Média
SUM() → SOMA
MIN() → MENOR VALOR 
MAX →  MAIOR VALOR
COUNT() → RETORNA O NUMERO DE LINHAS
OU REGISTROS ENCONTRADOS */

-- Quantidade total de consultas
SELECT COUNT(*) AS total_consultas
FROM  Consultas;

--Maior Valor de consulta
SELECT MAX(valor) AS maior_valor
FROM Consultas

-- Menor valor de consulta 
SELECT Min(valor) AS menor_valor
FROM Consultas;

-- Media das consultas
SELECT AVG(valor) AS media_consultas
FROM Consultas;

-- Soma total das consultas
SELECT SUM(valor) AS soma_consultas
FROM Consultas;

-- 10. GRUPO BY - Agrupar Resultados
-- Contar quantos pacientes têm convênio
SELECT convenio, COUNT(*) AS total_paciente
FROM Pacientes
GROUP BY convenio;

-- Média de valores de consultaas por pacientes
SELECT id_paciente, AVG(valor) AS media_valor
FROM Consultas
GROUP BY id_paciente;

-- 11 DROP TABLE - EXCLUIR TABELAS 
DROP TABLE Consultas;
SELECT * FROM Consulta; 

