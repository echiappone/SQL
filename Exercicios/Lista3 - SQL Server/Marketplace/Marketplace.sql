-- DDL
-- CREATE
-- ALTER
-- DROP

CREATE DATABASE db_marketplace

USE db_marketplace

CREATE TABLE Usuarios(
	Id INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Senha VARCHAR(100) NOT NULL,
	Endereco VARCHAR(100) NULL
)

CREATE TABLE Categorias(
	Id INT PRIMARY KEY NOT NULL,
	Descricao VARCHAR(50)
)

CREATE TABLE Produtos(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	NomeProduto VARCHAR(50) NOT NULL,
	Descricao VARCHAR(150) NOT NULL,
	Preco FLOAT NULL,
	FK_Criador INT NOT NULL,
	FK_Categoria INT NOT NULL,
	FOREIGN KEY (FK_Criador) REFERENCES Usuarios (Id),
	FOREIGN KEY (FK_Categoria) REFERENCES Categorias (Id)
)

CREATE TABLE Compras(
	FK_Comprador INT NOT NULL,
	FK_Produto INT NOT NULL,
	FOREIGN KEY (FK_Comprador) REFERENCES Usuarios (Id),
	FOREIGN KEY (FK_Produto) REFERENCES Produtos (Id)
)

-- DML
-- INSERT
-- SELECT
-- UPDATE
-- DELETE

INSERT INTO Usuarios
VALUES
(1, 'Yasmin Boaz', 'yasmin@email.com', '134652', 'Rua das pitangas , 168 - SP'),
(2,  'Matheus Boaz', 'rodrigues@email.com', '134652', 'Rua dos laranjais, 265 - SP'),
(3, 'Gustavo Boaz', 'gustavo@email.com', '134652', 'Rua dos Amarais, 357 - SP')

INSERT INTO Categorias
VALUES
(1, 'Animais'),
(2, 'Humanos')

INSERT INTO Produtos
VALUES
('Sabonete Dog', 'Sabonete para uso do seu cachorrinho', 2.75, 3, 1),
('Sabonete Cat', 'Sabonete para uso do seu Gato', 5.75, 3, 1),
('Shampoo Seda', 'Shampoo para uso Adulto Humano', 15.25, 2, 1)

INSERT INTO Compras
VALUES
(1, 3),
(2, 1),
(2, 2),
(2, 2)

SELECT * FROM Usuarios
WHERE Endereco LIKE '%Rua das pi%'

SELECT * FROM Produtos
WHERE Preco BETWEEN 5 AND 15

UPDATE Usuarios
SET Nome = 'Yasmin Cristine'
WHERE Id = 1

SELECT Usuarios.Nome, SUM(Produtos.Preco) AS Total
FROM Usuarios
INNER JOIN Compras ON Usuarios.Id = Compras.FK_Comprador
INNER JOIN Produtos ON Produtos.Id = Compras.FK_Produto
GROUP BY Usuarios.Nome;

DELETE Compras
DELETE Produtos
DELETE Usuarios
DELETE Categorias

select * from Usuarios