-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline_name TEXT
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id int REFERENCES countries(id)
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id int REFERENCES passengers(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline int REFERENCES airlines(id),
  from_city int REFERENCES cities(id),
  to_city int REFERENCES cities(id)
);

INSERT INTO airlines
(airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries
(country_name)
VALUES
  ('United States'),
  ('United Kingdom'),
  ('Morocco'),
  ('China'),
  ('Mexico'),
  ('Japan'),
  ('France'),
  ('UAU'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities
(city_name, country_id)
VALUES
  ('Washington DC',1),
  ('Seattle',1),
  ('London',2),
  ('Las Vegas',1),
  ('Tokyo',6),
  ('Los Angeles',1),
  ('Mexico City',5),
  ('Paris',7),
  ('Casablanca',3),
  ('Dubai',8),
  ('Beijing',4),
  ('New York',1),
  ('Charlotte',1),
  ('Cedar Rapids',1),
  ('Chicago',1),
  ('New Orleans',1),
  ('Sao Paolo',9),
  ('Santiago',10);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');


INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline, from_city, to_city)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2,5,3),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 6, 4),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00',3, 2, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5,10,11),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  (7, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13,16),
  (8, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7,17, 18);