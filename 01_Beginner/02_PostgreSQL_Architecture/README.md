# PostgreSQL Architecture Notes

## What is PostgreSQL Architecture?

**PostgreSQL Architecture** describes how PostgreSQL processes a SQL query and manages data internally. It explains how a query travels from the client to the database and how the result is returned.

---

# PostgreSQL Architecture Diagram

```text
        Client
 (psql / pgAdmin / Application)
               │
               ▼
      PostgreSQL Server
               │
        Query Parser
               │
               ▼
   Query Planner & Optimizer
               │
               ▼
      Query Executor
               │
               ▼
      Shared Buffers (Cache)
               │
      ┌────────┴────────┐
      │                 │
      ▼                 ▼
   Data Files       WAL Files
      │
      ▼
    Result
```

---

# Main Components

## 1. Client

The client is the application that sends SQL queries to PostgreSQL.

### Examples

* psql
* pgAdmin
* Java Application
* Python Application
* Node.js Application

**Responsibility**

* Connect to PostgreSQL Server
* Send SQL queries
* Receive results

---

## 2. PostgreSQL Server

The PostgreSQL Server is the main database engine.

It receives queries from clients and processes them using different internal components.

---

## 3. Query Parser

The Parser checks whether the SQL query is valid.

### It verifies:

* SQL syntax
* Table name
* Column name
* Database objects
* User permissions (basic validation)

### Example

```sql
SELECT * FROM employees;
```

Valid query ✔

```sql
SELEC * FROM employees;
```

Invalid query ✘

Parser returns a syntax error.

---

## 4. Query Planner (Optimizer)

The Planner decides the fastest way to execute a query.

It creates an **Execution Plan**.

### It decides:

* Sequential Scan
* Index Scan
* Bitmap Scan
* Join Method
* Parallel Execution

The Optimizer always tries to reduce query execution time.

---

## 5. Query Executor

The Executor follows the execution plan created by the Planner.

It:

* Reads data
* Filters rows
* Joins tables
* Sorts data
* Returns the final result

---

## 6. Shared Buffers (Buffer Cache)

Shared Buffers are PostgreSQL's memory cache.

Frequently accessed data is stored here.

### Benefits

* Faster query execution
* Less disk access
* Better performance

If data is available in memory, PostgreSQL does not read it from the disk.

---

## 7. Data Files

Data Files store the actual database on disk.

They contain:

* Tables
* Indexes
* Rows
* Database objects

All permanent data is stored here.

---

## 8. WAL (Write-Ahead Log)

WAL stands for **Write-Ahead Log**.

Before PostgreSQL writes data to the actual table, it first records the change in the WAL file.

### Purpose

* Crash Recovery
* Data Safety
* Replication
* Backup Support

### Example

```sql
INSERT INTO employees VALUES (...);
```

Process:

```
Write to WAL
        ↓
Write to Data File
```

If the server crashes, PostgreSQL uses WAL to recover the data.

---

# Background Processes

## 1. Checkpointer

* Saves modified data from memory to disk.
* Creates checkpoints.
* Helps during crash recovery.

---

## 2. Background Writer

* Writes dirty pages from Shared Buffers to disk.
* Reduces the workload during checkpoints.

---

## 3. WAL Writer

* Writes WAL records from memory to WAL files.
* Ensures transaction durability.

---

## 4. Autovacuum

Autovacuum runs automatically.

It:

* Removes dead tuples
* Reclaims storage space
* Updates statistics
* Improves query performance

Without Autovacuum, database performance can decrease over time.

---

# SQL Query Flow

Example Query

```sql
SELECT * FROM employees WHERE salary > 50000;
```

Flow

```
Client
   │
   ▼
PostgreSQL Server
   │
   ▼
Parser
   │
   ▼
Planner / Optimizer
   │
   ▼
Executor
   │
   ▼
Shared Buffers
   │
   ▼
Data Files (if needed)
   │
   ▼
Executor
   │
   ▼
Client
```

---

# Simple Real-Life Example

Imagine a Library.

* **Client** → Student
* **PostgreSQL Server** → Library
* **Parser** → Librarian checks the request
* **Planner** → Finds the quickest way to locate the book
* **Executor** → Brings the book
* **Shared Buffers** → Books already on the desk (fast access)
* **Data Files** → Books stored in the library shelves
* **WAL** → Issue register that records every transaction first

---

# Key Interview Points

* PostgreSQL follows a **Client-Server Architecture**.
* Every SQL query passes through **Parser → Planner → Executor**.
* The Planner selects the most efficient execution plan.
* Shared Buffers improve performance by caching frequently used data.
* WAL provides crash recovery and transaction durability.
* Background processes maintain performance and data consistency.
* Autovacuum automatically cleans dead tuples and keeps the database optimized.

---

# One-Line Summary

**PostgreSQL Architecture is the internal structure of PostgreSQL that explains how SQL queries are processed, how data is stored and retrieved, and how the database ensures performance, reliability, and crash recovery.**
