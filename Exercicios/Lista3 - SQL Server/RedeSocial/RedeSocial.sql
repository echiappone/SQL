CREATE DATABASE db_RedeSocial

USE db_RedeSocial

CREATE TABLE Usuario
(
	ID_Usuario INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
)

CREATE TABLE Grupo
(
	ID_Grupo INT PRIMARY KEY NOT NULL,
	NomeGrupo VARCHAR(100) NOT NULL,
	Descricao VARCHAR(200) NOT NULL,
	FK_Usuario INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES Usuario (ID_Usuario)
)

CREATE TABLE Postagem
(
	ID_Postagem INT PRIMARY KEY NOT NULL,
	Post VARCHAR(500) NOT NULL,
	Diahora datetime NOT NULL,
	Midia VARCHAR(500),
	FK_Usuario INT NOT NULL,
	FK_Grupo INT,
	FOREIGN KEY (FK_Usuario) REFERENCES Usuario (ID_Usuario),
	FOREIGN KEY (FK_Grupo) REFERENCES Grupo (ID_Grupo)
)

INSERT INTO Usuario
VALUES
(1,'Erick','12345','erickfilho@bol.com'),
(2,'Barbara','54321','barbarafilha@bol.com'),
(3,'Alex','24680','alexpai@bol.com'),
(4,'Tais','13579','taismae@bol.com')

INSERT INTO Grupo
VALUES
(1,'Grupo sambinha','Feito para colocar todos os sambas da cidade',1),
(2,'Grupo igreja','Feito para saber dos compromissos da igreja',3),
(3,'Grupo amigos','Feito pra fazer fofoca',3),
(4,'Grupo Volei','Feito para marcar dias pra jogar volei',2)

INSERT INTO Postagem
VALUES
(1,'Hoje a noite vai ter culto das crianças, chegar cedo','2022-04-20 13:30:05',
'https://pbs.twimg.com/profile_images/1496323515750006785/0Lx6Fn2Q_400x400.jpg',1,2),
(2,'Hoje a noite vai ter samba na lapa','2022-04-20 13:31:15',
'https://pbs.twimg.com/profile_images/1496323515750006785/0Lx6Fn2Q_400x400.jpg',3,1),
(3,'Fiquei sabendo que o Erick só quer saber e programar','2022-04-20 13:33:45',
'https://pbs.twimg.com/profile_images/1496323515750006785/0Lx6Fn2Q_400x400.jpg',2,3),
(4,'quinta feita vai ter feira com promocao de pastel','2022-04-20 13:34:02',
'https://pbs.twimg.com/profile_images/1496323515750006785/0Lx6Fn2Q_400x400.jpg',4,'')

SELECT * FROM Usuario
WHERE Email LIKE '%filh%'

SELECT * FROM Postagem
WHERE FK_Usuario BETWEEN 1 AND 2

UPDATE Usuario
SET Nome = 'Claubinho'
WHERE ID_Usuario = 1

SELECT Usuario.Nome, SUM(Usuario.Email) AS Total
FROM Usuario

GROUP BY Usuario.Nome, Usuario.Email;

DELETE Postagem
DELETE Grupo
DELETE Usuario

select * from Grupo