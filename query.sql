/* QUERY 1 */

WITH resultado AS 
(
    SELECT fornecedor, nome, COUNT(categoria) AS n_categorias
	FROM(SELECT forn_primario AS fornecedor, nome, categoria 
		 FROM produto
         NATURAL JOIN fornecedor AS fornecedor(forn_primario, nome)

		UNION

		SELECT nif AS fornecedor, nome, categoria
		FROM fornece_sec
		NATURAL JOIN produto NATURAL JOIN fornecedor) AS resultado(fornecedor, nome, categoria)
	GROUP BY fornecedor, nome 
)

SELECT nome
FROM resultado
WHERE n_categorias = (SELECT MAX(n_categorias) FROM resultado)

/* QUERY 2 */

WITH resultado AS
(
    SELECT * FROM produto
)

SELECT *
FROM resultado