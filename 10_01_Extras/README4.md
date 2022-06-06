## Assign permissions to MySQL users
As we mentioned before: the database server allows more than one user to work with the server's resources (records, tables, databases, functions, etc.).

Up to this point in the course, all the exercises have been done using the root user.

If we are the only administrators of the server (something that very rarely happens) we should have no problem continuing to use root, however, if more people will work with the server, it will be necessary to create new users and assign the relevant permissions.

<img height='200' src='https://i.imgur.com/L0j46Th.png?raw=true'>

### ADD NEW USERS
For us to generate a new user, the first thing we must do is authenticate ourselves on the server.
```powershell
mysql -u root -p -h localhost<ip>
```

Later we must generate a new User, For this we execute the following sentence.

```sql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
```

Up to this point, we can already authenticate with the server using the new user, however, once authenticated, the actions that we can do are minimal, since this user does not have the necessary permissions to work with the databases.

### ASSIGN PERMISSIONS
In order to set permissions, the following statements must be executed using the root user.

If we want the new user to have administrator permissions (All permissions), we must execute the following sentence.

```sql
GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';
```

Asterisks indicate that permissions will be assigned to all databases and all tables (first asterisk databases, second asterisk tables).

If we want to assign permissions for certain actions, the statement would be as follows. We replace ALL PRIVILEGES and place the actions that we want to assign.

```sql
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
    -> ON easycode.*
    -> TO 'username'@'localhost';
```

On this occasion we are indicating that the new user will be able to consult, create, update and delete records, as well as how to create or delete elements (tables, indexes, columns, functions, stores, etc...).

All these permissions will be valid only in the easycode database and will apply to all tables.
If we want to assign permissions to only one table, we replace the asterisks with the name of the table.

```sql
example easycode.users
```

Once we have finished with the permissions, the last step will be to refresh them.

```sql
FLUSH PRIVILEGES;
```

## PERMISSIONS
Here is a list of some permissions that we can assign.

* CREATE allows you to create new tables or databases.
* DROP allows you to drop tables or databases.
* DELETE allows you to delete records from tables.
* INSERT allows you to insert records into tables.
* SELECT allows you to read records in tables.
* UPDATE allows to update records in the tables.
* GRANT OPTION allows removing user permissions.
* SHOW DATABASE Allows you to list the existing databases.

### SENTENCES TO TAKE INTO ACCOUNT

```sql
-- list of all users
SELECT User FROM mysql.user;

-- delete user
DROP USER 'user'@'localhost';

-- Revoke specific permissions from a user (in this case, update & delete)
REVOKE UPDATE, DELETE ON *.* FROM 'user'@'localhost';

-- Revoke all permissions from a user
REVOKE ALL PRIVILEGES ON *.* FROM 'user'@'localhost';
```