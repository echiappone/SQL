CREATE DATABASE db_Redesocial

USE db_Redesocial

CREATE TABLE tb_usuarios(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Nickname VARCHAR(20) NULL,
	Email VARCHAR(100) NULL,
	Senha VARCHAR(20) NOT NULL
)

CREATE TABLE tb_publicacoes(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Tema VARCHAR(50) NULL,
	Titulo VARCHAR(50) NULL,
	Descricao VARCHAR(500) NULL,
	Foto VARCHAR(50) NULL,
	Fk_usuario INT NOT NULL,
	FOREIGN KEY (Fk_Usuario) REFERENCES tb_usuarios (Id)
)

CREATE TABLE tb_grupos(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nomegrupo VARCHAR(50) NULL,
	Fotogrupo VARCHAR(100) NULL,
	Segmento VARCHAR(50) NULL,
	FK_usuario INT NOT NULL,
	FK_publicacao INT NOT NULL,
	FOREIGN KEY (FK_usuario) REFERENCES tb_usuarios (Id),
	FOREIGN KEY (FK_publicacao) REFERENCES tb_publicacoes (Id)
)


-- INSERTS
INSERT INTO tb_usuarios 
VALUES
('Rodrigo da Silva Franca', 'RDG99', 'rodrigo@email.com', 'password123'),
('Nickole Bueno', 'Princesinha1993', 'nickole@email.com', 'password321'),
('Erick Chiappone', 'Chiapp', 'erick@email.com', 'password234'),
('Gustavao', '', '', 'password579')

INSERT INTO tb_publicacoes
VALUES
('Copa do Brasil', 'Corinthians VS Portuguesa RJ', 'Achei a escalacao muito jovem. E voces?', '',1),
('', '', '', '',2)

INSERT INTO tb_grupos 
VALUES
('Post 1','','Futebol',1,1),
('Post 2','','Esporte',2,1)

--DELETA TODOS OS DADOS DA TABELA USUARIO
DELETE FROM tb_usuarios

--ZERA O INCREMENTO DA TABELA USUARIO
DBCC CHECKIDENT (tb_usuarios, RESEED, 0)

--MOSTRA O INCREMENTO ATUAL DA TABELA USUARIO
SELECT IDENT_CURRENT('tb_usuarios')

-- FULL JOIN
SELECT tb_usuarios.Id  AS Usuario, tb_usuarios.Nome, tb_usuarios.Email, tb_usuarios.Senha, tb_publicacoes.Tema AS Publicação, tb_publicacoes.Id, tb_publicacoes.Descricao
FROM tb_usuarios  
FULL JOIN tb_publicacoes
ON tb_usuarios.Id = tb_publicacoes.Id

-- IN
SELECT * FROM tb_publicacoes
WHERE Id IN (2)

-- COUNT e LIKE
SELECT COUNT(tb_publicacoes.Titulo) AS 'Publicações sobre Portuguesa'
FROM tb_publicacoes
WHERE tb_publicacoes.Titulo LIKE ('%Portuguesa%')