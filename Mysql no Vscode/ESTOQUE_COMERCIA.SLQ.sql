DROP DATABASE IF EXISTS estoquecomercial;
CREATE DATABASE estoquecomercial;
USE estoquecomercial;

CREATE TABLE Itens_Estoque(
idItem INT NOT NULL AUTO_INCREMENT,
descricaoItem VARCHAR(200),
setorItem VARCHAR(200),
precoVendaItem DECIMAL(9,2),
estoqueItem INT,
PRIMARY KEY (idItem)
);

CREATE TABLE Pedidos (
idPedido INT AUTO_INCREMENT,
idItem INT,
quantidadeComprada INT,
valorTotal  DECIMAL(9,2),
dataPedido DATE,
PRIMARY KEY(idPedido)
);

INSERT INTO Pedidos
(idItem, quantidadeComprada, valorTotal, dataPedido)
VALUES
(2,12,5.20,'2023-11-10'),
(2,20,5.20,'2023-06-15'),
(1,5,7.50,'2023-08-01');

INSERT INTO Itens_Estoque
(descricaoItem,setorItem,precoVendaItem,estoqueItem)VALUES
('Suco de Laranja','Bebidas','7.50',250),
('Macarrão 1kg','Alimentos','5.20',180),
('Sabão em pó','Limpeza','12.90',90),
('Café Torrado','Alimentos','15.80',120),
('Iogurte Natural','Laticínios','4.30',350),
('Biscoito Integral',NULL,'3.90',210),
('Molho de Tomate','Alimentos','2.80',500);

-- SELECT*FROM Itens_Estoque
-- WHERE precoVendaItem=3.90
-- AND estoqueItem>=210;

-- SELECT*FROM Itens_Estoque
-- WHERE setorItem='Limpeza'
-- OR precoVendaItem=7.50;

-- SELECT*FROM Itens_Estoque
-- WHERE (setorItem='Limpeza'OR setorItem='Alimentos')
-- AND precoVendaItem>=5.00;

-- SELECT*FROM Itens_Estoque
-- WHERE NOT setorItem='Alimentos'

-- SELECT*FROM Itens_Estoque
-- WHERE setorItem='Alimentos' AND NOT estoqueItem IN(100,200,250,300,350,50);

-- SELECT*FROM Itens_Estoque
-- WHERE NOT setorItem IN('Bebidas','Laticínios','Bebidas','Limpeza');

-- SELECT*FROM Itens_Estoque
-- WHERE precoVendaItem BETWEEN 2.80 AND 7.50;

-- SELECT descricaoItem AS DESCRICAO
-- FROM Itens_Estoque
-- WHERE precoVendaItem
-- BETWEEN 5 AND 10;

-- SELECT*FROM Itens_Estoque
-- WHERE precoVendaItem NOT IN(7.50,3.90);

-- SELECT descricaoItem 
-- FROM Itens_Estoque
-- WHERE idItem IS NOT NULL;

-- SELECT * FROM Itens_Estoque
-- WHERE setorItem<>'Alimentos';

-- SELECT * FROM Itens_Estoque
-- WHERE setorItem != 'Alimentos';

-- SELECT descricaoItem AS descricao, precoVendaItem AS preco FROM Itens_Estoque;

-- SELECT descricaoItem descricao, precoVendaItem preco FROM Itens_Estoque;

-- SELECT descricaoItem AS DESCRICAO
-- FROM Itens_Estoque
-- WHERE descricaoItem BETWEEN 'a' AND 'z'
-- ORDER BY descricaoItem; -- ORDER BY ordena -- ORDER BY DESC ordena ao contrário

-- SELECT descricaoItem, setorItem, precoVendaItem
-- FROM Itens_Estoque
-- WHERE NOT setorItem IN('Alimentos') 
-- AND precoVendaItem>4 
-- ORDER BY descricaoItem;

-- SELECT COUNT(descricaoItem) AS CONTAGEM -- RETORNA A QUANTIDADE DE ITENS QUE POSSUEM OQUE VOCÊ PROCUROU
-- FROM Itens_Estoque
-- WHERE descricaoItem LIKE'%MOLHO%';

-- SELECT COUNT(setorItem) AS SETOR
-- FROM Itens_Estoque
-- WHERE setorItem IN('Alimentos');

-- SELECT AVG(precoVendaItem) -- VALOR MÉDIO TOTAL
-- FROM Itens_Estoque;

-- SELECT SUM(estoqueItem) -- SOMA TOTAL DE UMA COLUNA
-- FROM Itens_Estoque
-- WHERE setorItem IN('Limpeza', 'Bebidas');

-- SELECT MIN(precoVendaItem) -- MENOR VALOR DE UMA COLUNA
-- FROM Itens_Estoque
-- WHERE setorItem IN('Limpeza'); 

-- SELECT MAX(precoVendaItem) -- MAIOR VALOR DE UMA COLUNA
-- FROM Itens_Estoque
-- WHERE setorItem IN('Limpeza');

-- SELECT MIN(descricaoItem)
-- FROM Itens_Estoque

-- SELECT MAX(descricaoItem)
-- FROM Itens_Estoque


-------------------------------------------------------------------------------------------------------------------------------

-- SELECT * 
-- FROM Itens_Estoque
-- WHERE precoVendaItem = -- SUBCONSULTA
-- (SELECT MAX(precoVendaItem)
-- FROM Itens_Estoque
-- );

-- SELECT * 
-- FROM Itens_Estoque
-- WHERE precoVendaItem <> -- <> IGUAL A !=
-- (SELECT MAX(precoVendaItem)
-- FROM Itens_Estoque
-- );

-- SELECT descricaoItem
-- FROM Itens_Estoque
-- WHERE idItem IN 
-- (SELECT idItem
-- FROM Pedidos
-- );

-- SELECT I.descricaoItem,
-- (
--     SELECT SUM
--     (P.quantidadeComprada* P.valorTotal)
--     FROM  Pedidos AS P
--     WHERE P.idItem = I.idItem
-- )
-- AS TOTAL_COMPRADO
-- FROM Itens_Estoque AS I;

-- SELECT descricaoItem, setorItem, precoVendaItem
-- FROM Pedidos, Itens_Estoque
-- WHERE Pedidos.idItem = Itens_Estoque.idItem;

