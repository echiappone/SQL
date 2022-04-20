-- DML
-- INSERT
-- SELECT
-- UPDATE
-- DELETE

-- INSERT
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