# PostgreSQL Constraints

## Complete Beginner to Professional Notes

---

# 1. What are Constraints?

A **Constraint** is a rule applied to a table column or table that controls what type of data can be stored.

Constraints help maintain:

* Data accuracy
* Data consistency
* Data integrity
* Relationship between tables
* Business rules

Example:

Without constraints:

```text
employees

id     name
--------------
1      John
1      Alice
```

Duplicate IDs are possible.

With PRIMARY KEY constraint:

```text
id must be unique
```

Duplicate values are rejected.

---

# 2. Why Do We Need Constraints?

Constraints prevent problems like:

### Duplicate Data

Example:

Two users with the same email:

```
john@gmail.com
john@gmail.com
```

Solution:

```
UNIQUE constraint
```

---

### Missing Required Data

Example:

Employee without a name:

```
id = 1
name = NULL
```

Solution:

```
NOT NULL constraint
```

---

### Invalid Data

Example:

Age:

```
-50
```

Solution:

```
CHECK constraint
```

---

### Broken Relationships

Example:

Order belongs to a customer that does not exist.

Solution:

```
FOREIGN KEY constraint
```

---

# 3. Types of PostgreSQL Constraints

PostgreSQL supports these main constraints:

```text
Constraints

    |
    |
-------------------------
|       |       |       |
PRIMARY FOREIGN UNIQUE NOT
 KEY     KEY          NULL

        |
        |
     CHECK
     
        |
        |
     DEFAULT
```

Main constraints:

1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. CHECK
6. DEFAULT

---

# 4. PRIMARY KEY Constraint

## What is PRIMARY KEY?

A Primary Key uniquely identifies each row in a table.

Rules:

* Values must be unique
* Cannot contain NULL values
* Only one primary key per table

Example:

```sql
CREATE TABLE employees
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);
```

Table:

```
id     name
-------------
1      John
2      Alice
3      David
```

Invalid:

```
id     name
-------------
1      Mark
```

Because ID 1 already exists.

---

# 5. Creating Primary Key After Table Creation

Using ALTER TABLE:

```sql
ALTER TABLE employees
ADD PRIMARY KEY(id);
```

---

# 6. Composite Primary Key

A primary key can contain multiple columns.

Example:

Student course registration:

```sql
CREATE TABLE registrations
(
    student_id INTEGER,
    course_id INTEGER,

    PRIMARY KEY(student_id, course_id)
);
```

Here:

```
student_id + course_id
```

together create uniqueness.

Example:

Valid:

```
student_id  course_id

1           101
1           102
2           101
```

Invalid:

```
1           101
1           101
```

---

# 7. FOREIGN KEY Constraint

## What is FOREIGN KEY?

A Foreign Key creates a relationship between two tables.

It ensures that a value exists in another table.

Example:

Customers:

```
customers

id    name
-------------
1     John
2     Alice
```

Orders:

```
orders

id    customer_id
-----------------
101       1
102       2
```

customer_id references customers.id.

---

SQL:

Customer table:

```sql
CREATE TABLE customers
(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);
```

Orders table:

```sql
CREATE TABLE orders
(
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,

    FOREIGN KEY(customer_id)
    REFERENCES customers(id)
);
```

---

# 8. FOREIGN KEY Rules

Foreign key value:

✅ Can be NULL (unless NOT NULL is added)

✅ Must exist in parent table

Example:

Allowed:

```
customer_id = 1
```

Because customer 1 exists.

Rejected:

```
customer_id = 999
```

Because customer 999 does not exist.

---

# 9. ON DELETE Actions

When parent data is deleted, PostgreSQL can perform different actions.

Options:

## CASCADE

Delete child rows automatically.

Example:

```sql
FOREIGN KEY(customer_id)
REFERENCES customers(id)
ON DELETE CASCADE
```

Delete customer:

```
Customer deleted
        |
        |
Orders automatically deleted
```

---

## RESTRICT

Prevent deletion.

Example:

```
Customer has orders

Cannot delete customer
```

---

## SET NULL

Set child value to NULL.

Example:

```
customer_id = NULL
```

---

## SET DEFAULT

Set default value.

---

# 10. UNIQUE Constraint

## What is UNIQUE?

UNIQUE ensures that all values in a column are different.

Example:

```sql
CREATE TABLE users
(
    id INTEGER,
    email VARCHAR(100) UNIQUE
);
```

Valid:

```
john@gmail.com
alice@gmail.com
```

Invalid:

```
john@gmail.com
john@gmail.com
```

---

# 11. UNIQUE vs PRIMARY KEY

| PRIMARY KEY         | UNIQUE              |
| ------------------- | ------------------- |
| Only one per table  | Multiple allowed    |
| Cannot contain NULL | Can contain NULL    |
| Identifies rows     | Prevents duplicates |

---

# 12. NOT NULL Constraint

NOT NULL prevents empty values.

Example:

```sql
CREATE TABLE employees
(
    id INTEGER,
    name VARCHAR(100) NOT NULL
);
```

Invalid:

```sql
INSERT INTO employees(id)
VALUES(1);
```

Because name is required.

---

# 13. NULL vs NOT NULL

NULL means:

"No value available"

Example:

```
middle_name = NULL
```

NOT NULL means:

"Value is mandatory"

Example:

```
employee_name cannot be empty
```

---

# 14. CHECK Constraint

CHECK validates data based on a condition.

Example:

Employee age:

```sql
CREATE TABLE employees
(
    id INTEGER,
    age INTEGER CHECK(age >= 18)
);
```

Allowed:

```
age = 25
```

Rejected:

```
age = 10
```

---

# 15. Multiple CHECK Conditions

Example:

```sql
CREATE TABLE products
(
    price NUMERIC
    CHECK(price > 0)
);
```

Price cannot be zero or negative.

---

# 16. DEFAULT Constraint

DEFAULT provides a value automatically.

Example:

```sql
CREATE TABLE users
(
    id INTEGER,
    status VARCHAR(20)
    DEFAULT 'active'
);
```

Insert:

```sql
INSERT INTO users(id)
VALUES(1);
```

Result:

```
id   status
-------------
1    active
```

---

# 17. Naming Constraints

It is a good practice to give meaningful names.

Example:

```sql
CREATE TABLE employees
(
    id INTEGER,

    CONSTRAINT employees_pk
    PRIMARY KEY(id)
);
```

Benefits:

* Easy troubleshooting
* Easy modification
* Better database management

---

# 18. Adding Constraints with ALTER TABLE

## Add NOT NULL

```sql
ALTER TABLE employees
ALTER COLUMN name
SET NOT NULL;
```

---

## Add UNIQUE

```sql
ALTER TABLE employees
ADD CONSTRAINT unique_email
UNIQUE(email);
```

---

## Add CHECK

```sql
ALTER TABLE employees
ADD CONSTRAINT age_check
CHECK(age >= 18);
```

---

## Add FOREIGN KEY

```sql
ALTER TABLE orders
ADD CONSTRAINT customer_fk
FOREIGN KEY(customer_id)
REFERENCES customers(id);
```

---

# 19. Removing Constraints

Syntax:

```sql
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;
```

Example:

```sql
ALTER TABLE employees
DROP CONSTRAINT unique_email;
```

---

# 20. Constraints Example: Real Application Design

## Customer Table

```sql
CREATE TABLE customers
(
    id SERIAL PRIMARY KEY,

    email VARCHAR(100)
    UNIQUE,

    name VARCHAR(100)
    NOT NULL
);
```

---

## Orders Table

```sql
CREATE TABLE orders
(
    id SERIAL PRIMARY KEY,

    customer_id INTEGER NOT NULL,

    amount NUMERIC(10,2)
    CHECK(amount > 0),

    FOREIGN KEY(customer_id)
    REFERENCES customers(id)
);
```

This design ensures:

✅ Unique customer IDs
✅ Unique emails
✅ Customer name required
✅ Orders must belong to customers
✅ Amount cannot be negative

---

# 21. Common Mistakes

## Mistake 1: No Primary Key

Bad design:

```sql
CREATE TABLE employees
(
    name VARCHAR(100)
);
```

Problem:

* Duplicate rows possible
* Hard to identify records

---

## Mistake 2: Wrong Foreign Key

Example:

Referencing a non-existing column:

```sql
REFERENCES customers(email)
```

when email is not unique.

---

## Mistake 3: Too Many Constraints

Do not add unnecessary restrictions.

Example:

A description column should not have a very small limit without a reason.

---

# 22. Industry Best Practices

✅ Every important table should have a primary key.

✅ Use foreign keys to maintain relationships.

✅ Use NOT NULL for mandatory fields.

✅ Use UNIQUE for business-critical unique values.

Examples:

* Email
* Username
* Phone number

✅ Use CHECK for business rules.

Examples:

* Salary > 0
* Age >= 18

✅ Give meaningful constraint names.

---

# 23. Interview Questions

## What is a constraint?

A constraint is a rule applied to table data to maintain data integrity.

---

## Difference between PRIMARY KEY and UNIQUE?

Primary key uniquely identifies each row and cannot contain NULL.

Unique prevents duplicate values but can allow NULL.

---

## Can a table have multiple primary keys?

No. A table can have only one primary key.

---

## Can a table have multiple UNIQUE constraints?

Yes.

Example:

```
email UNIQUE
phone UNIQUE
username UNIQUE
```

---

## What is a foreign key?

A foreign key creates a relationship between two tables and maintains referential integrity.

---

## What is the purpose of CHECK constraint?

It validates data based on a condition.

Example:

```
salary > 0
```

---

# Chapter Summary

* Constraints maintain database integrity.
* PRIMARY KEY identifies rows uniquely.
* FOREIGN KEY maintains table relationships.
* UNIQUE prevents duplicate values.
* NOT NULL ensures required data.
* CHECK validates business rules.
* DEFAULT automatically inserts values.
* Proper constraints make databases reliable and production-ready.

---

# Practice Exercises

1. Create a student table with:

   * student_id as PRIMARY KEY
   * email as UNIQUE
   * name as NOT NULL
   * age CHECK(age >= 5)

2. Create a course table.

3. Create enrollment table using FOREIGN KEY.

4. Add ON DELETE CASCADE.

5. Add a DEFAULT value for student status.

6. Remove one constraint using ALTER TABLE.

---

# Next Chapter

After Constraints, the next logical topic is:

**PostgreSQL CRUD Operations**

* INSERT
* SELECT
* UPDATE
* DELETE

Because after designing tables and rules, we need to learn how to work with actual data.
