# AirBnB Database Schema and Advanced Concepts

This directory contains the SQL scripts for creating and managing the AirBnB database schema, as well as documentation on advanced database concepts applied to optimize performance and scalability.

## Contents

- **schema.sql**  
  Defines the normalized database schema, including tables, primary keys, foreign keys, and constraints.

- **normalization.md**  
  Documents the normalization process up to Third Normal Form (3NF), ensuring data integrity and eliminating redundancy.

---

## Advanced Database Concepts Applied

### 1. **Normalization**
- All tables are designed in 3NF to ensure data consistency and avoid redundancy.

### 2. **Indexing**
- Indexes are created on high-usage columns (e.g., user_id, property_id, email) to speed up queries involving WHERE, JOIN, and ORDER BY clauses.

### 3. **Partitioning**
- The Booking table is partitioned by start_date to improve performance for date-based queries on large datasets.

### 4. **Query Optimization**
- Query execution plans are analyzed using `EXPLAIN ANALYZE` to identify and resolve bottlenecks.
- Queries are refactored to select only necessary columns and use appropriate filters.

### 5. **Aggregations and Window Functions**
- SQL aggregation (COUNT, AVG) and window functions (RANK, ROW_NUMBER) are used for analytics and reporting.

### 6. **Joins and Subqueries**
- Advanced SQL queries utilize INNER JOIN, LEFT JOIN, FULL OUTER JOIN, and both correlated and non-correlated subqueries for comprehensive data retrieval.

---

## Usage

1. Run `schema.sql` to create the database schema.
2. Review `normalization.md` for details on normalization.
3. Refer to the advanced scripts in the `database-adv-script` directory for indexing, partitioning, and query optimization examples.

---
