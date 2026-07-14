# PostgreSQL Beginner Level Practice Set

## Complete Hands-On Exercises

---

# Part 1: Database and Table Creation

## Exercise 1: Create Database

Create a database named:

```sql
company_db
```

---

## Exercise 2: Create Employee Table

Create a table:

```text
employees
```

with columns:

| Column       | Data Type     |
| ------------ | ------------- |
| employee_id  | INTEGER       |
| first_name   | VARCHAR(50)   |
| last_name    | VARCHAR(50)   |
| email        | VARCHAR(100)  |
| phone        | VARCHAR(15)   |
| department   | VARCHAR(50)   |
| salary       | NUMERIC(10,2) |
| joining_date | DATE          |
| active       | BOOLEAN       |

---

## Exercise 3: Add Constraints

Modify the table and add:

* employee_id as PRIMARY KEY
* email as UNIQUE
* salary cannot be NULL
* active default value TRUE

---

# Part 2: Insert Data Practice

Insert at least 10 employee records.

Example data:

| first_name | last_name | department | salary |
| ---------- | --------- | ---------- | ------ |
| John       | Smith     | IT         | 75000  |
| Alice      | Brown     | HR         | 55000  |
| David      | Miller    | Finance    | 65000  |
| Sarah      | Wilson    | IT         | 85000  |
| Mike       | Taylor    | Sales      | 45000  |

Add your own records.

---

# Part 3: Basic SELECT Practice

## Exercise 4

Display all employees.

```sql
SELECT *
FROM employees;
```

---

## Exercise 5

Display only:

* first_name
* last_name
* salary

---

## Exercise 6

Create an alias:

Display:

```
employee_name
employee_salary
```

---

# Part 4: Filtering Practice

## Exercise 7

Find employees whose department is:

```
IT
```

---

## Exercise 8

Find employees with salary greater than:

```
60000
```

---

## Exercise 9

Find employees with salary between:

```
50000 and 80000
```

---

## Exercise 10

Find employees who joined after:

```
2025-01-01
```

---

## Exercise 11

Find employees whose first name starts with:

```
A
```

---

## Exercise 12

Find employees whose email contains:

```
gmail
```

---

# Part 5: Operators Practice

## Exercise 13

Find employees:

* Department = IT
* Salary > 70000

Use:

```sql
AND
```

---

## Exercise 14

Find employees:

Department:

```
HR OR Finance
```

---

## Exercise 15

Find employees who are not in:

```
Sales
```

---

## Exercise 16

Find employees where salary is NOT NULL.

---

# Part 6: ORDER BY Practice

## Exercise 17

Display employees sorted by salary:

Ascending order.

---

## Exercise 18

Display employees sorted by salary:

Descending order.

---

## Exercise 19

Display highest paid employee first.

---

# Part 7: LIMIT Practice

## Exercise 20

Find top 3 highest salary employees.

---

## Exercise 21

Find the 5 newest employees.

---

# Part 8: String Function Practice

## Exercise 22

Convert all employee names into uppercase.

Expected:

```
JOHN
ALICE
DAVID
```

---

## Exercise 23

Convert department names into lowercase.

---

## Exercise 24

Display full name:

Example:

```
John Smith
```

Using:

```
CONCAT()
```

---

## Exercise 25

Find length of employee names.

---

## Exercise 26

Display first 3 characters of employee names.

Example:

```
Joh
Ali
Dav
```

---

## Exercise 27

Remove spaces from employee names.

---

## Exercise 28

Replace department:

```
IT
```

with:

```
Technology
```

---

## Exercise 29

Extract username from email.

Example:

Input:

```
john@gmail.com
```

Output:

```
john
```

---

## Exercise 30

Extract email domain.

Example:

Output:

```
gmail.com
```

---

# Part 9: Date and Time Practice

## Exercise 31

Display current date.

---

## Exercise 32

Display current timestamp.

---

## Exercise 33

Extract joining year.

Example:

```
2026
```

---

## Exercise 34

Extract joining month.

---

## Exercise 35

Find employee experience.

Use:

```
AGE()
```

---

## Exercise 36

Find employees who joined in the current year.

---

## Exercise 37

Find employees who joined in the last 6 months.

---

## Exercise 38

Format joining date:

Output:

```
14-JUL-2026
```

Use:

```
TO_CHAR()
```

---

# Part 10: Type Casting Practice

## Exercise 39

Convert:

```
'5000'
```

into INTEGER.

---

## Exercise 40

Convert:

```
100
```

into TEXT.

---

## Exercise 41

Calculate:

```
10 / 3
```

with decimal output.

---

## Exercise 42

Convert timestamp into date.

---

## Exercise 43

Assume salary is stored as TEXT.

Convert salary into INTEGER.

---

# Part 11: UPDATE Practice

## Exercise 44

Increase all IT employees salary by 10%.

---

## Exercise 45

Change department:

```
Sales → Marketing
```

---

## Exercise 46

Update employee phone number.

---

## Exercise 47

Change inactive employees:

```
active = false
```

---

# Part 12: DELETE Practice

## Exercise 48

Delete employees from:

```
Sales department
```

---

## Exercise 49

Delete employees whose salary is below:

```
30000
```

---

## Exercise 50

Delete employee by employee_id.

---

# Part 13: Real Business Problems

## Exercise 51

Find total number of employees.

---

## Exercise 52

Find average salary.

---

## Exercise 53

Find highest salary.

---

## Exercise 54

Find lowest salary.

---

## Exercise 55

Find total salary cost.

---

## Exercise 56

Find employees having the word:

```
manager
```

in their name.

---

## Exercise 57

Find duplicate email records.

---

## Exercise 58

Find employees with missing phone numbers.

---

## Exercise 59

Create a report:

```
Employee Name | Department | Salary
```

---

## Exercise 60

Create a salary category:

Rules:

```
salary > 80000
= High

salary between 50000 and 80000
= Medium

below 50000
= Low
```

Use:

```
CASE
```

---

# Challenge Section

## Challenge 1

Create a customer table:

Columns:

```
customer_id
name
email
phone
city
registration_date
```

Insert 20 records.

Practice:

* Filtering
* Sorting
* Searching
* String functions
* Date functions

---

## Challenge 2

Create an orders table:

Columns:

```
order_id
customer_id
product_name
amount
order_date
status
```

Practice:

* Find recent orders
* Find expensive orders
* Search products
* Format dates

---

## Challenge 3

Create a student table:

Columns:

```
student_id
name
marks
course
admission_date
```

Practice:

* Find top students
* Calculate percentage
* Categorize grades
* Search students

---

# Mini Project 1: Employee Management System

Create:

Tables:

```
employees
departments
salary_history
```

Implement:

* Primary keys
* Foreign keys
* Constraints
* Insert data
* Update salary
* Generate reports

---

# Mini Project 2: Online Store Database

Create:

Tables:

```
customers
products
orders
payments
```

Practice:

* CRUD
* Filtering
* Functions
* Dates
* Reports

---

# Learning Goal

After completing this practice set, you should be able to:

✅ Create databases
✅ Create tables
✅ Design basic schemas
✅ Insert and modify data
✅ Write SELECT queries
✅ Filter information
✅ Use operators
✅ Apply functions
✅ Handle text and dates
✅ Convert data types
✅ Solve basic business problems

---

# Next Level After This Practice

Move to:

1. Aggregate Functions
2. GROUP BY
3. HAVING
4. Joins
5. Subqueries
6. CTE
7. Views
8. Indexes
9. Query Optimization

These topics will take you from beginner SQL user to professional PostgreSQL developer.

