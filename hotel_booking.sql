
-- Hotel Booking Database Management System
-- 1. Create database
CREATE DATABASE hotel_booking;
USE hotel_booking;

-- 2. Create Tables
-- Users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Hotels table
CREATE TABLE hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Rooms table
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    type VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
        ON DELETE CASCADE
);

-- Bookings table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    guests INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
        ON DELETE CASCADE
);

-- 3. Insert Sample Data
-- Users
INSERT INTO users (name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '0712345678'),
('Bob Smith', 'bob@example.com', '0723456789'),
('Carol Davis', 'carol@example.com', '0734567890');

-- Hotels
INSERT INTO hotels (name, address, city, country) VALUES
('Sunrise Hotel', '123 Ocean View', 'Mombasa', 'Kenya'),
('Mountain Retreat', '456 Hill Road', 'Nairobi', 'Kenya'),
('City Central Inn', '789 Downtown St', 'Nairobi', 'Kenya');

-- Rooms
INSERT INTO rooms (hotel_id, room_number, type, price) VALUES
(1, '101', 'Single', 50.00),
(1, '102', 'Double', 80.00),
(2, '201', 'Suite', 120.00),
(2, '202', 'Single', 60.00),
(3, '301', 'Double', 90.00),
(3, '302', 'Suite', 150.00);

-- Bookings
INSERT INTO bookings (user_id, room_id, check_in, check_out, guests) VALUES
(1, 1, '2025-10-01', '2025-10-05', 1),
(2, 3, '2025-09-20', '2025-09-25', 2),
(3, 5, '2025-11-10', '2025-11-12', 2),
(1, 2, '2025-12-01', '2025-12-03', 2);

-- Update a user's phone number
UPDATE users SET phone = '0798765432' WHERE user_id = 1;

-- Change the price of a room
UPDATE rooms SET price = 100.00 WHERE room_id = 2;
