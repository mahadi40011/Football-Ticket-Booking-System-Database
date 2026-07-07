-- 1. CREATE Football Ticket Booking System Database
CREATE DATABASE football_ticket_booking_db


-- 1. CREATE USERS TABLE
CREATE TYPE user_role AS enum('Ticket Manager', 'Football Fan')
--
CREATE TABLE users (
  user_id serial PRIMARY KEY,
  full_name varchar(50) NOT NULL,
  email varchar(50) UNIQUE NOT NULL,
  role user_role NOT NULL,
  phone_number varchar(20)
);