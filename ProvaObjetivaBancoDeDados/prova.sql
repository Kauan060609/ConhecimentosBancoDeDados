USE controle_ponto_db;

SHOW TABLES

-- Quest 20
SELECT * 
FROM funcionarios

-- Quest 21
SELECT nome_funcionario 
FROM funcionarios
WHERE salario_funcionario =
(SELECT MAX(salario_funcionario)
 FROM funcionarios)

-- Quest 22
SELECT salario_funcionario 
FROM funcionarios
WHERE salario_funcionario =
(SELECT MIN(salario_funcionario)
 FROM funcionarios)

-- Quest 23
SELECT nome_funcionario
FROM funcionarios
WHERE data_admissao_funcionario > "2022-01-01"

-- Quest 24
SELECT AVG(salario_funcionario)
FROM funcionarios

-- Quest 25
SELECT nome_funcionario
FROM funcionarios
WHERE salario_funcionario > 5000

-- QUEST 26
SELECT D.nome_departamento, COUNT(F.id_departamento)
FROM funcionarios AS F
JOIN departamentos AS D ON D.id_departamento = F.id_departamento
GROUP BY D.nome_departamento

-- QUEST 27
SELECT C.nome_cargo, COUNT(F.id_cargo)
FROM funcionarios AS F
JOIN cargos AS C ON C.id_cargo = F.id_cargo
GROUP BY C.nome_cargo

-- QUEST 28
SELECT descricao_jornada, COUNT(F.id_funcionario)
FROM jornadas_trabalho AS J
JOIN funcionarios_jornadas AS F ON F.id_jornada = J.id_jornada
GROUP BY descricao_jornada

-- QUEST 29
SELECT F.nome_funcionario, COUNT(id_afastamento)
FROM afastamentos AS A
JOIN funcionarios AS F on F.id_funcionario = A.id_funcionario
GROUP BY F.id_funcionario

-- QUEST 30
SELECT observacao_afastamento, COUNT(id_afastamento)
FROM afastamentos 
GROUP BY observacao_afastamento

-- QUEST 31
SELECT D.nome_departamento, AVG(salario_funcionario)
FROM funcionarios AS F
JOIN departamentos AS D ON D.id_departamento = F.id_departamento
GROUP BY nome_departamento
ORDER BY AVG(salario_funcionario) DESC

-- QUEST 32
SELECT nome_funcionario, salario_funcionario
FROM funcionarios
WHERE salario_funcionario > 
(SELECT AVG(salario_funcionario)
 FROM funcionarios)

-- QUEST 33
SELECT nome_funcionario, COUNT(A.id_afastamento)
FROM funcionarios AS F
JOIN afastamentos AS A ON A.id_funcionario = F.id_funcionario
WHERE status_funcionario = 'ATIVO'
GROUP BY nome_funcionario 
HAVING COUNT(A.id_afastamento) 

-- QUEST 34
SELECT COUNT(id_funcionario)
FROM funcionarios AS F
JOIN departamentos AS D ON D.id_departamento = F.id_departamento
WHERE D.nome_departamento = 'Tecnologia da Informação'

-- QUEST 35
SELECT D.nome_departamento, COUNT(id_funcionario)
FROM funcionarios AS F
JOIN departamentos AS D ON D.id_departamento = F.id_departamento
GROUP BY D.nome_departamento
HAVING COUNT(id_funcionario) > 2

-- QUEST 36
SELECT descricao_jornada, count(F.id_funcionario)
FROM jornadas_trabalho AS J
JOIN funcionarios_jornadas AS F ON F.id_jornada = J.id_jornada
GROUP BY descricao_jornada

-- QUEST 37
SELECT DISTINCT id_funcionario
FROM registros_ponto AS R
JOIN ajustes_ponto AS A ON R.id_registro_ponto = A.id_registro_ponto
WHERE A.status_ajuste = 'APROVADO'

-- QUEST 38
SELECT nome_funcionario
FROM funcionarios AS F
JOIN afastamentos AS A ON A.id_funcionario = F.id_funcionario
WHERE salario_funcionario > 
(SELECT AVG(salario_funcionario)
 FROM funcionarios)
 GROUP BY nome_funcionario
 HAVING COUNT(A.id_afastamento) > 0


-- QUEST 39
SELECT nome_funcionario
FROM funcionarios
WHERE data_admissao_funcionario = 
(SELECT MIN(data_admissao_funcionario)
 FROM funcionarios)

-- QUEST 40 
SELECT D.nome_departamento, COUNT(id_funcionario)
FROM funcionarios AS F
JOIN departamentos AS D ON D.id_departamento = F.id_departamento
WHERE status_funcionario = 'ATIVO'
GROUP BY D.id_departamento

-- QUEST 41
SELECT nome_departamento, MAX(salario_funcionario)
FROM departamentos AS D
JOIN funcionarios AS F ON F.id_departamento = D.id_departamento
GROUP BY nome_departamento
ORDER BY nome_departamento DESC LIMIT 1

-- QUEST 42
SELECT nome_departamento, SUM(salario_funcionario)
FROM departamentos AS D
JOIN funcionarios AS F ON F.id_departamento = D.id_departamento
GROUP BY nome_departamento
ORDER BY nome_departamento DESC LIMIT 1

-- QUEST 43
SELECT nome_funcionario
FROM funcionarios
WHERE salario_funcionario > 
(SELECT AVG(salario_funcionario)
 FROM funcionarios
 WHERE id_departamento)