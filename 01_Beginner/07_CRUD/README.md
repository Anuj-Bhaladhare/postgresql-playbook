# PostgreSQL CRUD Operations

## Complete Beginner to Professional Notes

---

# 1. What is CRUD?

CRUD stands for:

```text id="c8n4fm"
C → Create
R → Read
U → Update
D → Delete
```

CRUD represents the four basic operations performed on database data.

| Operation | SQL Command | Purpose              |
| --------- | ----------- | -------------------- |
| Create    | INSERT      | Add new data         |
| Read      | SELECT      | Retrieve data        |
| Update    | UPDATE      | Modify existing data |
| Delete    | DELETE      | Remove data          |

---

# 2. Real-World Example

Imagine an Employee Management System.

## Create

A new employee joins:

```
John
Developer
Salary 60000
```

↓

INSERT

---

## Read

Manager wants employee details.

↓

SELECT

---

## Update

Employee salary increases.

↓

UPDATE

---

## Delete

Employee leaves the company.

↓

DELETE

---

# 3. CRUD Flow

```text id="x7p9bb"
Application

     |
     |
     ▼

PostgreSQL Database

     |
     |
 --------------------
 |        |         |
INSERT  SELECT   UPDATE
                   |
                 DELETE
```

---

# 4. CREATE Operation (INSERT)

## What is INSERT?

INSERT is used to add new rows into a table.

Syntax:

```sql
INSERT INTO table_name
(column1, column2)
VALUES
(value1, value2);
```

---

# 5. Example Table

We will use this table:

```sql
CREATE TABLE employees
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);
```

---

# 6. Insert Single Row

Example:

```sql
INSERT INTO employees
(id, name, department, salary)
VALUES
(1, 'John', 'IT', 60000);
```

Result:

```
id | name | department | salary
--------------------------------
1  | John | IT         | 60000
```

---

# 7. Insert Multiple Rows

PostgreSQL allows multiple inserts.

Example:

```sql
INSERT INTO employees
(id, name, department, salary)
VALUES
(2,'Alice','HR',50000),
(3,'David','Finance',70000),
(4,'Mike','IT',65000);
```

Result:

```
id | name  | department | salary
---------------------------------
1  | John  | IT         | 60000
2  | Alice | HR         | 50000
3  | David | Finance    | 70000
4  | Mike  | IT         | 65000
```

---

# 8. Insert Data Without Specifying All Columns

If a column has DEFAULT value:

Example:

```sql
INSERT INTO employees
(id,name)
VALUES
(5,'Sarah');
```

Remaining columns will use:

* DEFAULT value
* NULL (if allowed)

---

# 9. INSERT Using DEFAULT

Example:

```sql
INSERT INTO employees
VALUES
(DEFAULT,'Tom','IT',55000);
```

---

# 10. INSERT Using SELECT

We can insert data from another table.

Example:

```sql
INSERT INTO employee_backup
SELECT *
FROM employees;
```

Useful for:

* Data migration
* Backup
* ETL processes

---

# 11. READ Operation (SELECT)

## What is SELECT?

SELECT retrieves data from tables.

Syntax:

```sql
SELECT column_name
FROM table_name;
```

---

# 12. Select All Columns

Example:

```sql
SELECT *
FROM employees;
```

Output:

```
id | name | department | salary
```

---

# 13. Select Specific Columns

Better practice:

```sql
SELECT name, salary
FROM employees;
```

Output:

```
name  | salary
--------------
John  | 60000
Alice | 50000
```

---

# 14. Using WHERE Condition

WHERE filters rows.

Syntax:

```sql
SELECT columns
FROM table
WHERE condition;
```

Example:

```sql
SELECT *
FROM employees
WHERE department='IT';
```

Result:

```
John
Mike
```

---

# 15. Comparison Operators

| Operator | Meaning          |
| -------- | ---------------- |
| =        | Equal            |
| !=       | Not equal        |
| >        | Greater          |
| <        | Less             |
| >=       | Greater or equal |
| <=       | Less or equal    |

Example:

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

---

# 16. Logical Operators

## AND

Both conditions must be true.

Example:

```sql
SELECT *
FROM employees
WHERE department='IT'
AND salary>60000;
```

---

## OR

Any one condition can be true.

Example:

```sql
SELECT *
FROM employees
WHERE department='IT'
OR department='HR';
```

---

## NOT

Reverse condition.

Example:

```sql
SELECT *
FROM employees
WHERE NOT department='IT';
```

---

# 17. Sorting Data (ORDER BY)

ORDER BY sorts results.

Ascending:

```sql
SELECT *
FROM employees
ORDER BY salary;
```

Descending:

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

---

# 18. Limiting Data (LIMIT)

LIMIT controls number of rows.

Example:

```sql
SELECT *
FROM employees
LIMIT 5;
```

Returns only 5 rows.

---

# 19. UPDATE Operation

## What is UPDATE?

UPDATE modifies existing records.

Syntax:

```sql
UPDATE table_name
SET column=value
WHERE condition;
```

---

# 20. Update Single Row

Example:

```sql
UPDATE employees
SET salary=70000
WHERE id=1;
```

Before:

```
John 60000
```

After:

```
John 70000
```

---

# 21. Update Multiple Columns

Example:

```sql
UPDATE employees
SET
department='Management',
salary=90000
WHERE id=2;
```

---

# 22. Update Multiple Rows

Example:

```sql
UPDATE employees
SET salary=salary+5000
WHERE department='IT';
```

All IT employees get an increment.

---

# 23. Important UPDATE Warning

Never run:

```sql
UPDATE employees
SET salary=100000;
```

without WHERE.

It updates every row.

Before UPDATE:

```text
John 60000
Alice 50000
```

After:

```text
John 100000
Alice 100000
```

---

# 24. DELETE Operation

## What is DELETE?

DELETE removes rows from a table.

Syntax:

```sql
DELETE FROM table_name
WHERE condition;
```

---

# 25. Delete Single Row

Example:

```sql
DELETE FROM employees
WHERE id=4;
```

---

# 26. Delete Multiple Rows

Example:

```sql
DELETE FROM employees
WHERE department='HR';
```

---

# 27. Delete All Rows

Example:

```sql
DELETE FROM employees;
```

This removes all data.

The table remains.

---

# 28. DELETE vs TRUNCATE

| DELETE               | TRUNCATE                        |
| -------------------- | ------------------------------- |
| Removes rows         | Removes all rows                |
| Can use WHERE        | No WHERE                        |
| Slower               | Faster                          |
| Row-by-row operation | Bulk operation                  |
| Can rollback         | Can rollback inside transaction |

---

# 29. RETURNING Clause (PostgreSQL Feature)

PostgreSQL supports RETURNING after INSERT, UPDATE, DELETE.

Example:

```sql
INSERT INTO employees
VALUES(10,'Alex','IT',80000)
RETURNING *;
```

Output:

```
10 | Alex | IT | 80000
```

---

UPDATE example:

```sql
UPDATE employees
SET salary=90000
WHERE id=10
RETURNING *;
```

---

DELETE example:

```sql
DELETE FROM employees
WHERE id=10
RETURNING *;
```

---

# 30. Transaction Safety with CRUD

Transactions protect data changes.

Example:

```sql
BEGIN;

UPDATE employees
SET salary=100000
WHERE id=1;

ROLLBACK;
```

Changes are cancelled.

---

Commit:

```sql
BEGIN;

UPDATE employees
SET salary=100000
WHERE id=1;

COMMIT;
```

Changes become permanent.

---

# 31. Common CRUD Mistakes

## Mistake 1: INSERT without column names

Bad:

```sql
INSERT INTO employees
VALUES(...);
```

Better:

```sql
INSERT INTO employees
(id,name)
VALUES(...);
```

---

## Mistake 2: UPDATE without WHERE

Danger:

```sql
UPDATE employees
SET salary=50000;
```

---

## Mistake 3: DELETE without WHERE

Danger:

```sql
DELETE FROM employees;
```

---

## Mistake 4: Using SELECT *

For production:

Avoid:

```sql
SELECT *
FROM employees;
```

Prefer:

```sql
SELECT id,name
FROM employees;
```

---

# 32. Industry Best Practices

✅ Always specify column names in INSERT.

✅ Always test UPDATE and DELETE with SELECT first.

Example:

First:

```sql
SELECT *
FROM employees
WHERE id=10;
```

Then:

```sql
DELETE FROM employees
WHERE id=10;
```

---

✅ Use transactions for important changes.

✅ Avoid unnecessary data retrieval.

✅ Use WHERE carefully.

---

# 33. Interview Questions

## What is CRUD?

CRUD represents Create, Read, Update, and Delete operations on database data.

---

## Which SQL command is used to retrieve data?

SELECT.

---

## Difference between DELETE and TRUNCATE?

DELETE removes rows and supports WHERE conditions.

TRUNCATE removes all rows quickly and keeps table structure.

---

## What happens if UPDATE is executed without WHERE?

All rows in the table are updated.

---

## What is RETURNING in PostgreSQL?

RETURNING returns affected rows after INSERT, UPDATE, or DELETE.

---

# Chapter Summary

* CRUD is the foundation of database operations.
* INSERT creates new records.
* SELECT reads data.
* UPDATE modifies existing records.
* DELETE removes records.
* WHERE controls which rows are affected.
* Transactions provide safety.
* PostgreSQL RETURNING provides immediate feedback after changes.

---

# Practice Exercises

Create an employee table and perform:

1. Insert 10 employee records.
2. Display all employees.
3. Display only employee names and salaries.
4. Find employees with salary greater than 50000.
5. Increase IT department salary by 10%.
6. Delete employees who left the company.
7. Use RETURNING after UPDATE.
8. Perform an UPDATE using BEGIN and ROLLBACK.

---

# Next Chapter

After CRUD Operations, the next important topic is:

**SQL Operators and Filtering**

* Comparison Operators
* Logical Operators
* BETWEEN
* IN
* LIKE
* ILIKE
* IS NULL
* Pattern Matching

These concepts make your SELECT queries powerful and are used daily in real projects.
