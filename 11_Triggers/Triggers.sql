DELIMITER //
--5.7.2 <  Max 6 triggers
CREATE TRIGGER after_insert_books_update --trigger name
AFTER INSERT ON books -- define time & when to execute
FOR EACH ROW
BEGIN
-- NEW it's a reference to the actual register
  UPDATE authors SET books = books + 1 WHERE autor_id = NEW.autor_id;
END;
//

DELIMITER //
CREATE TRIGGER after_delete_books_update
AFTER DELETE ON books
FOR EACH ROW
BEGIN
  UPDATE authors SET books = books - 1 WHERE autor_id = OLD.autor_id;
END;
//

DELIMITER //
CREATE TRIGGER after_update_books_update
AFTER UPDATE ON books
FOR EACH ROW
BEGIN
  IF (NEW.autor_id != OLD.autor_id) THEN
    UPDATE authors SET books = books - 1 WHERE autor_id = OLD.autor_id;
    UPDATE authors SET books = books + 1 WHERE autor_id = NEW.autor_id;
  END IF;
END;
//

DELIMITER ;

-- To know the triggers in a database you can use the SHOW TRIGGERS statement.
SHOW TRIGGERS\G;

-- to delete a trigger you can use the DROP TRIGGER statement.
DROP TRIGGER IF EXISTS library_ff.after_insert_books_update;