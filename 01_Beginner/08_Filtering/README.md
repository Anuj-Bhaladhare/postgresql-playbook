# PostgreSQL Data Filtering

## Complete Beginner to Professional Notes

---

# 1. What is Data Filtering?

**Data Filtering** means retrieving only the required rows from a table based on specific conditions.

Instead of displaying all records:

```sql
SELECT *
FROM employees;
```

We filter data:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Only IT department employees are returned.

---

# 2. Why Do We Need Filtering?

Filtering helps to:

* Reduce unnecessary data
* Improve readability
* Find specific records quickly
* Build application search features
* Generate reports

Real-world examples:

| Requirement                | Filter            |
| -------------------------- | ----------------- |
| Active users only          | status = 'active' |
| High salary employees      | salary > 50000    |
| Orders in 2026             | order_date range  |
| Products under price limit | price < 1000      |

---

# 3. WHERE Clause

## What is WHERE?

`WHERE` is used to filter rows based on a condition.

Syntax:

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

---

# 4. Basic WHERE Example

Table:

```text
employees

id | name  | department | salary
---------------------------------
1  | John  | IT         | 60000
2  | Alice | HR         | 50000
3  | David | IT         | 75000
```

Query:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Result:

```text
John
David
```

---

# 5. Comparison Operators

Comparison operators compare values.

| Operator | Meaning               |
| -------- | --------------------- |
| =        | Equal                 |
| !=       | Not Equal             |
| <>       | Not Equal             |
| >        | Greater Than          |
| <        | Less Than             |
| >=       | Greater Than or Equal |
| <=       | Less Than or Equal    |

---

# 6. Equal (=)

Example:

Find IT employees:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

---

# 7. Not Equal (!= or <>)

Example:

Find employees not in IT:

```sql
SELECT *
FROM employees
WHERE department != 'IT';
```

or:

```sql
SELECT *
FROM employees
WHERE department <> 'IT';
```

---

# 8. Greater Than (>)

Example:

Find employees earning more than 60000:

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

---

# 9. Less Than (<)

Example:

```sql
SELECT *
FROM employees
WHERE salary < 50000;
```

---

# 10. Greater Than or Equal (>=)

Example:

```sql
SELECT *
FROM employees
WHERE salary >= 60000;
```

---

# 11. Less Than or Equal (<=)

Example:

```sql
SELECT *
FROM employees
WHERE salary <= 50000;
```

---

# 12. Logical Operators

Logical operators combine multiple conditions.

Main operators:

* AND
* OR
* NOT

---

# 13. AND Operator

## Meaning:

Both conditions must be TRUE.

Syntax:

```sql
WHERE condition1
AND condition2
```

Example:

Find IT employees earning more than 60000:

```sql
SELECT *
FROM employees
WHERE department='IT'
AND salary > 60000;
```

Result:

```text
David
```

---

# 14. OR Operator

## Meaning:

At least one condition must be TRUE.

Example:

Find IT or HR employees:

```sql
SELECT *
FROM employees
WHERE department='IT'
OR department='HR';
```

---

# 15. NOT Operator

NOT reverses a condition.

Example:

Find employees who are not IT:

```sql
SELECT *
FROM employees
WHERE NOT department='IT';
```

---

# 16. Operator Precedence

When multiple operators are used:

Order:

```text
()
NOT
AND
OR
```

Example:

Wrong assumption:

```sql
WHERE department='IT'
OR department='HR'
AND salary > 50000;
```

Better:

```sql
WHERE
(department='IT'
OR department='HR')
AND salary > 50000;
```

Always use parentheses for clarity.

---

# 17. BETWEEN Operator

## What is BETWEEN?

BETWEEN filters values within a range.

Syntax:

```sql
value BETWEEN low AND high
```

---

Example:

Find salary between 50000 and 70000:

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 70000;
```

Important:

BETWEEN is inclusive.

Meaning:

```text
50000 <= salary <= 70000
```

---

# 18. NOT BETWEEN

Example:

```sql
SELECT *
FROM employees
WHERE salary NOT BETWEEN 50000 AND 70000;
```

---

# 19. IN Operator

## What is IN?

IN checks multiple possible values.

Instead of writing:

```sql
department='IT'
OR department='HR'
OR department='Finance'
```

Use:

```sql
department IN ('IT','HR','Finance')
```

Example:

```sql
SELECT *
FROM employees
WHERE department IN ('IT','HR');
```

---

# 20. NOT IN

Example:

```sql
SELECT *
FROM employees
WHERE department NOT IN ('IT','HR');
```

---

# 21. LIKE Operator

## What is LIKE?

LIKE is used for pattern matching.

Wildcards:

| Symbol | Meaning                  |
| ------ | ------------------------ |
| %      | Any number of characters |
| _      | Exactly one character    |

---

# 22. LIKE with %

Example:

Find names starting with J:

```sql
SELECT *
FROM employees
WHERE name LIKE 'J%';
```

Matches:

```text
John
James
Jack
```

---

Find names ending with n:

```sql
SELECT *
FROM employees
WHERE name LIKE '%n';
```

Matches:

```text
John
Martin
```

---

Contains text:

```sql
SELECT *
FROM employees
WHERE name LIKE '%an%';
```

Matches:

```text
Daniel
Sanjay
```

---

# 23. LIKE with _

Underscore represents one character.

Example:

```sql
SELECT *
FROM employees
WHERE name LIKE '_ohn';
```

Matches:

```text
John
```

Does not match:

```text
Jonathan
```

---

# 24. ILIKE Operator

PostgreSQL provides:

```text
ILIKE
```

for case-insensitive searching.

Example:

```sql
SELECT *
FROM employees
WHERE name ILIKE 'john';
```

Matches:

```text
John
JOHN
john
```

---

# 25. IS NULL

## What is NULL?

NULL means missing or unknown value.

Example:

```text
id | phone
----------
1  | 9876543210
2  | NULL
```

Find missing phone numbers:

```sql
SELECT *
FROM employees
WHERE phone IS NULL;
```

---

# 26. IS NOT NULL

Find available phone numbers:

```sql
SELECT *
FROM employees
WHERE phone IS NOT NULL;
```

---

# 27. NULL Comparison Mistake

Wrong:

```sql
WHERE phone = NULL;
```

This will not work.

Correct:

```sql
WHERE phone IS NULL;
```

---

# 28. Filtering Dates

Example table:

```text
orders

id | order_date
----------------
1  | 2026-01-10
2  | 2026-05-20
```

Find orders after January:

```sql
SELECT *
FROM orders
WHERE order_date > '2026-01-01';
```

---

# 29. Filtering Dates Using BETWEEN

Example:

```sql
SELECT *
FROM orders
WHERE order_date
BETWEEN '2026-01-01'
AND '2026-03-31';
```

---

# 30. Filtering with Multiple Conditions

Example:

Find active IT employees with salary above 60000:

```sql
SELECT *
FROM employees
WHERE department='IT'
AND salary > 60000
AND status='active';
```

---

# 31. Filtering Using Expressions

Example:

Find employees whose yearly salary is above 700000:

```sql
SELECT *
FROM employees
WHERE salary * 12 > 700000;
```

---

# 32. Filtering with CASE

Example:

```sql
SELECT name,
CASE
WHEN salary > 70000
THEN 'High'
ELSE 'Normal'
END AS category
FROM employees;
```

---

# 33. Common Filtering Mistakes

## Mistake 1: Forgetting quotes for text

Wrong:

```sql
WHERE department = IT;
```

Correct:

```sql
WHERE department = 'IT';
```

---

## Mistake 2: Wrong NULL comparison

Wrong:

```sql
WHERE email=NULL;
```

Correct:

```sql
WHERE email IS NULL;
```

---

## Mistake 3: Incorrect OR usage

Wrong:

```sql
WHERE department='IT'
OR 'HR';
```

Correct:

```sql
WHERE department IN ('IT','HR');
```

---

## Mistake 4: Missing parentheses

Wrong:

```sql
A OR B AND C
```

Better:

```sql
(A OR B) AND C
```

---

# 34. Performance Best Practices

✅ Filter data using indexed columns when possible.

Example:

```sql
WHERE employee_id = 100;
```

is usually faster than:

```sql
WHERE name LIKE '%john%';
```

---

✅ Avoid unnecessary calculations in WHERE.

Instead of:

```sql
WHERE salary*12 > 1000000;
```

Store and query properly when needed.

---

✅ Select only required columns.

Better:

```sql
SELECT name, salary
FROM employees;
```

---

# 35. Interview Questions

## What is the purpose of WHERE clause?

WHERE filters rows based on specified conditions.

---

## Difference between WHERE and HAVING?

WHERE filters rows before grouping.

HAVING filters groups after GROUP BY.

---

## Difference between LIKE and ILIKE?

LIKE is case-sensitive.

ILIKE is case-insensitive in PostgreSQL.

---

## How do you check NULL values?

Using:

```sql
IS NULL
```

or:

```sql
IS NOT NULL
```

---

## Does BETWEEN include boundary values?

Yes.

Example:

```sql
BETWEEN 10 AND 20
```

includes 10 and 20.

---

# Chapter Summary

* Filtering retrieves only required data.
* WHERE is the main filtering clause.
* Comparison operators compare values.
* AND, OR, NOT combine conditions.
* BETWEEN filters ranges.
* IN filters multiple values.
* LIKE and ILIKE search patterns.
* IS NULL handles missing values.
* Good filtering improves query efficiency.

---

# Practice Exercises

Using an employee table:

1. Find all employees from IT department.
2. Find employees with salary greater than 50000.
3. Find employees with salary between 40000 and 70000.
4. Find employees from IT, HR, and Finance departments.
5. Find employees whose name starts with 'A'.
6. Find employees whose email is missing.
7. Find employees who are not active.
8. Write a query combining three conditions using AND.

---

# Next Chapter

After Filtering, the next important topic is:

**Sorting and Limiting Data**

* ORDER BY
* ASC / DESC
* LIMIT
* OFFSET
* Pagination

These are heavily used in real applications and reporting systems.
