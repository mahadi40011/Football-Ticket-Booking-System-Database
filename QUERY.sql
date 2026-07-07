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


-- 2. CREATE MATCHES TABLE
CREATE TYPE match_status AS enum(
  'Available',
  'Selling Fast',
  'Sold Out',
  'Postponed'
)
--
CREATE TABLE matches (
  match_id serial PRIMARY KEY,
  fixture varchar(100) NOT NULL,
  tournament_category varchar(100) NOT NULL,
  base_ticket_price decimal(8, 2) NOT NULL CHECK (base_ticket_price > 0),
  match_status match_status NOT NULL
);