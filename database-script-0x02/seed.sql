-- USERS
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'Alice', 'Smith', 'alice.smith@gmail.com', 'hashalice', '555-1234', 'host'),
  ('d2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', 'Bob', 'Johnson', 'bob.johnson@yahoo.com', 'hashbob', '555-2345', 'guest'),
  ('e3c3g3d2-3c4d-6e5f-0a1b-3456789012cd', 'Carol', 'Williams', 'carol.williams@outlook.com', 'hashcarol', '555-3456', 'host'),
  ('f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', 'David', 'Brown', 'david.brown@gmail.com', 'hashdavid', '555-4567', 'guest'),
  ('a5e5i5f4-5e6f-8a7b-2c3d-5678901234ef', 'Eve', 'Davis', 'eve.davis@company.com', 'hasheve', '555-5678', 'admin');

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('p1001-nyc-loft-2025', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'NYC Loft', 'Modern loft in Manhattan with skyline view.', 'New York, NY', 250.00),
  ('p1002-la-villa-2025', 'e3c3g3d2-3c4d-6e5f-0a1b-3456789012cd', 'LA Villa', 'Spacious villa with pool in Los Angeles.', 'Los Angeles, CA', 400.00),
  ('p1003-miami-condo-2025', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'Miami Beach Condo', 'Beachfront condo with ocean view.', 'Miami, FL', 300.00),
  ('p1004-denver-cabin-2025', 'e3c3g3d2-3c4d-6e5f-0a1b-3456789012cd', 'Denver Cabin', 'Cozy cabin near ski resorts.', 'Denver, CO', 180.00),
  ('p1005-chicago-flat-2025', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'Chicago Flat', 'Downtown flat close to Millennium Park.', 'Chicago, IL', 220.00);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('b2001-alice-bob', 'p1001-nyc-loft-2025', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', '2025-06-10', '2025-06-15', 1250.00, 'confirmed'),
  ('b2002-carol-david', 'p1002-la-villa-2025', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', '2025-07-01', '2025-07-05', 1600.00, 'pending'),
  ('b2003-alice-eve', 'p1003-miami-condo-2025', 'a5e5i5f4-5e6f-8a7b-2c3d-5678901234ef', '2025-08-12', '2025-08-15', 900.00, 'confirmed'),
  ('b2004-carol-bob', 'p1004-denver-cabin-2025', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', '2025-09-20', '2025-09-22', 360.00, 'canceled'),
  ('b2005-alice-david', 'p1005-chicago-flat-2025', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', '2025-10-05', '2025-10-10', 1100.00, 'confirmed');

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay3001', 'b2001-alice-bob', 1250.00, 'credit_card'),
  ('pay3002', 'b2002-carol-david', 1600.00, 'paypal'),
  ('pay3003', 'b2003-alice-eve', 900.00, 'stripe'),
  ('pay3004', 'b2004-carol-bob', 360.00, 'credit_card'),
  ('pay3005', 'b2005-alice-david', 1100.00, 'paypal');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('r4001', 'p1001-nyc-loft-2025', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', 5, 'Amazing loft, great location!'),
  ('r4002', 'p1002-la-villa-2025', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', 4, 'Spacious and clean, pool was fantastic.'),
  ('r4003', 'p1003-miami-condo-2025', 'a5e5i5f4-5e6f-8a7b-2c3d-5678901234ef', 5, 'Loved the ocean view and easy beach access.'),
  ('r4004', 'p1004-denver-cabin-2025', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', 3, 'Cozy but a bit far from the city.'),
  ('r4005', 'p1005-chicago-flat-2025', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', 4, 'Perfect spot for exploring downtown Chicago.');

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('m5001', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'Hi Alice, is the NYC Loft available in June?'),
  ('m5002', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'd2b2f2c1-2b3c-5d4e-9f0a-2345678901bc', 'Hi Bob, yes it is available for your dates.'),
  ('m5003', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', 'e3c3g3d2-3c4d-6e5f-0a1b-3456789012cd', 'Carol, is the LA Villa pet-friendly?'),
  ('m5004', 'e3c3g3d2-3c4d-6e5f-0a1b-3456789012cd', 'f4d4h4e3-4d5e-7f6a-1b2c-4567890123de', 'Yes, pets are welcome at the villa!'),
  ('m5005', 'a5e5i5f4-5e6f-8a7b-2c3d-5678901234ef', 'c1a1e1b0-1a2b-4c3d-8e9f-1234567890ab', 'Admin reminder: Please update your property photos.');