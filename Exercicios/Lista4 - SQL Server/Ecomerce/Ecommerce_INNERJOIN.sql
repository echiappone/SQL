CREATE DATABASE db_Ecommerce

USE db_Ecommerce

CREATE TABLE tb_Usuarios
(
	Id_Usuarios INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(100) NULL,
	Email VARCHAR(50) NULL,
	Senha VARCHAR(100) NULL,
	Endereco VARCHAR(50) NULL,
	Forma_Pagamento VARCHAR(100) NULL
)

CREATE TABLE tb_Produtos
(
	Id_Produtos INT PRIMARY KEY IDENTITY NOT NULL,
	Preco FLOAT NULL,
	Quantidade INT NULL,
	Categoria VARCHAR(50) NULL
)

CREATE TABLE tb_Pedidos
(
	Id_Entrega INT PRIMARY KEY IDENTITY NOT NULL,
	PrevisaoEntrega VARCHAR(50) NULL,
	FK_Id_Usuarios INT NULL,
	FK_Id_Produtos INT NULL,
	FOREIGN KEY (FK_Id_Usuarios) REFERENCES tb_Usuarios (Id_Usuarios),
	FOREIGN KEY (FK_Id_Produtos) REFERENCES tb_Produtos (Id_Produtos)
)


-- INSERTS
INSERT INTO tb_Usuarios
VALUES
('Erick','erick@email.com','12345','Rua Brasil - 123','PIX'),
('Gustavo','guse@email.com','12345','Rua Anhanguera - 123','DEBITO'),
('Nickole','nick@email.com','12345','Rua Laranjais - 123','CREDITO'),
('Naomy','nao@email.com','12345','Rua Pessegos - 123','BOLETO')

INSERT INTO tb_Produtos
VALUES
(1999.00, 15, 'TV SMART LG'),
(2999.00, 8, 'SOFÁ GRANDE'),
(1500.00, 10, 'FOGÃO BRASTEMP'),
(2000.00, 5, 'ARMARIO MADEIRA MACICA')

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


-- INNER JOIN, AVG e BETWEEN
SELECT tb_Usuarios.Nome AS Nome, AVG(tb_Produtos.Preco) AS Media
FROM tb_Usuarios
INNER JOIN tb_Pedidos ON Id_Usuarios = FK_Id_Usuarios
INNER JOIN tb_Produtos ON Id_Produtos = FK_Id_Produtos
GROUP BY tb_Usuarios.Nome HAVING (AVG(tb_Produtos.Preco) BETWEEN 2000 and 3000)