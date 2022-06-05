USE library_ff;

-- Concat many strings into a single string
SELECT CONCAT(a.name, ' ', a.surname) AS full_name
FROM `authors` as a;

-- Get the length of a string
SELECT LENGTH(a.name) AS name_length
FROM `authors` as a;

-- Gets rows where the name is smaller than 7 characters
SELECT * FROM `authors` AS a
WHERE LENGTH(a.name) > 7;

-- Converts the string to uppercase or lowercase
SELECT UPPER(a.name) AS name_upper, LOWER(a.surname) AS surname_lower
FROM `authors` as a;

-- Removes the spaces at the beginning and end of a string
SELECT TRIM(a.name) AS name_trim
FROM `authors` as a;

-- Creates a substring of size 3 [the first 3 characters] from the start of the string
SELECT LEFT(a.name, 3) AS name_left
FROM `authors` as a;

-- Creates a substring of size 3 [The last 3 characters] from the end of the string
SELECT RIGHT(a.name, 3) AS name_right
FROM `authors` as a;

-- Returns all the rows where the name starts with the 'HARRY POTTER'
SELECT * FROM `books` AS b
WHERE LEFT(UPPER(b.title), 12) = 'HARRY POTTER';

-- Returns all the rows where the title of the books ends with 'ANILLOS'
SELECT * FROM `books` AS b
WHERE RIGHT(UPPER(b.title), 7) = 'ANILLOS';

-- Returns a random number between 0 and 100 rouded to the nearest integer
SELECT ROUND(RAND()*100) AS random_number;

-- Returns a truncate decimal number to a certain number of decimal places
SELECT TRUNCATE(RAND()*100, 2) AS truncate_random_number;

-- Returns a number powered by another number
SELECT POWER(RAND()*100, 2) AS power_random_number;

