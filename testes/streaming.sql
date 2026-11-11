CREATE DATABASE streaming_db;
USE streaming_db;

CREATE TABLE filmes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    ano_lancamento INT NOT NULL,
    duracao_minutos INT,
    nota_avaliacao DECIMAL(3, 1)
);

CREATE TABLE usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    plano VARCHAR(20) DEFAULT 'Básico',
    ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO filmes (titulo, genero, ano_lancamento, duracao_minutos, nota_avaliacao) VALUES
('Interestelar', 'Ficção Científica', 2014, 169, 8.7),
('O Poderoso Chefão', 'Drama', 1972, 175, 9.2),
('Vingadores: Ultimato', 'Ação', 2019, 181, 8.4),
('Matrix', 'Ficção Científica', 1999, 136, 8.7),
('Divertida Mente 2', 'Animação', 2024, 96, 7.7);

INSERT INTO usuarios (nome, plano, ativo) VALUES
('Lucas Mendes', 'Básico', TRUE),
('Beatriz Ramos', 'Premium', TRUE),
('Rafael Lima', 'Básico', False);

SELECT * FROM filmes;

SELECT titulo, ano_lancamento, nota_avaliacao
FROM filmes
WHERE genero = 'Ficção Científica';

SELECT titulo, nota_avaliacao
FROM filmes
WHERE nota_avaliacao >= 8.5
ORDER BY nota_avaliacao DESC;

SELECT nome, plano
FROM usuarios
WHERE ativo = TRUE;

UPDATE usuarios
SET plano = 'Premium'
WHERE id = 1;

UPDATE filmes
SET nota_avaliacao = 8.8
WHERE id = 1;

SELECT * FROM usuarios WHERE id = 1;
SELECT * FROM filmes WHERE id = 1;

DELETE FROM filmes
WHERE id = 5;

SELECT * FROM filmes;
