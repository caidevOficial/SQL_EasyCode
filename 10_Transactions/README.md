### Storage Engines in MySQL
Fortunately for us database administrators, MySQL allows us to work with different storage engines, among which MyISAM and InnoDB stand out.

Storage Engine? What is that? 🤔, you see, a storage engine is in charge of storing, managing and retrieving all the information in a table. That is why it is of the utmost importance that we know the existence of these engines, what their main differences are and in which cases it is good to use one or the other, in this way that we can guarantee better performance in our applications. 😉

In order for us to know which storage engine we can use, it is enough to execute the following sentence in our terminal.

```sql
SHOW ENGINES;
```

We will get the following list.

* InnoDB
* MRG_MYISAM
* MEMORY
* BLACKHOLE
* MyISAM
* CSV
* ARCHIVE
* PERFORMANCE_SCHEMA
* FEDERATED

This time we will focus on explaining the two most popular storage engines, I am referring to MyISAM and InnoDB.

MyISAM is the default MySQL engine. One of the main advantages of this engine is the speed when retrieving information. MyISAM is an excellent option when the predominant statements in our application are queries. This is one of the reasons why MyISAM is so popular in web applications.

```
If your application needs to perform full-text searches, MyISAM is a better option.
```

The main disadvantage of MyISAM lies in the absence of automation, since the referential integrity of the data is not checked. Time is saved in the insertion, yes, but we lose reliability in the data.

On the other hand we have the InnoDB storage engine. The main advantage of this engine lies in the safety of operations. InnoDB allows the execution of transactions, this guarantees us that the data is persisted correctly and if there is an error we can revert all the changes made.

Something interesting to mention about InnoDB is that this engine performs a full lock on a table when one of the following statements is executed.

* SELECT
* INSERT
* UPDATE
* DELETE

If we want to work with transactions and the integrity of the data is crucial, our best option will be InnoDB, on the other hand, if what we want is greater speed when obtaining information, it will be necessary to use MyISAM.

### MANAGEMENT
If we so wish we can change the storage engine. There are two ways to do this. The first is to modify the my.cnf file.

```
[mysqld]
default-storage-engine = innodb
```

The second way is to do it directly from our section, just execute the following statement.

```sql
SET storage_engine=INNODB;
```

In both cases we changed the storage engine from MyISAM to InnoDB.

If we want to know which storage engine a particular table uses, we can do so by executing the following statement.

```sql
SHOW TABLE STATUS WHERE `Name` = 'table' \G;
```

If we want to create a table using a particular engine, we must follow the following structure.

```sql
CREATE TABLE `tabla_innodb` (id INT, value INT) ENGINE=INNODB;
CREATE TABLE `tabla_myisam` (id INT, value INT) ENGINE=MYISAM;
CREATE TABLE `tabla_default` (id INT, value INT);
```