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

-- # Questões Básicas — Subquery como filtro

-- 1. Liste os alunos que possuem a maior idade cadastrada.
SELECT nome, idade 
FROM Alunos
WHERE idade = 
(SELECT MAX(idade) FROM Alunos);
-- 2. Exiba os alunos que possuem idade menor que a média das idades.
SELECT nome, idade
FROM Alunos
WHERE idade < 
(SELECT AVG(idade) FROM Alunos);

-- 3. Mostre os cursos que possuem a maior carga horária.
SELECT nome_curso,carga_horaria
FROM Cursos
WHERE carga_horaria = 
(SELECT MAX(carga_horaria) FROM Cursos);

-- 4. Liste os alunos que possuem nota igual à maior nota registrada nas matrículas.
SELECT nota 
FROM Matriculas
WHERE nota =
(SELECT MAX(nota) FROM Matriculas);

-- 5. Exiba os alunos que possuem nota menor que a média geral das notas.
SELECT nome, M.nota
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_matricula = A.id_aluno
WHERE nota <
(SELECT AVG(nota) FROM Matriculas);
-- 6. Mostre os cursos cuja carga horária seja maior que a média das cargas horárias.
SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria >
(SELECT AVG(carga_horaria) FROM Cursos);
-- 7. Liste os alunos que possuem exatamente a menor idade cadastrada.
SELECT nome, idade
FROM Alunos
WHERE idade = 
(SELECT MIN(idade) FROM Alunos);
-- 8. Exiba as matrículas cuja quantidade de faltas seja maior que a média de faltas.
SELECT id_matricula, faltas
FROM Matriculas
WHERE faltas > 
(SELECT AVG(faltas) FROM Matriculas);
-- 9. Mostre os cursos que possuem carga horária diferente da maior carga horária.
SELECT nome_curso, carga_horaria
FROM Cursos
WHERE carga_horaria !=
(SELECT MAX(carga_horaria) FROM Cursos);
-- 10. Liste os alunos que possuem nota igual à menor nota registrada.
SELECT nota
FROM Matriculas
WHERE nota =
(SELECT MIN(nota) FROM Matriculas);

-- # Questões Intermediárias — Subquery com IN

-- 1. Liste os nomes dos alunos que possuem matrícula cadastrada.
SELECT nome
FROM Alunos
WHERE id_aluno IN
(SELECT id_aluno FROM Matriculas);
-- 2. Exiba os cursos que possuem alunos matriculados.
SELECT nome_curso
FROM Cursos
WHERE id_curso IN 
(SELECT id_curso FROM Matriculas);
-- 3. Mostre os alunos que estão matriculados no curso “Python”.
SELECT nome 
FROM Alunos
WHERE id_aluno IN 
(
SELECT id_aluno 
FROM Matriculas AS M
JOIN Cursos AS C ON C.id_curso = M.id_curso
WHERE C.nome_curso = 'Python');

-- 4. Liste os alunos matriculados em cursos com carga horária maior que 60 horas.
SELECT nome
FROM Alunos
WHERE id_aluno IN 
(SELECT id_aluno
FROM Matriculas
WHERE id_curso IN
(
SELECT id_curso
FROM Cursos
WHERE carga_horaria > 60
));
-- 5. Exiba os cursos nos quais existem alunos com nota maior que 8.
SELECT nome_curso
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
WHERE M.nota > 8;

-- 6. Mostre os alunos que possuem mais de uma matrícula.
SELECT NOME 
FROM Alunos
WHERE id_aluno IN 
(
SELECT id_aluno
FROM Matriculas
GROUP BY id_aluno
HAVING COUNT(id_matricula) > 1
);
-- 7. Liste os cursos que NÃO possuem matrículas cadastradas.
SELECT id_curso
FROM Cursos
WHERE id_curso NOT IN 
(
SELECT id_curso
FROM Matriculas
);
-- 8. Exiba os alunos que possuem faltas maiores que 5 em alguma matrícula.
SELECT nome
FROM Alunos
WHERE id_aluno IN
(
SELECT id_aluno
FROM Matriculas
WHERE faltas > 5
);
-- 9. Mostre os cursos frequentados por alunos da cidade de Curitiba.
SELECT nome_curso
FROM Cursos
WHERE id_curso IN 
(
SELECT id_curso
FROM Matriculas AS M
JOIN Alunos AS A ON A.id_aluno = M.id_aluno
WHERE A.cidade = 'Curitiba'
);
-- 10. Liste os alunos matriculados no curso com maior carga horária.
SELECT nome
FROM Alunos
WHERE id_aluno IN 
(
SELECT id_aluno
FROM Matriculas
WHERE id_curso IN 
(
SELECT id_curso 
FROM Cursos 
WHERE carga_horaria =
(
SELECT MAX(carga_horaria)
FROM Cursos
)
)
);

-- # Questões Avançadas — Subquery com operadores de comparação

-- 1. Exiba os alunos cuja idade seja maior que a média de idade dos alunos de São Paulo.
SELECT nome
FROM Alunos
WHERE idade >
(
SELECT AVG(idade)
FROM Alunos
WHERE cidade = 'São Paulo'
);

-- 2. Liste os cursos cuja média de notas seja maior que a média geral das notas.
SELECT nome_curso
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY C.id_curso, C.nome_curso
HAVING AVG(nota) > 
(
SELECT AVG(nota)
FROM Matriculas
);
-- 3. Mostre os alunos cuja soma de faltas seja maior que a média total de faltas.
SELECT nome, M.faltas
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
WHERE M.faltas > 
(SELECT AVG(faltas)
FROM Matriculas);
-- 4. Exiba os cursos cuja maior nota registrada seja igual à maior nota do sistema.
SELECT nome_curso, M.nota
FROM Cursos AS C 
JOIN Matriculas AS M ON M.id_curso = C.id_curso
WHERE M.nota =
(SELECT MAX(nota)
FROM Matriculas)

-- 5. Liste os alunos cuja média de notas seja menor que a média geral dos alunos.
SELECT nome, AVG(M.nota) AS MEDIA_ALUNO
FROM Alunos AS A 
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY A.id_aluno, nome
HAVING AVG(nota) < 
(SELECT AVG(nota)
FROM Matriculas)

-- 6. Mostre os cursos cuja quantidade de matrículas seja maior que a média de matrículas dos cursos.
SELECT nome_curso, COUNT(M.id_matricula) AS QUANTIDADE_Matriculas
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY C.id_curso,nome_curso
HAVING COUNT(M.id_matricula) >
(SELECT COUNT(id_matricula) FROM Matriculas) / 
(SELECT COUNT(id_curso) FROM Cursos);

-- 7. Exiba os alunos que possuem nota maior que todas as notas do curso “Banco de Dados”.
SELECT nome, M.nota
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
WHERE M.nota > ALL
(SELECT nota 
FROM Matriculas AS M 
JOIN Cursos AS C ON C.id_curso = M.id_curso
WHERE C.nome_curso = 'Banco de Dados')

-- 8. Liste os cursos cuja menor nota seja maior que a média geral das menores notas dos cursos.
SELECT nome_curso, MIN(M.nota)
FROM Cursos AS C 
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY C.id_curso, nome_curso 
HAVING MIN(M.nota) > 
(SELECT AVG(menor_nota_curso)
FROM 
(
SELECT MIN(nota) AS menor_nota_curso
FROM Matriculas
GROUP BY id_curso
) AS sub_tabela
);

-- 9. Mostre os alunos cuja idade seja igual à idade média dos alunos.
SELECT nome, idade
FROM Alunos 
WHERE idade = 
(SELECT AVG(idade)
 FROM Alunos)

-- 10. Exiba os cursos cuja carga horária seja menor que a maior carga horária cadastrada.
SELECT nome_curso 
FROM Cursos 
WHERE carga_horaria < 
(SELECT MAX(carga_horaria) 
FROM Cursos)

-- # Questões — Subquery como nova coluna

-- 1. Liste os alunos e exiba ao lado a quantidade total de matrículas de cada aluno.
SELECT nome, COUNT(M.id_matricula)
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome;

-- 2. Exiba os cursos e mostre ao lado a média das notas de cada curso.
SELECT nome_curso, AVG(M.nota) AS Media_nota_curso
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;

-- 3. Liste os alunos e mostre a soma total de faltas de cada um.
SELECT nome, COUNT(faltas) AS quantidade_faltas
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome;

-- 4. Exiba os cursos e mostre quantos alunos estão matriculados em cada curso.
SELECT nome_curso, COUNT(id_matricula) AS QUANTIDADE_Matriculas_cursos 
FROM Cursos AS C 
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;

-- 5. Liste os alunos e apresente sua maior nota registrada.
SELECT nome, MAX(M.nota) AS  maior_nota
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome;

-- 6. Exiba os cursos e mostre a menor nota registrada em cada curso.
SELECT nome_curso, MIN(M.nota)
FROM Cursos AS C 
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso

-- 7. Liste os alunos e mostre a média de notas de cada um em uma nova coluna chamada Media_Aluno.
SELECT nome, AVG(M.nota) AS Media_Aluno 
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome

-- 8. Exiba os cursos e apresente o total de faltas registradas em cada curso.
SELECT nome_curso, COUNT(faltas) AS quantidade_faltas_cursos
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso;

-- 9. Liste os alunos e mostre a quantidade de cursos diferentes em que estão matriculados.
SELECT nome, COUNT(M.id_curso)
FROM Alunos AS A 
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome

-- 10. Exiba os cursos e mostre a quantidade de alunos aprovados (nota maior ou igual a 7).
SELECT nome, AVG(M.nota) AS Media_Aluno
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome
HAVING AVG(M.nota) > 7;




-- # Questões Desafio — Misturando GROUP BY + HAVING + SUBQUERY

-- 1. Liste as cidades cuja média de idade seja maior que a média geral de idade dos alunos.
SELECT cidade, AVG(idade) AS MEDIA_IDADE
FROM Alunos
GROUP BY cidade
HAVING AVG(idade) > 
(SELECT AVG(idade)
FROM Alunos);

-- 2. Exiba os cursos cuja média de notas seja maior que a média das médias dos cursos.
SELECT nome_curso, AVG(M.nota) AS Media_nota_curso
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso
HAVING AVG(M.nota) > 
(SELECT AVG(media_cursos)
 FROM (
    SELECT AVG(M.nota) AS media_cursos
    FROM Matriculas
    GROUP BY id_matricula
 ) AS Sub_tabela_media
    )

-- 3. Mostre os alunos cuja soma de faltas seja maior que a soma média de faltas dos alunos.
SELECT nome, COUNT(M.faltas)
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome
HAVING COUNT(M.faltas) > 
(SELECT SUM(media_faltas)
 FROM (
    SELECT AVG(faltas) AS media_faltas 
    FROM Matriculas
    GROUP BY id_aluno
 ) AS Sub_somaFaltas)

-- 4. Liste os cursos que possuem quantidade de matrículas acima da média de matrículas por curso.
SELECT nome_curso, COUNT(M.id_matricula)
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY nome_curso
HAVING COUNT(M.id_matricula) > 
 (SELECT AVG(contagem_cursos)
  FROM (
    SELECT COUNT(id_matricula) AS contagem_cursos
    FROM Matriculas
    GROUP BY id_curso
  ) AS Sub_contagem
  )


-- 5. Exiba os alunos cuja média de notas seja maior que a média dos alunos da cidade de São Paulo.
SELECT nome, AVG(M.nota) AS Media_notas
FROM Alunos AS A 
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY nome
HAVING AVG(M.nota) > 
(SELECT AVG(M.nota)
 FROM Alunos AS A 
 JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
 WHERE cidade = 'São Paulo'
 GROUP BY cidade
 )

-- 6. Mostre os cursos cuja carga horária seja maior que a média das cargas horárias dos cursos com matrícula.
SELECT C.id_curso, C.nome_curso, C.carga_horaria
FROM Cursos AS C
WHERE C.carga_horaria > (
    SELECT AVG(C2.carga_horaria)
    FROM Cursos AS C2
    JOIN Matriculas AS M ON M.id_curso = C2.id_curso
)

-- 7. Liste os alunos que possuem mais matrículas que a média de matrículas dos alunos.
SELECT A.id_aluno, A.nome, COUNT(M.id_matricula) AS Total_Matriculas
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY A.id_aluno, A.nome
HAVING COUNT(M.id_matricula) > (
    SELECT AVG(Total_Aluno)
    FROM (
        SELECT COUNT(id_matricula) AS Total_Aluno
        FROM Matriculas
        GROUP BY id_aluno
    ) AS Sub
)

-- 8. Exiba os cursos cuja maior nota seja inferior à maior nota geral do sistema.
SELECT C.id_curso, C.nome_curso, MAX(M.nota) AS Maior_Nota_Curso
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
GROUP BY C.id_curso, C.nome_curso
HAVING MAX(M.nota) < (
    SELECT MAX(nota)
    FROM Matriculas
)

-- 9. Mostre os alunos cuja média de faltas seja menor que a média geral de faltas.
SELECT A.id_aluno, A.nome, AVG(M.faltas) AS Media_Faltas_Aluno
FROM Alunos AS A
JOIN Matriculas AS M ON M.id_aluno = A.id_aluno
GROUP BY A.id_aluno, A.nome
HAVING AVG(M.faltas) < (
    SELECT AVG(faltas)
    FROM Matriculas
)

-- 10. Liste os cursos cuja quantidade de alunos aprovados seja maior que a média de aprovados dos cursos.
SELECT C.id_curso, C.nome_curso, COUNT(M.id_matricula) AS Qtd_Aprovados
FROM Cursos AS C
JOIN Matriculas AS M ON M.id_curso = C.id_curso
WHERE M.nota >= 7.0
GROUP BY C.id_curso, C.nome_curso
HAVING COUNT(M.id_matricula) > (
    SELECT AVG(Total_Aprovados)
    FROM (
        SELECT COUNT(id_matricula) AS Total_Aprovados
        FROM Matriculas
        WHERE nota >= 7.0
        GROUP BY id_curso
    ) AS Sub
)