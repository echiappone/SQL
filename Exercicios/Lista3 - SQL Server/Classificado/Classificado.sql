CREATE DATABASE db_Classificado

USE db_Classificado

CREATE TABLE Usuario
(
	ID_Usuario INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telefone VARCHAR(11) NOT NULL,
	Endereco VARCHAR(200) NOT NULL
)

CREATE TABLE Anuncio
(
	Classificacao INT NOT NULL,
	Descricao VARCHAR(200),
	Nota FLOAT NOT NULL,
	FK_Usuario INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES Usuario (ID_Usuario)
)

INSERT INTO Usuario
VALUES
(1,'Erick','12345','erickfilho@bol.com','11988888888','avenida das pitangas 10'),
(2,'Barbara','54321','barbarafilha@bol.com','11933333333','avenida das flores 20'),
(3,'Alex','24680','alexpai@bol.com','11944444444','avenida das frutas 30'),
(4,'Tais','13579','taismae@bol.com','11977777777','avenida dos animais 40')

INSERT INTO Anuncio
VALUES
(12,'Parabens pela classificacao',9,2),
(3,'Parabens pela classificacao',9.7,3),
(45,'Infelizmente voce nao se classificou',5.5,1),
(69,'Infelizmente voce nao se classificou',3,4)

SELECT * FROM Anuncio
WHERE Descricao LIKE '%Parabens%'

UPDATE Usuario
SET Nome = 'Pamella'
WHERE ID_Usuario = 2

SELECT Usuario.Nome, SUM(Usuario.ID_Usuario) AS Total
FROM Usuario

DELETE Usuario
DELETE Anuncio

select * from Anuncio