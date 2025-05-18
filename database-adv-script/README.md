# Advanced SQL Join and Subquery Queries

This directory contains advanced SQL queries demonstrating the use of different types of joins and subqueries on the AirBnB database schema.

## Files

- **joins_queries.sql**  
  Contains SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN to retrieve and combine data from multiple tables.

- **subqueries.sql**  
  Contains SQL queries using both correlated and non-correlated subqueries for advanced data retrieval.

---

## Join Queries

### 1. INNER JOIN
Retrieves all bookings along with the respective users who made those bookings.  
**Example:**
```sql
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    "User".user_id,
    "User".first_name,
    "User".last_name,
    "User".email
FROM
    Booking
INNER JOIN "User" ON Booking.user_id = "User".user_id;
```
**Use case:**  
Get detailed booking information together with user details for each booking.

---

### 2. LEFT JOIN
Retrieves all properties and their reviews, including properties that have no reviews.  
**Example:**
```sql
SELECT
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Review.review_id,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN Review ON Property.property_id = Review.property_id;
```
**Use case:**  
List all properties, showing reviews if they exist, or NULL if there are no reviews.

---

### 3. FULL OUTER JOIN
Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user.  
**Example:**
```sql
SELECT
    "User".user_id,
    "User".first_name,
    "User".last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    "User"
FULL OUTER JOIN Booking ON "User".user_id = Booking.user_id;
```
**Use case:**  
Get a comprehensive list of all users and all bookings, including users without bookings and bookings not linked to a user.

---

## Subqueries

### 1. Non-Correlated Subquery
Find all properties where the average rating is greater than 4.0.  
**Example:**
```sql
SELECT
    property_id,
    name,
    location
FROM
    Property
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Review
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );
```
**Use case:**  
Identify top-rated properties based on user reviews.

---

### 2. Correlated Subquery
Find users who have made more than 3 bookings.  
**Example:**
```sql
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    "User" u
WHERE
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;
```
**Use case:**  
Identify frequent bookers for marketing or loyalty programs.

---

## Usage

- Run the queries in `joins_queries.sql` and `subqueries.sql` against your AirBnB database to see how different join types and subqueries affect the results.
- These queries are useful for reporting, analytics, and understanding relationships between users, bookings, properties, and reviews.

## Prerequisites

- The AirBnB database schema and sample data should be loaded as described in the main project documentation.

---