CREATE DATABASE IF NOT EXISTS HOSPITAL;
USE HOSPITAL;
CREATE TABLE IF NOT EXISTS MEDICO(
ID_MEDICO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
CRM INT NOT NULL,
CPF VARCHAR(20) NOT NULL,
ESPECIALIDADE VARCHAR(30) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
TELEFONE VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS CARGO(
id_cargo INT(11) PRIMARY KEY,
nome VARCHAR(45));
CREATE TABLE IF NOT EXISTS riscos_ocupacionais(
id_riscos INT(11) PRIMARY KEY,
nome VARCHAR(45));
CREATE TABLE IF NOT EXISTS resultado_exame(
id_tipo_resultado_exame INT(11) PRIMARY KEY,
tipo VARCHAR(30));
CREATE TABLE IF NOT EXISTS tipo_exame(
id_tipo_exame INT(11) PRIMARY KEY,
tipo VARCHAR(50));
-- APARTIR DE AGORA POSSUEM FK
CREATE TABLE IF NOT EXISTS exame(
id_exame INT(11) PRIMARY KEY,
especialidade VARCHAR(30),
data_realizacao DATE,
CONSTRAINT exa_res FOREIGN KEY(tipo_exame_id_exame) REFERENCES resultado_exame(id_tipo_resultado_exame));
CREATE TABLE IF NOT EXISTS atestado(
id_atestado INT(11) PRIMARY KEY,
resultados_riscos VARCHAR(100),
resultados VARCHAR(100),
observacoes VARCHAR(300),
constraint exa_med FOREIGN KEY(medico_id) REFERENCES medico(id_medico));
CREATE TABLE IF NOT EXISTS funcionario(
id_funcionario INT(11) PRIMARY KEY,
nome VARCHAR(100),
cpf VARCHAR(20),
data_nascimento DATE,
endereço VARCHAR(200),
telefone VARCHAR(20),
CONSTRAINT fun_car FOREIGN KEY(cargo_id_cargo) REFERENCES cargo(id_cargo),
CONSTRAINT fun_emp FOREIGN KEY(empresa_id_empresa) REFERENCES empresa(id_empresa));
CREATE TABLE IF NOT EXISTS empresa(
id_empresa INT(11) PRIMARY KEY,
crpj VARCHAR(20),
nome_fantasia VARCHAR(50),
endereco VARCHAR(200),
telefone VARCHAR(20),
CONSTRAINT emp_emp FOREIGN KEY(empresa_id_empresa) REFERENCES empresa(id_empresa));
-- ENTIDADES ASSOCIATIVAS
CREATE TABLE IF NOT EXISTS cargo_has_riscos_ocupacionais(
PRIMARY KEY(cargo_id_cargo,riscos_ocupacionais_id_riscos),
FOREIGN KEY(cargo_id_cargo) REFERENCES cargo(id_cargo),
FOREIGN KEY(riscos_ocupacionais_id_riscos) REFERENCES risco_ocupacionais(id_riscos));
CREATE TABLE IF NOT EXISTS funcionario_has_exame(
PRIMARY KEY(exame_id_exame,funcionario_id_funcionario),
FOREIGN KEY(exame_id_exame) REFERENCES exame(id_name),
FOREIGN KEY(funcionario_id_funcionario) REFERENCES funcionario(id_funcionario));
CREATE TABLE IF NOT EXISTS exame_has_atestado(
PRIMARY KEY(exame_id_exame, atestado_id_atestado),
FOREIGN KEY(exame_id_exame) REFERENCES exame(id_exame),
FOREIGN KEY(atestado_id_atestado) REFERENCES atestado(id_atestado));
CREATE TABLE IF NOT EXISTS empresa_has_exame(
PRIMARY KEY(exame_id_exame,empresa_id_empresa),
FOREIGN KEY(exame_id_exame) REFERENCES exame(id_exame),
FOREIGN KEY(empresa_id_empresa) REFERENCES empresa(id_empresa));
