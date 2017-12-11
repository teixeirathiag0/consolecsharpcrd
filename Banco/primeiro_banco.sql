--CREATE DATABASE db_Biblioteca;

--use db_Biblioteca
/*
CREATE TABLE tbl_Livro(
	ID_Livro SMALLINT PRIMARY KEY IDENTITY(100,1),
	Nome_Livro VARCHAR(50) NOT NULL,
	ISBN VARCHAR(30) NOT NULL UNIQUE,
	ID_Autor SMALLINT NOT NULL,
	Data_Pub DATETIME NOT NULL,
	Preco_Livro MONEY NOT NULL
)


CREATE TABLE tbl_autores(
	ID_Autor SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nome_Autor VARCHAR(50),
	Sobrenome_Autor VARCHAR(60)
)

CREATE TABLE tbl_editoras(
	ID_Editora SMALLINT PRIMARY KEY IDENTITY,
	Nome_Editora VARCHAR(50) NOT NULL
)

ALTER TABLE tbl_Livro
DROP COLUMN ID_Autor;

ALTER TABLE tbl_Livro
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY(ID_Autor)
REFERENCES tbl_autores;

ALTER TABLE tbl_Livro
ALTER COLUMN ID_Autor SMALLINT

ALTER TABLE tbl_Livro
ADD ID_Editora SMALLINT NOT NULL
CONSTRAINT fk_id_editora FOREIGN KEY(ID_Editora)
REFERENCES tbl_editoras;
*/

SELECT * FROM tbl_autores;
SELECT * FROM tbl_Livro;
SELECT * FROM tbl_editoras;


--FAZENDO AS INSERÇÕES
/*

INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('Stephen','King');
INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('Carl','Sagan');
INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('Neil','Gaiman');
INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('Paul','Deitel');
INSERT INTO tbl_autores(Nome_Autor, Sobrenome_Autor) VALUES ('Yeshua','Hamashia');


INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Copel');
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Saint');
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Rocco');
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Pearson');
INSERT INTO tbl_editoras(Nome_Editora) VALUES ('Madras');


INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('O Iluminado', '43243232','20151104', 57.34,1,1);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('Pale Blue Dot', '53263432','19880508', 89.90,2, 2);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('O Oceano no Fim do Caminho', '23256232','20110514', 30.00 ,3, 3);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('Java, Como Programar', '13263232','20000812', 310.60,4, 4);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('C, Como Programar', '18269232','19950103', 287.30,4, 4);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('O Iluminado', '65243232','20111207', 57.34,5, 5);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('Use a cabeça, JQuery!', '34269232','20130306', 25.90,NULL, 4);
INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) VALUES ('Arduíno Básico', '45243232','20151207', 70.00,NULL, 5);
*/


/*
--SELECT DISTINCT

SELECT DISTINCT ID_Autor FROM tbl_Livro;
*/


/*
--ORDER BY (usado para ordenar os valores da tabela, sendo em decrescente ou crescente)
SELECT * FROM tbl_Livro ORDER BY Nome_Livro, Preco_Livro ASC;
*/

/*
--TRUNCATE (usado para limpar os dados da tabela, sem necessáriamente excluir a mesma)
TRUNCATE TABLE tbl_Livro;
*/

/*
--UPDATE
	UPDATE tbl_Livro
	SET Preco_Livro = 50.00
		WHERE ID_Autor = 5;
*/

/*
--SELECT TOP
SELECT TOP 50 PERCENT *
FROM tbl_Livro;

ou

SELECT TOP 3 *
FROM tbl_Livro;
*/


/*
INNER JOIN e ALIAS

SELECT te.Nome_Editora, ta.Nome_Autor, ta.Sobrenome_Autor
	FROM tbl_Livro AS tl
		INNER JOIN tbl_editoras AS te
			ON tl.ID_Editora = te.ID_Editora
		INNER JOIN tbl_autores AS ta
			ON tl.ID_Autor = ta.ID_Autor;
*/

/*

UNION -- Combinar o conjunto de resultados de dois ou mais SELECTS

SELECT tl.Nome_Livro, tl.Preco_Livro
	FROM tbl_Livro AS tl
UNION --Poderia usar 'UNION ALL' para mostrar valores repetidos
SELECT te.Nome_Editora, te.ID_Editora
	FROM tbl_editoras AS te;

*/
/*
SELECT tl.ID_Livro,tl.Nome_Livro, tl.ISBN, ta.Nome_Autor
	INTO Livro_ISBN
		FROM tbl_Livro as tl
			INNER JOIN tbl_autores ta
				ON tl.ID_Autor = ta.ID_Autor;
*/



/*
	SELECT Nome_Livro as Livro, Preco_Livro as Preço
	FROM tbl_Livro
	WHERE Preco_Livro BETWEEN 30.00 AND 100.00;
*/

/*
	SELECT MIN(Preco_Livro) FROM tbl_Livro
	SELECT MAX(Preco_Livro) FROM tbl_Livro
	SELECT AVG(Preco_Livro) FROM tbl_Livro
	SELECT SUM(Preco_Livro) FROM tbl_Livro
	SELECT COUNT(Preco_Livro) FROM tbl_Livro
*/


/*
	LIKE AND NOT LIKE

	% qualquer cadeia de 0 ou mais caracteres

	_ sublinhado, qualquer caractere único

	[] Qualquer caractere único no intervalo ou conjunto especificado

	[^] Qualquer caractere único que não esteja no intervalo ou conjunto especificado

	o% -> significa alguma cadeia que começa com a letra 'O'

	%o -> alguma cadeia que termina com a letra 'O'

	_a% -> especifica um padrão com as sentenças que tenham a 
	sua segunda letra sendo a letra 'a'


	'[OP]%' -> palavras que começam com esse conjunto
	de caracteres, não importa o que vem depois

	%[OP] -> palavras que terminam com esses caracteres

	LIKE '_i__o' -> primeira letra não importa, nem 3, 4 etc..


*/

/*
--Pegando todos os livros, incluindo os que não tem autor-- (LEFT JOIN)
SELECT *
	FROM tbl_Livro
		LEFT JOIN tbl_autores
			ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor


--Pegando os livros que tem autor--
SELECT *
	FROM tbl_Livro
		INNER JOIN tbl_autores
			ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor


-- Excluindo as Correspondências [apenas livros que não possuem autor]
SELECT *
	FROM tbl_Livro
		LEFT JOIN tbl_autores
			ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor
	WHERE tbl_Livro.ID_Autor IS NULL

*/

/*
--Exemplo de FULL JOIN
SELECT li.Nome_Livro, li.ID_Autor, tba.Nome_Autor
	FROM tbl_Livro AS li
		FULL JOIN tbl_autores AS tba
			ON li.ID_Autor = tba.ID_Autor

--Excluindo Correspondências com FULL JOIN--

SELECT li.Nome_Livro, li.ID_Autor, tba.Nome_Autor
	FROM tbl_Livro AS li
		FULL JOIN tbl_autores AS tba
			ON li.ID_Autor = tba.ID_Autor
	WHERE li.ID_Autor IS NULL OR tba.ID_Autor IS NULL
*/


/*COMANDOS IN e NOT IN

	SÃO USADOS PARA VERIFICAR SE UM DETERMINADO VALOR 
	CORRESPONDE À UMA CONSULTA
	 
	AO INVÉS DE USAR AND ATRIBUTO = '', uso IN ou NOT IN

	-- TAMBÉM PODE SUBSTITUIR O OPERADOR OR PARA QUERIES COM MAIS 
	DE UMA CONDIÇÃO
*/

/*

'IN' e 'NOT IN' SÃO FILTROS

SELECT * 
	FROM tbl_autores ta
		WHERE ta.ID_Autor IN (1,2)
*/

--CREATE RULE r1_preco AS @VALOR > 10.00;

/*	
	UMA SP_BINDRULE é uma PROCEDURE pronta 
	é usado para vincular regras

 --	EXECUTE SP_BINDRULE r1_preco, 'tbl_Livro.Preco_Livro'
*/


/*
	-- CONCATENAÇÃO DE STRINGS --

	É FEITA COM O COMANDO SELECT

	Ex: 
		String1 | coluna + string2 | coluna

		Ex: 

		SELECT Nome_Autor + ' ' + Sobrenome_Autor AS 'Nome Completo' FROM tbl_autores

		Ex 2: 

		SELECT 'Eu gosto do Livro ' + Nome_Livro AS 'Meu Livro' 
	FROM tbl_Livro
		WHERE ID_Autor = 2
*/


/*
	Collation -> Colação/Agrupamento
	Trata-se da codificação dos caracteres em uma ordem padrão

	-- Usado para ver as opções de agrupamento disponíveis
	SELECT * FROM fn_helpcollations()

	--Esquemad e colação usado atualmente pelo servidor
	SELECT SERVERPROPERTY('Collation') AS Current_Collation


	--Alterar o esquema de colações do BDD
	SELECT DATABASEPROPERTYEX('db_Biblioteca','Collation') AS colacao

*/


/*
	CLÁUSULA WITH TIES
	-- Usado para exibir itens adjacentes
	Ex: TOP 4 retorna os 4 primeiros Livros da tabela 'livro' levando em consideração o ID_Editora
	Porém, existem IDs com o mesmo valor, e estes ficarão de fora dos itens retornados, a Cláusula
	WITH TIES faz com que estes itens, (que possuem o mesmo valor de ID_Editora) também sejam inclusos 
	no resultado

	SELECT TOP(4) WITH TIES Nome_Livro, ID_Editora
	FROM tbl_Livro
		ORDER BY ID_Editora ASC
*/

/*
	VIEWS

	Uma View é uma tabela virtual baseada no conjunto de resultados de uma consulta SQL. (Sempre mostra dados atualizados)

	ALTER VIEW vw_LivrosAutores
	AS SELECT tbl_Livro.Nome_Livro AS Livro, tbl_autores.Nome_Autor AS Autor, tbl_autores.Sobrenome_Autor AS Sobrenome, tbl_Livro.Preco_Livro AS Preço
		FROM tbl_Livro
			INNER JOIN tbl_autores
				ON tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

SELECT *
	FROM vw_LivrosAutores
*/


DECLARE @codigo INT
SET @codigo = 100

WHILE @codigo < 106
	BEGIN
		SELECT ID_Livro AS ID, Nome_Livro AS Livro, Preco_Livro AS Preço
		FROM tbl_Livro
			WHERE ID_Livro = @codigo
			SET @codigo = @codigo + 1
				PRINT 'ID' + CAST(@codigo AS VARCHAR(1))
				SET @codigo = ID_Livro
	END;
