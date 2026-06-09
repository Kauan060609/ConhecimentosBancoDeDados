INSERT INTO Setores(nome_setor,localizacao_setor) VALUES
('Eletrônica', 'Jaraguá do Sul'),
('Automação', 'Brasil'),
('Mecânica', 'França'),
('TI', 'Portugal'),
('Ferramentaria', 'Suiça');

INSERT INTO Funcionarios(nome_funcionario,cpf_funcionario,cargo_funcionario,salario_funcionario,data_adimissao) VALUES
('Kauan', '12345678910','Eletricista',1500,'2025-10-05'),
('João', '12376545676','Pedreiro',2500,'2022-11-03'),
('Maria', '24257628310','Confeiteira',1100,'2022-11-04'),
('Paulo', '23509878920','Faxineiro',3000,'2024-12-15'),
('Vitor', '1230945620','Jardineiro',1500,'2021-11-09'),
('Junior', '45623445610','Banqueiro',4000,'2025-10-05'),
('Yago', '45687623411','Caixa',100,'2020-04-25'),
('Pedro', '65478923409','Cozinheiro',2000,'2015-02-05'),
('Lucas', '09834529114','Faxineiro',100,'2010-10-04'),
('Gabriel', '23412304920','Musico',5000,'2010-10-05');

INSERT INTO Produtos(codigo_produto,descricao_produto,preco_fabricacao,quantidade_produto) VALUES 
(123, 'Parafuso',100,1500),
(1234, 'Borracha',150,200),
(1235, 'Lápis',200,15000),
(1236, 'Mesa',12,120),
(1237, 'Parafusadeira',1000,123),
(1238, 'Cadeira',1200,12345),
(1239, 'Computador',1243,23412),
(1230, 'Mouse',1241,21341),
(1231, 'Teclado',323,4213),
(1232,'Camisa',531,3214);

INSERT INTO Fornecedores(razao_fornecedor,cnpj_fornecedor,telefone_fornecedor,cidade_fornecedor) VALUES
('Porque sim', 123, 01234,'Jaraguá do Sul'),
('Porque Não', 1234, 01235,'Amazonas'),
('Talvez', 1235, 01237,'Piaui'),
('pode ser', 1236, 01238,'Porto Alegre'),
('Acho que não', 1237, 01239,'Coritiba');

INSERT INTO Ordens(quantidade_ordem,data_ordem,status_ordem,tempo_estimado,tempo_real) VALUES
(100, 140, 'Finalizada','2025-04-01', '2025-02-03'),
(123, 123, 'Em andamento','2025-02-04', '2025-02-21'),
(1234, 654, 'Finalizada','2025-06-01', '2025-02-22'),
(12345, 7564, 'Finalizada','2025-08-02', '2025-02-23'),
(1241, 43, 'Em andamento','2025-04-09', '2025-02-24'),
(532, 64, 'Finalizada','2025-12-02', '2025-02-24'),
(5324, 64, 'Finalizada','2025-04-15', '2025-02-25'),
(653, 234, 'Em andamento','2025-04-11', '2025-02-25'),
(6423, 43, 'Finalizada','2025-04-25', '2025-02-26'),
(104340, 532, 'Em andamento','2025-04-21', '2025-02-27'),
(653, 856, 'Em andamento','2025-04-30', '2025-02-28'),
(431, 543, 'Finalizada','2025-04-21', '2025-02-28'),
(324, 34, 'Finalizada','2025-04-23', '2025-02-01'),
(23, 235, 'Finalizada','2025-04-24', '2025-02-02'),
(14300, 634, 'Em andamento','2025-04-25', '2025-02-04');

INSERT INTO Controle_qualidade(data_inspecao,resultado_inspecao,observacoes) VALUES
('2021-01-01', 'Deu boa', 'Deu certo'),
('2021-02-02', 'Deu ruim', 'Não deu certo'),
('2021-03-03', 'Deu boa', 'Deu certo'),
('2021-04-04', 'Deu ruim', 'Não deu certo'),
('2021-05-05', 'Deu boa', 'Deu certo'),
('2021-06-06', 'Deu ruim', 'Não deu certo'),
('2021-07-07', 'Deu boa', 'Deu certo'),
('2021-08-08', 'Deu ruim', 'Não deu certo'),
('2021-09-09', 'Deu boa', 'Deu certo'),
('2021-10-10', 'Deu ruim', 'Não deu certo');

INSERT INTO Categorias(nome_categoria) VALUES
