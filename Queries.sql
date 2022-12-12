SELECT *
FROM book
WHERE ISBN = $1;

SELECT *
FROM book
WHERE Bname = $1;

SELECT *
FROM book
WHERE Bauthor = $1;

SELECT *
FROM book
WHERE Btitle = $1;

SELECT * 
FROM publisher
WHERE Pname = $1;