create database aula_UNION;
use aula_UNION;

 

CREATE TABLE TB_Assuntos
    (
    IdAssunto int not null auto_increment primary key,
    DescAssunto varchar(25) not null
    );

 

CREATE TABLE TB_Livros 
    (
    IdLivro INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NomeLivro VARCHAR(50) NOT NULL,
    PrecoLivro decimal(6,2) NOT NULL,
    IdAssunto int not null,
    CONSTRAINT FK_TB_LIVROS_TB_ASSUNTOS
    FOREIGN KEY (IdAssunto)
    REFERENCES TB_Assuntos(IdAssunto)
    );
   
INSERT INTO TB_ASSUNTOS (DescAssunto) VALUES 
   ('Literatura'),
   ('Romance'),
   ('Policial'),
   ('Auto ajuda');

 

INSERT INTO TB_Livros (NomeLivro, PrecoLivro, IdAssunto) VALUES 
   ('O meu pé de laranja lima', 25.99, 1),
   ('Dom Quixote', 31.00, 1),  
   ('Guerra e Paz', 26.50, 1),   
   ('Dom Casmurro', 29.90, 2),  
   ('Como eu era antes de você', 33.00, 2),
   ('O silêncio dos inocentes', 32.00, 3),  
   ('Contos de imaginação e mistério', 30.50, 3),   
   ('Crime e Castigo', 35.00, 3),
   ('Os 7 Hábitos das Pessoas Altamente Eficazes', 26.00, 4),    
   ('O Poder da Autorresponsabilidade', 29.00, 4);


-- Exemplo 1
 
SELECT 
	L.NomeLivro            AS 'Título do livro',
        L.PrecoLivro           AS 'Preço Normal',
	L.PrecoLivro * 0.90    AS  'Preço Ajustado',
	A.DescAssunto          AS 'Assunto do livro'
FROM TB_Livros as L INNER JOIN TB_Assuntos as A ON L.IdAssunto = A.IdAssunto
WHERE L.PrecoLivro > 30.00
UNION ALL
SELECT 
	L.NomeLivro,
        L.PrecoLivro,
	L.PrecoLivro * 1.15,
	A.DescAssunto
FROM TB_Livros as L INNER JOIN TB_Assuntos as A ON L.IdAssunto = A.IdAssunto
WHERE A.DescAssunto = 'Auto ajuda'
ORDER BY 3 DESC;

-- Exemplo 2

SELECT 
    L.NomeLivro        AS 'Título do livro',
    L.PrecoLivro           AS 'Preço Normal',
    'Livro caro'       AS 'Resultado'
FROM tb_Livros as L
WHERE L.PrecoLivro >= 30.00
UNION ALL
SELECT 
    L.NomeLivro        AS 'Título do livro',
    L.PrecoLivro           AS 'Preço Normal',
    'Preço razoável'   AS 'Resultado'
FROM tb_Livros as L
WHERE L.PrecoLivro < 30.00
ORDER BY 2  DESC;

-- Exemplo 3

SELECT 
	L.NomeLivro            AS ‘Título do livro’,
        L.PrecoLivro           AS 'Preço Normal',
	A.DescAssunto          AS ‘Assunto do livro’
FROM tb_Livros as L INNER JOIN tb_Assuntos as A ON L.IdAssunto = A.IdAssunto
WHERE A.DescAssunto = 'Romance'

UNION

SELECT 
	L.NomeLivro,
        L.PrecoLivro,
	A.DescAssunto
FROM tb_Livros as L INNER JOIN tb_Assuntos as A ON L.IdAssunto = A.IdAssunto
WHERE L.PrecoLivro >= 28,00
ORDER BY 1  ASC;


