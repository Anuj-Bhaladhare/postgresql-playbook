# PostgreSQL String Functions

## Complete Beginner to Professional Notes

---

# 1. What are String Functions?

String functions are built-in PostgreSQL functions that work with character data.

They operate on:

* CHAR
* VARCHAR
* TEXT

Example:

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

is a string function.

---

# 2. Why Do We Need String Functions?

String functions help to:

* Format text
* Search text
* Modify text
* Extract information
* Clean database values

Example:

Database:

```
first_name
-----------
john
```

Using:

```sql
SELECT UPPER(first_name)
FROM employees;
```

Output:

```
JOHN
```

---

# 3. Categories of String Functions

PostgreSQL String Functions:

```
String Functions

        |
        |
--------------------------------
|        |        |            |
Case   Length   Modify     Search
Functions        Text       Text

        |
        |
    Formatting
```

Main functions:

1. UPPER()
2. LOWER()
3. INITCAP()
4. LENGTH()
5. CONCAT()
6. || Operator
7. SUBSTRING()
8. LEFT()
9. RIGHT()
10. TRIM()
11. LTRIM()
12. RTRIM()
13. REPLACE()
14. POSITION()
15. STRPOS()
16. SPLIT_PART()
17. LPAD()
18. RPAD()
19. REVERSE()
20. ASCII()

---

# 4. UPPER()

## Purpose

Converts lowercase characters into uppercase.

Syntax:

```sql
UPPER(string)
```

Example:

```sql
SELECT UPPER('postgresql');
```

Output:

```
POSTGRESQL
```

---

## Real Example

Table:

```
employees

name
------
john
alice
```

Query:

```sql
SELECT UPPER(name)
FROM employees;
```

Output:

```
JOHN
ALICE
```

---

# 5. LOWER()

## Purpose

Converts uppercase characters into lowercase.

Example:

```sql
SELECT LOWER('POSTGRESQL');
```

Output:

```
postgresql
```

---

## Practical Use

Case-insensitive comparison:

```sql
SELECT *
FROM users
WHERE LOWER(email)
=
'john@gmail.com';
```

---

# 6. INITCAP()

## Purpose

Converts first letter of each word into uppercase.

Example:

```sql
SELECT INITCAP('postgresql database');
```

Output:

```
Postgresql Database
```

---

## Real Example

Input:

```
john smith
```

Query:

```sql
SELECT INITCAP(name)
FROM employees;
```

Output:

```
John Smith
```

---

# 7. LENGTH()

## Purpose

Returns number of characters.

Example:

```sql
SELECT LENGTH('PostgreSQL');
```

Output:

```
10
```

---

## With Table

```sql
SELECT 
name,
LENGTH(name)
FROM employees;
```

Output:

```
John    4
Alice   5
```

---

# 8. CONCAT()

## Purpose

Combines multiple strings.

Syntax:

```sql
CONCAT(value1,value2,...)
```

Example:

```sql
SELECT CONCAT('Postgre','SQL');
```

Output:

```
PostgreSQL
```

---

## Real Example

Table:

```
first_name
last_name
```

Query:

```sql
SELECT CONCAT(
first_name,
' ',
last_name
)
FROM employees;
```

Output:

```
John Smith
```

---

# 9. Concatenation Operator (||)

Alternative to CONCAT.

Example:

```sql
SELECT 
first_name || ' ' || last_name
FROM employees;
```

Output:

```
John Smith
```

---

## Difference

| CONCAT() | || |
|-|-|
| Function | Operator |
| Handles NULL differently | NULL can affect result |

---

# 10. SUBSTRING()

## Purpose

Extracts part of a string.

Syntax:

```sql
SUBSTRING(string,start,length)
```

Example:

```sql
SELECT SUBSTRING(
'PostgreSQL',
1,
8
);
```

Output:

```
Postgre
```

---

## Extract Email Username

Example:

Email:

```
john@gmail.com
```

Query:

```sql
SELECT SUBSTRING(
email,
1,
POSITION('@' IN email)-1
)
FROM users;
```

Output:

```
john
```

---

# 11. LEFT()

## Purpose

Returns characters from the beginning.

Syntax:

```sql
LEFT(string,count)
```

Example:

```sql
SELECT LEFT(
'PostgreSQL',
5
);
```

Output:

```
Postg
```

---

# 12. RIGHT()

## Purpose

Returns characters from the end.

Example:

```sql
SELECT RIGHT(
'PostgreSQL',
3
);
```

Output:

```
SQL
```

---

# 13. TRIM()

## Purpose

Removes spaces from both sides.

Example:

```sql
SELECT TRIM(
' PostgreSQL '
);
```

Output:

```
PostgreSQL
```

---

# 14. LTRIM()

Removes spaces from left side.

Example:

```sql
SELECT LTRIM(
'   PostgreSQL'
);
```

Output:

```
PostgreSQL
```

---

# 15. RTRIM()

Removes spaces from right side.

Example:

```sql
SELECT RTRIM(
'PostgreSQL   '
);
```

Output:

```
PostgreSQL
```

---

# 16. REPLACE()

## Purpose

Replaces existing text.

Syntax:

```sql
REPLACE(
original,
old_text,
new_text
)
```

Example:

```sql
SELECT REPLACE(
'PostgreSQL Database',
'Database',
'System'
);
```

Output:

```
PostgreSQL System
```

---

## Real Example

Fix incorrect department name:

Before:

```
Post GreSQL
```

Query:

```sql
UPDATE products
SET name =
REPLACE(name,'Post GreSQL','PostgreSQL');
```

---

# 17. POSITION()

## Purpose

Finds location of text.

Example:

```sql
SELECT POSITION(
'SQL'
IN
'PostgreSQL'
);
```

Output:

```
6
```

---

# 18. STRPOS()

Same purpose as POSITION.

Example:

```sql
SELECT STRPOS(
'PostgreSQL',
'SQL'
);
```

Output:

```
6
```

---

# 19. SPLIT_PART()

## Purpose

Splits text based on delimiter.

Syntax:

```sql
SPLIT_PART(
string,
delimiter,
position
)
```

Example:

Email:

```
john@gmail.com
```

Query:

```sql
SELECT SPLIT_PART(
'john@gmail.com',
'@',
1
);
```

Output:

```
john
```

Second part:

```sql
SELECT SPLIT_PART(
'john@gmail.com',
'@',
2
);
```

Output:

```
gmail.com
```

---

# 20. LPAD()

## Purpose

Adds characters to the left.

Example:

```sql
SELECT LPAD(
'123',
5,
'0'
);
```

Output:

```
00123
```

---

## Real Example

Employee ID formatting:

Before:

```
123
```

After:

```
00123
```

---

# 21. RPAD()

Adds characters to the right.

Example:

```sql
SELECT RPAD(
'SQL',
6,
'*'
);
```

Output:

```
SQL***
```

---

# 22. REVERSE()

## Purpose

Reverses string.

Example:

```sql
SELECT REVERSE('PostgreSQL');
```

Output:

```
LQSergtsoP
```

---

# 23. ASCII()

## Purpose

Returns ASCII code of first character.

Example:

```sql
SELECT ASCII('A');
```

Output:

```
65
```

---

# 24. CHR()

## Purpose

Converts ASCII number into character.

Example:

```sql
SELECT CHR(65);
```

Output:

```
A
```

---

# 25. STRING_AGG()

## Purpose

Combines multiple rows into one string.

Example Table:

```
employees

name
------
John
Alice
David
```

Query:

```sql
SELECT STRING_AGG(
name,
', '
)
FROM employees;
```

Output:

```
John, Alice, David
```

---

# 26. String Functions with GROUP BY

Example:

Employee count by first letter:

```sql
SELECT
LEFT(name,1),
COUNT(*)
FROM employees
GROUP BY LEFT(name,1);
```

Output:

```
J   10
A   15
D   5
```

---

# 27. Handling NULL Values

Important:

Most string functions return NULL when input is NULL.

Example:

```sql
SELECT LENGTH(NULL);
```

Output:

```
NULL
```

---

Solution:

Use COALESCE:

```sql
SELECT LENGTH(
COALESCE(name,'')
);
```

---

# 28. Practical Examples

## Example 1: Create Full Name

```sql
SELECT
first_name || ' ' || last_name
AS full_name
FROM employees;
```

---

## Example 2: Email Domain

```sql
SELECT
SPLIT_PART(email,'@',2)
AS domain
FROM users;
```

---

## Example 3: Clean User Names

```sql
SELECT
INITCAP(
TRIM(name)
)
FROM users;
```

---

## Example 4: Search Names

```sql
SELECT *
FROM employees
WHERE
LOWER(name)
LIKE '%john%';
```

---

# 29. Common Mistakes

## Mistake 1: Forgetting NULL handling

Wrong:

```sql
SELECT name || surname
FROM employees;
```

If surname is NULL:

Result:

```
NULL
```

Better:

```sql
SELECT
COALESCE(name,'')
||
COALESCE(surname,'');
```

---

## Mistake 2: Using wrong substring position

Always verify:

```sql
SUBSTRING(text,start,length)
```

---

## Mistake 3: Using LIKE for exact matching

Slow:

```sql
WHERE name LIKE 'John'
```

Better:

```sql
WHERE name='John'
```

---

# 30. Industry Best Practices

✅ Clean imported text using TRIM().

✅ Use LOWER() for case-insensitive comparison.

✅ Use CONCAT() or || for formatted output.

✅ Use COALESCE() when working with possible NULL values.

✅ Avoid unnecessary string functions on indexed columns.

---

# 31. Interview Questions

## What is the difference between CONCAT() and ||?

Both combine strings.

CONCAT() is a function.

|| is a concatenation operator.

---

## Difference between LENGTH() and CHAR_LENGTH()?

Both return character count.

---

## How do you convert text into uppercase?

Using:

```sql
UPPER()
```

---

## How do you remove extra spaces?

Using:

```sql
TRIM()
```

---

## How do you split a string in PostgreSQL?

Using:

```sql
SPLIT_PART()
```

---

# Chapter Summary

* String functions manipulate text values.
* UPPER(), LOWER(), INITCAP() format text.
* LENGTH() measures text size.
* CONCAT() and || combine strings.
* SUBSTRING(), LEFT(), RIGHT() extract text.
* TRIM() cleans unwanted spaces.
* REPLACE() modifies text.
* SPLIT_PART() separates values.
* STRING_AGG() combines multiple rows.

---

# Practice Exercises

Using a users table:

1. Convert all names to uppercase.
2. Convert emails to lowercase.
3. Find length of usernames.
4. Extract username from email.
5. Extract email domain.
6. Remove spaces from names.
7. Replace old company names with new names.
8. Generate full names using CONCAT.
9. Find names starting with "A".
10. Combine employee names using STRING_AGG.

---

# Next Chapter

After String Functions, the next important topic is:

**Numeric Functions in PostgreSQL**

* ROUND()
* CEIL()
* FLOOR()
* ABS()
* POWER()
* RANDOM()
* Mathematical calculations

These are heavily used in finance, reporting, and analytics.
