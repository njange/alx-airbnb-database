# Index Performance Report

## Objective

Improve query performance by creating indexes on high-usage columns in the User, Booking, and Property tables. Measure and report the impact using `EXPLAIN ANALYZE`.

---

## Index Creation

Indexes were created on columns frequently used in WHERE, JOIN, and ORDER BY clauses:

- **User Table:**  
  - `email` (for lookups)  
  - `user_id` (for joins)

- **Booking Table:**  
  - `user_id` and `property_id` (for joins and filters)  
  - `booking_id` (for joins)

- **Property Table:**  
  - `host_id` and `property_id` (for joins and filters)  
  - `name` (for searches)

See `database_index.sql` for the exact SQL commands.

---

## Performance Measurement

### Example Query (Before Indexing)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab';