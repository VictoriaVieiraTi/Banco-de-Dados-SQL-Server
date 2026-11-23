-- Atividade Tabela Supermercado 

-- CRIANDO TABELA SUPERMERCADO
CREATE DATABASE Supermercado;
GO 

USE Supermercado;
GO 

CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY,
nome_categoria VARCHAR(50)
);

CREATE TABLE Fornecedores (
id_fornecedor INT PRIMARY KEY,
nome_fornecedor VARCHAR(100),
telefone VARCHAR(20)
);

CREATE TABLE Produtos (
id_produto INT PRIMARY KEY,
nome_produto VARCHAR(100),
Preco DECIMAL(10,2),
id_categoria INT,
id_fornecedor INT,
FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- CRIANDO CATEGORIA POR NOMES DE PRODUTOS 
-- TABELA CATEGORIAS 
INSERT INTO Categorias VALUES
(1, 'Bebidas'),
(2, 'Alimentos'),
(3,	'Limpeza'),
(4,	'Higiene'),
(5, 'Hortifruti');

--TABELA FORNECEDORES 
INSERT INTO Fornecedores VALUES
(1, 'Coca-Cola', '11987654321'),
(2, 'Nestlé' ,   '11987654322'),
(3, 'Unilever', '11987654323'),
(4, 'Colgate', '11987654324'),
(5, 'Fazenda Verde', '11987654325');

-- TABELA PRODUTOS
INSERT INTO Produtos VALUES
(1, 'Refrigerante Coca-Cola', 8.50, 1, 1),
(2, 'Chocolate Nestlé', 6.90, 2, 2),
(3, 'Detergente', 2.99, 3, 3),
(4, 'Creme Dental', 5.50, 4, 4),
(5, 'Alface', 3.99, 5, 5);

-- Consultar os Registros
SELECT * FROM Categorias;

SELECT * FROM Fornecedores;

SELECT * FROM Produtos;

-- visualizar as tabelas relacionadas.

SELECT
    Produtos.nome_produto,
    Produtos.preco,
    Categorias.nome_categoria,
    Fornecedores.nome_fornecedor
FROM Produtos
INNER JOIN Categorias
ON Produtos.id_categoria = Categorias.id_categoria
INNER JOIN Fornecedores
ON Produtos.id_fornecedor = Fornecedores.id_fornecedor;




