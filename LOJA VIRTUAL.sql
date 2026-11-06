CREATE DATABASE Loja Virtual;
GO

USE LojaVirtual;
GO

--Tabela Clientes
CREATE TABLE Clientes (
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(100) 
	Email VARCHAR(100) 
	Telefone VARCHAR(20),
	DataCadastro DATE 
);

-- Tabela Produtos
CREATE TABLE Produtos(
	id_produto INT IDENTITY(1,1) PRIMARY KEY,
	ClienteID INT REFERENCES Clientes(ClienteID),
	Nome VARCHAR(100) NOT NULL,
	descricao TEXT, 
	categoria CHAR(3)
	quantidade INT,
	preco DECIMAL(10,2),
	data_cadastro DATETIME,
