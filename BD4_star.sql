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

	CHECK (dia >= 1 AND dia <= 31 AND mes = 1, 3, 5, 7, 9, 11),
	CHECK (dia >= 1 AND dia <= 30 AND mes = 4, 6, 8, 10, 12),
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
    instante TIMESTAMP,

	PRIMARY KEY(cean, dia, mes, ano),

	FOREIGN KEY(cean) REFERENCES d_produto(cean),
	FOREIGN KEY(dia, mes, ano) REFERENCES d_produto(dia, mes, ano),
	FOREIGN KEY(nro, lado, altura, operador, instante) REFERENCES reposicao(nro, lado, altura, operador, instante)

);



-- OLAP --

SELECT categoria, ano, mes, COUNT(cean) AS Num_Reposicoes 
FROM ( 
		SELECT cean, categoria, mes, ano, 
		FROM reposicoes_facts NATURAL JOIN d_produto
		WHERE nif_fornecedor_principal = 123455678 
	)
GROUP BY categoria, ROLLUP (ano, mes);