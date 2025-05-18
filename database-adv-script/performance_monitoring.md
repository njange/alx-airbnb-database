# Database Performance Monitoring and Refinement

## 1. Monitoring Query Performance

To monitor query performance, use `EXPLAIN ANALYZE` to review the execution plan and identify slow operations.  
Example for a frequently used query:

```sql
EXPLAIN ANALYZE
SELECT
    Booking.booking_id,
    "User".first_name,
    Property.name AS property_name,
    Payment.amount
FROM
    Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id
WHERE
    Booking.start_date BETWEEN '2025-06-01' AND '2025-06-30';
```

**Observation:**  
If the plan shows sequential scans on large tables or high cost, this indicates a bottleneck.

---

## 2. Identifying Bottlenecks

- **Sequential scans** on Booking or Property tables for date or ID filters.
- **Missing indexes** on columns used in WHERE, JOIN, or ORDER BY clauses.
- **Large result sets** due to lack of partitioning or filtering.

---

## 3. Suggested Changes

- **Add indexes** on columns frequently used in filters and joins:
    ```sql
    CREATE INDEX IF NOT EXISTS idx_booking_start_date ON Booking(start_date);
    CREATE INDEX IF NOT EXISTS idx_property_name ON Property(name);
    ```
- **Partition large tables** (e.g., Booking) by date as already implemented.
- **Review and remove unnecessary columns** from SELECT to reduce I/O.

---

## 4. Implementing Changes

- Indexes and partitioning have been added in previous scripts.
- After adding indexes, rerun `EXPLAIN ANALYZE` to confirm that index scans or partition pruning are used.

---

## 5. Reporting Improvements

- **Before:** Queries on Booking by date range performed full table scans, resulting in high execution time.
- **After:** With partitioning and indexes, only relevant partitions and rows are scanned, significantly reducing query time.
- **EXPLAIN ANALYZE** now shows index scans and partition pruning, confirming improved performance.

---

**Conclusion:**  
Continuous monitoring with `EXPLAIN ANALYZE` and schema adjustments (indexes, partitioning) are essential for maintaining optimal database performance as data grows.