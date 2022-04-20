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