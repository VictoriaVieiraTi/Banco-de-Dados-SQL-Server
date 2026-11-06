
-- 1. CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO


-- 2.CRIAÇÃO DAS TABELAS
--Tabela de Pacientes
CREATE TABLE Pacientes (
	id_paciente INT IDENTITY(1,1) PRIMARY KEY, 
	Nome VARCHAR(60) NOT NULL,			-- CAMPO OBRIGATÓRIO 
	data_nascimento DATE NOT NULL,		-- CAMPO OBRIGATÓRIO 
	sexo CHAR(1) NOT NULL,				-- CAMPO OBRIGATÓRIO 
	telefone VARCHAR(20) NULL,			-- CAMPO OPICIONAL 
	convenio VARCHAR(50) NULL,			-- CAMPO OPICIONAL
);
GO

--TABELA MEDICO
CREATE TABLE Medicos (
	id_medico INT IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	especialidade VARCHAR(50) NOT NULL,
	Telefone VARCHAR(20) NULL,
	email VARCHAR(80) NULL

);

--TABELA CONSULTAS
CREATE TABLE Consultas (
	id_consulta INT IDENTITY (1,1) PRIMARY KEY,
	id_paciente INT NOT NULL,
	id_medico INT NOT NULL,
	data_consulta DATE NOT NULL,
	valor DECIMAL(8,2) NULL,
	diagnostico VARCHAR(255) NULL,

	FOREIGN KEY(id_paciente)
		REFERENCES Pacientes(id_paciente),

		FOREIGN KEY (id_medico)
			REFERENCES Medicos(id_medico)

);

	-- 3. INSERINDO DADOS (INSERT)
INSERT INTO Pacientes (nome,data_nascimento, sexo , telefone , convenio)
VALUES
('Ana Paula','1990-05-10', 'F', '99999-1111','Unimed'),
('Bruno Lima', '1995-09-25', 'M', NULL, 'Bradesco'),
('Carla Mendes', '2000-01-15', 'F', NULL, NULL)
GO

INSERT INTO Medicos (nome,especialidade, Telefone, email)
VALUES
('Dr João Silva', 'Cardiologista', '97777-3333', 'joao@hospital.com'),
('Dra. Maria Souza', 'Pediatria', '96666-4444',  'maria@hospital.com'),
('Dr. Carlos Nunes', 'Ortopedia',	NULL,  'carlos@hospital.com');
GO

	INSERT INTO Consultas(id_paciente, id_medico, data_consulta, valor, diagnostico)
	VALUES
	(1, 1, '2025-11-01', 200.00, 'Check-up anual'),
	(2,2,  '2025-11-02', 150.00, 'Gripe Comum'),
	(3, 3, '2025-11-03', NULL, NULL);
	GO

--SELECT 
SELECT * FROM Pacientes;
SELECT * FROM Medicos;
SELECT * FROM Consultas;

--SELECT COM WHERE 
-- Pacientes que têm convênio (IS NOT NULL)
SELECT Nome, convenio FROM Pacientes
WHERE convenio IS NOT NULL;

-- Pacientes sem telefone (IS NULL)
SELECT Nome, telefone FROM Pacientes
WHERE telefone IS NULL;

-- Pacientes do sexo feminino E com convênio (AND)
SELECT Nome, sexo, convenio FROM Pacientes
WHERE sexo = 'F' AND convenio IS NOT NULL;
GO

-- Médicos com especialidade em Cardiologia OU Pediatria (OR)
SELECT Nome, especialidade FROM Medicos
WHERE especialidade = 'Cardiologista' OR especialidade = 'Pediatria'; 
GO

-- Pacientes cujo nome começa com 'A' (LIKE)
SELECT * FROM Pacientes
WHERE Nome LIKE 'A%';


-- Pacientes cujo nome termina com 'a' (LIKE)
SELECT * FROM Pacientes
WHERE Nome LIKE '%a';

-- CONSULTAS COM VALOR ENTRE 150 E 250 (BETWEEN)
SELECT * FROM Consultas
WHERE valor BETWEEN 150 AND 250;