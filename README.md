
What is PostgreSQL?

PostgreSQL (pronounced "Post-gress-Q-L") is a powerful, open-source object-relational database management system (ORDBMS). It is known for its reliability, feature richness, and standards compliance.

Key Features of PostgreSQL:
     Open Source: Free to use, modify, and distribute under the PostgreSQL License.
     Relational + Object-Oriented: Supports traditional relational features plus advanced data types like JSON, XML, arrays, and user-defined types.
     SQL Compliant: Strong support for SQL standards (ANSI SQL:2008 and later).
     Extensible: You can add custom functions, data types, operators, and even write plugins.
     Advanced Indexing: Supports B-tree, Hash, GIN, GiST, BRIN, and more.
     Strong Security: Role-based authentication, SSL, encryption, and row-level security.


What is the purpose of a database schema in PostgreSQL?

In PostgreSQL, a schema is like a folder or namespace inside a database. It is used to organize and group related database objects such as: Tables,Views, Indexes, Sequences, Functions, Types

Main Purposes of a Schema:

    Organization of Objects: Helps you group related objects together. Example: A banking app could have separate schemas for customers, loans, and audit_logs.

    Avoid Name Conflicts: You can have multiple tables with the same name in different schemas.
    Example:
    sales.january_orders
    marketing.january_orders

    Access Control / Permissions: Schemas can be secured by assigning different privileges to different users or roles. Example: Give developer access to public schema, Restrict access to secure schema

Logical Separation in Applications: Especially useful in multi-tenant applications (one schema per tenant/client). You don’t need to create separate databases.

Modularity: You can import/export schemas to move specific parts of your application. Helpful in development and deployment pipelines.


Explain the Primary Key and Foreign Key concepts in PostgreSQL.

A Primary Key is a column (or group of columns) that uniquely identifies each row in a table.
Characteristics:
Must be unique
Cannot be NULL
Each table can have only one primary key

Example:
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE
);
student_id is the primary key. Each student must have a unique student_id.

Foreign Key

A Foreign Key is a column (or group of columns) in one table that refers to the primary key of another table. It is used to establish relationships between tables.
Purpose:
Enforces referential integrity — you can’t add invalid references
Helps maintain consistent and meaningful data
Example:
Parent table
CREATE TABLE departments (
  dept_id SERIAL PRIMARY KEY,
  dept_name TEXT NOT NULL
);

Child table with foreign key reference
CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  dept_id INTEGER REFERENCES departments(dept_id)
);

Here:
    departments.dept_id is the primary key
    employees.dept_id is a foreign key, linking each employee to a department


What is the difference between the VARCHAR and CHAR data types?

Both VARCHAR and CHAR are used to store text (string) data, but they differ in storage behavior, performance, and usage.
1. VARCHAR(n) (Variable-length character)
    Stores up to n characters.
    Does not pad the string with spaces if it's shorter than n.
    More flexible and space-efficient.

Example: name VARCHAR(10)
Stores "Ali" as "Ali" (no padding).
Can store up to 10 characters.
Commonly used for variable-length fields (like names, emails, etc.)

2. CHAR(n) (Fixed-length character)
Always stores exactly n characters.
Pads with spaces if input is shorter than n.
Slightly faster for fixed-length data.

Example:
code CHAR(5)
Stores "AB" as "AB " (with 3 trailing spaces).
Best for fixed-format data like 2-letter country codes, product codes, etc.

Key Differences Table:
Feature	                VARCHAR(n)	                CHAR(n)
Length	                Variable (up to n)	                Fixed (exactly n)
Padding	                No padding	                                Pads with spaces
Storage Efficiency	More efficient for short strings	Less efficient if strings are short
Best Use Case	Names, emails, comments	Codes, abbreviations, fixed-length fields
Performance	Slightly slower	Slightly faster for fixed-size


What are the LIMIT and OFFSET clauses used for?

LIMIT Clause:
Specifies the maximum number of rows to return.
Prevents fetching unnecessary data.
Example:
SELECT * FROM employees
LIMIT 5;

Returns only the first 5 rows.

OFFSET Clause:
Skips the first N rows before starting to return rows.
Often used with LIMIT for pagination.

Example:
SELECT * FROM employees
OFFSET 10;
Skips the first 10 rows, returns the rest.
