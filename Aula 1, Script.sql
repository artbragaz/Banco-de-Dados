-- 1 PASSO:
-- CRIAR A BASE DE DADOS (CREATE SCHEMA OOU CREATE DATABASE)
CREATE DATABASE IF NOT EXISTS PROVA_SI1N;
-- OU CREATE SCHEMA IF NOT EXISTS PROVA_S1IN;
-- IF NOT EXISTS: NÃO CRIAR SE JÁ HOUVER CRIADO

-- PASSO 2:
-- CARREGAR A BASE DE DADOS CRIADA PARA USO
USE PROVA_SI1N;

-- PASSO 3:
-- CRIAR AS TABELAS SEM CHAVE ESTRANGEIRA
CREATE TABLE IF NOT EXISTS ALUNO(
MATRICULA INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL);

CREATE TABLE IF NOT EXISTS PROFESSOR(
NUM_ID INT PRIMARY KEY,
NOME VARCHAR (100) NOT NULL,
ESPECIALIZACAO  VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS CURSO(
COD_CURSO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
DURACAO VARCHAR(50) NOT NULL);

-- PASSO 4:
-- CRIAR AS TABELAS COM CHAVE ESTRANGEIRA
CREATE TABLE IF NOT EXISTS DISCIPLINA(
CODIGO INT PRIMARY KEY,
NOME_DISC VARCHAR(100) NOT NULL,
CARGA_HORARIA INT NOT NULL,
COD_CURSO INT NOT NULL,
CONSTRAINT CUR_DIS FOREIGN KEY(COD_CURSO) REFERENCES CURSO(COD_CURSO));

-- PASSO 5:
-- CRIAR AS ENTIDADES ASSOCIATIVAS, SE HOUVER.
CREATE TABLE IF NOT EXISTS ALUNOS_DISCIPLINAS(
MATRICULA INT,
CODIGO INT,
PRIMARY KEY(MATRICULA,CODIGO),
FOREIGN KEY(MATRICULA) REFERENCES ALUNO(MATRICULA),
FOREIGN KEY (CODIGO) REFERENCES DISCIPLINA(CODIGO));

CREATE TABLE IF NOT EXISTS ALUNO_CURSO(
MATRICULA INT,
COD_CURSO INT,
PRIMARY KEY(MATRICULA,COD_CURSO),
FOREIGN KEY(MATRICULA) REFERENCES ALUNO(MATRICULA),
FOREIGN KEY(COD_CURSO) REFERENCES CURSO(COD_CURSO));
-- CHAVE ESTRANGEIRA(ATRIBUTO) REFERENCIA TABELA(CHAVE_PRIMARIA);

CREATE TABLE IF NOT EXISTS CURSO_PROFESSOR(
NUM_REG INT,
COD_CURSO INT,
PRIMARY KEY(NUM_REG,COD_CURSO),
FOREIGN KEY(NUM_REG) REFERENCES PROFESSOR(NUM_ID),
FOREIGN KEY(COD_CURSO) REFERENCES CURSO(COD_CURSO));

