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


-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
INSERT INTO matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available'),
(106, 'Arsenal vs Chelsea', 'Premier League', 110.00, 'Selling Fast'),
(107, 'Manchester United vs Tottenham', 'Premier League', 115.00, 'Available'),
(108, 'Borussia Dortmund vs RB Leipzig', 'Bundesliga', 95.00, 'Available'),
(109, 'Ajax vs PSV Eindhoven', 'Eredivisie', 75.00, 'Selling Fast'),
(110, 'Benfica vs Porto', 'Primeira Liga', 85.00, 'Available'),
(111, 'Atletico Madrid vs Sevilla', 'La Liga', 100.00, 'Sold Out'),
(112, 'Napoli vs Lazio', 'Serie A', 88.00, 'Available'),
(113, 'Celtic vs Rangers', 'Scottish Premiership', 70.00, 'Selling Fast'),
(114, 'Flamengo vs Palmeiras', 'Copa Libertadores', 125.00, 'Available'),
(115, 'Boca Juniors vs River Plate', 'Copa Libertadores', 140.00, 'Sold Out'),
(116, 'Al Nassr vs Al Hilal', 'Saudi Pro League', 105.00, 'Available'),
(117, 'Inter Miami vs LA Galaxy', 'MLS', 95.00, 'Selling Fast'),
(118, 'Galatasaray vs Fenerbahce', 'Turkish Super Lig', 85.00, 'Postponed'),
(119, 'Club Brugge vs Anderlecht', 'Belgian Pro League', 65.00, 'Available'),
(120, 'Sporting CP vs Braga', 'Primeira Liga', 78.00, 'Available');