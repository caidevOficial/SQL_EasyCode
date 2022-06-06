-- If the transactions fails we can use the ROLLBACK statement
-- And the table will be restored to its original state
DELIMITER //
CREATE PROCEDURE loan(user_id INT, book_id INT)
BEGIN
  -- If an error occurs, it will EXIT the procedure
  -- Executing the ROLLBACK statement between the BEGIN and END statements.
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK; -- Rollback the transaction if an error occurs
  END;

  START TRANSACTION;
  INSERT INTO `users_books`(book_id, user_id) VALUES(book_id, user_id);
  UPDATE `books` AS b SET stock = stock - 1 WHERE b.book_id = book_id;
  COMMIT;
END//
DELIMITER ;