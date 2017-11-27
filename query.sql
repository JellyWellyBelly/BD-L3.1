SELECT nome -- n é isto
FROM(SELECT fornecedor, nome, COUNT(categoria) AS n_categorias
	FROM(SELECT forn_primario AS fornecedor, nome, categoria 
		 FROM produto
         NATURAL JOIN fornecedor AS fornecedor(forn_primario, nome)

		UNION

		SELECT nif AS fornecedor, nome, categoria
		FROM fornece_sec
		NATURAL JOIN produto NATURAL JOIN fornecedor) AS resultado(fornecedor, nome, categoria)
	GROUP BY fornecedor, nome) AS resultado(fornecedor, nome, n_categorias)
WHERE n_categorias = (SELECT MAX(n_categorias) FROM resultado) -- n é isto