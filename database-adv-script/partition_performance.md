# Partitioning Performance Report

## Objective
Optimize query performance on the large `Booking` table by implementing partitioning based on the `start_date` column.

---

## Implementation

- The `Booking_partitioned` table was created using PostgreSQL's `PARTITION BY RANGE (start_date)` feature.
- Separate partitions were created for the years 2024, 2025, and a future partition for dates beyond 2026.

## Performance Testing

**Test Query:**
```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking_partitioned
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';