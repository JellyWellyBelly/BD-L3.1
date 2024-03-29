TRUNCATE evento_reposicao CASCADE;
TRUNCATE categoria CASCADE;
TRUNCATE categoria_simples CASCADE;
TRUNCATE super_categoria CASCADE;
TRUNCATE constituida CASCADE;
TRUNCATE fornecedor CASCADE;
TRUNCATE produto CASCADE;
TRUNCATE fornece_sec CASCADE;
TRUNCATE planograma CASCADE;
TRUNCATE reposicao CASCADE;
TRUNCATE prateleira CASCADE;
TRUNCATE corredor CASCADE;

/* FORNECEDORES */
INSERT INTO fornecedor(nif, nome) VALUES (1, 'Fernando');
INSERT INTO fornecedor(nif, nome) VALUES (2, 'Jorge');
INSERT INTO fornecedor(nif, nome) VALUES (3, 'Ricardo');
INSERT INTO fornecedor(nif, nome) VALUES (4, 'Rita');
INSERT INTO fornecedor(nif, nome) VALUES (5, 'Anastacia');
INSERT INTO fornecedor(nif, nome) VALUES (6, 'Luis');
INSERT INTO fornecedor(nif, nome) VALUES (7, 'Ana');
INSERT INTO fornecedor(nif, nome) VALUES (8, 'Lucia');
INSERT INTO fornecedor(nif, nome) VALUES (9, 'Marta');
INSERT INTO fornecedor(nif, nome) VALUES (10, 'Pedro');
INSERT INTO fornecedor(nif, nome) VALUES (11, 'Joaquim');
INSERT INTO fornecedor(nif, nome) VALUES (12, 'Miguel');

/* CATEGORIAS/PRODUTOS */
INSERT INTO categoria(nome) VALUES ('fruta');
INSERT INTO categoria(nome) VALUES ('legumes');
INSERT INTO categoria(nome) VALUES ('leguminosas');
INSERT INTO categoria(nome) VALUES ('tuberculos');
INSERT INTO categoria(nome) VALUES ('verdura');
INSERT INTO categoria(nome) VALUES ('peixe');
INSERT INTO categoria(nome) VALUES ('peixe de rio');
INSERT INTO categoria(nome) VALUES ('peixe de mar');
INSERT INTO categoria(nome) VALUES ('carne');
INSERT INTO categoria(nome) VALUES ('carnes vermelhas');
INSERT INTO categoria(nome) VALUES ('carnes de aves');
INSERT INTO categoria(nome) VALUES ('degradavel');
INSERT INTO categoria(nome) VALUES ('vegetal');

INSERT INTO categoria_simples(nome) VALUES ('fruta');
INSERT INTO categoria_simples(nome) VALUES ('peixe de rio');
INSERT INTO categoria_simples(nome) VALUES ('peixe de mar');
INSERT INTO categoria_simples(nome) VALUES ('leguminosas');
INSERT INTO categoria_simples(nome) VALUES ('verdura');
INSERT INTO categoria_simples(nome) VALUES ('carnes vermelhas');
INSERT INTO categoria_simples(nome) VALUES ('vegetal');
INSERT INTO categoria_simples(nome) VALUES ('carnes de aves');

INSERT INTO super_categoria(nome) VALUES ('legumes');
INSERT INTO super_categoria(nome) VALUES ('peixe');
INSERT INTO super_categoria(nome) VALUES ('carne');
INSERT INTO super_categoria(nome) VALUES ('degradavel');

INSERT INTO constituida(super_categoria, categoria) VALUES ('legumes', 'verdura');
INSERT INTO constituida(super_categoria, categoria) VALUES ('legumes', 'tuberculos');
INSERT INTO constituida(super_categoria, categoria) VALUES ('legumes', 'leguminosas');
INSERT INTO constituida(super_categoria, categoria) VALUES ('carne', 'carnes vermelhas');
INSERT INTO constituida(super_categoria, categoria) VALUES ('carne', 'carnes de aves');
INSERT INTO constituida(super_categoria, categoria) VALUES ('legumes', 'degradavel');
INSERT INTO constituida(super_categoria, categoria) VALUES ('legumes', 'fruta');
INSERT INTO constituida(super_categoria, categoria) VALUES ('peixe', 'peixe de rio');
INSERT INTO constituida(super_categoria, categoria) VALUES ('peixe', 'peixe de mar');
INSERT INTO constituida(super_categoria, categoria) VALUES ('degradavel', 'fruta');
INSERT INTO constituida(super_categoria, categoria) VALUES ('degradavel', 'carne');
INSERT INTO constituida(super_categoria, categoria) VALUES ('carne', 'fruta');

INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (1, 'banana', 'fruta', 1, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (2, 'morango', 'fruta', 2, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (3, 'costeletas', 'carne', 3, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (4, 'maca', 'degradavel', 3, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (5, 'alface', 'vegetal', 2, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (6, 'cenoura', 'vegetal', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (7, 'couve', 'vegetal', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (8, 'beterraba', 'vegetal', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (9, 'milho', 'vegetal', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (10, 'berinjela', 'vegetal', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (11, 'linguica', 'carne', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (12, 'torresmo', 'carne', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (13, 'peru', 'carne', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (14, 'entrecosto', 'carne', 5, DATE '2016-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (15, 'febra', 'carne', 5, DATE '2016-01-19');

INSERT INTO fornece_sec(nif, ean) VALUES (1, 2);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 4);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 6);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 8);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 10);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 12);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 13);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 14);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 1);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 3);
--INSERT INTO fornece_sec(nif, ean) VALUES (2, 5); -- TA MAL
INSERT INTO fornece_sec(nif, ean) VALUES (2, 7);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 9);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 12);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 13);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 14);
INSERT INTO fornece_sec(nif, ean) VALUES (2, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 1);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 10);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 12);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 13);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 14);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 1);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 2);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 3);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 4);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 5);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 6);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 7);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 8);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 9);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 10);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 12);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 13);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 14);
INSERT INTO fornece_sec(nif, ean) VALUES (4, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (6, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (7, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (8, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (9, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (10, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (11, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (12, 11);
INSERT INTO fornece_sec(nif, ean) VALUES (6, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (7, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (8, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (9, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (10, 15);
INSERT INTO fornece_sec(nif, ean) VALUES (11, 15);
--INSERT INTO fornece_sec(nif, ean) VALUES (1, 1); -- TA MAL

/*UPDATE fornece_sec
SET nif = 1, ean = 1
WHERE nif = 1 AND ean = 2; TA MAL */ 

/*UPDATE produto
SET forn_primario = 2, ean = 1
WHERE forn_primario = 1 AND ean = 1; TA MAL*/

/* MERCADO */
INSERT INTO corredor(nro, largura) VALUES (1, 13);
INSERT INTO corredor(nro, largura) VALUES (2, 15);

INSERT INTO prateleira(nro, lado, altura) VALUES (1, 'dir', 'medio');
INSERT INTO prateleira(nro, lado, altura) VALUES (2, 'dir', 'cima');

INSERT INTO planograma(ean, nro, lado, altura, face, unidades, loc) VALUES (1, 1, 'dir', 'medio', 1, 1337, 1);
INSERT INTO planograma(ean, nro, lado, altura, face, unidades, loc) VALUES (2, 2, 'dir', 'cima', 1, 1337, 1);
INSERT INTO planograma(ean, nro, lado, altura, face, unidades, loc) VALUES (1, 2, 'dir', 'cima', 1, 1337, 1);

/* REPOSICOES */
INSERT INTO evento_reposicao(operador, instante) VALUES (1, TIMESTAMP '1997-01-31 00:57:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (2, TIMESTAMP '1997-02-01 00:00:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (1, TIMESTAMP '1997-01-31 10:00:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (2, TIMESTAMP '1997-02-01 10:57:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (2, TIMESTAMP '1997-02-01 01:00:00');

INSERT INTO reposicao(ean, nro, lado, altura, operador, instante, unidades) VALUES (1, 1, 'dir', 'medio', 1,TIMESTAMP '1997-01-31 00:57:00',1337);
INSERT INTO reposicao(ean, nro, lado, altura, operador, instante, unidades) VALUES (2, 2, 'dir', 'cima', 2, TIMESTAMP '1997-02-01 00:00:00',1337);
INSERT INTO reposicao(ean, nro, lado, altura, operador, instante, unidades) VALUES (1, 2, 'dir', 'cima', 2, TIMESTAMP '1997-02-01 00:00:00',1337);
INSERT INTO reposicao(ean, nro, lado, altura, operador, instante, unidades) VALUES (2, 2, 'dir', 'cima', 2, TIMESTAMP '1997-02-01 01:00:00',1337);