SELECT * FROM produtos;
 TRUNCATE produtos;
-- ALTER TABLE -> ALTERA ESTRUTURA 
-- ALTER TABLE NOME_TABELA ADD NOME DA COLUNA <TIPO>[RESTRICAO]
 ALTER TABLE produtos ADD DATAFABRI DATE NOT NULL;

 ALTER TABLE produtos ADD obs_produto TEXT;

  ALTER TABLE produtos MODIFY validade DATETIME NOT NULL;

  ALTER TABLE produtos DROP COLUMN DATAFABRI;

  --INSERT 
  INSERT INTO produtos VALUES
  -- INSERIR OS VALORES EM ORDEM
  -- COLOCAR TODOS OS VALORES
  (DEFAULT, 'Abacaxi', 'Abaloco', 90.99, 'S', '2026-04-04', 'not obs'),
  (DEFAULT, 'Abacaxi', 'Abaloco', 90.99, 'S', '2026-04-04', 'not obs'),
  (DEFAULT, 'Abacaxi', 'Abaloco', 90.99, 'S', '2026-04-04', 'not obs');