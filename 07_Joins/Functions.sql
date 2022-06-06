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

DELIMITER ;

UPDATE `books` SET pages = get_amount_pages();
UPDATE `books` SET sales = get_amount_sales();

