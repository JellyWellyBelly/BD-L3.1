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
	FOREIGN KEY(super_categoria) REFERENCES super_categoria(nome) ON DELETE CASCADE,
	FOREIGN KEY(categoria) REFERENCES categoria(nome) ON DELETE CASCADE,

	CHECK(super_categoria <> categoria)
);

CREATE TABLE fornecedor (
	nif NUMERIC(9,0),
	nome VARCHAR(255),

	PRIMARY KEY (nif),

	CHECK (nif > 0)
);

CREATE TABLE produto (
	ean NUMERIC(13,0),
	design TEXT,
	categoria VARCHAR(40),
	forn_primario INT,
	data DATE,

	PRIMARY KEY(ean),
	FOREIGN KEY(categoria) REFERENCES categoria(nome) ON DELETE CASCADE, --Quando uma categoria eh apagada os produtos desaparecem tambem 
	FOREIGN KEY(forn_primario) REFERENCES fornecedor(nif) ON DELETE CASCADE, --Com a falta de um fornecedor primario eh eliminado o produto da DB

	CHECK (ean > 0)
);

CREATE TABLE fornece_sec(
	nif NUMERIC(9,0),
	ean NUMERIC(13,0),

	PRIMARY KEY(nif, ean),
	FOREIGN KEY(nif) REFERENCES fornecedor(nif) ON DELETE CASCADE,
	FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE
);

CREATE TABLE corredor (
	nro SMALLINT,
	largura NUMERIC(5,2),

	PRIMARY KEY(nro),

	CHECK (nro > 0)
);

CREATE TABLE prateleira (
	nro SMALLINT,
	lado CHAR(3),
	altura VARCHAR(5),

	PRIMARY KEY(nro, lado, altura),
	FOREIGN KEY(nro) REFERENCES corredor(nro) ON DELETE CASCADE,

	CHECK (lado = 'dir' OR lado = 'esq'),
	CHECK (altura = 'baixo' OR altura = 'cima' OR altura = 'medio')
);

CREATE TABLE planograma (
	ean NUMERIC(13,0),
    nro SMALLINT,
    lado CHAR(3),
    altura VARCHAR(5),
    face SMALLINT,
    unidades SMALLINT,
    loc SMALLINT,

    PRIMARY KEY(ean, nro, lado, altura),
    FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE,
    FOREIGN KEY(nro, lado, altura) REFERENCES prateleira(nro, lado, altura) ON DELETE CASCADE,

    CHECK (face > 0),
    CHECK (unidades > 0),
    CHECK (loc > 0)
);

CREATE TABLE evento_reposicao (
	operador SMALLINT,
    instante TIMESTAMP,
    
    PRIMARY KEY(operador, instante),
    
    CHECK (instante <= CURRENT_TIMESTAMP),
    CHECK (operador > 0)
);

CREATE TABLE reposicao (
    ean NUMERIC(13,0),
    nro SMALLINT,
    lado CHAR(3),
    altura VARCHAR(5),
    operador SMALLINT,
    instante TIMESTAMP,
    unidades SMALLINT,
    
    PRIMARY KEY(ean, nro, lado, altura, operador, instante),
    FOREIGN KEY(ean, nro, lado, altura) REFERENCES planograma(ean, nro, lado, altura) ON DELETE CASCADE,
    FOREIGN KEY(operador, instante) REFERENCES evento_reposicao(operador, instante) ON DELETE CASCADE,

    CHECK (unidades > 0) -- Queremos que seja positivo, porque nao achamos logico repor unidades negativas
);