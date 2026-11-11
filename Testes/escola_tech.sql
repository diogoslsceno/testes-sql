CREATE DATABASE escola_tech;
USE escola_tech;

CREATE TABLE alunos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cidade VARCHAR(50)
);

CREATE TABLE cursos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    duracao_horas INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE matriculas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    status_matricula VARCHAR(20) DEFAULT 'Ativa',
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

INSERT INTO alunos (nome, email, cidade) VALUES
('Ana Clara', 'ana.clara@gmail.com', 'São Paulo'),
('Bruno Mendes', 'bruno.mendes@gmail.com', 'Rio de Janeiro'),
('Carla Dias', 'carla.dias@gmail.com', 'Belo Horizonte'),
('Diego Rocha', 'diogo.rocha@gmail.com', 'Curitiba');

INSERT INTO cursos (titulo, categoria, duracao_horas, preco) VALUES
('Lógica de Programação', 'Iniciante', 40, 150.00),
('Banco de Dados MySQL', 'Dados', 60, 220.00),
('Desenvolvimento WEB com React', 'Frontent', 80, 350.00),
('Python para Inteligêngia Artificial', 'Dados', 100, 490.00);

INSERT INTO matriculas (aluno_id, curso_id, data_matricula, status_matricula) VALUES
(1, 2, '2026-11-01', 'Ativa'),
(1, 3, '2026-11-02', 'Ativa'),
(2, 1, '2026-11-05', 'Concluída'),
(3, 4, '2026-11-08', 'Ativa'),
(4, 2, '2026-11-10', 'Ativa');

SELECT titulo, preco
FROM cursos
WHERE preco <= 250.00;

SELECT
	alunos.nome AS Aluno,
    cursos.titulo AS Curso,
    cursos.categoria AS Categoria,
    matriculas.status_matricula AS Status_Matricula
FROM matriculas
INNER JOIN alunos ON matriculas.aluno_id = alunos.id
INNER JOIN cursos ON matriculas.curso_id = cursos.id;

SELECT
	alunos.nome AS Aluno,
    cursos.titulo AS Curso
FROM matriculas
INNER JOIN alunos ON matriculas.aluno_id = alunos.id
INNER JOIN cursos ON matriculas.curso_id = cursos.id
WHERE cursos.categoria = 'Dados';

UPDATE matriculas
SET status_matricula = 'Concluída'
WHERE id = 1;

SElECT * FROM matriculas WHERE id = 1;

SELECT
	COUNT(*) AS total_matriculas,
    SUM(cursos.preco) AS faturamento_total
FROM matriculas
INNER JOIN cursos ON matriculas.curso_id = cursos.id;