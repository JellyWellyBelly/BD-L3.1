-- Populate --


INSERT INTO d_produto(cean, categoria, nif_fornecedor_principal) 
SELECT ean, categoria, forn_primario
FROM produto;

INSERT INTO d_tempo(dia, mes, ano) 
SELECT DISTINCT EXTRACT(DAY FROM instante),
		EXTRACT(MONTH FROM instante),
		EXTRACT(YEAR FROM instante)
FROM reposicao;

INSERT INTO reposicoes_facts(cean, dia, mes, ano, unidades_repostas)
SELECT DISTINCT ean, -- DISTINCT porque usamos TIMESTAMP na reposicao sendo assim possivel repor duas vezes o mesmo produto no mesmo dia
	   EXTRACT(DAY FROM instante),
	   EXTRACT(MONTH FROM instante),
	   EXTRACT(YEAR FROM instante),
	   unidades
FROM reposicao;



-- Schema --



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

	CHECK (dia >= 1 AND dia <= 31 AND mes IN (1, 3, 5, 7, 9, 11) OR (dia >= 1 AND dia <= 30 AND mes IN (4, 6, 8, 10, 12)) OR (dia >= 1 AND dia <= 28 AND mes = 2))
);


CREATE TABLE reposicoes_facts(
	cean Numeric(13,0),
	dia Numeric(2,0), 
	mes Numeric(2,0), 
	ano Numeric(4,0),

	-- measures --
	
    unidades_repostas SMALLINT,

	PRIMARY KEY(cean, dia, mes, ano),

	FOREIGN KEY(cean) REFERENCES d_produto(cean),
	FOREIGN KEY(dia, mes, ano) REFERENCES d_tempo(dia, mes, ano)

);



-- OLAP --

WITH TEMP AS (SELECT ean, categoria, mes, ano 
		     FROM reposicoes_facts NATURAL JOIN d_produto
		     WHERE nif_fornecedor_principal = 123455678)

SELECT categoria, ano, mes, COUNT(ean) AS Num_Reposicoes 
FROM TEMP
GROUP BY categoria, ano, mes

UNION

SELECT categoria, ano, NULL AS mes, COUNT(ean) AS Num_Reposicoes 
FROM TEMP
GROUP BY categoria, ano

UNION

SELECT categoria, NULL AS ano, NULL AS mes, COUNT(ean) AS Num_Reposicoes 
FROM TEMP
GROUP BY categoria
ORDER BY categoria, ano, mes;