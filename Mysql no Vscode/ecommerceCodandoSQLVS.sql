
DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;
-- criando database e apagando caso já exista

CREATE TABLE categoria (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    PRIMARY KEY (id)
);
-- tabela categoria

CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);
-- tabela produto


SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE categoria;      
TRUNCATE produto;         
SET FOREIGN_KEY_CHECKS = 1;
-- desativando chave de segurança para o truncate funcionar na chave estrangeira



INSERT INTO categoria (nome, descricao) 
VALUES ('Comida', 'Pratos e culinária em geral'),
('Limpeza', 'Limpeza e Perfumes'),
('Frutas', 'Frutas Frescas');
INSERT INTO produto (id, nome, descricao, preco, estoque, categoria_id) VALUES
(1, 'Sushi', 'Japonês tradicional', 10.99, 150, 1),
(2, 'Morango', 'Orgânico e fresco', 110.99, 10, 1),
(3, 'Detergente', 'Neutro 500ml', 2.50, 200, 2),
(4, 'Pizza Calabresa', 'Forno a lenha', 45.00, 30, 1),
(5, 'Amaciante', 'Toque de baunilha 2L', 18.90, 80, 2),
(6, 'Hambúrguer', 'Artesanal blend 180g', 29.90, 60, 1),
(7, 'Desinfetante', 'Fragrância de Lavanda 1L', 8.40, 120, 2),
(8, 'Sabão em Pó', 'Ação profunda 1kg', 14.99, 95, 2),
(9, 'Chocolate Amargo', 'Cacau 70%', 7.50, 300, 1),
(10, 'Esponja de Aço', 'Pacote com 4 unidades', 3.20, 150, 2);
-- inserts

SELECT * FROM categoria;
SELECT * FROM produto;
-- Selects

-- UPDATE produto
-- SET categoria_id=1
-- WHERE id=1;

-- UPDATE categoria
-- SET nome = 'Comida'
-- WHERE id=1;
-- -- Updates

-- UPDATE produto
-- SET categoria_id=1
-- WHERE nome LIKE'S%';
-- -- Condições(LIKE) - a% Muda tudo que começa com a letra inserida - %a% Muda tudo que possui a letra inserida

-- UPDATE produto 
-- SET preco=1500
-- WHERE id=1;

-- UPDATE produto 
-- SET id=1
-- WHERE id=1;

-- UPDATE produto
-- SET categoria_id=2
-- WHERE preco>=50;

-- UPDATE produto
-- SET estoque = estoque + 30
-- WHERE id = 1;

-- -- Condições(IF) - Já sei pow

-- UPDATE produto
-- SET 
--     descricao = 'Notebook com SSD e 16gm Ram',
--     estoque = 15
-- WHERE id=3;
 
-- UPDATE produto
-- SET
--     nome = 'pc usado - notebook',
--     descricao = 'Notebook Ruim',
--     estoque = estoque + 90,
--     id = 11
-- WHERE id=1;

-- -- É possivel mudar várias colunas de uma vez só

-- UPDATE produto
-- SET nome = 'erro'
-- WHERE id =1 or id =2;

-- -- OR básico e auto-explicativo

-- UPDATE produto
-- SET nome = CASE 
--     WHEN id=1 THEN 'lego'
--     WHEN id=2 THEN 'celular flip'
--     WHEN id=3 THEN 'insider'
-- END
-- WHERE id IN(1,2,3);

-- -- When - Basicamente um "suit case", vai mudar todos os ids que eu coloquei no caso 1,2 e 3, possui uma condição para cada id se for real acontece o THEN.

-- UPDATE produto
-- SET nome = 'produto generico'
-- WHERE ID IN(1,2,3);

-- -- Apenas muda tudo que foi apontado no where.

-- DELETE FROM produto
-- WHERE preco >= 15;

-- DELETE FROM produto
-- WHERE id IN(1,2,3);

-- DELETE, simples.

-- DELETE FROM produto
-- WHERE categoria_id=2;

-- DELETE FROM categoria
-- WHERE id=2;

-- -- É necessário apagar todos os ids filhos dependentes do id pai antes de apagar o id pai

-- DELETE FROM produto
-- WHERE categoria_id=1 AND nome LIKE'%s%';

-- DELETE com condições

-- ALTER TABLE produto
-- ADD COLUMN status CHAR(2)
-- DEFAULT 'A';

-- ALTER TABLE categoria
-- ADD COLUMN status CHAR(2)
-- DEFAULT 'A';

-- -- Adicionando Colunas

-- UPDATE produto
-- SET status = 'I'
-- WHERE categoria_id = 1;

-- UPDATE categoria
-- SET status = 'I'
-- WHERE id = 2;

-- Update colocando I de inativo.

-- SELECT nome AS NOME_PRODUTO, estoque AS QNTD_ESTOQUE
-- FROM produto
-- WHERE status = 'I' and id IN(4,5,6,7,8,9);

-- Selecionando quem está inativo ou tem id de 4 a 7.

