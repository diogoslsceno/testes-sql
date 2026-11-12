# Contexto e Linha de Aprendizado em SQL 🧠

Este documento consolida o histórico, a evolução dos estudos e o resumo de todos os scripts práticos criados no repositório **testes-sql**.

---

## 🎯 Objetivo dos Estudos
Desenvolver proficiência prática em **SQL (Structured Query Language)** utilizando **MySQL Server 8.4** e a interface gráfica **MySQL Workbench**, partindo dos comandos fundamentais de definição e manipulação de dados até relacionamentos avançados entre tabelas e modelagem visual EER.

---

## 📚 Projetos Desenvolvidos

### 1. Loja de Vendas (`Testes/loja_vendas.sql`)
* **Tema:** Sistema básico de produtos e compras em loja de informática.
* **Conceitos abordados:**
  * Criação de banco de dados (`CREATE DATABASE`, `USE`).
  * Tipos de dados essenciais: `INT AUTO_INCREMENT`, `VARCHAR`, `DECIMAL(10,2)`.
  * Chave primária (`PRIMARY KEY`) garantindo identificadores únicos.
  * Inserção em lote de registros (`INSERT INTO ... VALUES (...)`).
  * Consultas com filtros condicionais (`WHERE preco > 200`) e ordenação (`ORDER BY preco DESC`).
  * Modificação controlada de dados e controle de estoque (`UPDATE ... WHERE`).

---

### 2. Plataforma de Streaming (`Testes/streaming.sql`)
* **Tema:** Catálogo de filmes e controle de usuários assinantes.
* **Conceitos abordados:**
  * Tipagem numérica precisa: notas com casas decimais (`DECIMAL(3,1)`).
  * Valores padrão e booleanos: `BOOLEAN DEFAULT TRUE` para controle de status da assinatura.
  * Consultas combinadas com filtros de gênero e notas (`WHERE ... ORDER BY`).
  * Atualização de planos de usuários e notas de catálogo (`UPDATE`).
  * Remoção segura de registros de catálogo utilizando chave primária (`DELETE FROM ... WHERE id = ...`).

---

### 3. Escola de Tecnologia (`Testes/escola_tech.sql`)
* **Tema:** Gestão acadêmica cruzando alunos, cursos e matrículas.
* **Conceitos abordados:**
  * Restrição de unicidade: `UNIQUE` para garantir que e-mails não sejam duplicados.
  * Chave estrangeira (`FOREIGN KEY ... REFERENCES ...`) criando o vínculo relacional real entre tabelas.
  * **O Poder do `INNER JOIN`:** Consulta cruzando 3 tabelas simultaneamente para emitir o relatório completo de alunos e cursos matriculados.
  * Funções de agregação: `COUNT(*)` para contagem de inscritos e `SUM()` para cálculo de faturamento total.
  * Boas práticas de nomenclatura: uso de `status_matricula` evitando ambiguidades com palavras-chave do MySQL.

---

### 4. Clínica Médica (`Testes/clinica.sql`)
* **Tema:** Agendamento de consultas médicas entre pacientes e profissionais de saúde.
* **Conceitos abordados:**
  * Manipulação de datas no padrão universal ISO (`DATE`: `YYYY-MM-DD`).
  * Cruzamento de tabelas com `INNER JOIN` gerando a agenda de atendimentos.
  * **Agrupamento com `GROUP BY`:** Utilização de `COUNT(consultas.id) ... GROUP BY medicos.nome` para gerar métricas de produtividade por médico.
  * Ciclo de vida do agendamento: transição de status (`Agendada` ➔ `Realizada`) e cancelamento via `DELETE`.

---

### 5. E-commerce Completo e Modelagem EER (`Testes/ecommerce_db.sql`)
* **Tema:** Arquitetura relacional completa de uma loja virtual com 6 tabelas conectadas.
* **Conceitos abordados:**
  * **Cardinalidade Relacional:**
    * `1:N` (Um para Muitos): `clientes` ➔ `enderecos`, `clientes` ➔ `pedidos`, `categorias` ➔ `produtos`.
    * `N:M` (Muitos para Muitos): resolvido com a tabela associativa `itens_pedido` entre `pedidos` e `produtos`.
  * Datas dinâmicas: `DATETIME DEFAULT CURRENT_TIMESTAMP` para registro do momento da compra.
  * Cruzamento avançado: consulta unindo 4 tabelas (`itens_pedido`, `pedidos`, `clientes` e `produtos`) com cálculo de subtotal por item.
  * **Engenharia Reversa:** Geração e visualização do diagrama de modelo relacional (EER) no MySQL Workbench.

---

## 🛠️ Resumo das Cláusulas e Comandos Praticados

| Comando / Cláusula | Tipo | Finalidade Principal |
| :--- | :---: | :--- |
| `CREATE DATABASE` / `USE` | DDL | Criação e seleção do esquema de trabalho. |
| `CREATE TABLE` | DDL | Definição da estrutura das tabelas, tipos e chaves (`PK`, `FK`). |
| `INSERT INTO` | DML | Inserção de novos registros no banco. |
| `SELECT ... FROM` | DQL | Consulta e extração de dados gravados. |
| `WHERE` | Cláusula | Filtro de condições (ex: valores, status, textos). |
| `ORDER BY (ASC / DESC)` | Cláusula | Ordenação dos resultados (crescente ou decrescente). |
| `INNER JOIN ... ON` | Cláusula | Junção de tabelas com base em chaves relacionadas. |
| `GROUP BY` | Cláusula | Agrupamento de linhas para cálculo de funções agregadas. |
| `COUNT()` / `SUM()` | Funções | Contagem de registros e soma de valores monetários/quantitativos. |
| `UPDATE ... SET` | DML | Alteração de registros existentes (sempre com `WHERE`!). |
| `DELETE FROM` | DML | Remoção de registros do banco (sempre com `WHERE`!). |

---

## ⚙️ Ambiente e Configurações

* **Servidor MySQL:** Versão 8.4 LTS rodando isolada via Docker Compose.
* **Controle Manual:** Gerenciado sob demanda através dos comandos `mysql-start`, `mysql-stop` e `mysql-status`.
* **Interface Gráfica:** MySQL Workbench configurado com sugestões automáticas em letras maiúsculas (`CodeCompletionUpperCaseKeywords`).
* **Segurança de Versão:** Arquivo `.gitignore` ativo para blindar o repositório contra dumps pesados e dados sensíveis.
