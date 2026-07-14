# PostgreSQL Date and Time Functions

## Complete Beginner to Professional Notes

---

# 1. What are Date and Time Functions?

Date and Time Functions are built-in PostgreSQL functions used to:

* Store dates
* Calculate time differences
* Format dates
* Extract date information
* Compare dates
* Handle time zones

Example:

```sql
SELECT CURRENT_DATE;
```

Output:

```text
2026-07-14
```

---

# 2. PostgreSQL Date and Time Data Types

PostgreSQL provides several date/time data types.

| Data Type   | Purpose                 |
| ----------- | ----------------------- |
| DATE        | Stores only date        |
| TIME        | Stores only time        |
| TIMESTAMP   | Date + time             |
| TIMESTAMPTZ | Timestamp with timezone |
| INTERVAL    | Time duration           |

---

# 3. DATE Type

Stores only date.

Format:

```text
YYYY-MM-DD
```

Example:

```sql
CREATE TABLE employees
(
    joining_date DATE
);
```

Value:

```text
2026-07-14
```

---

# 4. TIME Type

Stores only time.

Example:

```sql
CREATE TABLE meetings
(
    meeting_time TIME
);
```

Value:

```text
10:30:00
```

---

# 5. TIMESTAMP Type

Stores date and time.

Example:

```sql
2026-07-14 10:30:00
```

Example:

```sql
CREATE TABLE orders
(
    created_at TIMESTAMP
);
```

---

# 6. TIMESTAMPTZ Type

Timestamp with timezone information.

Example:

```sql
2026-07-14 10:30:00+05:30
```

Useful for:

* International applications
* Global users
* Distributed systems

---

# 7. INTERVAL Type

Represents a duration of time.

Examples:

```text
5 days
3 months
2 hours
```

Example:

```sql
SELECT INTERVAL '5 days';
```

Output:

```text
5 days
```

---

# 8. CURRENT Date and Time Functions

PostgreSQL provides functions to get current date and time.

---

# 9. CURRENT_DATE

Returns current date.

Example:

```sql
SELECT CURRENT_DATE;
```

Output:

```text
2026-07-14
```

---

# 10. CURRENT_TIME

Returns current time.

Example:

```sql
SELECT CURRENT_TIME;
```

Output:

```text
10:45:20+05:30
```

---

# 11. CURRENT_TIMESTAMP

Returns current date and time.

Example:

```sql
SELECT CURRENT_TIMESTAMP;
```

Output:

```text
2026-07-14 10:45:20
```

---

# 12. NOW()

Returns current timestamp.

Example:

```sql
SELECT NOW();
```

Output:

```text
2026-07-14 10:45:20
```

Important:

```text
NOW()
=
CURRENT_TIMESTAMP
```

---

# 13. LOCALTIME

Returns current local time.

Example:

```sql
SELECT LOCALTIME;
```

---

# 14. LOCALTIMESTAMP

Returns local date and time.

Example:

```sql
SELECT LOCALTIMESTAMP;
```

---

# 15. Extracting Date Information

The most commonly used function:

```sql
EXTRACT()
```

Syntax:

```sql
EXTRACT(field FROM source)
```

---

# 16. Extract Year

Example:

```sql
SELECT EXTRACT(
YEAR FROM CURRENT_DATE
);
```

Output:

```text
2026
```

---

# 17. Extract Month

Example:

```sql
SELECT EXTRACT(
MONTH FROM CURRENT_DATE
);
```

Output:

```text
7
```

---

# 18. Extract Day

Example:

```sql
SELECT EXTRACT(
DAY FROM CURRENT_DATE
);
```

Output:

```text
14
```

---

# 19. Extract Hour

Example:

```sql
SELECT EXTRACT(
HOUR FROM CURRENT_TIMESTAMP
);
```

---

# 20. Extract Minute

Example:

```sql
SELECT EXTRACT(
MINUTE FROM CURRENT_TIMESTAMP
);
```

---

# 21. Extract Second

Example:

```sql
SELECT EXTRACT(
SECOND FROM CURRENT_TIMESTAMP
);
```

---

# 22. Date Arithmetic

PostgreSQL allows mathematical operations on dates.

---

# 23. Add Days to Date

Example:

```sql
SELECT DATE '2026-07-14'
+ INTERVAL '10 days';
```

Output:

```text
2026-07-24
```

---

# 24. Subtract Days from Date

Example:

```sql
SELECT DATE '2026-07-14'
- INTERVAL '5 days';
```

Output:

```text
2026-07-09
```

---

# 25. Add Months

Example:

```sql
SELECT DATE '2026-07-14'
+ INTERVAL '2 months';
```

Output:

```text
2026-09-14
```

---

# 26. Difference Between Two Dates

Example:

```sql
SELECT
DATE '2026-07-14'
-
DATE '2026-07-01';
```

Output:

```text
13
```

Meaning:

13 days difference.

---

# 27. AGE() Function

AGE calculates difference between dates.

Syntax:

```sql
AGE(end_date,start_date)
```

Example:

```sql
SELECT AGE(
DATE '2026-07-14',
DATE '2000-01-01'
);
```

Output:

```text
26 years 6 mons
```

---

# 28. AGE() with Current Date

Example:

Find employee age:

```sql
SELECT AGE(
CURRENT_DATE,
birth_date
)
FROM employees;
```

---

# 29. DATE_TRUNC()

Very important for reporting.

It truncates date/time to a specific precision.

Syntax:

```sql
DATE_TRUNC(
precision,
timestamp
)
```

---

Example:

Remove time:

```sql
SELECT DATE_TRUNC(
'day',
NOW()
);
```

Output:

```text
2026-07-14 00:00:00
```

---

# 30. Truncate to Month

Example:

```sql
SELECT DATE_TRUNC(
'month',
NOW()
);
```

Output:

```text
2026-07-01 00:00:00
```

---

# 31. Truncate to Year

Example:

```sql
SELECT DATE_TRUNC(
'year',
NOW()
);
```

Output:

```text
2026-01-01 00:00:00
```

---

# 32. Date Formatting with TO_CHAR()

TO_CHAR converts date into formatted text.

Syntax:

```sql
TO_CHAR(value, format)
```

---

# 33. Format Date Example

Example:

```sql
SELECT TO_CHAR(
CURRENT_DATE,
'DD-MM-YYYY'
);
```

Output:

```text
14-07-2026
```

---

# 34. Common Date Format Patterns

| Pattern | Meaning |
| ------- | ------- |
| YYYY    | Year    |
| MM      | Month   |
| DD      | Day     |
| HH      | Hour    |
| MI      | Minute  |
| SS      | Second  |

---

Example:

```sql
SELECT TO_CHAR(
NOW(),
'DD Mon YYYY'
);
```

Output:

```text
14 Jul 2026
```

---

# 35. Convert String to Date

Use:

```sql
TO_DATE()
```

Syntax:

```sql
TO_DATE(text,format)
```

Example:

```sql
SELECT TO_DATE(
'14-07-2026',
'DD-MM-YYYY'
);
```

Output:

```text
2026-07-14
```

---

# 36. Convert String to Timestamp

Use:

```sql
TO_TIMESTAMP()
```

Example:

```sql
SELECT TO_TIMESTAMP(
'14-07-2026 10:30',
'DD-MM-YYYY HH24:MI'
);
```

---

# 37. Time Zone Functions

PostgreSQL supports timezone conversion.

---

# 38. Current Time Zone

Example:

```sql
SHOW timezone;
```

Example output:

```text
Asia/Kolkata
```

---

# 39. Change Time Zone

Example:

```sql
SET timezone='America/New_York';
```

---

# 40. Convert Time Zone

Using:

```sql
AT TIME ZONE
```

Example:

```sql
SELECT
TIMESTAMP '2026-07-14 10:00'
AT TIME ZONE 'Asia/Kolkata';
```

---

# 41. Practical Examples

---

## Example 1: Employee Experience

Table:

```text
employees

name
joining_date
```

Query:

```sql
SELECT
name,
AGE(
CURRENT_DATE,
joining_date
)
AS experience
FROM employees;
```

---

## Example 2: Monthly Sales Report

```sql
SELECT
DATE_TRUNC(
'month',
order_date
),
SUM(amount)
FROM orders
GROUP BY 1;
```

---

## Example 3: Find Orders Last 7 Days

```sql
SELECT *
FROM orders
WHERE order_date >=
CURRENT_DATE - INTERVAL '7 days';
```

---

## Example 4: Find Employees Joined This Year

```sql
SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM joining_date)
=
EXTRACT(YEAR FROM CURRENT_DATE);
```

---

# 42. Common Mistakes

---

## Mistake 1: Comparing Date with Text

Wrong:

```sql
WHERE joining_date='July'
```

Correct:

```sql
WHERE EXTRACT(MONTH FROM joining_date)=7
```

---

## Mistake 2: Ignoring Time Component

Example:

```sql
2026-07-14 15:30:00
```

is not equal to:

```sql
2026-07-14 00:00:00
```

Use:

```sql
DATE_TRUNC()
```

when needed.

---

## Mistake 3: Wrong Date Format

Wrong:

```sql
14/07/2026
```

Correct:

```sql
2026-07-14
```

---

# 43. Industry Best Practices

✅ Store dates using proper DATE/TIMESTAMP types.

✅ Avoid storing dates as VARCHAR.

✅ Use TIMESTAMPTZ for global applications.

✅ Use DATE_TRUNC for reporting.

✅ Use indexes on frequently searched date columns.

Example:

```sql
WHERE created_at >= '2026-01-01'
```

---

# 44. Interview Questions

## Difference between DATE and TIMESTAMP?

DATE stores only date.

TIMESTAMP stores date and time.

---

## Difference between NOW() and CURRENT_DATE?

NOW() returns date and time.

CURRENT_DATE returns only date.

---

## What is DATE_TRUNC()?

It removes smaller time units from a timestamp.

Example:

Month reporting:

```sql
DATE_TRUNC('month',date)
```

---

## What is AGE()?

AGE calculates the difference between two dates.

---

## How do you format dates in PostgreSQL?

Using:

```sql
TO_CHAR()
```

---

# Chapter Summary

* PostgreSQL provides powerful date/time support.
* DATE stores dates.
* TIMESTAMP stores date and time.
* NOW() gives current timestamp.
* EXTRACT() retrieves date parts.
* AGE() calculates differences.
* DATE_TRUNC() is useful for reports.
* TO_CHAR() formats dates.
* TO_DATE() converts strings to dates.
* Time zone handling is important for global systems.

---

# Practice Exercises

Using an orders table:

1. Find today's date.
2. Find current timestamp.
3. Extract year from order_date.
4. Extract month from order_date.
5. Find orders from last 30 days.
6. Calculate customer age using AGE().
7. Generate monthly sales reports using DATE_TRUNC().
8. Format dates as DD-MM-YYYY.
9. Convert text into DATE.
10. Find employees who joined this year.

---

# Next Chapter

After Date and Time Functions, the next important topic is:

**Aggregate Functions**

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

These concepts are the foundation of SQL reporting and analytics.
