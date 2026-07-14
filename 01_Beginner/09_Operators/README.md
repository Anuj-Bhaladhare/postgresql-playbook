# PostgreSQL Operators

## Complete Beginner to Professional Notes

---

# 1. What are Operators?

An **Operator** is a symbol or keyword that performs an operation on one or more values.

Examples:

```sql
5 + 10
```

Here:

```text
+
```

is an operator.

SQL uses operators for:

* Calculations
* Comparisons
* Filtering
* Searching
* Combining conditions
* Working with data structures

---

# 2. Types of PostgreSQL Operators

PostgreSQL provides different categories of operators.

```text id="7y3q4f"
PostgreSQL Operators

          |
          |
 --------------------------------
 |        |        |             |
Arithmetic Comparison Logical  Special
Operators   Operators Operators Operators

```

Main categories:

1. Arithmetic Operators
2. Comparison Operators
3. Logical Operators
4. Assignment Operators
5. String Operators
6. Pattern Matching Operators
7. Range Operators
8. Array Operators
9. JSON Operators
10. Bitwise Operators

---

# 3. Arithmetic Operators

Arithmetic operators perform mathematical calculations.

| Operator | Meaning        |
| -------- | -------------- |
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |

---

# 4. Addition (+)

Example:

```sql
SELECT 10 + 5;
```

Output:

```
15
```

Real example:

```sql
SELECT salary + 5000
FROM employees;
```

Adds 5000 to salary.

---

# 5. Subtraction (-)

Example:

```sql
SELECT 100 - 30;
```

Output:

```
70
```

Example:

```sql
SELECT salary - 1000
FROM employees;
```

---

# 6. Multiplication (*)

Example:

```sql
SELECT price * quantity
FROM orders;
```

Calculates total amount.

Example:

```text
price = 100
quantity = 5

100 * 5 = 500
```

---

# 7. Division (/)

Example:

```sql
SELECT 100 / 5;
```

Output:

```
20
```

Example:

```sql
SELECT total_sales / employees
FROM company;
```

---

# 8. Modulus (%)

Returns remainder.

Example:

```sql
SELECT 10 % 3;
```

Output:

```
1
```

Real usage:

Finding even numbers:

```sql
SELECT *
FROM employees
WHERE id % 2 = 0;
```

---

# 9. Comparison Operators

Comparison operators compare two values.

They return:

```
TRUE
FALSE
NULL
```

---

# 10. Equal Operator (=)

Example:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Returns IT employees.

---

# 11. Not Equal Operators (!= and <>)

Both work in PostgreSQL.

Example:

```sql
SELECT *
FROM employees
WHERE department != 'HR';
```

or:

```sql
SELECT *
FROM employees
WHERE department <> 'HR';
```

---

# 12. Greater Than (>)

Example:

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

# 13. Less Than (<)

Example:

```sql
SELECT *
FROM employees
WHERE salary < 50000;
```

---

# 14. Greater Than or Equal (>=)

Example:

```sql
SELECT *
FROM employees
WHERE salary >= 50000;
```

---

# 15. Less Than or Equal (<=)

Example:

```sql
SELECT *
FROM employees
WHERE salary <= 50000;
```

---

# 16. Logical Operators

Logical operators combine conditions.

Main operators:

* AND
* OR
* NOT

---

# 17. AND Operator

Both conditions must be true.

Example:

```sql
SELECT *
FROM employees
WHERE department='IT'
AND salary > 60000;
```

---

# 18. OR Operator

At least one condition must be true.

Example:

```sql
SELECT *
FROM employees
WHERE department='IT'
OR department='HR';
```

---

# 19. NOT Operator

Reverses a condition.

Example:

```sql
SELECT *
FROM employees
WHERE NOT department='IT';
```

---

# 20. Special Comparison Operators

PostgreSQL provides powerful comparison operators.

---

# 21. BETWEEN Operator

Checks values within a range.

Syntax:

```sql
value BETWEEN low AND high
```

Example:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;
```

Equivalent:

```sql
salary >= 40000
AND salary <= 70000
```

---

# 22. IN Operator

Checks multiple possible values.

Example:

```sql
SELECT *
FROM employees
WHERE department IN
('IT','HR','Finance');
```

Equivalent:

```sql
department='IT'
OR department='HR'
OR department='Finance'
```

---

# 23. NOT IN Operator

Example:

```sql
SELECT *
FROM employees
WHERE department NOT IN
('IT','HR');
```

---

# 24. LIKE Operator

Used for pattern matching.

Wildcards:

| Symbol | Meaning                  |
| ------ | ------------------------ |
| %      | Any number of characters |
| _      | Single character         |

Example:

Starts with A:

```sql
SELECT *
FROM employees
WHERE name LIKE 'A%';
```

---

# 25. ILIKE Operator

PostgreSQL-specific.

Case-insensitive LIKE.

Example:

```sql
SELECT *
FROM employees
WHERE name ILIKE 'john';
```

Matches:

```
John
JOHN
john
```

---

# 26. IS NULL Operator

Checks missing values.

Example:

```sql
SELECT *
FROM employees
WHERE phone IS NULL;
```

---

# 27. IS NOT NULL

Example:

```sql
SELECT *
FROM employees
WHERE phone IS NOT NULL;
```

---

# 28. String Operators

Used for text operations.

---

# 29. Concatenation Operator (||)

Combines strings.

Example:

```sql
SELECT
first_name || ' ' || last_name
AS full_name
FROM employees;
```

Output:

```
John Smith
```

---

# 30. String Comparison

Example:

```sql
SELECT *
FROM employees
WHERE name > 'John';
```

PostgreSQL compares alphabetically.

---

# 31. Array Operators

PostgreSQL supports arrays.

Example:

```sql
tags = ARRAY['SQL','Postgres']
```

---

## Contains (@>)

Example:

```sql
SELECT *
FROM products
WHERE tags @> ARRAY['SQL'];
```

Checks if array contains value.

---

## Overlap (&&)

Example:

```sql
SELECT *
FROM products
WHERE tags && ARRAY['SQL','Python'];
```

Checks common elements.

---

# 32. JSON Operators

PostgreSQL has powerful JSON support.

Example JSON:

```json
{
"name":"John",
"age":30
}
```

Stored in JSONB column.

---

# 33. Get JSON Value (->)

Example:

```sql
SELECT data->'name'
FROM users;
```

Returns JSON value.

---

# 34. Get JSON Text (->>)

Example:

```sql
SELECT data->>'name'
FROM users;
```

Returns text.

Difference:

| Operator | Returns |
| -------- | ------- |
| ->       | JSON    |
| ->>      | Text    |

---

# 35. Range Operators

PostgreSQL supports range data types.

Example:

```text
[10,20]
```

---

Contains:

```text
@
```

Example:

```sql
range @> 15
```

Meaning:

Does range contain 15?

---

# 36. Bitwise Operators

Used for binary operations.

| Operator | Meaning |    |
| -------- | ------- | -- |
| &        | AND     |    |
|          |         | OR |
| #        | XOR     |    |
| ~        | NOT     |    |

Example:

```sql
SELECT 5 & 3;
```

---

# 37. Assignment Operator

Used internally to assign values.

Example:

```sql
UPDATE employees
SET salary = 70000;
```

Here:

```text
=
```

assigns value.

---

# 38. Operator Precedence

When multiple operators exist, PostgreSQL follows priority.

Order:

```text
()
*
/
%
+
-
Comparison
NOT
AND
OR
```

Example:

```sql
SELECT 10 + 5 * 2;
```

Calculation:

```
5 * 2 = 10

10 + 10 = 20
```

---

# 39. Common Mistakes

## Mistake 1: Using = NULL

Wrong:

```sql
WHERE name = NULL;
```

Correct:

```sql
WHERE name IS NULL;
```

---

## Mistake 2: Forgetting parentheses

Wrong:

```sql
A OR B AND C
```

Better:

```sql
(A OR B) AND C
```

---

## Mistake 3: Using LIKE unnecessarily

Slow:

```sql
WHERE name LIKE '%John%'
```

For exact search:

Better:

```sql
WHERE name='John'
```

---

## Mistake 4: Incorrect IN usage

Wrong:

```sql
WHERE department='IT','HR'
```

Correct:

```sql
WHERE department IN ('IT','HR')
```

---

# 40. Industry Best Practices

✅ Use parentheses when combining conditions.

✅ Use proper operators for the requirement.

✅ Avoid unnecessary calculations in WHERE conditions.

✅ Use indexes with frequently searched operators.

✅ Use ILIKE carefully because case-insensitive searches can be slower.

✅ Prefer IN instead of multiple OR conditions.

---

# 41. Interview Questions

## What are operators in SQL?

Operators are symbols or keywords used to perform calculations and comparisons.

---

## Difference between = and IS NULL?

= compares values.

IS NULL checks missing values.

---

## Difference between LIKE and ILIKE?

LIKE is case-sensitive.

ILIKE is case-insensitive in PostgreSQL.

---

## What does || do in PostgreSQL?

It concatenates strings.

Example:

```sql
'Hello' || ' World'
```

Result:

```
Hello World
```

---

## What is BETWEEN?

BETWEEN checks whether a value exists within a specified range.

---

# Chapter Summary

* Operators are used for calculations and comparisons.
* Arithmetic operators perform mathematical operations.
* Comparison operators filter data.
* Logical operators combine conditions.
* LIKE and ILIKE perform pattern searches.
* PostgreSQL provides advanced operators for arrays and JSON.
* Correct operator usage improves query quality and performance.

---

# Practice Exercises

Using an employee table:

1. Find employees with salary greater than 50000.
2. Find employees in IT or HR using IN.
3. Find names starting with 'S'.
4. Find employees with missing phone numbers.
5. Calculate yearly salary using multiplication.
6. Combine three conditions using AND/OR.
7. Concatenate first name and last name.
8. Use BETWEEN to find salary ranges.

---

# Next Chapter

After Operators, the next important topic is:

**Sorting and Limiting Data**

* ORDER BY
* ASC / DESC
* LIMIT
* OFFSET
* Pagination
* Top-N Queries

These concepts are heavily used in reports, dashboards, and real-world applications.
