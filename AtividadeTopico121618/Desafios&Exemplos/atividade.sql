CREATE DATABASE AprendendoUsuarios;
USE AprendendoUsuarios;

-- 1. Clientes
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100)
);

-- 2. Transporte
CREATE TABLE transporte (
    id_transporte INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50), -- Aéreo, Rodoviário
    valor_transporte DECIMAL(10, 2)
);

-- 3. Hospedagem
CREATE TABLE hospedagem (
    id_hospedagem INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100),
    valor_diaria DECIMAL(10, 2)
);

-- 4. Pacote (Relaciona transporte e hospedagem)
CREATE TABLE pacote (
    id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    destino VARCHAR(100),
    quantidade_dias INT,
    id_transporte INT,
    id_hospedagem INT,
    FOREIGN KEY (id_transporte) REFERENCES transporte(id_transporte),
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagem(id_hospedagem)
);

-- 5. Venda
CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE,
    forma_pagamento VARCHAR(50),
    valor_total_dolar DECIMAL(10, 2),
    id_cliente INT,
    id_pacote INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_pacote) REFERENCES pacote(id_pacote)
);

-- Inserindo Clientes
INSERT INTO cliente (nome, cpf, email) VALUES
('Ana Silva', '123.456.789-00', 'ana.silva@email.com'),
('Bruno Costa', '987.654.321-11', 'bruno.costa@email.com'),
('Carlos Souza', '456.789.123-22', 'carlos.souza@email.com');

-- Inserindo Transportes
INSERT INTO transporte (tipo, valor_transporte) VALUES
('Aéreo', 1500.00),
('Rodoviário', 350.00),
('Aéreo', 2200.00);

-- Inserindo Hospedagens
INSERT INTO hospedagem (descricao, valor_diaria) VALUES
('Hotel Beira Mar 4 Estrelas', 250.00),
('Pousada Chalé do Vale', 120.00),
('Resort All Inclusive', 600.00);

-- Inserindo Pacotes
-- (id_transporte e id_hospedagem referenciam os IDs inseridos acima)
INSERT INTO pacote (destino, quantidade_dias, id_transporte, id_hospedagem) VALUES
('Rio de Janeiro', 5, 1, 1), -- Transporte Aéreo (1) + Hotel Beira Mar (1)
('Gramado', 4, 2, 2),        -- Transporte Rodoviário (2) + Pousada Chalé (2)
('Cancún', 7, 3, 3);         -- Transporte Aéreo Caro (3) + Resort (3)

-- Inserindo Vendas
-- (id_cliente e id_pacote referenciam os registros anteriores)
INSERT INTO venda (data_venda, forma_pagamento, valor_total_dolar, id_cliente, id_pacote) VALUES
('2026-03-15', 'Cartão de Crédito', 1850.00, 1, 1), -- Ana Silva comprou pacote Rio
('2026-03-16', 'Pix', 830.00, 2, 2),              -- Bruno Costa comprou pacote Gramado
('2026-03-16', 'Boleto', 4500.00, 3, 3);           -- Carlos Souza comprou pacote Cancún