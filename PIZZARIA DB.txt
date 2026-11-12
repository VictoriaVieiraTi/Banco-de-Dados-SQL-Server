-- Criando o banco de dados Pizzaria
CREATE DATABASE PizzariaDB;
GO

USE PizzariaDB;
GO

-- CRIAÇÃO DAS TABELAS
-- TABELA Clientes 
CREATE TABLE clientes(
id_cliente INT IDENTITY(1,1)PRIMARY KEY,
nome VARCHAR(100) NOT NULL, 
CPF VARCHAR(14) NOT NULL,
telefone VARCHAR(20) NULL,
endereco VARCHAR(150) NOT NULL,
cidade VARCHAR(60) NOT NULL
);
GO

-- TABELA PIZZAS
CREATE TABLE  pizzas(
id_pizza INT IDENTITY(1,1) PRIMARY KEY,
nome_pizza VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
tamanho VARCHAR(50) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
quantidade_estoque INT NOT NULL,
);
GO

-- TABELE DE FUNCIONÁRIOS
CREATE TABLE funcionario(
id_funcionario INT IDENTITY(1,1) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cargo VARCHAR(50) NOT NULL,
salario DECIMAL(10,2) NOT NULL,
data_admissao DATE NOT NULL
);
GO


-- TABELA DE PEDIDOS
CREATE TABLE pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_pizza INT NOT NULL,
    id_funcionario INT NOT NULL,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,

    -- Chave estrangeira para Clientes
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),

    -- Chave estrangeira para Pizzas
    FOREIGN KEY (id_pizza) REFERENCES pizzas(id_pizza),

    -- Chave estrangeira para Funcionarios
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);
GO
   -- 3. Inserindo 10 clientes de cidades diferentes
   INSERT INTO clientes (nome,CPF,telefone,endereco,cidade)
   VALUES
   ('Ana Silva', '111.111.111-11', '11999990001', 'Rua das Flores, 100', 'Osasco'),
   ('Bruno Santos', '222.222.222-22', '11999990002', 'Rua Central, 200', 'São Paulo'),
   ('Carla Oliveira', '333.333.333-33', '11999990003', 'Av. Brasil, 300', 'Barueri'),
   ('Daniel Costa', '444.444.444-44', '11999990004', 'Rua Azul, 400', 'Carapicuíba'),
   ('Eduarda Lima', '555.555.555-55', '11999990005', 'Rua Verde, 500', 'Cotia'),
   ('Felipe Souza', '666.666.666-66', '11999990006', 'Rua das Palmeiras, 600', 'Itapevi'),
   ('Gabriela Alves', '777.777.777-77', '11999990007', 'Av. Paulista, 700', 'Santo André'),
   ('Henrique Rocha', '888.888.888-88', '11999990008', 'Rua do Sol, 800', 'Guarulhos'),
   ('Isabela Martins', '999.999.999-99', '11999990009', 'Rua Nova, 900', 'Taboão da Serra'),
   ('João Ferreira', '000.000.000-00', '11999990010', 'Rua da Paz, 1000', 'Mauá');
GO

   --  Consultando todos os clientes cadastrados
    SELECT * FROM clientes;
    GO

-- 3. -- Inserindo 12 pizzas de diferentes categorias
INSERT INTO pizzas (nome_pizza, categoria, tamanho, preco, quantidade_estoque)
VALUES
('Italiana', 'Tradicional', 'Grande', 45.00, 20),
('Calabresa', 'Tradicional', 'Grande', 48.00, 25),
('Portuguesa', 'Tradicional', 'Grande', 52.00, 18),
('Frango com Catupiry', 'Especial', 'Grande', 58.00, 15),
('Quatro Queijos', 'Especial', 'Grande', 62.00, 12),
('Pepperoni', 'Especial', 'Grande', 65.00, 14),
('Chocolate', 'Doce', 'Média', 42.00, 10),
('Romeu e Julieta', 'Doce', 'Média', 44.00, 8),
('Banana com Canela', 'Doce', 'Média', 40.00, 11),
('Marguerita', 'Vegetariana', 'Grande', 49.00, 16),
('Brócolis com Queijo', 'Vegetariana', 'Grande', 53.00, 13),
('Palmito', 'Vegetariana', 'Grande', 55.00, 9);
GO

-- Consultando todas as pizzas cadastradas
SELECT * FROM pizzas;
GO

-- 3.Inserção de dados 
-- Inserindo 5 funcionários com nomes árabes
INSERT INTO funcionario (nome, cargo, salario,data_admissao)
VALUES
('Ahmed Hassan', 'Gerente', 4500.00, '2024-01-15'),
('Layla Nasser', 'Atendente', 2200.00, '2024-03-10'),
('Omar Khalil', 'Pizzaiolo', 3200.00, '2023-08-20'),
('Yasmin Haddad', 'Caixa', 2500.00, '2024-06-05'),
('Samir Mansour', 'Entregador', 2100.00, '2025-02-12');
GO

-- Consultando os funcionários cadastrados
SELECT * FROM funcionario;
GO

-- Conferindo os IDs dos clientes
SELECT id_cliente, nome FROM clientes;
GO

-- Conferindo os IDs das pizzas
SELECT id_pizza, nome_pizza FROM pizzas;
GO


-- Conferindo os IDs dos funcionários
SELECT id_funcionario, nome FROM funcionario;
GO

-- Inserindo 20 pedidos na pizzaria
INSERT INTO pedidos (id_cliente, id_pizza, id_funcionario, quantidade, data_pedido)
VALUES
    (1, 1, 1, 2, '2026-10-01'),
    (2, 2, 2, 1, '2026-10-02'),
    (3, 3, 3, 3, '2026-10-03'),
    (4, 4, 4, 1, '2026-10-04'),
    (5, 5, 5, 2, '2026-10-05'),
    (6, 6, 1, 1, '2026-10-06'),
    (7, 7, 2, 2, '2026-10-07'),
    (8, 8, 3, 1, '2026-10-08'),
    (9, 9, 4, 3, '2026-10-09'),
    (10, 10, 5, 2, '2026-10-10'),
    (1, 11, 1, 1, '2026-10-11'),
    (2, 12, 2, 2, '2026-10-12'),
    (3, 1, 3, 1, '2026-10-13'),
    (4, 2, 4, 2, '2026-10-14'),
    (5, 3, 5, 1, '2026-10-15'),
    (6, 4, 1, 3, '2026-10-16'),
    (7, 5, 2, 1, '2026-10-17'),
    (8, 6, 3, 2, '2026-10-18'),
    (9, 7, 4, 1, '2026-10-19'),
    (10, 8, 5, 2, '2026-10-20');
    GO


-- Etapa 4 
-- 1. Exibir todos os clientes cadastrados
SELECT *
FROM clientes;
GO

-- 2. Consultar nome, categoria e preço das pizzas
SELECT nome_pizza, categoria, preco
FROM pizzas;
GO

-- 3. Listar funcionários com salário superior a R$ 3.000
SELECT *
FROM funcionario
WHERE salario > 3000;
GO

-- 4. Exibir pizzas com preço inferior a R$ 60
SELECT *
FROM pizzas
WHERE preco < 60;
GO

-- 5. Consultar clientes de uma cidade específica
SELECT *
FROM clientes
WHERE cidade = 'Osasco';
GO

-- 6. Listar pizzas com estoque superior a 10 unidades
SELECT *
FROM pizzas
WHERE quantidade_estoque > 10;
GO



-- 5. Atualização e exclusão 

-- Atualizando o telefone de um cliente
UPDATE clientes
SET telefone = '1198887777'
WHERE id_cliente = 1;
GO

-- Conferindo a alteração
SELECT *
FROM clientes
WHERE id_cliente = 1;
GO

-- 2. Alterar o preço de uma pizza
UPDATE pizzas
SET preco = 50.00
WHERE id_pizza = 1;
GO

-- Conferindo a alteração
SELECT *
FROM pizzas
WHERE id_pizza = 1;
GO

-- 3. Aumentar o salário de um funcionário em 10%
UPDATE funcionario
SET salario = salario * 1.10
WHERE id_funcionario = 1;
GO

-- Conferindo a alteração
SELECT *
FROM funcionario
WHERE id_funcionario = 1;
GO

-- 4. Modificar o estoque de uma pizza
UPDATE pizzas
SET quantidade_estoque = 30
WHERE id_pizza = 2;
GO

-- Conferindo a alteração
SELECT *
FROM pizzas
WHERE id_pizza = 2;
GO

-- Verificar os pedidos de cada cliente
SELECT *
FROM pedidos;
GO


-- Criar uma pizza de teste
INSERT INTO pizzas (nome_pizza, categoria, tamanho, preco, quantidade_estoque)
VALUES ('Pizza Teste', 'Temporaria', 'Pequena', 30.00, 5);
GO

-- Conferir a pizza cadastrada
SELECT *
FROM pizzas
WHERE nome_pizza = 'Pizza Teste';
GO

-- Excluir a pizza de teste
DELETE FROM pizzas
WHERE nome_pizza = 'Pizza Teste';
GO

-- Conferir se foi excluída
SELECT *
FROM pizzas
WHERE nome_pizza = 'Pizza Teste';
GO


-- Etapa 6 Alteração de tabelas 

-- 1. Adicionar a coluna descrição na Tabela Pizzas
ALTER TABLE pizzas
ADD descricao VARCHAR(150);
GO

-- Conferindo Alteração da Descrição
SELECT *
FROM pizzas;
GO

-- 2. Adicionando o atributo email na tabela cliente
ALTER TABLE clientes
ADD email VARCHAR(100);
GO

-- Conferindo alteração do e-mail 
SELECT * FROM clientes;
GO

-- 3. Alterar o tipo de dado da coluna telefone
ALTER TABLE clientes
ALTER COLUMN telefone VARCHAR(25);
GO

-- 4. Excluir o atributo email da tabela Clientes
ALTER TABLE clientes
DROP COLUMN email;
GO


-- ETAPA 7 - ORDENAÇÃO (ORDER BY)

-- 1. Pizzas da mais barata para a mais cara
SELECT * FROM pizzas
ORDER BY preco ASC;
GO

-- 2. Pizzas da mais cara para a mais barata
SELECT * FROM pizzas
ORDER BY preco DESC;
GO

-- 3. Funcionários em ordem alfabética
SELECT * FROM funcionario
ORDER BY nome ASC;
GO

-- 4. Clientes em ordem alfabética decrescente
SELECT * FROM clientes
ORDER BY nome DESC;
GO

-- 5. Pedidos do mais recente para o mais antigo
SELECT * FROM pedidos
ORDER BY data_pedido DESC;
GO

-- ETAPA 8 - AGRUPAMENTO (GROUP BY)

-- 1. Contar pizzas por categoria
SELECT categoria, COUNT(*) AS quantidade_pizzas
FROM pizzas
GROUP BY categoria;
GO

-- 2. Contar clientes por cidade
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM clientes
GROUP BY cidade;
GO

-- 3. Contar pedidos por funcionário
SELECT id_funcionario, COUNT(*) AS quantidade_pedidos
FROM pedidos
GROUP BY id_funcionario;
GO

-- 4. Calcular o total de pizzas vendidas por tipo
SELECT id_pizza, SUM(quantidade) AS total_vendido
FROM pedidos
GROUP BY id_pizza;
GO

SELECT * FROM funcionario;
GO


-- ETAPA 9 - FUNÇÕES DE AGREGAÇÃO

-- 1. Calcular a média dos preços das pizzas
SELECT AVG(preco) AS media_precos
FROM pizzas;
GO

-- 2. Calcular a soma dos salários dos funcionários
SELECT SUM(salario) AS total_salarios
FROM funcionario;
GO

-- 3. Identificar o menor preço de pizza
SELECT MIN(preco) AS menor_preco
FROM pizzas;
GO

-- 4. Identificar o maior salário dos funcionários
SELECT MAX(salario) AS maior_salario
FROM funcionario;
GO

-- Desafio: média dos preços das pizzas por categoria
SELECT categoria, AVG(preco) AS media_precos
FROM pizzas
GROUP BY categoria;
GO

-- Etapa 10 Exclusão de Tabelas 

CREATE TABLE PizzasTemporarias (
    id_pizza INT,
    nome_pizza VARCHAR(100),
    preco DECIMAL(10,2)
);
GO

-- 2. Inserir dois registros
INSERT INTO PizzasTemporarias (id_pizza, nome_pizza, preco)
VALUES
(1, 'Pizza Teste 1', 35.00),
(2, 'Pizza Teste 2', 42.00);
GO

-- 3 Consultando os registros 
SELECT * FROM PizzasTemporarias;
GO

-- 4 Excluindo a tabela 
DROP TABLE PizzasTemporarias;
GO

-- EXEMPLO 
-- DROP DATABASE PizzariaDB;


