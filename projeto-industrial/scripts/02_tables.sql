CREATE TABLE Setores(
id_setor INT PRIMARY KEY AUTO_INCREMENT,
nome_setor VARCHAR(100),
localizacao_setor VARCHAR(100),
id_funcionario INT,
id_produtos INT
);

CREATE TABLE Funcionarios(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome_funcionario VARCHAR(100),
cpf_funcionario CHAR(11),
cargo_funcionario VARCHAR(50),
salario_funcionario INT,
data_adimissao DATE,
id_setor INT,
FOREIGN KEY (id_setor)
REFERENCES Setores(id_setor)
);

CREATE TABLE Produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
codigo_produto INT UNIQUE,
descricao_produto TEXT,
preco_fabricacao INT,
quantidade_produto INT
);

CREATE TABLE Fornecedores(
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
razao_fornecedor VARCHAR(100),
cnpj_fornecedor INT UNIQUE,
telefone_fornecedor INT,
cidade_fornecedor VARCHAR(100),
id_produto INT,
FOREIGN KEY (id_produto)
REFERENCES Produtos(id_produto)
);

CREATE TABLE Ordens(
id_ordem INT PRIMARY KEY AUTO_INCREMENT,
quantidade_ordem INT,
data_ordem INT,
status_ordem ENUM ('Finalizada', 'Em andamento'),
tempo_estimado DATE,
tempo_real DATE,
id_funcionario INT,
id_produto INT,
FOREIGN KEY (id_funcionario) 
REFERENCES Funcionarios(id_funcionario),
FOREIGN KEY (id_produto) 
REFERENCES Produtos(id_produto)
);

CREATE TABLE Controle_qualidade(
id_inspecao INT PRIMARY KEY AUTO_INCREMENT,
data_inspecao DATE,
resultado_inspecao TEXT,
observacoes TEXT,
id_ordem INT,
FOREIGN KEY (id_ordem)
REFERENCES Ordens(id_ordem)
);

CREATE TABLE Categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nome_categoria ENUM('Estruturas', 'Parafusos', 'Componentes'),
id_produto INT,
FOREIGN KEY (id_produto)
REFERENCES Produtos(id_produto)
);
