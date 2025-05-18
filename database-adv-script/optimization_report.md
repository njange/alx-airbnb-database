# Query Optimization Report

## Objective

Analyze and optimize a complex query that retrieves all bookings along with user, property, and payment details.

---

## Initial Query

The initial query joins the Booking, User, Property, and Payment tables to retrieve comprehensive booking information:

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
    "User".email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_date
FROM
    Booking
JOIN "User" ON Booking.user_id = "User".user_id
JOIN Property ON Booking.property_id = Property.property_id
LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id;