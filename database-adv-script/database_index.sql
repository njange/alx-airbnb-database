-- Indexes for high-usage columns in User, Booking, and Property tables

-- User table: email (frequent lookups), user_id (joins)
CREATE INDEX IF NOT EXISTS idx_user_email ON "User"(email);
CREATE INDEX IF NOT EXISTS idx_user_user_id ON "User"(user_id);

-- Booking table: user_id and property_id (joins, filters), booking_id (joins)
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON Booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON Booking(property_id);
CREATE INDEX IF NOT EXISTS idx_booking_booking_id ON Booking(booking_id);

-- Property table: host_id (joins), property_id (joins, filters), name (searches)
CREATE INDEX IF NOT EXISTS idx_property_host_id ON Property(host_id);
CREATE INDEX IF NOT EXISTS idx_property_property_id ON Property(property_id);
CREATE INDEX IF NOT EXISTS idx_property_name ON Property(name);

-- Example: Measure performance before and after adding indexes
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'some-user-id';
-- EXPLAIN ANALYZE SELECT * FROM Property WHERE name ILIKE '%Loft%';