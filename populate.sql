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

/* FORNECEDORES */
INSERT INTO fornecedor(nif, nome) VALUES (1, 'Fernando');
INSERT INTO fornecedor(nif, nome) VALUES (2, 'Jorge');
INSERT INTO fornecedor(nif, nome) VALUES (3, 'Ricardo');

/* REPOSICOES */
INSERT INTO evento_reposicao(operador, instante) VALUES (1, TIMESTAMP '1997-01-31 00:57:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (2, TIMESTAMP '1997-02-01 00:00:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (1, TIMESTAMP '1997-01-31 10:00:00');
INSERT INTO evento_reposicao(operador, instante) VALUES (2, TIMESTAMP '1997-02-01 10:57:00');

/* CATEGORIAS/PRODUTOS */
INSERT INTO categoria(nome) VALUES ('fruta');
INSERT INTO categoria(nome) VALUES ('degradavel');
INSERT INTO categoria(nome) VALUES ('carne');
INSERT INTO categoria(nome) VALUES ('vegetal');
INSERT INTO categoria_simples(nome) VALUES ('fruta');
INSERT INTO categoria_simples(nome) VALUES ('vegetal');
INSERT INTO super_categoria(nome) VALUES ('degradavel');
INSERT INTO super_categoria(nome) VALUES ('carne');
INSERT INTO constituida(super_categoria, categoria) VALUES ('degradavel', 'fruta');
INSERT INTO constituida(super_categoria, categoria) VALUES ('carne', 'vegetal');

INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (1, 'banana', 'fruta', 1, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (2, 'morango', 'fruta', 2, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (3, 'costeletas', 'carne', 3, DATE '2015-01-19');
INSERT INTO produto(ean, design, categoria, forn_primario, data) VALUES (4, 'maca', 'degradavel', 3, DATE '2015-01-19');
INSERT INTO fornece_sec(nif, ean) VALUES (2, 1);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 2);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 3);
INSERT INTO fornece_sec(nif, ean) VALUES (1, 4);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 1);
INSERT INTO fornece_sec(nif, ean) VALUES (3, 2);

/* MERCADO */
INSERT INTO corredor(largura) VALUES (13);
INSERT INTO corredor(largura) VALUES (15);
INSERT INTO prateleira(nro, lado, altura) VALUES (1, 'dir', 2.00);
INSERT INTO prateleira(nro, lado, altura) VALUES (2, 'dir', 2.00);
INSERT INTO planograma(ean, nro, lado, altura, face, unidades, loc) VALUES (1, 1, 'dir', 2.00, 1, 1337, 1);
INSERT INTO planograma(ean, nro, lado, altura, face, unidades, loc) VALUES (2, 2, 'dir', 2.00, 1, 1337, 1);

/* REPOSICAO */
INSERT INTO reposicao VALUES (1, 1,'dir',2.00,1,TIMESTAMP '1997-01-31 00:57:00',1337);
INSERT INTO reposicao VALUES (2, 2,'dir',2.00,2,TIMESTAMP '1997-02-01 00:00:00',1337);
