-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

CREATE TABLE traveler
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE destination
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline ON DELETE SET NULL,
  from_city_country_id INT REFERENCES city_country ON DELETE SET NULL,
  to_city_country_id INT REFERENCES city_country ON DELETE SET NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  traveler_id INT REFERENCES traveler ON DELETE CASCADE,
  flight_id INT REFERENCES flight ON DELETE CASCADE
);


INSERT INTO traveler
  (first_name, last_name) 
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO destination
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('New York', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('London', 'United Kingdom'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Tokyo', 'Japan'),
  ('Dubai', 'UAE'),
  ('Avianca Brasil', 'Sao Paolo'),
  ('Santiago', 'Chile');

INSERT INTO flight
  (departure, arrival, airline_id, from_city_country_id, to_city_country_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 3),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 4, 5),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 3, 4),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 2, 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 5, 6),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 4, 5),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 6, 7),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 8, 9),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 11);




INSERT INTO tickets
  (seat, traveler_id, flight_id)
VALUES
  ('33B', 1, 1),
  ('8A', 2, 2),
  ('12F', 3, 4),
  ('23D', 4, 5);
  











   