-- Find the total number of bookings made by each user
SELECT
    "User".user_id,
    "User".first_name,
    "User".last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM
    "User"
LEFT JOIN Booking ON "User".user_id = Booking.user_id
GROUP BY
    "User".user_id, "User".first_name, "User".last_name;

-- Rank properties based on the total number of bookings they have received
SELECT
    Property.property_id,
    Property.name AS property_name,
    COUNT(Booking.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS property_rank
FROM
    Property
LEFT JOIN Booking ON Property.property_id = Booking.property_id
GROUP BY
    Property.property_id, Property.name
ORDER BY
    property_rank;