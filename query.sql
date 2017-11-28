/* QUERY 1 */

WITH resultado AS (
    SELECT fornecedor, nome, COUNT(categoria) AS n_categorias
	FROM (
		SELECT forn_primario AS fornecedor, nome, categoria 
		FROM produto
        NATURAL JOIN fornecedor AS fornecedor(forn_primario, nome)

		UNION

		SELECT nif AS fornecedor, nome, categoria
		FROM fornece_sec
		NATURAL JOIN produto NATURAL JOIN fornecedor
    ) AS resultado
	GROUP BY fornecedor, nome 
)

SELECT nome
FROM resultado
WHERE n_categorias = (SELECT MAX(n_categorias) FROM resultado);



/* QUERY 2 */

SELECT nif, nome
FROM (
    SELECT nif, nome, COUNT(categoria) AS n_categorias
 	FROM (
		SELECT categoria, forn_primario AS nif, nome
		FROM produto
		NATURAL JOIN categoria_simples AS categoria_simples(categoria)
		NATURAL JOIN fornecedor AS fornecedor(forn_primario, nome)
	) AS prods_dos_forn_prim
	GROUP BY nif, nome
) AS resultado
WHERE (n_categorias = (SELECT COUNT(nome) FROM categoria_simples));



/* QUERY 3 */

SELECT ean
FROM produto
WHERE NOT EXISTS (
    SELECT ean
	FROM reposicao 
	WHERE produto.ean = reposicao.ean);



/* QUERY 4 */
