# Learning-SQL
My Journey of learning SQL is present in this repository. Currently learning PostgreSQL from FreeCodeCamp

## Instructions for PostgreSQL with FreeCodeCamp and Gitpod

Connect to PostgreSQL with the following command:
```bash
psql --username=freecodecamp --dbname=postgres
```

To dump the database to a file, use the following command:
```bash
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
```

To restore the database from a file, use the following command:
```bash
psql -U freecodecamp postgres < universe.sql
```