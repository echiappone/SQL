CREATE DATABASE db_Ecommerce

USE db_Ecommerce

CREATE TABLE Produto
(
	ID_Produto INT PRIMARY KEY NOT NULL,
	NomeProduto VARCHAR(100) NOT NULL,
	Descricao VARCHAR(200) NOT NULL,
	Preco FLOAT NOT NULL,
	Quant INT NOT NULL
)

CREATE TABLE Estoque
(
	ID_Estoque INT PRIMARY KEY NOT NULL,
	QuantEstoque INT NOT NULL,
	FK_Produto INT NOT NULL,
	FOREIGN KEY (FK_Produto) REFERENCES Produto (ID_Produto)
)

CREATE TABLE Usuario
(
	ID_Usuario INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Endereco VARCHAR(200) NOT NULL,
)

CREATE TABLE Carrinho
(
	Valor FLOAT NOT NULL,
	FK_Usuario INT NOT NULL,
	FK_Produto INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES Usuario (ID_Usuario),
	FOREIGN KEY (FK_Produto) REFERENCES Produto (ID_Produto)
)

INSERT INTO Produto
VALUES
(1,'Café','café forte leão 1kg', 10.00, 1),
(2,'Acucar','acucar fino neve 1kg', 6.50, 4),
(3,'Feijao','Feijao preto', 9.00, 1),
(4,'Arroz', 'Arroz branco neve 1kg',9.50, 2)

INSERT INTO Estoque
VALUES
(1, 30, 1),
(2, 20, 2),
(3, 25, 3),
(4, 50, 4)

INSERT INTO Usuario
VALUES
(1,'Erick','12345','erickfilho@bol.com','avenida das pitangas 10'),
(2,'Barbara','54321','barbarafilha@bol.com','avenida das flores 20'),
(3,'Alex','24680','alexpai@bol.com','avenida das frutas 30'),
(4,'Tais','13579','taismae@bol.com','avenida dos animais 40')

INSERT INTO Carrinho
VALUES
(500,1,2),
(760,2,4),
(500,3,4),
(1000,4,1)

SELECT * FROM Usuario
WHERE Endereco LIKE '%avenida das pi%'

SELECT * FROM Produto
WHERE Preco BETWEEN 5 AND 15

UPDATE Usuario
SET Nome = 'Boaz'
WHERE ID_Usuario = 1

SELECT Usuario.Nome, SUM(Usuario.ID_Usuario) AS Total
FROM Usuario
INNER JOIN Carrinho ON Usuario.ID_Usuario = Carrinho.FK_Produto
GROUP BY Usuario.Nome;

DELETE Estoque
DELETE Produto
DELETE Usuario
DELETE Carrinho

select * from Usuario