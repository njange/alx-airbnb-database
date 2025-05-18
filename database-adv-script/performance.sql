-- Retrieve all bookings with user, property, and payment details
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

-- performance analysis
EXPLAIN ANALYZE
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

-- Refactored query: Only select necessary columns, ensure indexes exist, and avoid unnecessary joins
-- (Assuming all required indexes from database_index.sql are present)
-- If only summary data is needed, aggregate or filter as appropriate, e.g.:
-- SELECT Booking.booking_id, "User".first_name, Property.name AS property_name, Payment.amount
-- FROM Booking
-- JOIN "User" ON Booking.user_id = "User".user_id
-- JOIN Property ON Booking.property_id = Property.property_id
-- LEFT JOIN Payment ON Booking.booking_id = Payment.booking_id;