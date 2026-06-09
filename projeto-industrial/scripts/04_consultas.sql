-- 1.Liste todos os setores cadastrados na fábrica.
SELECT nome_setor
FROM Setores
-- 2.Liste o nome, cargo e salário de todos os funcionários.
SELECT nome_funcionario, cargo_funcionario, salario_funcionario
FROM Funcionarios
-- 3.Exiba o código, nome e preço de fabricação de todos os produtos cadastrados.
SELECT categoria_produto, codigo_produto, preco_fabricacao
FROM Produtos
-- 4.Exiba apenas o nome e a quantidade em estoque dos produtos.
SELECT descricao_produto, quantidade_produto
FROM Produtos
-- 5.Liste os funcionários admitidos após uma determinada data informada pelo professor.
SELECT nome_funcionario
FROM Funcionarios
WHERE data_adimissao > '2025-10-05'; -- sua DATA
-- 6.Exiba todos os produtos cuja quantidade em estoque seja superior a 100 unidades.
SELECT descricao_produto, quantidade_produto 
FROM Produtos 
WHERE quantidade_produto > 100;
-- 7.Liste todos os fornecedores localizados em uma cidade específica.
SELECT cnpj_fornecedor 
FROM Fornecedores
WHERE cidade_fornecedor = 'Coritiba'; -- Sua Cidade
-- 8.Exiba os produtos cujo preço de fabricação esteja entre R$ 50,00 e R$ 500,00.
SELECT descricao_produto 
FROM Produtos
WHERE preco_fabricacao 
BETWEEN 50 AND 500;
-- 9.Liste os funcionários cujo salário seja superior a R$ 3.000,00.
SELECT nome_funcionario
FROM Funcionarios
WHERE salario_funcionario > 3000
-- 10.Liste os funcionários cujo cargo contenha a palavra "Operador".
SELECT nome_funcionario 
FROM Funcionarios 
WHERE cargo_funcionario LIKE '%Operador%'
-- 11.Exiba todos os fornecedores que possuem telefone cadastrado.
SELECT cnpj_fornecedor
FROM Fornecedores 
WHERE telefone_fornecedor > 0;
-- 12.Exiba os produtos cuja descrição contenha uma palavra ou trecho informado pelo professor.
SELECT descricao_produto
FROM Produtos
WHERE descricao_produto LIKE '%Mesa%' -- Trecho desejado
-- 13.Exiba todos os produtos ordenados pelo nome em ordem alfabética.
SELECT descricao_produto 
FROM Produtos
GROUP BY descricao_produto
ORDER BY descricao_produto
-- 14.Liste todos os produtos ordenados pelo preço de fabricação em ordem decrescente.
SELECT descricao_produto,preco_fabricacao
FROM Produtos
GROUP BY descricao_produto,preco_fabricacao
ORDER BY preco_fabricacao DESC;
-- 15.Exiba as ordens de produção com status "Concluída".
SELECT id_ordem
FROM Ordens
WHERE status_ordem = 'Finalizada'

-- 16.Exiba a quantidade total de funcionários cadastrados na empresa.
SELECT COUNT(id_funcionario) AS QUANTIDADE_FUNCIONARIOS
FROM Funcionarios;
-- 17.Apresente o salário médio dos funcionários.
SELECT AVG(salario_funcionario)
FROM Funcionarios;
-- 18.Exiba o menor preço de fabricação entre todos os produtos.
SELECT MIN(preco_fabricacao)
FROM Produtos;
-- 19.Apresente a quantidade de produtos cadastrados em cada categoria.
SELECT COUNT(nome_categria)
FROM Categorias
WHERE nome_categoria = 'Parafusos' -- SUA CATEGORIA
-- 20.Exiba a quantidade de ordens de produção cadastradas por funcionário responsável.
SELECT COUNT(id_ordem)
FROM Ordens
-- 21.Liste o nome dos funcionários e o nome do setor ao qual cada funcionário pertence.
SELECT nome_funcionario, S.nome_setor
FROM Funcionarios AS F
JOIN Setores AS S ON S.id_funcionario = F.id_funcionario;
-- 22.Exiba o nome dos produtos juntamente com o nome de suas respectivas categorias.
SELECT descricao_produto, C.nome_categoria
FROM Produtos AS P
JOIN Categorias AS C ON C.id_produto = P.id_produto
-- 23.Liste o nome do produto, o nome do fornecedor principal e o preço de fabricação do produto.
SELECT nome_produto, F.cnpj, preco_fabricacao
FROM Produtos AS P
JOIN Fornecedores AS F ON F.id_produto = P.id_produto
-- 24.Exiba o(s) produto(s) que possuem o maior preço de fabricação cadastrado.
SELECT MAX(preco_fabricacao)
FROM Produtos;
-- 25.Liste os funcionários cujo salário seja superior ao salário médio dos funcionários da empresa.
SELECT nome_funcionario,
AVG(salario_funcionario)
FROM Funcionarios 
GROUP BY nome_funcionario
HAVING salario_funcionario > AVG(salario_funcionario);
