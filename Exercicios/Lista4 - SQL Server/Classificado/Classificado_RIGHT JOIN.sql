CREATE DATABASE db_Classificado

USE db_Classificado

CREATE TABLE tb_usuario
(
	id_usuario INT PRIMARY KEY NOT NULL,
	nome VARCHAR(50) NULL,
	senha VARCHAR(50) NULL,
	email VARCHAR(100) NULL,
	telefone VARCHAR(11) NULL,
	endereco VARCHAR(200) NULL
)

CREATE TABLE tb_desafio
(
	id_desafio INT PRIMARY KEY NOT NULL,
	nota FLOAT NULL,
	classificacao INT NULL,
	descricao VARCHAR(200),
)

CREATE TABLE tb_classificado
(
	id_classificado INT PRIMARY KEY NOT NULL,
	fk_candidato INT NOT NULL,
	fk_resultado INT NOT NULL,
	FOREIGN KEY (fk_candidato) REFERENCES tb_usuario (id_usuario),
	FOREIGN KEY (fk_resultado) REFERENCES tb_desafio (id_desafio)
)


INSERT INTO tb_usuario
VALUES
(1,'Erick','12345','erickfilho@bol.com','11988888888',''),
(2,'Barbara','54321','barbarafilha@bol.com','11933333333',''),
(3,'Alex','24680','alexpai@bol.com','11944444444','avenida das frutas 30'),
(4,'Tais','13579','taismae@bol.com','11977777777','avenida dos animais 40')

INSERT INTO tb_desafio
VALUES
(1,9.7,2,'Classificado'),
(2,9,7,'Classificado'),
(3,5.5,45,'Desclassificado'),
(4,3,69,'Desclassificado')

INSERT INTO tb_classificado
VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4)


-- UPDATE
UPDATE tb_usuario
SET nome = 'Pamella'
WHERE id_usuario = 2


-- IN, COUNT e AVG
SELECT COUNT(tb_desafio.nota) AS 'Notas Positivas',
	AVG(tb_desafio.nota)AS 'Media Positiva'
	FROM tb_desafio
	WHERE tb_desafio.descricao IN ('Classificado')

SELECT COUNT(tb_desafio.nota) AS 'Notas Negativas',
	AVG(tb_desafio.nota)AS 'Media Negativa'
	FROM tb_desafio
	WHERE tb_desafio.descricao IN ('Desclassificado')

SELECT COUNT(tb_desafio.nota) AS 'Total Notas',
	AVG(tb_desafio.nota)AS 'Media'
	FROM tb_desafio


-- RIGHT JOIN
SELECT
tb_usuario.nome AS Nome,
tb_classificado.id_classificado AS ID_Classificação
FROM tb_usuario
RIGHT JOIN tb_classificado
ON tb_usuario.id_usuario = tb_classificado.fk_candidato;