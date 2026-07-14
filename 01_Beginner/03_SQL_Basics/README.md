# SQL Basics

## Beginner to Intermediate Notes

---

# What is SQL?

**SQL** stands for **Structured Query Language**.

SQL is the standard language used to communicate with relational databases.

Using SQL, we can:

* Store data
* Retrieve data
* Update data
* Delete data
* Create database objects
* Manage users and permissions

Almost every relational database uses SQL, including:

* PostgreSQL
* MySQL
* Oracle
* SQL Server
* SQLite

---

# What is a Database?

A **Database** is an organized collection of related data.

### Example

A school stores:

* Students
* Teachers
* Courses
* Fees
* Attendance

Instead of storing everything in Excel files, the school stores the information inside a database.

---

# What is a Table?

A **Table** stores data in rows and columns.

Example:

```text
+----+---------+------+--------+
| ID | Name    | Age  | Salary |
+----+---------+------+--------+
| 1  | John    | 25   | 50000  |
| 2  | Alice   | 28   | 65000  |
| 3  | David   | 30   | 72000  |
+----+---------+------+--------+
```

A database can contain many tables.

Example:

* employees
* departments
* customers
* orders
* products

---

# What is a Row?

A **Row** represents one complete record.

Example

```text
1 | John | 25 | 50000
```

This row contains all information about one employee.

Rows are also called:

* Record
* Tuple

---

# What is a Column?

A **Column** stores one type of information.

Example

```text
ID
Name
Age
Salary
```

Columns are also called:

* Field
* Attribute

---

# Database → Table → Row → Column

```text
Database
│
├── Employees Table
│      │
│      ├── Rows (Records)
│      │
│      └── Columns
│
├── Orders Table
│
└── Customers Table
```

---

# What Can SQL Do?

SQL allows us to:

* Create databases
* Create tables
* Insert records
* Read records
* Update records
* Delete records
* Search data
* Sort data
* Filter data
* Join multiple tables
* Create views
* Create indexes
* Manage users

---

# Types of SQL Commands

SQL commands are divided into five categories.

```
SQL
│
├── DDL
├── DML
├── DQL
├── DCL
└── TCL
```

---

# 1. DDL (Data Definition Language)

DDL defines the structure of database objects.

Commands:

* CREATE
* ALTER
* DROP
* TRUNCATE
* RENAME

Example

```sql
CREATE TABLE employees (
    id INT,
    name VARCHAR(100)
);
```

---

# 2. DML (Data Manipulation Language)

DML changes the data inside tables.

Commands:

* INSERT
* UPDATE
* DELETE

Example

```sql
INSERT INTO employees
VALUES (1, 'John');
```

---

# 3. DQL (Data Query Language)

DQL retrieves data.

Main command:

```text
SELECT
```

Example

```sql
SELECT *
FROM employees;
```

---

# 4. DCL (Data Control Language)

Controls user permissions.

Commands:

* GRANT
* REVOKE

Example

```sql
GRANT SELECT
ON employees
TO john;
```

---

# 5. TCL (Transaction Control Language)

Manages transactions.

Commands:

* BEGIN
* COMMIT
* ROLLBACK
* SAVEPOINT

Example

```sql
BEGIN;

UPDATE employees
SET salary = salary + 1000;

COMMIT;
```

---

# SQL is Not Case Sensitive

These are exactly the same.

```sql
SELECT * FROM employees;
```

```sql
select * from employees;
```

```sql
SeLeCt * FrOm employees;
```

Best practice:

* SQL keywords → UPPERCASE
* Table names → lowercase
* Column names → lowercase

Example

```sql
SELECT id, name
FROM employees;
```

---

# SQL Statement Rules

Every SQL statement can end with a semicolon.

```sql
SELECT *
FROM employees;
```

Although some tools execute without it, using a semicolon is considered a good habit.

---

# SQL Comments

Single-line comment

```sql
-- Display all employees

SELECT *
FROM employees;
```

Multi-line comment

```sql
/*
Display all employees
whose salary is greater than 50000
*/

SELECT *
FROM employees;
```

---

# Basic SQL Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

Example

```sql
SELECT name, salary
FROM employees
WHERE salary > 50000;
```

---

# Common SQL Keywords

| Keyword  | Purpose        |
| -------- | -------------- |
| SELECT   | Read data      |
| FROM     | Specify table  |
| WHERE    | Filter rows    |
| INSERT   | Add data       |
| UPDATE   | Modify data    |
| DELETE   | Remove data    |
| CREATE   | Create objects |
| DROP     | Delete objects |
| ALTER    | Modify objects |
| ORDER BY | Sort data      |
| GROUP BY | Group data     |
| HAVING   | Filter groups  |
| LIMIT    | Restrict rows  |

---

# Common Beginner Mistakes

❌ Forgetting the WHERE clause in UPDATE

```sql
UPDATE employees
SET salary = 70000;
```

This updates every employee.

Correct

```sql
UPDATE employees
SET salary = 70000
WHERE id = 1;
```

---

❌ Using DELETE without WHERE

```sql
DELETE FROM employees;
```

This deletes all rows.

---

❌ Using SELECT *

Instead of

```sql
SELECT *
FROM employees;
```

Prefer

```sql
SELECT id, name
FROM employees;
```

Selecting only the required columns improves readability and can reduce unnecessary data transfer.

---

# Best Practices

* Use meaningful table names.
* Use meaningful column names.
* Write SQL keywords in uppercase.
* Always format queries properly.
* Use comments where necessary.
* Test UPDATE and DELETE with a SELECT first.
* Avoid using SELECT * in production code unless it is truly needed.

---

# Interview Questions

### What is SQL?

SQL is the standard language used to create, retrieve, update, delete, and manage data in relational databases.

---

### What is the difference between a Database and a Table?

A database is a collection of related tables.

A table stores related data in rows and columns.

---

### What are the five types of SQL commands?

* DDL
* DML
* DQL
* DCL
* TCL

---

### Is SQL case-sensitive?

Most SQL keywords are not case-sensitive. However, object names can become case-sensitive if they are created using double quotes in PostgreSQL.

---

# Chapter Summary

* SQL stands for Structured Query Language.
* SQL is used to communicate with relational databases.
* Data is stored in tables.
* Tables contain rows and columns.
* SQL commands are grouped into DDL, DML, DQL, DCL, and TCL.
* SQL syntax is generally simple and readable.
* Following formatting and safety best practices makes SQL easier to maintain and less error-prone.

---

# Practice Exercises

1. Define SQL in your own words.
2. Explain the difference between a row and a column.
3. List the five categories of SQL commands with one example each.
4. Write a `SELECT` query to retrieve all rows from an `employees` table.
5. Why is using `UPDATE` or `DELETE` without a `WHERE` clause risky?
6. Write two examples of SQL comments (single-line and multi-line).
