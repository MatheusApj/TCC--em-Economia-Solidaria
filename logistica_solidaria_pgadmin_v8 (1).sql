
-- ========================================
-- BANCO DE DADOS: logistica_solidaria
-- ========================================

CREATE DATABASE logistica_solidaria;

\c logistica_solidaria;

-- ========================================
-- TABELA: ASSOCIACAO
-- ========================================
CREATE TABLE associacao (
    id_associacao SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) UNIQUE,
    municipio VARCHAR(100),
    telefone VARCHAR(20)
);

-- ========================================
-- TABELA: AGRICULTOR
-- ========================================
CREATE TABLE agricultor (
    id_agricultor SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    dap_caf VARCHAR(50),
    telefone VARCHAR(20),
    comunidade VARCHAR(100),
    id_associacao INTEGER,
    CONSTRAINT fk_associacao
        FOREIGN KEY (id_associacao)
        REFERENCES associacao(id_associacao)
        ON DELETE SET NULL
);

-- ========================================
-- TABELA: PRODUTO
-- ========================================
CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    categoria VARCHAR(80),
    unidade_medida VARCHAR(20) NOT NULL,
    preco_referencia NUMERIC(10,2),
    certificacao VARCHAR(80)
);

-- ========================================
-- TABELA: ENTIDADE_RECEBEDORA
-- ========================================
CREATE TABLE entidade_recebedora (
    id_entidade SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo VARCHAR(80),
    municipio VARCHAR(100),
    endereco TEXT
);

-- ========================================
-- TABELA: OFERTA
-- ========================================
CREATE TABLE oferta (
    id_oferta SERIAL PRIMARY KEY,
    id_agricultor INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade NUMERIC(10,2) NOT NULL,
    data_disponibilidade DATE NOT NULL,
    local_retirada VARCHAR(150),
    CONSTRAINT fk_oferta_agricultor
        FOREIGN KEY (id_agricultor)
        REFERENCES agricultor(id_agricultor)
        ON DELETE CASCADE,
    CONSTRAINT fk_oferta_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON DELETE CASCADE
);

-- ========================================
-- TABELA: DEMANDA
-- ========================================
CREATE TABLE demanda (
    id_demanda SERIAL PRIMARY KEY,
    id_entidade INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade_solicitada NUMERIC(10,2) NOT NULL,
    periodo_entrega VARCHAR(50),
    CONSTRAINT fk_demanda_entidade
        FOREIGN KEY (id_entidade)
        REFERENCES entidade_recebedora(id_entidade)
        ON DELETE CASCADE,
    CONSTRAINT fk_demanda_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON DELETE CASCADE
);

-- ========================================
-- TABELA: PEDIDO
-- ========================================
CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'PENDENTE'
);

-- ========================================
-- TABELA: PEDIDO_ITEM
-- ========================================
CREATE TABLE pedido_item (
    id_pedido_item SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_oferta INTEGER NOT NULL,
    id_demanda INTEGER NOT NULL,
    quantidade_atendida NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON DELETE CASCADE,
    CONSTRAINT fk_oferta
        FOREIGN KEY (id_oferta)
        REFERENCES oferta(id_oferta)
        ON DELETE CASCADE,
    CONSTRAINT fk_demanda
        FOREIGN KEY (id_demanda)
        REFERENCES demanda(id_demanda)
        ON DELETE CASCADE
);

-- ========================================
-- TABELA: ENTREGA
-- ========================================
CREATE TABLE entrega (
    id_entrega SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    data_entrega DATE,
    quantidade_entregue NUMERIC(10,2),
    responsavel VARCHAR(120),
    comprovante TEXT,
    CONSTRAINT fk_entrega_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON DELETE CASCADE
);
