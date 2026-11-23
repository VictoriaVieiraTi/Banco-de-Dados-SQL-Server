-- Atividade Tabela Supermercado 

-- CRIANDO TABELA SUPERMERCADO
CREATE DATABASE Supermercado;
GO 

USE Supermercado;
GO 

--- TABELA CLIENTES
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- CADASTRO DE CLIENTES 
INSERT INTO Clientes VALUES
(1, 'Ana Souza', '11987654321', 'ana@gmail.com'),
(2, 'Carlos Lima', '11987654322', 'carlos@gmail.com'),
(3, 'Mariana Costa', '11987654323', 'mariana@gmail.com'),
(4, 'Pedro Santos', '11987654324', 'pedro@gmail.com'),
(5, 'Juliana Alves', '11987654325', 'juliana@gmail.com');


-- TABELA VENDAS
CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY,
    data_venda DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- CADASTRO DE 5 VENDAS
INSERT INTO Vendas VALUES
(1, '2026-11-20', 1),
(2, '2026-11-20', 2),
(3, '2026-11-21', 3),
(4, '2026-11-21', 1),
(5, '2026-11-22', 5);


-- Criação da Tabela Itens Venda
CREATE TABLE ItensVenda (
    id_item INT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venda)
    REFERENCES Vendas(id_venda),
    FOREIGN KEY (id_produto)
    REFERENCES Produtos(id_produto)
);

-- itens venda - valores
INSERT INTO ItensVenda VALUES
(1, 1, 1, 2, 8.50),
(2, 2, 2, 3, 6.90),
(3, 3, 3, 2, 2.99),
(4, 4, 4, 1, 5.50),
(5, 5, 5, 4, 3.99);



-- CONFERINDO OS REGISTROS
SELECT * FROM Clientes;
SELECT * FROM Vendas;
SELECT * FROM ItensVenda;


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


-- Consultando tabelas 
SELECT * FROM Clientes;
SELECT * FROM Categorias;
SELECT * FROM Fornecedores;
SELECT * FROM Produtos;
SELECT * FROM Vendas;
SELECT * FROM ItensVenda;

--- consultando 

SELECT
    Clientes.nome_cliente,
    Vendas.data_venda,
    Produtos.nome_produto,
    Categorias.nome_categoria,
    Fornecedores.nome_fornecedor,
    ItensVenda.quantidade,
    ItensVenda.preco_unitario,
    (ItensVenda.quantidade * ItensVenda.preco_unitario) AS total_item

FROM Clientes

INNER JOIN Vendas
    ON Clientes.id_cliente = Vendas.id_cliente

INNER JOIN ItensVenda
    ON Vendas.id_venda = ItensVenda.id_venda

INNER JOIN Produtos
    ON ItensVenda.id_produto = Produtos.id_produto

INNER JOIN Categorias
    ON Produtos.id_categoria = Categorias.id_categoria

INNER JOIN Fornecedores
    ON Produtos.id_fornecedor = Fornecedores.id_fornecedor;
