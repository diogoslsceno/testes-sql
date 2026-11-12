CREATE DATABASE ecommercer_db;
USE ecommercer_db;

CREATE TABLE categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(150)
);

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
	telefone VARCHAR(20)
);

CREATE TABLE enderecos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo VARCHAR(20) DEFAULT 'Entrega',
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
	cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NULL,
	data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(20) DEFAULT 'Pendente',
	FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
	id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO categorias (nome, descricao) VALUES
('Informática', 'Acessórios e componentes para computadores'),
('Áudio', 'Fones de ouvido e caixas de som');

INSERT INTO clientes (nome, email, telefone) VALUES
('Lucas Almeida', 'lucas@email.com', '11 9888-0001'),
('Juliana Lima', 'juliana@email.com', '21 97777-0002');

INSERT INTO enderecos (cliente_id, tipo, rua, numero, cidade, estado, cep) VALUES
(1, 'Entrega', 'Av. Paulista', 1000, 'São Paulo', 'SP', '01310-100'),
(2, 'Entrega', 'Rua das Laranjeiras', '500', 'Rio de Janeiro', 'RJ', '22240-000');

INSERT INTO produtos (categoria_id, nome, preco, estoque) VALUES
(1, 'SSD NVMe 1TB', 450.00, 20),
(1, 'Memória RAM 16GB', 280.00, 35),
(2, 'Memória Gamer 7.1', 320.00, 15);

INSERT INTO pedidos (cliente_id, status_pedido) VALUES
(1, 'Pago'),
(2, 'Pendente');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 450.00),
(1, 2, 2, 280.00),
(2, 3, 1, 320.00);

SELECT
	pedidos.id AS Pedido_Numero,
    clientes.nome AS Cliente,
    produtos.nome AS Produto,
    itens_pedido.quantidade AS Qtd,
    itens_pedido.preco_unitario AS Preco_Unitario,
    (itens_pedido.quantidade * itens_pedido.preco_unitario) AS Subtotal,
    pedidos.status_pedido AS Status
FROM itens_pedido
INNER JOIN pedidos ON itens_pedido.pedido_id = pedidos.id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN produtos ON itens_pedido.produto_id = produtos.id;