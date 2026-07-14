# PostgreSQL Data Types

## Complete Beginner to Professional Notes

---

# 1. What are Data Types?

A **Data Type** defines what kind of value a column can store.

When we create a table, every column must have a specific data type.

Example:

```sql
CREATE TABLE employees (
    id INTEGER,
    name VARCHAR(100),
    salary NUMERIC(10,2),
    joining_date DATE
);
```

Here:

| Column       | Data Type | Purpose               |
| ------------ | --------- | --------------------- |
| id           | INTEGER   | Stores numbers        |
| name         | VARCHAR   | Stores text           |
| salary       | NUMERIC   | Stores decimal values |
| joining_date | DATE      | Stores dates          |

---

# 2. Why Data Types are Important?

Choosing the correct data type helps with:

* Data accuracy
* Storage optimization
* Better query performance
* Proper validation
* Faster indexing
* Avoiding data errors

Example:

Wrong design:

```sql
age VARCHAR(10)
```

Correct design:

```sql
age INTEGER
```

Age is a number, so it should use a numeric data type.

---

# 3. PostgreSQL Data Type Categories

PostgreSQL provides many built-in data types.

Main categories:

```
PostgreSQL Data Types

        |
        |
  -------------------------
  |      |       |        |
Numeric Character Date   Other
Types    Types    Types  Types
```

---

# 4. Numeric Data Types

Numeric types store numbers.

They are divided into:

1. Integer Types
2. Exact Decimal Types
3. Floating Point Types

---

# 4.1 Integer Types

Used for whole numbers.

PostgreSQL provides three integer types.

| Data Type | Storage | Range                           |
| --------- | ------- | ------------------------------- |
| SMALLINT  | 2 bytes | -32,768 to 32,767               |
| INTEGER   | 4 bytes | -2,147,483,648 to 2,147,483,647 |
| BIGINT    | 8 bytes | Very large numbers              |

---

## SMALLINT Example

```sql
CREATE TABLE products (
    quantity SMALLINT
);
```

Use when values are small.

Example:

* Age
* Small counters
* Status codes

---

## INTEGER Example

Most commonly used integer type.

Example:

```sql
CREATE TABLE employees (
    employee_id INTEGER
);
```

Common usage:

* Employee ID
* Customer ID
* Product ID

---

## BIGINT Example

Used for very large values.

Example:

```sql
CREATE TABLE transactions (
    transaction_id BIGINT
);
```

Used in:

* Banking systems
* Large applications
* Event tracking systems

---

# 4.2 NUMERIC / DECIMAL

Used for exact decimal values.

Syntax:

```sql
NUMERIC(precision, scale)
```

Example:

```sql
salary NUMERIC(10,2)
```

Meaning:

```
10  = Total digits
2   = Digits after decimal
```

Example values:

```
99999999.99
```

---

## Where to Use NUMERIC?

Use for:

* Money
* Salary
* Accounting values
* Financial calculations

Example:

```sql
CREATE TABLE accounts (
    balance NUMERIC(12,2)
);
```

---

# 4.3 Floating Point Types

Used for approximate decimal values.

Types:

* REAL
* DOUBLE PRECISION

Example:

```sql
temperature DOUBLE PRECISION;
```

Use for:

* Scientific calculations
* Measurements

Avoid floating types for money because they can have precision issues.

---

# 5. Character Data Types

Used to store text.

PostgreSQL provides:

* CHAR
* VARCHAR
* TEXT

---

# 5.1 CHAR(n)

Fixed-length character type.

Example:

```sql
country_code CHAR(2);
```

Value:

```
IN
US
UK
```

If size is not filled, PostgreSQL adds spaces.

---

# 5.2 VARCHAR(n)

Variable-length text with a limit.

Example:

```sql
name VARCHAR(100);
```

Can store:

```
John Smith
```

Maximum:

```
100 characters
```

Commonly used for:

* Names
* Emails
* Addresses

---

# 5.3 TEXT

Stores unlimited length text.

Example:

```sql
description TEXT;
```

Used for:

* Comments
* Articles
* Messages
* Large descriptions

PostgreSQL treats VARCHAR and TEXT almost similarly in performance.

---

# VARCHAR vs TEXT

| VARCHAR(n)                        | TEXT                  |
| --------------------------------- | --------------------- |
| Has length limit                  | No limit              |
| Good when restriction is required | Good for general text |
| Common in applications            | Common in PostgreSQL  |

---

# 6. Boolean Data Type

Stores TRUE or FALSE values.

Data Type:

```sql
BOOLEAN
```

Possible values:

```text
TRUE
FALSE
NULL
```

Example:

```sql
CREATE TABLE users (
    is_active BOOLEAN
);
```

Values:

```
TRUE  → Active user
FALSE → Inactive user
```

---

# 7. Date and Time Data Types

PostgreSQL has powerful date/time support.

---

# 7.1 DATE

Stores only date.

Format:

```
YYYY-MM-DD
```

Example:

```sql
birth_date DATE;
```

Value:

```
1995-05-20
```

---

# 7.2 TIME

Stores time only.

Example:

```sql
login_time TIME;
```

Value:

```
10:30:45
```

---

# 7.3 TIMESTAMP

Stores date and time.

Example:

```sql
created_at TIMESTAMP;
```

Value:

```
2026-07-14 10:30:45
```

---

# 7.4 TIMESTAMPTZ

Timestamp with timezone.

Example:

```sql
created_at TIMESTAMPTZ;
```

Recommended for applications working globally.

---

# DATE vs TIMESTAMP

| DATE         | TIMESTAMP           |
| ------------ | ------------------- |
| Only date    | Date + time         |
| Birthday     | Transaction time    |
| Joining date | Order creation time |

---

# 8. UUID Data Type

UUID means:

**Universally Unique Identifier**

Example:

```
550e8400-e29b-41d4-a716-446655440000
```

Data Type:

```sql
UUID
```

Used for:

* User IDs
* Distributed systems
* Security-sensitive applications

Example:

```sql
CREATE TABLE users (
    id UUID
);
```

---

# 9. JSON Data Types

PostgreSQL supports JSON.

Types:

* JSON
* JSONB

---

# JSON

Stores JSON data as text.

Example:

```sql
{
 "name":"John",
 "age":30
}
```

---

# JSONB

Binary JSON format.

Advantages:

* Faster searching
* Supports indexing
* Better for production use

Example:

```sql
CREATE TABLE products (
    details JSONB
);
```

---

# JSON vs JSONB

| JSON                  | JSONB             |
| --------------------- | ----------------- |
| Stores original text  | Binary format     |
| Slower search         | Faster search     |
| No indexing advantage | Supports indexing |

In PostgreSQL applications, JSONB is usually preferred.

---

# 10. Array Data Type

PostgreSQL supports arrays.

Example:

```sql
CREATE TABLE students (
    subjects TEXT[]
);
```

Data:

```
{"Math","Science","English"}
```

---

# 11. Enum Data Type

ENUM stores predefined values.

Example:

Create type:

```sql
CREATE TYPE status AS ENUM
(
'active',
'inactive'
);
```

Use:

```sql
user_status status;
```

Only allowed values:

```
active
inactive
```

---

# 12. Special Data Types

PostgreSQL also supports:

| Data Type       | Purpose               |
| --------------- | --------------------- |
| MONEY           | Currency values       |
| BYTEA           | Binary data           |
| XML             | XML documents         |
| INET            | IP addresses          |
| CIDR            | Network addresses     |
| MACADDR         | MAC addresses         |
| RANGE           | Range values          |
| Geometric Types | Points, lines, shapes |

---

# 13. Common Data Type Selection Guide

| Requirement       | Recommended Type |
| ----------------- | ---------------- |
| Employee ID       | INTEGER/BIGINT   |
| Money             | NUMERIC          |
| Name              | VARCHAR/TEXT     |
| Description       | TEXT             |
| Status            | BOOLEAN/ENUM     |
| Date only         | DATE             |
| Date + Time       | TIMESTAMP        |
| Global timestamp  | TIMESTAMPTZ      |
| JSON data         | JSONB            |
| Unique identifier | UUID             |

---

# 14. Common Mistakes

## Mistake 1: Using VARCHAR everywhere

Wrong:

```sql
age VARCHAR(10)
```

Correct:

```sql
age INTEGER
```

---

## Mistake 2: Using FLOAT for money

Wrong:

```sql
price FLOAT
```

Correct:

```sql
price NUMERIC(10,2)
```

---

## Mistake 3: Storing dates as text

Wrong:

```sql
joining_date VARCHAR(20)
```

Correct:

```sql
joining_date DATE
```

---

# 15. Industry Best Practices

✅ Choose the smallest suitable data type.

✅ Use NUMERIC for financial data.

✅ Use TIMESTAMPTZ for global applications.

✅ Prefer JSONB over JSON for frequent searching.

✅ Use UUID when distributed uniqueness is required.

✅ Avoid storing numbers and dates as text.

---

# Interview Questions

## What is a data type?

A data type defines the type of value a database column can store.

---

## Difference between VARCHAR and TEXT?

VARCHAR has a length limit, while TEXT allows unlimited length.

---

## Why use NUMERIC instead of FLOAT for money?

NUMERIC provides exact precision, while FLOAT stores approximate values.

---

## Difference between JSON and JSONB?

JSON stores text format, while JSONB stores binary format and supports better indexing.

---

## Which data type is recommended for storing passwords?

Usually TEXT is used for storing password hashes.

---

# Chapter Summary

* Data types define what kind of data a column stores.
* PostgreSQL provides numeric, character, date/time, boolean, JSON, array, UUID, and special data types.
* Correct data type selection improves performance and data quality.
* NUMERIC is preferred for financial calculations.
* JSONB is preferred for JSON-based applications.
* TIMESTAMPTZ is recommended for global applications.

---

# Practice Exercises

1. Create an employee table using proper data types.
2. Choose data types for:

   * Product price
   * User email
   * Order date
   * Active status
   * Large transaction ID
3. Explain the difference between INTEGER and BIGINT.
4. Explain JSON vs JSONB.
5. When should you use UUID?
