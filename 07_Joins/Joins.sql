-- We can join fields of two tables using the INNER JOIN keyword
SELECT
  b.title,
  CONCAT(a.name, " ", a.surname) AS author_name,
  b.publish_date
FROM `books` AS b
INNER JOIN `authors` AS a ON b.author_id = a.author_id;

-------------------------

-- If the name of the fields are the same, we can use the USING keyword
SELECT
  title,
  CONCAT(name, " ", surname) AS author_name,
  publish_date
FROM `books`
INNER JOIN `authors`ON USING(author_id);

-------------------------

-- user = a
-- user_books = b

SELECT
  CONCAT(u.name, " ", u.surname) AS fullname,
  user_books.book_id
FROM users AS u
LEFT JOIN user_books ON u.user_id = user_books.user_id
WHERE user_books.book_id IS NOT NULL;

-------------------------

-- user_books = a
-- user = b

SELECT
  CONCAT(nombre, " ", surnames),
  ub.book_id
FROM user_books AS ub
LEFT JOIN `users` AS u ON ub.user_id = u.user_id
WHERE ub.book_id IS NOT NULL;


---------------------------
-- Returns all the users that haven't borrowed any book
SELECT
  CONCAT(u.name, " ", u.surname) AS fullname,
  ub.book_id
FROM `users_books` AS ub
RIGHT JOIN `users` AS u ON ub.user_id = u.user_id
WHERE ub.book_id IS NULL;

-- Returns the fullname of the users that have borrowed any book
-- the author of thye book MUST have a pseudonym and the borrow date is today
-- users = u
-- users_books = ub
-- books = b
-- authors = a

SELECT
  DISTINCT CONCAT(u.name, " ", u.surnames) AS fullname
FROM
  `users` AS u
  INNER JOIN `user_books` AS ub ON u.user_id = ub.user_id
    AND DATE(ub.publish_date) = CURDATE()
  INNER JOIN `books` AS b ON ub.book_id = b.book_id
  INNER JOIN `authors` AS a ON b.author_id = a.author_id
    AND a.alias IS NOT NULL;
  
-- Cartesian product
SELECT
  CONCAT(u.name, " ", u.surnames) AS fullname,
  b.title
FROM `users` AS u
CROSS JOIN `books` AS b
ORDER BY
  fullname,
  title ASC;

-- Cartesian product
INSERT INTO
  `users_books` (user_id, book_id)
SELECT
  b.book_id,
  u.user_id
FROM
  `users` AS u
  CROSS JOIN `books` AS b;