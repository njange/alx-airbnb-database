# AirBnB Database Normalization

## 1. First Normal Form (1NF)
- All tables have atomic values (no repeating groups or arrays).
- Each field contains only one value per row.

## 2. Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the primary key.
- No partial dependencies (since all tables use single-column primary keys).

## 3. Third Normal Form (3NF)
- No transitive dependencies (non-key attributes do not depend on other non-key attributes).

---

## Entities and Normalized Tables

### User
- **user_id** (PK, UUID, Indexed)
- first_name (VARCHAR, NOT NULL)
- last_name (VARCHAR, NOT NULL)
- email (VARCHAR, UNIQUE, NOT NULL, Indexed)
- password_hash (VARCHAR, NOT NULL)
- phone_number (VARCHAR, NULL)
- role (ENUM: guest, host, admin, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Constraints:**  
- Unique constraint on email  
- Non-null constraints on required fields

---

### Property
- **property_id** (PK, UUID, Indexed)
- host_id (FK, references User(user_id))
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- pricepernight (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

**Constraints:**  
- Foreign key constraint on host_id  
- Non-null constraints on essential attributes

---

### Booking
- **booking_id** (PK, UUID, Indexed)
- property_id (FK, references Property(property_id))
- user_id (FK, references User(user_id))
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (ENUM: pending, confirmed, canceled, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Constraints:**  
- Foreign key constraints on property_id and user_id  
- status must be one of pending, confirmed, or canceled

---

### Payment
- **payment_id** (PK, UUID, Indexed)
- booking_id (FK, references Booking(booking_id))
- amount (DECIMAL, NOT NULL)
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

**Constraints:**  
- Foreign key constraint on booking_id

---

### Review
- **review_id** (PK, UUID, Indexed)
- property_id (FK, references Property(property_id))
- user_id (FK, references User(user_id))
- rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Constraints:**  
- rating between 1 and 5  
- Foreign key constraints on property_id and user_id

---

### Message
- **message_id** (PK, UUID, Indexed)
- sender_id (FK, references User(user_id))
- recipient_id (FK, references User(user_id))
- message_body (TEXT, NOT NULL)
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Constraints:**  
- Foreign key constraints on sender_id and recipient_id

---

## Indexing
- Primary keys are indexed automatically.
- Additional indexes:
  - email in User
  - property_id in Property and Booking
  - booking_id in Booking and Payment

---

## Summary
All tables are in 3NF:
- Each table has a primary key.
- All attributes depend only on the primary key.
- No transitive or partial dependencies.