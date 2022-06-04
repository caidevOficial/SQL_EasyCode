## Implementation of constraints
### UNIQUE VALUES
As we know, if we need to validate unique values we will use the UNIQUE constraint.

```SQL
CREATE TABLE `users`( 
  user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) UNIQUE
);
```

Another way to express it is as follows.

```SQL
CREATE TABLE `users`( 
  user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  CONSTRAINT UNIQUE (name)
);
```

The word CONSTRAINT is optional, however, for readability reasons, I recommend placing it.

MULTIPLE COLUMN VALUES
If we need to validate the unique value of a combination of columns we will do it in the following way.

In this case we want to validate that the combination of name, surname and license plate are unique in the table.

```SQL
CREATE TABLE `users`( 
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  surname VARCHAR(50),
  enrollment VARCHAR(10),
  CONSTRAINT unique_combinacion UNIQUE (name, surname, enrollment),
  PRIMARY KEY (user_id)
);
```

### PRIMARY KEYS
There are a couple of ways in which we can define a field as a primary key.

```SQL
CREATE TABLE `users`( 
  user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
);
```
or

```SQL
CREATE TABLE `users`( 
  user_id INT UNSIGNED AUTO_INCREMENT,
  PRIMARY KEY(user_id)
);
```

In both cases the result is the same.