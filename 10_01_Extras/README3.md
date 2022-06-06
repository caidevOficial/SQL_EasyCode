## INFORMATION BACKUP
In MySQL we can make backups of our information, for this, we will use the mysqldump application.
If we want to back up a single database, we will execute the following command in our terminal.

```powershell
mysqldump base_de_datos > ruta/archivo_respaldo.sql
```

If what we need is to backup multiple databases, we will modify our command, adding --databases.

```powershell
mysqldump --databases db1 db2 db3 > ruta/archivo_respaldo.sql
```

We will separate the databases by a space.

If what we need is to back up one or multiple tables, the command will be the following.
For a single table.

```powershell
mysqldump base_de_datos tabla1 > ruta/archivo_respaldo.sql
```

for múltiples tables

```powershell
mysqldump base_de_datos tabla1 tabla3 > ruta/archivo_respaldo.sql
```