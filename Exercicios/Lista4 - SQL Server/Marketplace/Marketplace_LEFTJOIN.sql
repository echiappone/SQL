CREATE DATABASE db_Marketplace

USE db_Marketplace

CREATE TABLE tb_Usuarios (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR (50) NOT NULL,
	Email VARCHAR (50) NULL,
	Senha VARCHAR(100) NOT NULL,
	Endereco VARCHAR (100) NULL,
)

CREATE TABLE tb_Categorias (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Descricao VARCHAR(50) NULL
)

CREATE TABLE tb_Produtos (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	NomeProduto VARCHAR (50) NOT NULL,
	Descricao VARCHAR (150) NULL,
	Preco FLOAT NULL,
	FK_Criador INT NOT NULL,
	FK_Categoria INT NOT NULL,
	FOREIGN KEY (FK_Criador) REFERENCES tb_Usuarios (Id),
	FOREIGN KEY (FK_Categoria) REFERENCES tb_Categorias (Id)
)

CREATE TABLE tb_Pedidos(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	PrevisaoEntrega VARCHAR(50) NULL,
	FK_Comprador INT NOT NULL,
	FK_Produto INT NOT NULL,
	FOREIGN KEY (FK_Comprador) REFERENCES tb_Usuarios (Id),
	FOREIGN KEY (FK_Produto) REFERENCES tb_Produtos (Id)
)

--INSERTS
INSERT INTO tb_Usuarios
VALUES
('Erick','erick@email.com','12345','Rua Laranjais - 123'),
('Gustavo','guse@email.com','12345','Rua Anhanguera - 123'),
('Nick','nick@email.com','12345','Rua Brasil - 123'),
('Naomy','nao@email.com','12345','Rua Pessegos - 123')

INSERT INTO tb_Categorias
VALUES
('Eletrodosmeticos'),
('Decoracao'),
('Eletronico')

INSERT INTO tb_Produtos
VALUES
('microondas','120v',200.00, 1, 1),
('cortina','longa bege',30.00, 2, 2),
('xbox','modelo halo 2 controles',2000.00, 3, 3),
('playstation5','modelo godofwar 1 controle',3000.00, 4, 3),
('quadro','monalisa falsetao',100.00, 4, 2),
('computador','ryzen5 2600 16gb ram ssd250gb',5000.00, 4, 1),
('camera','nykon super premium',2000.00, 4, 1)

INSERT INTO tb_Pedidos
VALUES
('27/04/2022', 2, 4),
('27/04/2022', 2, 3),
('05/12/2022', 3, 3),
('05/12/2022', 3, 2),
('07/05/2022', 1, 2),
('07/05/2022', 1, 1),
('15/06/2022', 4, 2),
('15/06/2022', 4, 4)

-- SELECTS

-- INNER JOIN, AVG e BETWEEN
-- Medias entre 1 e 1000 que os usuarios investiram em seus pedidos
SELECT tb_Usuarios.Nome AS Nome, AVG(tb_Produtos.Preco) AS Media
FROM tb_Usuarios
INNER JOIN tb_Pedidos ON tb_Usuarios.Id = tb_Pedidos.FK_Comprador
INNER JOIN tb_Produtos ON tb_Usuarios.Id = tb_Produtos.FK_Criador
GROUP BY tb_Usuarios.Nome HAVING (AVG(tb_Produtos.Preco) BETWEEN 1 and 1000)

-- LEFT JOIN
SELECT
tb_usuarios.Id,
tb_usuarios.nome AS Nome,
tb_Usuarios.Email AS Email,
tb_Usuarios.Endereco AS Endereço,
tb_Pedidos.PrevisaoEntrega AS Entrega,
tb_Produtos.NomeProduto as Produto
FROM tb_usuarios
LEFT JOIN tb_Pedidos ON tb_usuarios.Id = tb_Pedidos.FK_comprador
LEFT JOIN tb_Produtos ON tb_usuarios.Id = tb_Produtos.FK_Criador

--DELETA TODOS OS DADOS DA TABELA USUARIO
DELETE FROM tb_Categorias

--ZERA O INCREMENTO DA TABELA USUARIO
DBCC CHECKIDENT (tb_Categorias, RESEED, 0)

--MOSTRA O INCREMENTO ATUAL DA TABELA USUARIO
SELECT IDENT_CURRENT('tb_categorias')