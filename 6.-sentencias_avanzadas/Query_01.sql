DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

-- Two ways to get all the rows from a table
-- As a table
SELECT * FROM authors;
-- As a card
SELECT * FROM authors\G;

-- Returns all the rows that starts with 'Harry' in its title
SELECT * FROM authors AS a WHERE a.title LIKE 'Harry%';

-- Returns all the rows that starts with 'Harry' in its title in card format
SELECT * FROM authors AS a WHERE a.title LIKE 'Harry%'\G;

-- Returns all the rows that ends with 'anillo' in its title
SELECT * FROM authors AS a WHERE a.title LIKE '%anillo';

-- Returns all the titles that have 5 characters and have a 'b' in the third character
SELECT * FROM authors AS a WHERE a.title LIKE '__b__';

-- Returns all the titles that have an 'a' in the second character
SELECT * FROM authors AS a WHERE a.title LIKE '_a%';

-- Returns all the titles that have an 'a' in the second character and have a 'o' in the fifth character
SELECT * FROM authors AS a WHERE a.title LIKE '_a__o%';

-- Returns all the titles that starts with 'a' or 'h' in its title
SELECT * FROM authors AS a WHERE a.title LIKE 'A%' OR a.title LIKE 'H%';
SELECT * FROM authors AS a WHERE LEFT(a.title, 1) = 'A' OR LEFT(a.title, 1) = 'H';

-- Returns all the titles that starts with at least one character from a list
SELECT * FROM authors AS a WHERE LEFT(a.title, 1) IN ('A', 'H', 'E');
SELECT * FROM authors AS a WHERE a.title REGEXP '^[AHE]';

-- Returns all the rows orders by the title
SELECT * FROM authors AS a ORDER BY a.title DESC;
SELECT a.book_id, a.title FROM authors AS a ORDER BY a.book_id, a.title DESC;

-- Returns the first 10 titles of the table
SELECT * FROM authors AS a LIMIT 10;

-- Returns the first 10 titles of the table where the author_id = 7
SELECT * FROM authors AS a WHERE a.author_id = 7 LIMIT 10;

-- Returns a portion of rows [starts from row 5] 
-- from the table where the author_id = 7
-- LIMIT 'from_row', 'amount_rows'
SELECT * FROM authors AS a WHERE a.author_id = 7 LIMIT 5, 10;

-- Aggregation functions
-- Returns the sum of the columns
SELECT SUM(b.sales) AS amount_sales FROM books AS b;

-- Returns the average of the columns
SELECT AVG(b.sales) AS average_sales FROM books AS b;

-- Returns the minimum of the columns
SELECT MIN(a.pages) AS minimum_pages FROM authors AS a;

-- Returns the maximum of the columns
SELECT MAX(a.pages) AS maximum_pages FROM authors AS a;

-- Returns the count of the rows
SELECT COUNT(*) AS amount_rows FROM authors AS a;

-- Returns the count of the rows that the authors have an alias
SELECT COUNT(a.alias) AS amount_rows FROM authors AS a;

-- With the aggregations functions we can work with the 
-- registers or cells that aren't NULL

-- Returns all the sales of the books, grouped by authors
-- And order by the amount of sales DESC
SELECT b.author_id, SUM(b.sales) AS amount_sales 
FROM books AS b 
GROUP BY b.author_id
ORDER BY amount_sales DESC;

-- Having clause
-- Returns all the sales of the books, grouped by authors
-- that have more than 5000 sales
-- And order by the amount of sales DESC
-- Remember that we can't conditionate an aggregation function
-- With a where clause, so we have to use the having clause
SELECT b.author_id, SUM(b.sales) AS amount_sales
FROM books AS b
GROUP BY b.author_id
HAVING SUM(b.sales) > 5000
ORDER BY amount_sales DESC;

-- UNION operator

-- Returns the fullname of the authors and the users
-- the alias and the amount of columns MUST be the same
SELECT CONCAT(a.name, ' ', a.surname) AS fullname
FROM `authors` AS a
UNION
SELECT CONCAT(u.name, ' ', u.surname) AS fullname
FROM `users` AS u;

-- Also if we need to return 2 columns from a table but only
-- 1 from other table, we can simulate wit a empty field
SELECT CONCAT(a.name, ' ', a.surname) AS fullname, '' AS Email
FROM `authors` AS a
UNION
SELECT CONCAT(u.name, ' ', u.surname) AS fullname, u.email AS Email
FROM `users` AS u;


-- Using variables with aggregate functions
SET @avg = (SELECT AVG(b.sales) AS average_sales FROM books AS b);

SELECT b.author_id FROM books AS a
GROUP BY b.author_id
HAVING SUM(b.sales) > @avg;

-- Also we can do a subquery
SELECT
  CONCAT(a.name, ' ', a.surname) AS fullname
FROM
  `authors` AS a
WHERE
  a.author_id IN (
    SELECT
      b.author_id
    FROM
      books AS b
    GROUP BY
      b.author_id
    HAVING
      SUM(b.sales) > (
        SELECT
          AVG(b.sales) AS average_sales
        FROM
          books AS b
      )
  );

-- We can use the EXISTS operator to validate
SELECT IF(
  EXISTS(
    SELECT b.book_id
    FROM `books` AS b
    WHERE b.title LIKE '%Hobbit' 
  ),
  'Have Stock',
  'Out of Stock'
) AS stock_status;