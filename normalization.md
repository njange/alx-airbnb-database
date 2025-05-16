# Database Normalization for AirBnB Schema

## Objective
Ensure the database schema is in Third Normal Form (3NF) by eliminating redundancies and ensuring all attributes are fully functionally dependent on the primary key.

---

## 1. First Normal Form (1NF)
- **Requirement:** All attributes must have atomic values; no repeating groups or arrays.
- **Application:**  
  - All tables (User, Property, Booking, Payment, Review, Message) have atomic columns.
  - No multi-valued or composite attributes.

---

## 2. Second Normal Form (2NF)
- **Requirement:** Must be in 1NF; all non-key attributes are fully dependent on the entire primary key.
- **Application:**  
  - All tables use a single-column primary key (UUID).
  - No partial dependencies exist.

---

## 3. Third Normal Form (3NF)
- **Requirement:** Must be in 2NF; no transitive dependencies (non-key attributes do not depend on other non-key attributes).
- **Application:**  
  - All non-key attributes in each table depend only on the primary key.
  - No attribute is transitively dependent on the primary key.

---

## Review of Each Table

### User
- **Attributes:** user_id (PK), first_name, last_name, email, password_hash, phone_number, role, created_at
- **Analysis:** All attributes depend only on user_id. No redundancies or transitive dependencies.

### Property
- **Attributes:** property_id (PK), host_id (FK), name, description, location, pricepernight, created_at, updated_at
- **Analysis:** All attributes depend only on property_id. host_id is a foreign key, not a transitive dependency.

### Booking
- **Attributes:** booking_id (PK), property_id (FK), user_id (FK), start_date, end_date, total_price, status, created_at
- **Analysis:** All attributes depend only on booking_id. No transitive dependencies.

### Payment
- **Attributes:** payment_id (PK), booking_id (FK), amount, payment_date, payment_method
- **Analysis:** All attributes depend only on payment_id. No transitive dependencies.

### Review
- **Attributes:** review_id (PK), property_id (FK), user_id (FK), rating, comment, created_at
- **Analysis:** All attributes depend only on review_id. No transitive dependencies.

### Message
- **Attributes:** message_id (PK), sender_id (FK), recipient_id (FK), message_body, sent_at
- **Analysis:** All attributes depend only on message_id. No transitive dependencies.

---

## Conclusion

- **All tables are in 3NF:**  
  - Each table has a primary key.
  - All non-key attributes are fully functionally dependent on the primary key.
  - No transitive or partial dependencies exist.
- **No further normalization required.**  
  - The schema is efficient and free from redundancy.

---