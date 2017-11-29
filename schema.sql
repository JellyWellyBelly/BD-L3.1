-- DROP TABLE IF EXISTS teste CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS categoria_simples CASCADE;
DROP TABLE IF EXISTS super_categoria CASCADE;
DROP TABLE IF EXISTS constituida CASCADE;
DROP TABLE IF EXISTS fornecedor CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS fornece_sec CASCADE;
DROP TABLE IF EXISTS corredor CASCADE;
DROP TABLE IF EXISTS prateleira CASCADE;
DROP TABLE IF EXISTS planograma CASCADE;
DROP TABLE IF EXISTS evento_reposicao CASCADE;
DROP TABLE IF EXISTS reposicao CASCADE;



--CREATE TABLE teste (
--	primario INT,
--	secundario INT NOT NULL,
--	
--	PRIMARY KEY(primario)
--);

CREATE TABLE categoria (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome)
);

CREATE TABLE categoria_simples (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome),
	FOREIGN KEY(nome) REFERENCES categoria(nome) ON DELETE CASCADE
);

CREATE TABLE super_categoria (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome),
	FOREIGN KEY(nome) REFERENCES categoria(nome) ON DELETE CASCADE
);

CREATE TABLE constituida (
	super_categoria VARCHAR(40),
	categoria VARCHAR(40),

	PRIMARY KEY(super_categoria, categoria),
	FOREIGN KEY(super_categoria) REFERENCES super_categoria(nome),
	FOREIGN KEY(categoria) REFERENCES categoria(nome),

	CHECK(super_categoria <> categoria)
);

CREATE TABLE fornecedor (
	nif INT,
	nome VARCHAR(255),

	PRIMARY KEY (nif)

	CHECK(nif >= 100 000 000 AND nif <= 999 999 999)
);

CREATE TABLE produto (
	ean BIGINT,
	design TEXT,
	categoria VARCHAR(40),
	forn_primario INT,
	data DATE,

	PRIMARY KEY(ean),
	FOREIGN KEY(categoria) REFERENCES categoria(nome),
	FOREIGN KEY(forn_primario) REFERENCES fornecedor(nif)

	CHECK(ean >= 100 000 000 0000 AND ean <= 999 999 999 9999)
);

CREATE TABLE fornece_sec(
	nif INTEGER,
	ean BIGINT,

	PRIMARY KEY(nif, ean),
	FOREIGN KEY(nif) REFERENCES fornecedor(nif) ON DELETE CASCADE,
	FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE
);

CREATE TABLE corredor (
	nro SMALLSERIAL,
	largura NUMERIC(5,2),

	PRIMARY KEY(nro)
);

CREATE TABLE prateleira (
	nro SMALLSERIAL,
	lado CHAR(3),
	altura NUMERIC(4,2),

	PRIMARY KEY(nro, lado, altura),
	FOREIGN KEY(nro) REFERENCES corredor(nro) ON DELETE CASCADE

	CHECK (lado = 'dir' OR lado = 'esq')
);



CREATE TABLE planograma (
	ean BIGINT,
    nro SMALLSERIAL,
    lado CHAR(3),
    altura NUMERIC(4,2),
    face SMALLINT,
    unidades SMALLINT,
    loc SMALLINT, 

    PRIMARY KEY(ean, nro, lado, altura),
    FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE,
    FOREIGN KEY(nro, lado, altura) REFERENCES prateleira(nro, lado, altura) ON DELETE CASCADE

);

CREATE TABLE evento_reposicao (
	operador SMALLINT,
    instante TIMESTAMP,
    
    PRIMARY KEY(operador, instante),
    
    CHECK(instante <= CURRENT_TIMESTAMP)
);

CREATE TABLE reposicao (
    ean BIGINT,
    nro SMALLSERIAL,
    lado CHAR(3),
    altura NUMERIC(4,2),
    operador INT,
    instante TIMESTAMP,
    unidades SMALLINT,
    
    PRIMARY KEY(ean, nro, lado, altura, operador, instante),
    FOREIGN KEY(ean, nro, lado, altura) REFERENCES planograma(ean, nro, lado, altura) ON DELETE NO ACTION,
    FOREIGN KEY(operador, instante) REFERENCES evento_reposicao(operador, instante) ON DELETE NO ACTION

);
