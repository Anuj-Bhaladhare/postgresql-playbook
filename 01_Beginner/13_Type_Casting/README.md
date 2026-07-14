# PostgreSQL Type Casting

## Complete Beginner to Professional Notes

---

# 1. What is Type Casting?

**Type Casting** is the process of converting a value from one data type to another data type.

Example:

Convert text into integer:

```sql
SELECT '100'::INTEGER;
```

Output:

```text
100
```

Here:

```text
'100'
```

is TEXT.

After casting:

```text
INTEGER
```

---

# 2. Why Do We Need Type Casting?

Type casting is required when:

* Performing calculations
* Comparing different data types
* Converting imported data
* Formatting output
* Working with APIs and JSON
* Handling user input

Example:

Without casting:

```sql
SELECT '10' + 20;
```

Error:

```text
operator does not exist: text + integer
```

Because PostgreSQL cannot add TEXT and INTEGER.

Correct:

```sql
SELECT '10'::INTEGER + 20;
```

Output:

```text
30
```

---

# 3. PostgreSQL Type System

Common PostgreSQL data types:

```text
Numeric
 |
 |-- INTEGER
 |-- BIGINT
 |-- NUMERIC
 |
Text
 |
 |-- CHAR
 |-- VARCHAR
 |-- TEXT
 |
Date/Time
 |
 |-- DATE
 |-- TIMESTAMP
 |
Boolean
 |
 |-- BOOLEAN
 |
JSON
 |
 |-- JSON
 |-- JSONB
```

---

# 4. Types of Type Casting

PostgreSQL supports two main methods:

## Method 1: CAST()

SQL Standard method

```sql
CAST(value AS datatype)
```

---

## Method 2: PostgreSQL Short Syntax (::)

PostgreSQL-specific method

```sql
value::datatype
```

---

# 5. CAST() Syntax

Syntax:

```sql
CAST(expression AS datatype)
```

Example:

```sql
SELECT CAST('100' AS INTEGER);
```

Output:

```text
100
```

---

# 6. :: Casting Syntax

PostgreSQL shortcut:

```sql
SELECT '100'::INTEGER;
```

Output:

```text
100
```

Both produce the same result.

---

# 7. CAST vs ::

| CAST()                | :: Operator         |
| --------------------- | ------------------- |
| SQL Standard          | PostgreSQL specific |
| More portable         | Shorter             |
| Used in all databases | PostgreSQL feature  |
| More readable         | Faster to write     |

---

# 8. Text to Integer Conversion

Example:

```sql
SELECT '500'::INTEGER;
```

Output:

```text
500
```

---

Real Example:

Table:

```text
products

price_text
-----------
1000
2000
```

Query:

```sql
SELECT
price_text::INTEGER
FROM products;
```

---

# 9. Integer to Text Conversion

Example:

```sql
SELECT 100::TEXT;
```

Output:

```text
100
```

---

Using CAST:

```sql
SELECT CAST(100 AS TEXT);
```

---

# 10. Integer to Numeric Conversion

Example:

```sql
SELECT 10::NUMERIC;
```

Output:

```text
10
```

Useful for:

* Financial calculations
* Decimal precision

---

# 11. Numeric to Integer Conversion

Example:

```sql
SELECT 10.75::INTEGER;
```

Output:

```text
11
```

PostgreSQL rounds numeric values.

---

# 12. Decimal Precision Casting

Example:

```sql
SELECT
CAST(123.456 AS NUMERIC(5,2));
```

Output:

```text
123.46
```

Meaning:

```text
NUMERIC(total digits, decimal digits)
```

---

# 13. Text to Date Conversion

Very common in real projects.

Example:

```sql
SELECT
'2026-07-14'::DATE;
```

Output:

```text
2026-07-14
```

---

Using CAST:

```sql
SELECT
CAST('2026-07-14' AS DATE);
```

---

# 14. Text to Timestamp Conversion

Example:

```sql
SELECT
'2026-07-14 10:30:00'::TIMESTAMP;
```

Output:

```text
2026-07-14 10:30:00
```

---

# 15. Date to Text Conversion

Example:

```sql
SELECT
CURRENT_DATE::TEXT;
```

Output:

```text
2026-07-14
```

---

# 16. Timestamp to Date Conversion

Example:

```sql
SELECT
NOW()::DATE;
```

Output:

```text
2026-07-14
```

Time part is removed.

---

# 17. Boolean Casting

PostgreSQL supports boolean conversion.

Text to boolean:

```sql
SELECT 'true'::BOOLEAN;
```

Output:

```text
true
```

---

Example:

```sql
SELECT 'false'::BOOLEAN;
```

Output:

```text
false
```

---

# 18. Boolean to Integer

PostgreSQL does not automatically convert:

```sql
TRUE::INTEGER
```

Instead use:

```sql
CASE
WHEN TRUE THEN 1
ELSE 0
END;
```

---

# 19. JSON Type Casting

PostgreSQL has strong JSON support.

Text to JSON:

```sql
SELECT
'{"name":"John"}'::JSON;
```

---

JSONB conversion:

```sql
SELECT
'{"name":"John"}'::JSONB;
```

---

# 20. Array Type Casting

Example:

Convert text array:

```sql
SELECT
'{10,20,30}'::INTEGER[];
```

Output:

```text
{10,20,30}
```

---

# 21. Explicit vs Implicit Casting

## Explicit Casting

Developer manually converts type.

Example:

```sql
SELECT
'100'::INTEGER;
```

---

## Implicit Casting

PostgreSQL automatically converts.

Example:

```sql
SELECT
10 + 5.5;
```

PostgreSQL converts:

```text
INTEGER → NUMERIC
```

---

# 22. Type Casting in Calculations

Example:

Wrong:

```sql
SELECT
5/2;
```

Output:

```text
2
```

Because both are integers.

---

Correct:

```sql
SELECT
5::NUMERIC / 2;
```

Output:

```text
2.5
```

---

# 23. Type Casting in Queries

Example table:

```text
employees

salary_text
------------
50000
60000
70000
```

Find salary greater than 60000:

Wrong:

```sql
WHERE salary_text > 60000
```

Correct:

```sql
WHERE salary_text::INTEGER > 60000
```

---

# 24. Type Casting with CONCAT

Example:

```sql
SELECT
'Employee ID: '
||
id::TEXT
FROM employees;
```

Output:

```text
Employee ID: 101
```

---

# 25. Type Casting with Dates

Example:

Find records after a date:

```sql
SELECT *
FROM orders
WHERE order_date >
'2026-01-01'::DATE;
```

---

# 26. Using TO_DATE Instead of Casting

Casting works when format is standard:

```sql
'2026-07-14'::DATE
```

For custom formats use:

```sql
TO_DATE()
```

Example:

```sql
SELECT TO_DATE(
'14/07/2026',
'DD/MM/YYYY'
);
```

---

# 27. Safe Casting Problem

Example:

```sql
SELECT 'abc'::INTEGER;
```

Result:

```text
ERROR
invalid input syntax for integer
```

PostgreSQL cannot convert invalid values.

---

# 28. Handling Invalid Data

Use validation before casting.

Example:

```sql
SELECT *
FROM products
WHERE price_text ~ '^[0-9]+$';
```

Then:

```sql
SELECT price_text::INTEGER
FROM products;
```

---

# 29. Type Casting with CASE

Example:

Convert only valid values:

```sql
SELECT
CASE
WHEN value ~ '^[0-9]+$'
THEN value::INTEGER
ELSE NULL
END
FROM table_name;
```

---

# 30. Common Type Casting Mistakes

---

## Mistake 1: Forgetting decimal casting

Wrong:

```sql
SELECT 10/3;
```

Output:

```text
3
```

Correct:

```sql
SELECT 10::NUMERIC/3;
```

Output:

```text
3.333
```

---

## Mistake 2: Invalid conversion

Wrong:

```sql
SELECT 'hello'::INTEGER;
```

Error.

---

## Mistake 3: Comparing different types

Wrong:

```sql
WHERE id='100'
```

Better:

```sql
WHERE id=100
```

---

# 31. Industry Best Practices

✅ Store data in the correct data type.

Do not store:

```text
salary VARCHAR
```

Store:

```text
salary NUMERIC
```

---

✅ Use explicit casting when clarity is important.

Example:

```sql
price::NUMERIC
```

---

✅ Validate data before casting.

Especially:

* CSV imports
* User input
* External APIs

---

✅ Avoid unnecessary casting on indexed columns.

Example:

Slower:

```sql
WHERE id::TEXT='100'
```

Better:

```sql
WHERE id=100
```

---

# 32. Real-World Examples

---

## Example 1: CSV Import Cleanup

CSV:

```text
salary
------
50000
60000
```

Imported as TEXT.

Convert:

```sql
SELECT salary::INTEGER
FROM employee_import;
```

---

## Example 2: Calculate Average

Wrong:

```sql
AVG(salary_text)
```

Correct:

```sql
AVG(salary_text::NUMERIC)
```

---

## Example 3: Generate Report Label

```sql
SELECT
'Year: '
||
EXTRACT(YEAR FROM order_date)::TEXT
FROM orders;
```

---

# 33. Interview Questions

## What is Type Casting?

Type casting converts one data type into another.

---

## Difference between CAST() and ::?

CAST() is SQL standard.

:: is PostgreSQL-specific syntax.

---

## Why is type casting required?

To make different data types compatible during operations.

---

## Difference between implicit and explicit casting?

Implicit:
PostgreSQL converts automatically.

Explicit:
Developer converts manually.

---

## Why does 5/2 return 2?

Because both values are INTEGER.

Use:

```sql
5::NUMERIC/2
```

to get:

```text
2.5
```

---

# Chapter Summary

* Type casting converts values between data types.
* PostgreSQL supports CAST() and :: syntax.
* Text can be converted into numbers and dates.
* Numeric casting is important for accurate calculations.
* Date casting is common in reporting.
* JSON and arrays also support casting.
* Always validate data before conversion.
* Correct data types improve database performance.

---

# Practice Exercises

1. Convert text '100' into INTEGER.
2. Convert integer 500 into TEXT.
3. Convert current timestamp into DATE.
4. Calculate 10/3 with decimal precision.
5. Convert JSON text into JSONB.
6. Convert string date into DATE.
7. Fix a salary column stored as TEXT.
8. Create a report label using integer-to-text conversion.

---

# Next Chapter

After Type Casting, the next important topic is:

**Aggregate Functions**

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

These concepts are the foundation of SQL reporting and analytics.
