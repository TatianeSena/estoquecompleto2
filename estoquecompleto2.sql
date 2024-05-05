select * from produtos_cestas

INSERT INTO produtos_cestas (produto_id, quantidade, cesta_id)
VALUES ('30', '2', '2');

DELETE FROM produtos_cestas
WHERE id = 18;

CREATE TABLE produtos_cestas (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    tipo_de_cesta VARCHAR(100),
    quantidade INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
ALTER TABLE produtos_cestas
DROP COLUMN tipo_de_cesta;
ALTER TABLE produtos_cestas
ADD COLUMN cesta_id INT,
ADD CONSTRAINT fk_cesta_id FOREIGN KEY (cesta_id) REFERENCES cestas(id);

DROP TABLE IF EXISTS produtos_cestas

ALTER TABLE produtos_cestas
ADD COLUMN quantidade INT



select * from cestas

select * from produtos

INSERT INTO produtos (nome)
VALUES ('Sabonete');

DELETE FROM produtos
WHERE id = (SELECT id FROM produtos WHERE nome = 'Milharina' LIMIT 1);

select * from entrada_mercadorias

INSERT INTO entrada_mercadorias (id_produto, data_compra, data_validade, quantidade)
VALUES ('30', '2024-05-05', '2026-04-01', '10');

UPDATE entrada_mercadorias AS em
SET quantidade = em.quantidade - sm.quantidade_cestas
FROM saida_mercadorias AS sm
WHERE em.id_produto IN (
    SELECT id_produto
    FROM saida_mercadorias
    WHERE data_venda = sm.data_venda
)
AND em.data_validade = (
    SELECT data_validade
    FROM entrada_mercadorias
    WHERE id_produto = em.id_produto
    ORDER BY data_validade ASC
    LIMIT 1
);

select * from saida_mercadorias

INSERT INTO saida_mercadorias (quantidade_cestas, tipo_cesta, data_venda)
VALUES ('1', 'Cesta 1', '2024-05-02');