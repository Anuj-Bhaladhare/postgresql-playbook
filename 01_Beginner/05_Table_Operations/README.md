# PostgreSQL Table Operations

## Complete Beginner to Professional Notes

---

# 1. What is a Table?

A **Table** is a database object that stores data in the form of rows and columns.

A table represents a real-world entity.

Examples:

| Real World Entity | Table Name |
| ----------------- | ---------- |
| Employees         | employees  |
| Customers         | customers  |
| Products          | products   |
| Orders            | orders     |

Example:

```text
employees table

+----+---------+--------+---------+
| id | name    | age    | salary  |
+----+---------+--------+---------+
| 1  | John    | 25     | 50000   |
| 2  | Alice   | 30     | 70000   |
+----+---------+--------+---------+
```

---

# 2. Table Operations Overview

PostgreSQL provides different commands to manage tables.

```text
Table Operations

        |
        |
 --------------------------
 |     |      |      |
CREATE ALTER DROP TRUNCATE
        |
        |
     RENAME
```

Main operations:

1. CREATE TABLE
2. ALTER TABLE
3. RENAME TABLE
4. DROP TABLE
5. TRUNCATE TABLE
6. Copy Table
7. Temporary Tables
8. Table Information Commands

---

# 3. CREATE TABLE

## What is CREATE TABLE?

`CREATE TABLE` is used to create a new table in a database.

Syntax:

```sql
CREATE TABLE table_name
(
    column1 datatype,
    column2 datatype,
    column3 datatype
);
```

---

# Example: Create Employee Table

```sql
CREATE TABLE employees
(
    id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    salary NUMERIC(10,2)
);
```

Now PostgreSQL creates:

```text
employees

+----+------+-----+--------+
| id | name | age | salary |
+----+------+-----+--------+
```

---

# 4. Creating Table with Constraints

Usually, tables are created with rules called constraints.

Example:

```sql
CREATE TABLE employees
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    salary NUMERIC(10,2)
);
```

Here:

| Constraint  | Purpose               |
| ----------- | --------------------- |
| PRIMARY KEY | Unique identification |
| NOT NULL    | Value cannot be empty |

---

# 5. CREATE TABLE IF NOT EXISTS

Sometimes we want to create a table only if it does not already exist.

Syntax:

```sql
CREATE TABLE IF NOT EXISTS employees
(
    id INTEGER,
    name VARCHAR(100)
);
```

Benefit:

* Avoids error
* Useful in deployment scripts

---

# 6. Viewing Tables

## List Tables

In PostgreSQL `psql`:

```sql
\dt
```

Output:

```text
employees
customers
orders
```

---

## Describe Table Structure

Command:

```sql
\d employees
```

Shows:

* Columns
* Data types
* Constraints
* Indexes

Example:

```text
 Column | Type
--------+---------
 id     | integer
 name   | varchar
```

---

# 7. ALTER TABLE

## What is ALTER TABLE?

ALTER TABLE modifies the structure of an existing table.

We can:

* Add column
* Remove column
* Change data type
* Rename column
* Add constraints

---

# 8. ADD COLUMN

Syntax:

```sql
ALTER TABLE table_name
ADD COLUMN column_name datatype;
```

Example:

```sql
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
```

Before:

```text
id | name | salary
```

After:

```text
id | name | salary | email
```

---

# 9. ADD Multiple Columns

Example:

```sql
ALTER TABLE employees
ADD COLUMN department VARCHAR(50),
ADD COLUMN joining_date DATE;
```

---

# 10. DROP COLUMN

Removes a column permanently.

Syntax:

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

Example:

```sql
ALTER TABLE employees
DROP COLUMN age;
```

Warning:

The data stored in that column will be deleted.

---

# 11. RENAME COLUMN

Changes column name.

Syntax:

```sql
ALTER TABLE table_name
RENAME COLUMN old_name
TO new_name;
```

Example:

```sql
ALTER TABLE employees
RENAME COLUMN name
TO employee_name;
```

Before:

```text
name
```

After:

```text
employee_name
```

---

# 12. Change Column Data Type

Syntax:

```sql
ALTER TABLE table_name
ALTER COLUMN column_name
TYPE new_datatype;
```

Example:

```sql
ALTER TABLE employees
ALTER COLUMN salary
TYPE NUMERIC(12,2);
```

---

# 13. SET DEFAULT Value

A default value is automatically inserted when no value is provided.

Example:

```sql
ALTER TABLE employees
ALTER COLUMN status
SET DEFAULT 'active';
```

Now:

```sql
INSERT INTO employees(name)
VALUES('John');
```

Result:

```text
status = active
```

---

# 14. Remove Default Value

Syntax:

```sql
ALTER TABLE employees
ALTER COLUMN status
DROP DEFAULT;
```

---

# 15. Add Constraint

Example:

Add NOT NULL:

```sql
ALTER TABLE employees
ALTER COLUMN name
SET NOT NULL;
```

---

Add UNIQUE constraint:

```sql
ALTER TABLE employees
ADD CONSTRAINT unique_email
UNIQUE(email);
```

---

# 16. Rename Table

Syntax:

```sql
ALTER TABLE old_table_name
RENAME TO new_table_name;
```

Example:

```sql
ALTER TABLE employees
RENAME TO employee_details;
```

Before:

```text
employees
```

After:

```text
employee_details
```

---

# 17. DROP TABLE

## What is DROP TABLE?

DROP TABLE permanently removes a table.

Syntax:

```sql
DROP TABLE table_name;
```

Example:

```sql
DROP TABLE employees;
```

It removes:

* Table structure
* Data
* Indexes
* Constraints

Everything is deleted.

---

# 18. DROP TABLE IF EXISTS

Safe way:

```sql
DROP TABLE IF EXISTS employees;
```

If table does not exist, PostgreSQL will not give an error.

---

# 19. TRUNCATE TABLE

TRUNCATE removes all rows but keeps the table structure.

Syntax:

```sql
TRUNCATE TABLE employees;
```

Before:

```text
employees

1 John
2 Alice
3 David
```

After:

```text
employees

(empty table)
```

Structure remains.

---

# DELETE vs TRUNCATE vs DROP

| Operation | Data    | Structure | Rollback                 |
| --------- | ------- | --------- | ------------------------ |
| DELETE    | Removed | Exists    | Yes                      |
| TRUNCATE  | Removed | Exists    | Yes (inside transaction) |
| DROP      | Removed | Removed   | No                       |

---

# 20. COPY TABLE

## Copy Structure Only

```sql
CREATE TABLE employee_backup
(LIKE employees);
```

Creates:

```text
Same columns
Same data types
No data
```

---

## Copy Data

```sql
CREATE TABLE employee_backup AS
SELECT *
FROM employees;
```

Creates:

* Structure
* Data

---

# 21. Temporary Tables

Temporary tables exist only during the current session.

Example:

```sql
CREATE TEMP TABLE temp_employee
(
    id INTEGER,
    name VARCHAR(50)
);
```

When the session ends:

```text
Temporary table automatically deleted
```

Used for:

* Intermediate calculations
* Reporting
* Data processing

---

# 22. Table Naming Best Practices

Good:

```text
employees
customer_orders
product_details
```

Avoid:

```text
Emp
Table1
Data
```

Rules:

* Use meaningful names
* Use lowercase
* Avoid spaces
* Use underscore for multiple words

---

# 23. Common Mistakes

## Mistake 1: Dropping table without checking

Wrong:

```sql
DROP TABLE employees;
```

Better:

```sql
DROP TABLE IF EXISTS employees;
```

---

## Mistake 2: Changing column type without checking data

Example:

```sql
ALTER TABLE employees
ALTER COLUMN age TYPE INTEGER;
```

If existing values cannot convert, it fails.

---

## Mistake 3: Using DELETE when TRUNCATE is needed

For removing all rows:

Better:

```sql
TRUNCATE TABLE employees;
```

---

# 24. Industry Best Practices

✅ Always use primary keys.

✅ Define proper data types.

✅ Add constraints during table creation.

✅ Use meaningful table names.

✅ Avoid unnecessary columns.

✅ Backup important tables before DROP operations.

✅ Use migrations for production database changes.

---

# Interview Questions

## What is a table?

A table is a database object that stores data in rows and columns.

---

## Difference between DELETE and TRUNCATE?

DELETE removes rows individually and supports conditions.

TRUNCATE removes all rows quickly while keeping the table structure.

---

## Difference between DROP and TRUNCATE?

DROP removes the complete table.

TRUNCATE removes only data.

---

## Can we rollback DROP TABLE?

Normally no. DROP permanently removes the object.

---

## What is ALTER TABLE?

ALTER TABLE is used to modify the structure of an existing table.

---

# Chapter Summary

* Tables store data in rows and columns.
* CREATE TABLE creates new tables.
* ALTER TABLE modifies existing tables.
* DROP TABLE removes complete tables.
* TRUNCATE removes all rows but keeps structure.
* Temporary tables exist only for a session.
* Proper table design is the foundation of a good database.

---

# Practice Exercises

1. Create a student table with:

   * id
   * name
   * age
   * email
   * admission_date

2. Add a phone_number column.

3. Rename email column to student_email.

4. Change age data type.

5. Create a backup table.

6. Remove all records using TRUNCATE.

7. Drop the backup table.

---

# Next Chapter

After Table Operations, the next logical topic is:

**PostgreSQL Constraints**

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK
* DEFAULT

Constraints are what make your tables reliable and production-ready.
