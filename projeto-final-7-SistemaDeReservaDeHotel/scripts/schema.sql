-- ======================================================
-- Script DDL e DML - Sistema de Reservas de Hotel
-- Baseado no modelo lógico da atividade 6
-- Gerado a partir das classes ORM (SQLAlchemy)
-- ======================================================

-- Tabela configuracao
CREATE TABLE configuracao (
    chave TEXT PRIMARY KEY,
    valor TEXT
);

-- Tabela tipo_quarto
CREATE TABLE tipo_quarto (
    id_tipo_quarto SERIAL PRIMARY KEY,
    codigo VARCHAR(20),
    descricao VARCHAR(100),
    capacidade_padrao INTEGER,
    tarifa_base_padrao FLOAT,
    caracteristicas TEXT
);

-- Tabela quarto
CREATE TABLE quarto (
    id_quarto SERIAL PRIMARY KEY,
    numero INTEGER,
    capacidade INTEGER,
    tarifa_base FLOAT,
    status VARCHAR(20),
    id_tipo_quarto INTEGER REFERENCES tipo_quarto(id_tipo_quarto)
);

-- Tabela bloqueio_quarto
CREATE TABLE bloqueio_quarto (
    id_bloqueio SERIAL PRIMARY KEY,
    motivo VARCHAR(100),
    data_inicio_bloqueio DATE,
    data_fim_bloqueio DATE,
    id_quarto INTEGER REFERENCES quarto(id_quarto)
);

-- Tabela hospede
CREATE TABLE hospede (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    documento VARCHAR(20),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela temporada
CREATE TABLE temporada (
    id_temporada SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    data_inicio DATE,
    data_fim DATE,
    multiplicador FLOAT
);

-- Tabela reserva
CREATE TABLE reserva (
    id_reserva SERIAL PRIMARY KEY,
    data_entrada DATE,
    data_saida DATE,
    num_hospedes INTEGER,
    origem VARCHAR(50),
    estado VARCHAR(20),
    valor_total FLOAT,
    id_hospede INTEGER REFERENCES hospede(id_hospede),
    id_quarto INTEGER REFERENCES quarto(id_quarto)
);

-- Tabela diaria
CREATE TABLE diaria (
    id_diaria SERIAL PRIMARY KEY,
    data_diaria DATE,
    valor FLOAT,
    multiplicador FLOAT,
    id_reserva INTEGER REFERENCES reserva(id_reserva),
    id_temporada INTEGER REFERENCES temporada(id_temporada)
);

-- Tabela historico_reserva
CREATE TABLE historico_reserva (
    id_historico SERIAL PRIMARY KEY,
    estado_anterior VARCHAR(20),
    estado_novo VARCHAR(20),
    data_alteracao DATE,
    id_reserva INTEGER REFERENCES reserva(id_reserva)
);

-- Tabela adicional
CREATE TABLE adicional (
    id_adicional SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    valor FLOAT,
    data_adicional DATE,
    id_reserva INTEGER REFERENCES reserva(id_reserva)
);

-- Tabela pagamento
CREATE TABLE pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    data_pagamento DATE,
    forma VARCHAR(20),
    valor FLOAT,
    id_reserva INTEGER REFERENCES reserva(id_reserva)
);

-- ======================================================
-- Dados de exemplo (opcional - você pode incluir ou não)
-- ======================================================

-- Tipos de quarto
INSERT INTO tipo_quarto (codigo, descricao, capacidade_padrao, tarifa_base_padrao, caracteristicas) VALUES
('STD', 'Standard', 2, 150.0, 'Cama de solteiro, TV, ar'),
('LUX', 'Luxo', 2, 300.0, 'Cama de casal, varanda, frigobar'),
('FAM', 'Família', 4, 450.0, 'Duas camas de casal, sala');

-- Quartos
INSERT INTO quarto (numero, capacidade, tarifa_base, status, id_tipo_quarto) VALUES
(101, 2, 150.0, 'disponível', 1),
(102, 2, 150.0, 'disponível', 1),
(201, 2, 300.0, 'disponível', 2),
(301, 4, 450.0, 'disponível', 3);

-- Hóspedes
INSERT INTO hospede (nome, documento, email, telefone) VALUES
('João Silva', '123.456.789-00', 'joao@email.com', '88999999999'),
('Maria Souza', '987.654.321-00', 'maria@email.com', '88888888888'),
('José Santos', '456.789.123-00', 'jose@email.com', '88777777777');

-- Temporadas
INSERT INTO temporada (nome, data_inicio, data_fim, multiplicador) VALUES
('Alta', '2025-12-20', '2026-01-10', 1.5),
('Baixa', '2026-03-01', '2026-06-30', 0.8);

-- Reservas (usando datas atuais; ajuste se necessário)
INSERT INTO reserva (data_entrada, data_saida, num_hospedes, origem, estado, valor_total, id_hospede, id_quarto) VALUES
(CURRENT_DATE, CURRENT_DATE + 3, 2, 'site', 'confirmada', 450.0, 1, 1),
(CURRENT_DATE + 1, CURRENT_DATE + 4, 2, 'telefone', 'confirmada', 900.0, 2, 3),
(CURRENT_DATE + 2, CURRENT_DATE + 6, 4, 'balcão', 'confirmada', 1800.0, 3, 4);

-- Diárias (exemplo para primeira reserva)
INSERT INTO diaria (data_diaria, valor, multiplicador, id_reserva, id_temporada) VALUES
(CURRENT_DATE, 150.0, 1.0, 1, NULL),
(CURRENT_DATE + 1, 150.0, 1.0, 1, NULL),
(CURRENT_DATE + 2, 150.0, 1.0, 1, NULL);

-- Pagamentos
INSERT INTO pagamento (data_pagamento, forma, valor, id_reserva) VALUES
(CURRENT_DATE, 'cartão', 450.0, 1),
(CURRENT_DATE + 1, 'pix', 900.0, 2);