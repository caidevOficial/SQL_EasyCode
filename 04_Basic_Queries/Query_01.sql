SELECT
    *
FROM
    `books`
WHERE
    title = 'The Lord of the Rings';

SELECT
    *
FROM
    `books` AS b
WHERE
    b.title = 'Carrie'
    AND b.author_id = 1;

SELECT
    *
FROM
    `books` AS b
WHERE
    AND (
        b.author_id = 1
        AND b.title = 'The Lord of the Rings'
    )
    OR (
        b.author_id = 1
        AND b.title = 'Carrie'
    );

SELECT
    *
FROM
    `books` AS b
WHERE
    b.author_id NOT IN (
        SELECT
            author_id
        FROM
            `books`
        WHERE
            title = 'The Lord of the Rings'
    );

-- Another way to use a NOT
SELECT
    *
FROM
    `books` AS b
WHERE
    b.alias <= > 'J.K Rowling';

-- Using a range
SELECT
    *
FROM
    `books` AS b
WHERE
    b.amount_pages BETWEEN 100
    AND 200;

-- Selecting from a list
SELECT
    *
FROM
    `books` AS b
WHERE
    b.author_id IN (1, 2, 3, 4, 5);

-- Selecting unique values
SELECT
    DISTINCT b.title
FROM
    `books` AS b;

-- Update a table field
UPDATE
    `books`
SET
    `amount_pages` = 200
WHERE
    `title` = 'The Lord of the Rings';

-- Another way to delete all the rows from a table
-- And reset the values of the primary key
-- It doesn't shoot any trigger
TRUNCATE TABLE `books`;