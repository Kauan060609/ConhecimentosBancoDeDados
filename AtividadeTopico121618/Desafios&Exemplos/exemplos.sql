-- BASICO
-- CRIAR USUARIOS
CREATE USER 'usuario'@'endereco' IDENTIFIED BY 'senha';
CREATE USER 'teste'@'localhost' IDENTIFIED BY'q1w2e3r4';

-- VER USUARIOS 
SELECT * FROM mysql.user;

-- EXCLUIR USUARIOS 
DROP USER'teste'@'localhost';

SELECT host,user
FROM mysql.user;

---------------------------------------------------------
-- GRANT
-- GRANT CONCERDER PRIVILEGIOS 
GRANT privilegios
ON nome_banco.nome_tabela
TO usuario@endereco;

-- TODOS OS PRIVILEGIOS 
GRANT ALL PRIVILEGES ON *.* TO'teste'@'localhost';

-- ATUALIZAR DADOS DE PRIVILEGIOS
FLUSH PRIVILEGES;

-- EXEMPLO
GRANT CREATE,SELECT,INSERT,UPDATE
ON *.*
TO'teste3'@'localhost';

-- VISUALIZAR PRIVILEGIOS 
SHOW GRANTS;

-- VISUALIZAR PRIVILEGIOS DO USUARIO DESEJADO 
SHOW GRANTS FOR'teste'@'localhost';

-- # Desafio

-- Agora que você já conhece os comandos de gerenciamento de privilégios do MySQL, realize os seguintes exercícios:


-- 1. Conceda todos os privilégios para o usuário criado com o seu nome.
CREATE USER 'kauan'@'localhost' IDENTIFIED BY'123';
GRANT ALL PRIVILEGES ON *.* TO'kauan'@'localhost';

-- 2. Crie uma nova base de dados contendo duas tabelas com pelo menos três colunas cada.
CREATE DATABASE DesafioUsuarios
USE DesafioUsuarios;
CREATE TABLE abc(
    id_abc INT PRIMARY KEY AUTO_INCREMENT,
    oi INT,
    tchau VARCHAR(100),    
    ola VARCHAR(100)
);

CREATE TABLE def(
    id_def INT PRIMARY KEY AUTO_INCREMENT,
    bom_dia INT,
    boa_tarde VARCHAR(100),    
    boa_noite VARCHAR(100)
);

-- 3. Crie um novo usuário chamado **programador**.
CREATE USER 'programador'@'localhost' IDENTIFIED BY '12345'

-- 4. Conceda ao usuário **programador** apenas os privilégios de manipulação de dados (**SELECT**, **INSERT** e **UPDATE**) em apenas uma das tabelas criadas.
GRANT SELECT, INSERT, UPDATE 
ON DesafioUsuarios.abc 
TO programador@localhost

-- 5. Teste as permissões utilizando uma nova conexão e verifique quais operações são permitidas e quais são bloqueadas pelo servidor MySQL.

----------------------------------------------------------------------------

-- REVOKE
REVOKE privilegios
ON nome_banco.nome_tabela
FROM usuario@endereco;

REVOKE ALL PRIVILEGES
ON*.*
FROM'teste'@'localhost';

REVOKE CREATE,SELECT,INSERT,UPDATE
ON*.*
FROM'teste3'@'localhost';

-----------------------------------------------------------------------------------

-- ROLES 
CREATEROLE'app_desenvolvedor',
'app_leitura',
'app_escrita';

-- OQUE AS ROLES TEM ACESSO
GRANT ALL ON vamosla.*TO'app_desenvolvedor';

GRANT SELECT ON vamosla.*TO'app_leitura';

GRANT INSERT,UPDATE,DELETE ON vamosla.* TO'app_escrita';

-- USUARIOS
CREATEUSER'usuario_desenvolvedor'@'localhost';

CREATEUSER'usuario_leitura'@'localhost';

CREATEUSER'usuario_escrita'@'localhost';

-- ASSOSIAÇÃO USUARIO/ROLES

GRANT'app_desenvolvedor'
TO'usuario_desenvolvedor'@'localhost';

GRANT'app_leitura'
TO'usuario_leitura'@'localhost';

GRANT'app_leitura',
'app_escrita'
TO'usuario_escrita'@'localhost';

-- DEFINIR ROLE PADRÃO

SET DEFAULT ROLE'app_escrita'
TO'usuario_escrita'@'localhost';

-- EXCLUIR ROLE 

DROP ROLE'app_leitura',
'app_escrita';

-- VER PERMISSÕES ATRAVÉS DE ROLE ESPECIFICA

SHOW GRANTS FOR'usuario_desenvolvedor'@'localhost'
USING'app_desenvolvedor';