CREATE DATABASE loja_vendas;
USE loja_vendas;

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAUlT 0
);

CREATE TABLE vendas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nome VARCHAR(100) NOT NULL,
    produto_id INT,
    quantidade INT NOT NULL,
    data_venda DATE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Teclado Mecânico RGB', 'Periféricos', 250.00, 15),
('Mouse Sem Fio 16000 DPI', 'Periféricos', 180.00, 30),
('Monitor Gamer 27 144hz', 'Monitores', 1200.00, 8),
('Cadeira Ergonômica', 'Móveis', 850.00, 5);

INSERT INTO vendas (cliente_nome, produto_id, quantidade, data_venda) VALUES
('Carlos Silva', 1, 2, '2026-11-01'),
('Mariana SOuza', 3, 1, '2026-11-05'),
('João Santos', 2, 1, '2026-11-10');

SELECT * FROM produtos;
SELECT nome, preco FROM produtos WHERE preco > 200;
SELECT nome, preco, estoque FROM produtos ORDER BY preco DESC;
SELECT cliente_nome, quantidade, data_venda FROM vendas;
UPDATE produtos SET preco = 220.00 WHERE id = 1;
UPDATE produtos SET estoque = estoque - 1 WHERE id = 2;
SELECT * FROM produtos;