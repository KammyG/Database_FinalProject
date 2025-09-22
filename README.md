
# Hotel Booking Database Management System

## Project Overview
This project is a **Hotel Booking Database Management System** implemented using **MySQL**. It is designed to manage users, hotels, rooms, and bookings in a relational database. The system includes proper relationships, constraints, and sample data to simulate a real-world hotel booking environment.

---

## Database Schema

### 1. Users Table
Stores information about users who can book hotel rooms.

| Column | Type | Constraints |
|--------|------|-------------|
| user_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(100) | NOT NULL, UNIQUE |
| phone | VARCHAR(20) | NULL |

---

### 2. Hotels Table
Stores hotel details.

| Column | Type | Constraints |
|--------|------|-------------|
| hotel_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| name | VARCHAR(150) | NOT NULL |
| address | VARCHAR(255) | NULL |
| city | VARCHAR(100) | NULL |
| country | VARCHAR(100) | NULL |

---

### 3. Rooms Table
Stores rooms for each hotel. Linked to the `hotels` table via a foreign key.

| Column | Type | Constraints |
|--------|------|-------------|
| room_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| hotel_id | INT | FOREIGN KEY REFERENCES `hotels(hotel_id)` ON DELETE CASCADE |
| room_number | VARCHAR(10) | NOT NULL |
| type | VARCHAR(50) | NOT NULL |
| price | DECIMAL(10,2) | NOT NULL |

---

### 4. Bookings Table
Stores booking information. Linked to `users` and `rooms` tables via foreign keys.

| Column | Type | Constraints |
|--------|------|-------------|
| booking_id | INT | PRIMARY KEY, AUTO_INCREMENT |
| user_id | INT | FOREIGN KEY REFERENCES `users(user_id)` ON DELETE CASCADE |
| room_id | INT | FOREIGN KEY REFERENCES `rooms(room_id)` ON DELETE CASCADE |
| check_in | DATE | NOT NULL |
| check_out | DATE | NOT NULL |
| guests | INT | NOT NULL |
| booking_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

---

## Sample Data
The database includes sample data for demonstration purposes:

- **Users:** Alice Johnson, Bob Smith, Carol Davis  
- **Hotels:** Sunrise Hotel, Mountain Retreat, City Central Inn  
- **Rooms:** Multiple types (Single, Double, Suite) for each hotel  
- **Bookings:** Sample bookings for each user and room  

---

## CRUD Operations Examples

### Update a User's Phone Number
```sql
UPDATE users
SET phone = '0798765432'
WHERE user_id = 1;
````

### Update Room Price

```sql
UPDATE rooms
SET price = 100.00
WHERE room_id = 2;
```

---

## How to Run

1. Open your **MySQL Workbench** or terminal.
2. Copy the `hotel_booking.sql` script.
3. Execute the script to create the database, tables, and sample data.
4. Run queries to manage users, hotels, rooms, and bookings.

---

## Notes

* All tables have **primary keys** and appropriate **foreign key relationships**.
* Deleting a hotel or user will automatically delete associated rooms or bookings (`ON DELETE CASCADE`).
* The database can be extended to include additional features like payment, reviews, or room availability.

---


If you want, I can also **add a section with diagrams or an ERD** so your README looks professional and complete for submission. Do you want me to do that?
```
