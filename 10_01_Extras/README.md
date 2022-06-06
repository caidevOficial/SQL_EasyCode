## Index
* [Events](#mysql-events)
* [Cursors](./README2.md)
* [Information Backup](./README3.md)
* [Permissions](./README4.md)

## MySQL Events
As of version 5.1, MySQL adds the concept of events. An event is nothing more than a task which is executed automatically at a previously scheduled time. If you are a Linux user you can see the events as the cron jobs .

The events will allow us as database administrators to program certain tasks which we want to be executed periodically or at a specific time, in such a way that we can automate certain processes.

<div align='center'>
    <img alt="MySQL Logo" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg?raw=true" height="200px" />
</div>

### EXAMPLES
For this tutorial I will rely on my test table.

```sql
CREATE TABLE test(
 evento VARCHAR(50),
 fecha DATETIME 
); 
```

The first thing we must do is enable our server so that it can execute events.

```sql
SET GLOBAL event_scheduler = ON;
```

Later we create our event; In my case, it will have the name of insertion event. This event will run in 1 min, and what it will do is insert a record into my table.

```sql
CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO INSERT INTO test VALUES ('Event 1', NOW());
```

The name of the event must not have more than 64 characters.

If we want the event to be executed on a specific date, we only have to specify it in ON SCHEDULE AT. Remember, the format is year-month-day hour:minute:second.

```sql
ON SCHEDULE AT '2018-12-31 12:00:00';
```

If our event will execute more than one SQL statement, we must rely on BEGIN and END.

```sql
DELIMITER //
CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
 INSERT INTO test VALUES ('Evento 1', NOW());
 INSERT INTO test VALUES ('Evento 2', NOW());
 INSERT INTO test VALUES ('Evento 3', NOW());
END //

DELIMITER ;
```

Once the event has been created, we can list it.

```sql
SHOW events\G;
```

If we want to delete an event we will use DROP.

```sql
DROP EVENT nombre_evento;
```

It is important to mention that once the event has expired, it will be automatically deleted. If we do not want this to happen, we must support ON COMPLETION

```sql
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
```

Something common with events is working with stored procedures.

```sql
CREATE EVENT nombre_evento
ON SCHEDULE AT 'fecha de ejeución' 
DO
CALL store_procedure();
```

## PERIODIC EVENTS.
Events can be scheduled to run periodically.

```sql
CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());
```

This time, the event runs every minute after 6:30 PM. We can schedule the execution for every second, minute, hour, week, month or year.

If we want the event to run between a range of dates, we must rely on ENDS.

```sql
CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
ENDS '2018-07-07 19:00:00'
DO INSERT INTO test VALUES ('Evento 1', NOW());
```

Now, the event runs for a period of 30 minutes (From 6:30 PM to 7:00 PM).

### EDIT EVENTS
If for some reason we need to stop an event, what we have to do is disable it.

```sql
ALTER EVENT nombre_evento
DISABLE;
```

To enable an event again we place ENABLE.

```sql
ALTER EVENT nombre_evento
ENABLE;
```

## STOP EVENTS
To completely stop all events, we must execute the following statement.

```sql
SET GLOBAL event_scheduler = OFF;
```

## STRUCTURE OF AN EVENT
Events in MySQL can be as complex as we want them to be.

```
CREATE
    [DEFINER = { user | CURRENT_USER }]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT 'string']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval] ...
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval] ...]
    [ENDS timestamp [+ INTERVAL interval] ...]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}
```