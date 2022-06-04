
Reset MySQL root password
If you have lost the password of your root user, don't worry, it is possible to reset it by following the steps below.

If the server is on a remote machine, we must enter it through SSH [Tutorial](https://www.youtube.com/watch?v=DtUt79BVvJ0&t=14s)

The first thing we need to do is stop the server.

```powershell
mysql.server stop
```
```powershell
service mysqld stop
```

```powershell
mysqld stop
```
Once the server is stopped, we must restart it in a safe mode.

```powershell
sudo mysqld_safe --skip-grant-tables --skip-networkin
```

--skip-grant-tables It allows us to connect to the server without the need for a password, in addition to granting all the privileges to the session.

```powershell
--skip-networkin Detiene la escucha de peticiones TCP/IP
```

Now, in a new tab, we must connect to the server using the root user

```powershell
mysql -u root
```

Once inside the server, we must work with the MySQL database

```powershell
USE mysql;
```

With the database change we will update.

```powershell
UPDATE user SET password=PASSWORD('your_password') WHERE user='root';
```

If the update was successful we must exit the server

```powershell
FLUSH PRIVILEGES;
exit
```

The final step is to stop the server in safe mode. We start the server as usual and we authenticate, the password will already be working.

```powershell
mysql -u root -p 
```

How to connect:

```powershell
mysql -u root -p -h localhost
```

Set variables in two ways:

```SQL
SET @name = 'My_name';
SET @password := 'My_password';
SET @course := 'My_course', @gestor := 'Mysql';
```

Using Variables:

```SQL
@my_sum = @a + @b; 
```

Show all the databases of the server:

```SQL
SHOW DATABASES;
```

Creating Database:

```SQL
CREATE DATABASE IF NOT EXISTS my_database;
```

Drop an specific database:

```SQL
DROP DATABASE IF EXISTS @database;
```

where *@database* is the name of the database you want to delete.

Using a specific database to, for example, create a table:

```SQL
USE my_database;
```

Show all the info of a table [Two ways]:

```SQL
SHOW COLUMNS FROM my_table;
DESC my_table;
```

To create a table bassed on the schema of another one we should use:

```SQL
CREATE TABLE IF NOT EXISTS my_new_table LIKE my_other_table;
```

To execute a query file from the console we can use [Two ways]:

```powershell
mysql -u root -p < path_to_file/my_query.sql
```

Using this way, you can see the result of each query in the console.

```sql
SOURCE path_to_file/my_query.sql;
```

If you want to execute a query without login in, you can use:

```powershell
mysql -u root -p my_database -e 'SELECT * FROM my_table';
```

### Type of data
In general, most database servers allow us to store the same type of data, such as strings, dates, and numbers.

In this post, we list the types of data that you will use the most in your day to day life.

ALPHANUMERIC
CHAR
VARCHAR
In both cases we must specify the maximum length that the field can store. Optionally we can define the charset that will store.

```SQL
varchar(20) character set utf8
```

With MySQL we can set the charset that the database will use from its creation 

```sql
CREATE DATABASE my_database CHARACTER SET utf8;
```

### INTEGER NUMBERS

<table>
    <thead>
        <tr>
            <th>Type</th>
            <th>Range</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Tinyint</td>
            <td>-128 a 127</td>
        </tr>
        <tr>
            <td>Smallint</td>
            <td>-32,768 a 32,767</td>
        </tr>
        <tr>
            <td>Mediumint</td>
            <td>-8,388,608 a 8,388,607</td>
        </tr>
        <tr>
            <td>Int</td>
            <td>-2,147,483,648 a 2,147,483,647</td>
        </tr>
        <tr>
            <td>Bigint</td>
            <td>-9,223,372,036,854,775,808 a 9,223,372,036,854,775,807</td>
        </tr>
    </tbody>
</table>


FLOATING NUMBERS
For the floats we will find two types

* Float
* double

In both cases we must specify the number of digits that the column will store before and after the point (p,s)

```SQL
precio FLOAT(3, 2)
```

In this case the column can store up to three digits as integers and two after the decimal point.

Example 999.99

### TIME

<table>
    <thead>
        <tr>
            <th>Type</th>
            <th>Default Format</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Date</td>
            <td>YYYY-MM-DD</td>
        </tr>
        <tr>
            <td>Datetime</td>
            <td>YYYY-MM-DD HH:MI:SS</td>
        </tr>
        <tr>
            <td>Timestamp</td>
            <td>YYYY-MM-DD HH:MI:SS</td>
        </tr>
        <tr>
            <td>Time</td>
            <td>HH:MI:SS</td>
        </tr>
    </tbody>
</table>


##### Examples from __curso profesional de base de datos__.

Link of [curso_db]

[curso_db]: <https://codigofacilito.com/cursos/base-datos-profesional>
