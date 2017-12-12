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
	forn_primario NUMERIC(9,0),
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
    instante TIME,
    
    PRIMARY KEY(operador, instante),
    
    CHECK (instante <= CURRENT_TIME),
    CHECK (operador > 0)
);

CREATE TABLE reposicao (
    ean NUMERIC(13,0),
    nro SMALLINT,
    lado CHAR(3),
    altura VARCHAR(5),
    operador SMALLINT,
    instante TIME,
    unidades SMALLINT,
    
    PRIMARY KEY(ean, nro, lado, altura, operador, instante),
    FOREIGN KEY(ean, nro, lado, altura) REFERENCES planograma(ean, nro, lado, altura) ON DELETE CASCADE,
    FOREIGN KEY(operador, instante) REFERENCES evento_reposicao(operador, instante) ON DELETE CASCADE,

    CHECK (unidades > 0) -- Queremos que seja positivo, porque nao achamos logico repor unidades negativas
);

-- Estrela --

CREATE TABLE d_produto(
	cean Numeric(13,0), 
	categoria VARCHAR(40), 
	nif_fornecedor_principal Numeric(9,0),

	PRIMARY KEY(cean)
);

CREATE TABLE d_tempo(
	dia Numeric(2,0), 
	mes Numeric(2,0), 
	ano Numeric(4,0),

	PRIMARY KEY(dia, mes, ano),

	CHECK (dia >= 1 AND dia <= 31 AND mes IN (1, 3, 5, 7, 9, 11)),
	CHECK (dia >= 1 AND dia <= 30 AND mes IN (4, 6, 8, 10, 12)),
	CHECK (dia >= 1 AND dia <= 28 AND mes = 2)
);


CREATE TABLE reposicoes_facts(
	cean Numeric(13,0),
	dia Numeric(2,0), 
	mes Numeric(2,0), 
	ano Numeric(4,0),

	-- measures --

	nro SMALLINT,
    lado CHAR(3),
    altura VARCHAR(5),
    operador SMALLINT,
    instante TIME,
    unidades SMALLINT,

	PRIMARY KEY(cean, dia, mes, ano),

	FOREIGN KEY(cean) REFERENCES d_produto(cean),
	FOREIGN KEY(dia, mes, ano) REFERENCES d_produto(dia, mes, ano)

);


---- TRIGGER ----

---- TRIGGERS ----

CREATE OR REPLACE FUNCTION cancel_fornece_sec_proc() 
	RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS(
        SELECT forn_primario, ean
        FROM produto
        WHERE NEW.ean = produto.ean AND NEW.nif = produto.forn_primario) THEN
		RAISE EXCEPTION 'O fornecedor % ja e fornecedor primario do produto %', NEW.nif, NEW.ean;
	END IF;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER cancel_fornece_sec
    AFTER INSERT OR UPDATE ON fornece_sec
	FOR EACH ROW
	EXECUTE PROCEDURE cancel_fornece_sec_proc();


CREATE OR REPLACE FUNCTION cancel_produto_proc() 
	RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS(
        SELECT nif, ean
        FROM fornece_sec
        WHERE NEW.ean = fornece_sec.ean AND fornece_sec.nif = NEW.forn_primario) THEN
		RAISE EXCEPTION 'O fornecedor % ja e fornecedor secundario do produto %', NEW.forn_primario, NEW.ean;
	END IF;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER cancel_produto
    AFTER UPDATE ON produto
	FOR EACH ROW
	EXECUTE PROCEDURE cancel_produto_proc();
