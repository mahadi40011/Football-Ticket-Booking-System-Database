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


-- 3. CREATE BOOKINGS TABLE
CREATE TYPE payment_status AS enum('Pending', 'Confirmed', 'Cancelled', 'Refunded')
--
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id int REFERENCES users (user_id),
  match_id int REFERENCES matches (match_id),
  seat_number varchar(10) NOT NULL,
  payment_status payment_status NOT NULL,
  total_cost decimal(8, 2) NOT NULL CHECK (total_cost > 0)
);


-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
INSERT INTO users (full_name, email, role, phone_number) VALUES
('Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
('Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
('Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
('Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL),
('Rakib Hasan', 'rakib@mail.com', 'Football Fan', '+8801744444444'),
('Nusrat Jahan', 'nusrat@mail.com', 'Football Fan', '+8801755555555'),
('Imran Hossain', 'imran@mail.com', 'Football Fan', '+8801766666666'),
('Farzana Akter', 'farzana@mail.com', 'Football Fan', NULL),
('Mahmudul Hasan', 'mahmud@mail.com', 'Ticket Manager', '+8801788888888'),
('Sadia Islam', 'sadia@mail.com', 'Football Fan', '+8801799999999'),
('Rifat Ahmed', 'rifat@mail.com', 'Football Fan', '+8801811111111'),
('Mim Akter', 'mim@mail.com', 'Football Fan', '+8801822222222'),
('Shakib Hossain', 'shakib@mail.com', 'Football Fan', NULL),
('Tanzim Hasan', 'tanzim@mail.com', 'Ticket Manager', '+8801833333333'),
('Nafisa Rahman', 'nafisa@mail.com', 'Football Fan', '+8801844444444'),
('Arif Chowdhury', 'arif@mail.com', 'Football Fan', '+8801855555555'),
('Tamanna Islam', 'tamanna@mail.com', 'Football Fan', NULL),
('Fahim Ahmed', 'fahim@mail.com', 'Football Fan', '+8801877777777'),
('Sharmin Sultana', 'sharmin@mail.com', 'Ticket Manager', '+8801888888888'),
('Mehedi Hasan', 'mehedi@mail.com', 'Football Fan', NULL);