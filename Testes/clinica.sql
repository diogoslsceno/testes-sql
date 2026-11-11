CREATE DATABASE clinica_medica;
USE clinica_medica;

CREATE TABLE medicos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    valor_consulta DECIMAL(10, 2) NOT NULL 
);

CREATE TABLE pacientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    tem_convenio BOOLEAN DEFAULT FALSE
);

CREATE TABLE consultas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    data_consulta DATE NOT NULL,
    status_consulta VARCHAR(20) DEFAULT 'Agendada',
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

INSERT INTO medicos (nome, crm, especialidade, valor_consulta) VALUES
('Dr. Roberto Alves', 'CRM-SP 12345', 'Cardiologista',  350.00),
('Dra. Juliana Prado', 'CRM-GO 67890', 'Dermatologia', 280.00),
('Dr. Marcelo Costa', 'CRM-PR 54321', 'Ortopedia', 300.00),
('Dra. Fernanda Lima', 'CRM-PA 98765', 'Pediatra', 250.00);

INSERT INTO pacientes (nome, telefone, tem_convenio) VALUES
('Gabriel Miranda', '11 98888-1111', TRUE),
('Larissa Lobato', '62 97777-2222', FALSE),
('Felipe Carvalho', '11 96666-3333', TRUE),
('Camila Ribeiro', '41 95555-4444', FALSE);

INSERT INTO consultas (medico_id, paciente_id, data_consulta, status_consulta) VALUES
(1, 1, '2026-11-16', 'Agendada'),
(2, 2, '2026-11-17', 'Agendada'),
(1, 3, '2026-11-18', 'Agendada'),
(3, 4, '2026-11-19', 'Agendada');

SELECT nome, especialidade, valor_consulta
FROM medicos
WHERE valor_consulta <= 300.00;

SELECT
	pacientes.nome AS Paciente,
    medicos.nome AS Medico,
    medicos.especialidade AS Especialidade,
    consultas.data_consulta AS Data_Agendamento,
    consultas.status_consulta AS Situacao
FROM consultas
INNER JOIN pacientes ON consultas.paciente_id = pacientes.id
INNER JOIN medicos ON consultas.medico_id = medicos.id;

SELECT
	medicos.nome AS Medico,
    COUNT(consultas.id) AS Total_Consultas
FROM medicos
INNER JOIN consultas ON medicos.id = consultas.medico_id
GROUP BY medicos.nome;

UPDATE consultas
SET status_consulta = 'Realizada'
WHERE id = 1;

SELECT * FROM consultas WHERE id = 1;

DELETE FROM consultas
WHERE id = 4;

SELECT * FROM consultas;