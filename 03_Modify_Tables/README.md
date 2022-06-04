## Modify tables
We can modify the definition of a table once it has been created, for this, we will rely on the ALTER TABLE statement.

Here is a list of some modifications that we can make (the most common).

Rename table.
* Rename the users table to some_users.

```SQL
ALTER TABLE users RENAME some_users;
```

Add a new column.
* Add to the users table, the email column of type VARCHAR with a maximum of 50 characters.

```SQL
ALTER TABLE users ADD email VARCHAR(50);
```

Add a new column with constraints.
* Add the email column to the users table, validating their presence.

```SQL
ALTER TABLE users ADD email VARCHAR(50) NOT NULL DEFAULT '';
```

Add the email column to the users table, validating its unique value.

```SQL
ALTER TABLE my_table ADD email VARCHAR(50) UNIQUE;
```

Delete a column
* Remove the email column from the users table.

```SQL
ALTER TABLE users DROP COLUMN email;
```

Modify the data type of a column
* Modify the data type of the telephone column (users table) from INT to VARCHAR, maximum 50 characters.

```SQL
ALTER TABLE users MODIFY telephone VARCHAR(50);
```

Generate a primary key.
* Generate a primary key to the users table.

```SQL
ALTER TABLE users ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id);
```

Add foreign key.
* Add a foreign key to the users table, with reference to the groups table.

```SQL
ALTER TABLE users ADD FOREIGN KEY(group_id) REFERENCES grupos(group_id);
```

Remove foreign keys
* Delete the foreign key group_id from the users table.

```SQL
ALTER TABLE users DROP FOREIGN KEY group_id;
```
