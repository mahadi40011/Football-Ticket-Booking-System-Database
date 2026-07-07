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


-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
INSERT INTO bookings
(booking_id, user_id, match_id, seat_number, payment_status, total_cost)
VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 5, 102, 'B-04', 'Confirmed', 120.00),
(503, 3, 103, 'C-15', 'Pending', 130.00),
(504, 4, 104, 'D-08', 'Refunded', 90.00),
(505, 5, 105, 'A-21', null, 80.00),
(506, 6, 106, 'E-11', 'Cancelled', 110.00),
(507, 11, 107, 'F-05', 'Confirmed', 115.00),
(508, 8, 108, 'B-19', 'Pending', 95.00),
(509, 4, 109, 'C-07', 'Confirmed', 75.00),
(510,10,110, 'A-18', 'Refunded', 85.00),
(511,11,111, 'D-14', 'Confirmed', 100.00),
(512,12,112, 'E-03', 'Confirmed', 88.00),
(513,13,113, 'F-09', 'Cancelled', 70.00),
(514,14,114, 'A-06', null, 125.00),
(515,15,115, 'B-12', 'Confirmed', 140.00),
(516,16,116, 'C-22', 'Refunded', 105.00),
(517,19,117, 'D-17', 'Confirmed', 95.00),
(518,18,118, 'E-20', 'Pending', 85.00),
(519,19,119, 'F-01', 'Confirmed', 65.00),
(520,20,120, 'A-15', null, 78.00),
(521, 1,103, 'B-09', 'Confirmed', 130.00),
(522, 4,106, 'C-10', 'Refunded', 110.00),
(523, 6,109, 'D-02', 'Confirmed', 75.00),
(524, 8,112, 'E-16', 'Pending', 88.00),
(525,10,115, 'F-13', 'Confirmed', 140.00),
(526,12,118, 'A-24', 'Cancelled', 85.00),
(527,14,101, 'B-06', null, 150.00),
(528,16,104, 'C-18', 'Refunded', 90.00),
(529,18,107, 'D-11', 'Pending', 115.00),
(530,20,110, 'E-08', 'Confirmed', 85.00);


-- ===========
-- SQL Queries
-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
where
  tournament_category = 'Champions League'
  and match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
select
  user_id,
  full_name,
  email
from
  users
where
  full_name ilike 'Tanvir%'
  or full_name ilike '%Haque%'

  -- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
select
  booking_id,
  user_id,
  match_id,
  coalesce(payment_status :: text, 'Action Required') as systematic_status
from
  bookings
where
  payment_status is null

-- Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
select
  booking_id,
  full_name,
  fixture,
  total_cost
from
  users
  inner join bookings using(user_id)
  inner join matches using (match_id)

  -- Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.
select
  user_id,
  full_name,
  booking_id
from
  users full
  join bookings using(user_id)

  -- Query 6: Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings.
select
  booking_id,
  match_id,
  total_cost
from
  bookings
where
  (
    select
      avg(total_cost)
    from
      bookings
  ) < total_cost

-- Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match.
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
order by
  base_ticket_price desc
limit
  2 offset 1