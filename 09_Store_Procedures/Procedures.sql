-- List all the procedures that you have created in the database
-- The table proc is a special table that contains all the functions & procedures
SELECT mp.name FROM `mysql.proc` AS mp
WHERE mp.db = DATABASE() AND mp.type = 'PROCEDURE';

DELIMITER //

-- We use the OUT keyword to specify that the function will return a value
CREATE PROCEDURE loan(user_id INT, book_id INT, OUT amount INT)
BEGIN
  SET amount = (SELECT stock FROM `books` AS b WHERE b.book_id = book_id);
  IF amount > 0 THEN
    INSERT INTO `users_books`(book_id, user_id) VALUES(book_id, user_id);
    UPDATE `books` SET stock = stock - 1 WHERE b.book_id = book_id;
  --ELSEIF condition THEN
  ELSE
    SELECT "Can't realize the loan" AS err_message;
  END IF;
END//

CREATE PROCEDURE lector_type(user_id INT)
BEGIN
  SET @amount = (SELECT COUNT(*) FROM `users_books` AS ub WHERE ub.user_id = user_id);
  CASE
    WHEN @amount > 20 THEN
      SELECT "Fanatic" AS loan_message;
    WHEN @amount > 10 AND @amount < 20 THEN
      SELECT "Amateur" AS loan_message;
    WHEN @amount > 5 AND @amount < 10 THEN
      SELECT "Average" AS loan_message;
    ELSE
      SELECT "New" AS loan_message;
  END CASE;
END//

-- Using While
CREATE PROCEDURE random_books_1()
BEGIN
  SET @iterations= 0;
  WHILE @iterations < 5 DO
    SELECT book_id, title FROM `books` ORDER BY RAND() LIMIT 1;
    SET @iterations = @iterations + 1;
  END WHILE;
END//

-- Using REPEAT is like a Do-While
CREATE PROCEDURE random_books_2()
BEGIN
  SET @iterations= 0;
  REPEAT
    SELECT book_id, titulo FROM `books` ORDER BY RAND() LIMIT 1;
    SET @iterations = @iterations + 1;
    UNTIL @iterations >= 5
  END REPEAT;
END//

DELIMITER ;

-- To use a procedure, you need to call it.
SET @amount = -1;
CALL loan(1, 7, @amount);

-- To delete a procedure you need to drop it.
DROP PROCEDURE loan;