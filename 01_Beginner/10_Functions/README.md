# PostgreSQL Functions

## Complete Beginner to Professional Notes

---

# 1. What is a Function?

A **Function** is a reusable block of code that performs a specific operation and returns a result.

Simple example:

```sql
SELECT UPPER('postgresql');
```

Output:

```text
POSTGRESQL
```

Here:

```text
UPPER()
```

is a function.

---

# 2. Why Do We Need Functions?

Functions help us:

* Avoid repeating logic
* Perform calculations
* Transform data
* Analyze information
* Make queries shorter
* Improve productivity

Example:

Without function:

```sql
SELECT first_name, last_name
FROM employees;
```

Need to combine names manually.

With function:

```sql
SELECT CONCAT(first_name,last_name)
FROM employees;
```

---

# 3. Types of PostgreSQL Functions

PostgreSQL functions are mainly divided into:

```text
PostgreSQL Functions

        |
        |
 ---------------------------
 |            |             |
Built-in   Aggregate   User Defined
Functions  Functions   Functions
```

Main categories:

1. String Functions
2. Numeric Functions
3. Date and Time Functions
4. Aggregate Functions
5. Mathematical Functions
6. Conversion Functions
7. Conditional Functions
8. JSON Functions
9. User-Defined Functions

---

# 4. Function Syntax

Basic syntax:

```sql
function_name(arguments);
```

Example:

```sql
SELECT LENGTH('PostgreSQL');
```

Output:

```text
10
```

---

# 5. String Functions

String functions work with text data.

Common string functions:

| Function    | Purpose           |
| ----------- | ----------------- |
| LENGTH()    | Count characters  |
| UPPER()     | Convert uppercase |
| LOWER()     | Convert lowercase |
| CONCAT()    | Combine strings   |
| SUBSTRING() | Extract text      |
| TRIM()      | Remove spaces     |
| REPLACE()   | Replace text      |

---

# 6. LENGTH()

Returns number of characters.

Example:

```sql
SELECT LENGTH('PostgreSQL');
```

Output:

```text
10
```

Example with table:

```sql
SELECT name,
LENGTH(name)
FROM employees;
```

---

# 7. UPPER()

Converts text into uppercase.

Example:

```sql
SELECT UPPER('postgresql');
```

Output:

```text
POSTGRESQL
```

Example:

```sql
SELECT UPPER(name)
FROM employees;
```

---

# 8. LOWER()

Converts text into lowercase.

Example:

```sql
SELECT LOWER('POSTGRESQL');
```

Output:

```text
postgresql
```

---

# 9. CONCAT()

Combines multiple strings.

Example:

```sql
SELECT CONCAT('Postgre','SQL');
```

Output:

```text
PostgreSQL
```

Example:

```sql
SELECT CONCAT(first_name,' ',last_name)
FROM employees;
```

---

# 10. String Concatenation Operator (||)

Alternative method:

```sql
SELECT
first_name || ' ' || last_name
FROM employees;
```

---

# 11. SUBSTRING()

Extracts part of a string.

Syntax:

```sql
SUBSTRING(text,start,length)
```

Example:

```sql
SELECT SUBSTRING('PostgreSQL',1,8);
```

Output:

```text
Postgre
```

---

# 12. REPLACE()

Replaces text.

Example:

```sql
SELECT REPLACE(
'PostgreSQL Database',
'Database',
'System'
);
```

Output:

```text
PostgreSQL System
```

---

# 13. TRIM()

Removes spaces.

Example:

```sql
SELECT TRIM('  PostgreSQL  ');
```

Output:

```text
PostgreSQL
```

---

# 14. Numeric Functions

Numeric functions perform calculations.

Common functions:

| Function | Purpose           |
| -------- | ----------------- |
| ROUND()  | Round numbers     |
| CEIL()   | Round upward      |
| FLOOR()  | Round downward    |
| ABS()    | Absolute value    |
| POWER()  | Power calculation |
| RANDOM() | Random number     |

---

# 15. ROUND()

Rounds a number.

Example:

```sql
SELECT ROUND(10.567);
```

Output:

```text
11
```

With decimal:

```sql
SELECT ROUND(10.567,2);
```

Output:

```text
10.57
```

---

# 16. CEIL()

Rounds upward.

Example:

```sql
SELECT CEIL(10.2);
```

Output:

```text
11
```

---

# 17. FLOOR()

Rounds downward.

Example:

```sql
SELECT FLOOR(10.9);
```

Output:

```text
10
```

---

# 18. ABS()

Returns positive value.

Example:

```sql
SELECT ABS(-100);
```

Output:

```text
100
```

---

# 19. POWER()

Calculates power.

Example:

```sql
SELECT POWER(2,3);
```

Output:

```text
8
```

---

# 20. Date and Time Functions

PostgreSQL has powerful date functions.

Common functions:

| Function     | Purpose                  |
| ------------ | ------------------------ |
| NOW()        | Current date and time    |
| CURRENT_DATE | Current date             |
| CURRENT_TIME | Current time             |
| AGE()        | Difference between dates |
| EXTRACT()    | Extract date part        |

---

# 21. NOW()

Returns current timestamp.

Example:

```sql
SELECT NOW();
```

Output:

```text
2026-07-14 10:30:00
```

---

# 22. CURRENT_DATE

Example:

```sql
SELECT CURRENT_DATE;
```

Output:

```text
2026-07-14
```

---

# 23. AGE()

Calculates difference between dates.

Example:

```sql
SELECT AGE(
'2026-07-14',
'2000-01-01'
);
```

Returns:

```text
26 years
```

---

# 24. EXTRACT()

Extracts date information.

Example:

Get year:

```sql
SELECT EXTRACT(YEAR FROM CURRENT_DATE);
```

Output:

```text
2026
```

Example:

Get month:

```sql
SELECT EXTRACT(MONTH FROM CURRENT_DATE);
```

---

# 25. Aggregate Functions

Aggregate functions perform calculations on multiple rows.

Common functions:

| Function | Purpose    |
| -------- | ---------- |
| COUNT()  | Count rows |
| SUM()    | Total      |
| AVG()    | Average    |
| MAX()    | Maximum    |
| MIN()    | Minimum    |

---

# 26. COUNT()

Counts rows.

Example:

```sql
SELECT COUNT(*)
FROM employees;
```

Output:

```text
100
```

---

# 27. SUM()

Calculates total.

Example:

```sql
SELECT SUM(salary)
FROM employees;
```

---

# 28. AVG()

Calculates average.

Example:

```sql
SELECT AVG(salary)
FROM employees;
```

---

# 29. MAX()

Finds highest value.

Example:

```sql
SELECT MAX(salary)
FROM employees;
```

---

# 30. MIN()

Finds lowest value.

Example:

```sql
SELECT MIN(salary)
FROM employees;
```

---

# 31. GROUP BY with Functions

Functions are often used with GROUP BY.

Example:

Find average salary by department:

```sql
SELECT
department,
AVG(salary)
FROM employees
GROUP BY department;
```

Result:

```text
IT        70000
HR        50000
Finance   65000
```

---

# 32. Conditional Functions

## COALESCE()

Returns first non-null value.

Example:

```sql
SELECT COALESCE(phone,'Not Available')
FROM employees;
```

If phone is NULL:

Output:

```text
Not Available
```

---

# 33. NULLIF()

Returns NULL if two values are equal.

Example:

```sql
SELECT NULLIF(10,10);
```

Output:

```text
NULL
```

---

# 34. CASE Function

CASE provides conditional logic.

Example:

```sql
SELECT
name,
CASE
WHEN salary > 70000
THEN 'High'
ELSE 'Normal'
END
FROM employees;
```

Output:

```text
John High
Alice Normal
```

---

# 35. Type Conversion Functions

Used to convert data types.

## CAST()

Example:

```sql
SELECT CAST('100' AS INTEGER);
```

Output:

```text
100
```

---

Alternative:

```sql
SELECT '100'::INTEGER;
```

---

# 36. JSON Functions

PostgreSQL provides JSON functions.

Example:

Convert JSON:

```sql
SELECT '{"name":"John"}'::json;
```

Access JSON:

```sql
data->>'name'
```

---

# 37. User Defined Functions

PostgreSQL allows developers to create their own functions.

Example:

```sql
CREATE FUNCTION add_numbers(
a INTEGER,
b INTEGER
)
RETURNS INTEGER
AS $$
BEGIN
RETURN a+b;
END;
$$
LANGUAGE plpgsql;
```

Calling:

```sql
SELECT add_numbers(10,20);
```

Output:

```text
30
```

---

# 38. Function vs Procedure

| Function            | Procedure            |
| ------------------- | -------------------- |
| Returns value       | May not return value |
| Used in SQL queries | Called separately    |
| SELECT function()   | CALL procedure()     |

---

# 39. Common Mistakes

## Mistake 1: Ignoring NULL values

Example:

```sql
SELECT AVG(salary)
FROM employees;
```

NULL salaries are ignored.

---

## Mistake 2: Wrong function usage

Wrong:

```sql
SELECT LENGTH(100);
```

Correct:

```sql
SELECT LENGTH('100');
```

---

## Mistake 3: Using functions on indexed columns unnecessarily

Example:

Slow:

```sql
WHERE LOWER(name)='john'
```

May prevent index usage.

---

# 40. Industry Best Practices

✅ Use built-in functions whenever possible.

✅ Avoid unnecessary repeated calculations.

✅ Handle NULL values using COALESCE.

✅ Use meaningful aliases for calculated columns.

Example:

```sql
SELECT AVG(salary)
AS average_salary
FROM employees;
```

✅ Use functions to simplify complex queries.

---

# 41. Interview Questions

## What is a function?

A function is a reusable block of code that performs an operation and returns a result.

---

## Difference between COUNT(*) and COUNT(column)?

COUNT(*) counts all rows.

COUNT(column) ignores NULL values.

---

## What is COALESCE?

COALESCE returns the first non-null value.

---

## Difference between NOW() and CURRENT_DATE?

NOW() returns date and time.

CURRENT_DATE returns only date.

---

## What are aggregate functions?

Functions that perform calculations on multiple rows.

Examples:

* SUM()
* AVG()
* COUNT()
* MIN()
* MAX()

---

# Chapter Summary

* Functions simplify SQL operations.
* String functions manipulate text.
* Numeric functions perform calculations.
* Date functions handle time-based data.
* Aggregate functions analyze data.
* Conditional functions handle business logic.
* Conversion functions change data types.
* User-defined functions allow custom database logic.

---

# Practice Exercises

Using an employee table:

1. Convert employee names to uppercase.
2. Find length of employee names.
3. Calculate average salary.
4. Find highest and lowest salary.
5. Count employees by department.
6. Replace NULL phone numbers with "N/A".
7. Extract joining year from joining_date.
8. Create a custom function to calculate yearly salary.

---

# Next Chapter

After Functions, the next important topic is:

**Sorting and Limiting Data**

* ORDER BY
* ASC / DESC
* LIMIT
* OFFSET
* Pagination
* Top-N Queries

These concepts are essential for reports, dashboards, and application development.
