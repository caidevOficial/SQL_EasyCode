-- Initialize the variable
SELECT
  @now = CURDATE();

SELECT
  SECOND(@now) as seconds,
  MINUTE(@now) as minutes,
  HOUR(@now) as hours,
  DAY(@now) as day,
  MONTH(@now) as month,
  YEAR(@now) as year;

SELECT
  DAYOFWEEK(@now) as day_of_week,
  DAYOFMONTH(@now) as day_of_month,
  DAYOFYEAR(@now) as day_of_year,
  WEEKOFYEAR(@now) as week_of_year,
  QUARTER(@now) as quarter;

SELECT
  DATE(@now) as timestamp_to_date;

-- Returns all the books that have been created today.
SELECT
  *
FROM
  `books` AS b
WHERE
  DATE(b.publish_date) = CURDATE();

-- Adds 30 days to the current date
-- The type of the interval could be SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, or YEAR.
SELECT
  @now + INTERVAL 30 DAY;

-- Subtracts 30 days from the current date
-- The type of the interval could be SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, or YEAR.
SELECT
  @now - INTERVAL 30 DAY;

-- Returns a value 'Yes' if the condition is true, otherwise returns 'No'
SELECT
  IF(@now > DATE('2020-01-01'), 'Yes', 'No') as is_after_2020;

-- Returns a value bassed on the amount of pages of the books
SELECT
  IF(b.pages > 500, 'Long book', 'Short book') as long_or_short_book
FROM
  `books` AS b;

-- Returns a value to evaluate if is null or not.
SELECT
  IFNULL(b.pages, 'No pages') as pages_or_no_pages
FROM
  `books` AS b;

-- Creating Functions
-- Specifies an specific delimitator for the function
-- You can use any symbol to delimit the function, for example //
DELIMITER //
CREATE FUNCTION add_days(actual_date DATE, amount_days INT)
RETURNS DATE
BEGIN
RETURN actual_date + INTERVAL amount_days DAY;
END//

CREATE FUNCTION get_amount_pages()
RETURNS INT
BEGIN
SET
  @pages = (
    SELECT
      (ROUND(RAND() * 100) * 4)
  );
RETURN @pages;
END//

CREATE FUNCTION get_amount_sales()
RETURNS INT
BEGIN
SET
  @pages = (
    SELECT
      (ROUND(RAND() * 100) * 6)
  );
RETURN @pages;
END//

-- To use the functions you need to specify the default delimiter ;
DELIMITER;

-- To list all the functions that you have created in the database
-- The table proc is a special table that contains all the functions & procedures
SELECT
  f.name
FROM
  mysql.proc AS f
WHERE
  f.db = DATABASE()
  AND f.type = 'FUNCTION';

-- To list all the functions you can use the following command:
SHOW FUNCTION STATUS;

-- To drop a function that you have created use drop
DROP FUNCTION add_days;

-- Update a field using a function
UPDATE
  libros
SET
  pages = get_amount_pages();

UPDATE
  libros
SET
  ventas = get_amount_sales();