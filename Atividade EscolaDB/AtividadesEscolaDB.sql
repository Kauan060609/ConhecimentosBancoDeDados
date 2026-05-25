DROP DATABASE IF EXISTS EscolaDB;
CREATE DATABASE EscolaDB;
USE EscolaDB;

CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    idade INT
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    faltas INT,
FOREIGN KEY (id_aluno)REFERENCES Alunos(id_aluno),
FOREIGN KEY (id_curso)REFERENCES Cursos(id_curso)
);

INSERT INTO Alunos (nome, cidade, idade)VALUES
('Carlos','São Paulo',18),
('Mariana','Curitiba',22),
('João','Florianópolis',19),
('Fernanda','São Paulo',25),
('Lucas','Rio de Janeiro',20),
('Patricia','Curitiba',21),
('Ana','Porto Alegre',23),
('Bruno','São Paulo',24);

INSERT INTO Cursos (nome_curso, carga_horaria)VALUES
('Python',40),
('Banco de Dados',60),
('Java',80),
('Data Science',100);

INSERT INTO Matriculas (id_aluno, id_curso, nota, faltas)VALUES
(1,1,8.5,2),
(1,2,7.0,5),
(2,1,9.5,1),
(2,4,8.0,4),
(3,2,6.5,6),
(3,3,7.5,3),
(4,4,9.0,0),
(5,1,5.5,10),
(5,2,6.0,7),
(6,3,8.5,2),
(7,4,7.0,5),
(8,2,9.5,1);

-- Básicas

-- 1. Liste todos os alunos cadastrados.
SELECT * FROM Alunos;


-- 2. Liste apenas os nomes dos alunos.
SELECT nome 
FROM Alunos;

-- 3. Exiba todos os cursos cadastrados.
SELECT nome_curso
FROM Cursos;
-- 4. Mostre os alunos que moram em São Paulo.
SELECT nome, cidade 
FROM Alunos
WHERE cidade IN('São Paulo')

-- 5. Liste os alunos com idade maior que 20 anos.
SELECT nome, idade
FROM Alunos
WHERE idade>20;

-- 6. Exiba os cursos com carga horária maior que 50 horas.
SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria > 50;
-- 7. Mostre os alunos com idade entre 18 e 22 anos.
SELECT nome, idade
FROM Alunos
WHERE idade BETWEEN 18 AND 22;

-- 8. Liste os alunos da cidade de Curitiba.
SELECT nome, cidade
FROM Alunos
WHERE cidade IN('Curitiba');

-- 9. Exiba os alunos cuja idade seja menor que 21 anos.
SELECT nome, idade
FROM Alunos 
WHERE idade<21;

-- 10. Liste todas as matrículas cadastradas.
SELECT * FROM Matriculas;

-- Intermediárias

-- 1. Mostre os alunos que possuem nota maior que 8.
SELECT nome, nota
FROM Alunos AS A
Join Matriculas AS M ON M.id_aluno = A.id_aluno
WHERE M.nota>8;

-- 2. Liste os alunos que tiveram mais de 5 faltas.
SELECT nome, faltas 
FROM Alunos AS A
Join Matriculas AS M ON M.id_aluno = A.id_aluno
WHERE M.faltas>5;

-- 3. Exiba os cursos com carga horária igual a 80 horas.
SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria>80;
-- 4. Mostre os alunos que NÃO moram em São Paulo.
SELECT nome, cidade
FROM Alunos
WHERE NOT cidade IN('São Paulo');
-- 5. Liste os alunos cujo nome começa com a letra “A”.
SELECT nome
FROM Alunos 
WHERE nome LIKE'A%';
-- 6. Exiba os alunos cujo nome termina com a letra “a”.
SELECT nome
FROM Alunos 
WHERE nome LIKE'%A';
-- 7. Liste os cursos cujo nome contenha a palavra “Dados”.
SELECT nome_curso
FROM Cursos
WHERE nome_curso LIKE'%DADOS%';
-- 8. Mostre as matrículas com nota entre 7 e 9.
SELECT * 
FROM Matriculas
WHERE nota BETWEEN 7 AND 9;
-- 9. Liste os alunos que possuem exatamente 20 anos.
SELECT nome, idade
FROM Alunos
WHERE idade IN(20);
-- 10. Exiba os cursos com carga horária menor ou igual a 60 horas.
SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria<=60;

-- Questões com GROUP BY

-- 1. Mostre quantos alunos existem em cada cidade.
SELECT nome, cidade,
COUNT(nome) AS TotalAlunos
FROM Alunos
GROUP BY nome, cidade;

-- 2. Exiba a média de idade dos alunos agrupada por cidade.
SELECT cidade,
AVG(idade) AS MediaIdade
FROM Alunos
GROUP BY cidade;
-- 3. Mostre a quantidade de matrículas por curso.
SELECT nome_curso,
COUNT(M.id_aluno) AS QNTD_MATRICULAS
FROM Cursos as C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;


-- 4. Exiba a média das notas por curso.
SELECT nome_curso,
AVG(M.nota) AS MEDIA_NOTA
FROM Cursos AS C 
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;
-- 5. Mostre o total de faltas agrupado por curso.
SELECT nome_curso,
SUM(M.faltas) AS TOTAL_FALTAS
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;

-- 6. Liste a maior nota obtida em cada curso.
SELECT nome_curso,
MAX(M.nota) AS MAIOR_NOTA
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;
-- 7. Exiba a menor nota registrada em cada curso.
SELECT nome_curso,
MIN(M.nota) AS MAIOR_NOTA
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;
-- 8. Mostre a soma total das faltas agrupadas por aluno.
SELECT nome,
SUM(M.faltas) AS TOTAL_FALTAS
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome;
-- 9. Exiba a média de notas agrupada por aluno.
SELECT nome,
AVG(M.nota)
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome;
-- 10. Mostre quantos alunos existem em cada faixa etária.
SELECT idade,
COUNT(idade)
FROM Alunos
GROUP BY idade;

-- # Questões Avançadas — HAVING e ORDER BY

-- 1. Liste as cidades que possuem mais de 2 alunos.
SELECT cidade,
COUNT(id_aluno) AS QNTD_ALUNOS
FROM Alunos
GROUP BY cidade
HAVING COUNT(id_aluno)>2;

-- 2. Exiba os cursos cuja média de notas seja maior que 8.
SELECT nome_curso,
AVG(M.nota)
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso
HAVING AVG(M.nota)>8;
-- 3. Mostre os cursos que possuem mais de 2 matrículas.
SELECT nome_curso,
COUNT(id_matricula)
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso
HAVING COUNT(id_matricula)>2;
-- 4. Liste os alunos cuja soma de faltas seja maior que 5.
SELECT nome, faltas
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
WHERE M.faltas > 5;
-- 5. Exiba os cursos cuja menor nota seja maior que 6.
SELECT nome_curso,
MIN(M.nota)
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso
HAVING MIN(M.nota)>6;
-- 6. Mostre os cursos ordenados pela carga horária em ordem decrescente.
SELECT nome_curso, carga_horaria
FROM Cursos
ORDER BY carga_horaria;
-- 7. Liste os alunos ordenados por idade do maior para o menor.
SELECT nome, idade
FROM Alunos
ORDER BY idade DESC;
-- 8. Exiba a média de notas por curso ordenada da maior para a menor.
SELECT nome_curso, nota
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
ORDER BY M.nota DESC;

-- 9. Mostre as cidades ordenadas pela quantidade de alunos.
SELECT cidade,
COUNT(nome)
FROM Alunos
GROUP BY cidade
ORDER BY COUNT(nome);
-- 10. Liste os alunos com média de notas maior que 7 ordenados pela média decrescente.
SELECT nome,
AVG(M.nota)
FROM Alunos AS A
JOIN Matriculas as M ON M.id_aluno = A.id_aluno
GROUP BY nome
ORDER BY AVG(M.nota) DESC;
