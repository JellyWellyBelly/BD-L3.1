drop table teste cascade;

CREATE TABLE teste (
	primario integer,
	secundario integer NOT NULL,
	
	PRIMARY KEY(primario)
);















/* Coisas a rever / melhorar (isto ja diz respeito ao projeto, mas ta super incompleto)

CREATE TABLE categoria (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome),
);

CREATE TABLE categoria_simples (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome) REFERENCES categoria(nome),
);

CREATE TABLE super_categoria (
	nome VARCHAR(40),
	
	PRIMARY KEY(nome),
	FOREIGN KEY(nome) REFERENCES categoria(nome),
);

CREATE TABLE constituida (
	super_categoria VARCHAR(40),
	categoria VARCHAR(40),

	PRIMARY KEY(super_categoria, categoria),
	FOREIGN KEY(super_categoria) REFERENCES super_categoria(nome),
	FOREIGN KEY(categoria) REFERENCES categoria(nome)
);

CREATE TABLE produto (
	ean BIGINT(13),
	design TEXT,
	categoria VARCHAR(40),
	forn_primario INT(9), /* TO BE COMPLETED
	data ,

	PRIMARY KEY(ean),
	FOREIGN KEY(categoria) REFERENCES categoria(nome),
	FOREIGN KEY(forn_primario) REFERENCES fornecedor
);

CREATE TABLE fornecedor (
	nif ,
	nome VARCHAR(255)
); */

CREATE TABLE planograma (
	ean INT,
    nro SMALLSERIAL,
    lado CHAR(3),
    altura INT,
    face SMALLINT,
    unidades SMALLINT,
    loc INT,
    
    PRIMARY KEY(ean, nro, lado, altura),
    FOREIGN KEY(ean) REFERENCES produto(ean),
    FOREIGN KEY(nro) REFERENCES prateleira(nro),
    FOREIGN KEY(lado) REFERENCES prateleira(lado),
    FOREIGN KEY(altura) REFERENCES prateleira(altura)
);

CREATE TABLE evento_reposicao (
	operador INT,
    instante TIME,
    
    PRIMARY KEY(operador, instante)
);

CREATE TABLE reposicao (
    ean TEXT,
    nro SMALLSERIAL,
    lado CHAR(3),
    altura INT,
    operador INT,
    instante TIME,
    unidades INT,
    
    PRIMARY KEY(ean, nro, lado, altura, operador, instante),
    FOREIGN KEY(ean) REFERENCES planograma(ean),
    FOREIGN KEY(nro) REFERENCES planograma(nro),
    FOREIGN KEY(lado) REFERENCES planograma(lado),
    FOREIGN KEY(altura) REFERENCES planograma(altura),
    FOREIGN KEY(operador) REFERENCES evento_reposicao(operador),
    FOREIGN KEY(operador) REFERENCES evento_reposicao(instante),
    
    CHECK (lado = 'dir' OR lado = 'esq')
);
