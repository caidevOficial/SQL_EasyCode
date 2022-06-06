## MySQL Cursors
In databases, a Cursor is a mechanism which allows us to process the result of a query row by row.

As we know SQL is a set-oriented language. If we want to alter certain elements in our collection we will have to do it through condition. Only and exclusively the elements that comply with these conditions may be altered. With the cursors we can work with each of the elements (rows) of our query without having to obtain new sets. This will allow us to be much more flexible when handling information.

For us to be able to use a cursor it will be necessary to follow the following steps.

* Create a cursor from an SQL statement.
* Opening cursor.
* Data access.
* Cursor closure.

It is important to mention that in MySQL cursors can only be used within stored procedures.

Let's see an example.

1.-Create a stored procedure which increases the number of pages of each book by 10 (books table). In the console we must visualize the title, the previous number of pages and the current number of pages of each book.

Well, this example will allow us to better understand the use of cursors.

Let's see how our stored procedure could look.

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS facilito_procedure//
CREATE PROCEDURE facilito_procedure()
BEGIN
  DECLARE var_id INTEGER;
  DECLARE var_pages INTEGER;
  DECLARE var_title VARCHAR(255);
  DECLARE var_final INTEGER DEFAULT 0;
  DECLARE cursor1 CURSOR FOR SELECT book_id, title, pages FROM books;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;
  OPEN cursor1;

  my_loop: LOOP
    FETCH cursor1 INTO var_id, var_title, var_pages;
    IF var_final = 1 THEN
      LEAVE my_loop;
    END IF;
    UPDATE books SET pages = var_pages + 10 WHERE book_id = var_id;
    SELECT
      var_title AS  'title',
      var_pages AS 'Anterior',
      pages AS 'Incremento'
      FROM books WHERE book_id = var_id;
  END LOOP my_loop;
  CLOSE cursor1;
END//
DELIMITER ;
```

Within the stored procedure, the first thing we do is declare all the variables that we will use. In this case, since we will work with the title and the number of pages of each book, we declared three new variables. var_id, var_pages, var_title.

To have control over the iteration of each of the elements in the query, declare a fourth variable called var_final, whose value starts at 0.

Once we have declared all the variables we proceed to create our cursor. The cursor will be created from an SQL query. In this case the query is not too complex, however, if we wish we can create a course from a query with joins, order, group etc...

with the sentence

```sql
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;
```

We indicate that once all the elements (rows) inside our cursor have been iterated, the variable var_final will take a new value, from 0 to 1.

To start the iteration of the elements it will be necessary to open the cursor.

```sql
OPEN cursor1;
```

The iteration is achieved using a Loop, which will be controlled from the variable var_final.

```sql
    IF var_final = 1 THEN
            -- Finish the loop if not exist more rows.
      LEAVE my_loop;
    END IF;
```

By using the Fetch clause we get the current element (row) of our query and move on to the next element.

In this case, as in our query we have obtained 3 columns (id, title, pages) we assign the value of each of the columns to our variables. It is important to mention that the values can only be assigned to variables of the same type, we cannot assign a varchar to a variable of type integer.

The order is important.

```sql
FETCH cursor1 INTO var_id, var_title, var_pages;
```

Once we have performed all the corresponding tasks and all the elements (rows) have been iterated, the next step will be to close the cursor.

```sql
close cursor1
```

To execute our stored procedure we will execute the following sentence.

```sql
CALL facilito_procedure();
```