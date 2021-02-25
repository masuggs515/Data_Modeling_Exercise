-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
id SERIAL PRIMARY KEY,
airline TEXT UNIQUE NOT NULL
);

CREATE TABLE countries
(
id SERIAL PRIMARY KEY,
country TEXT UNIQUE NOT NULL
);

CREATE TABLE cities
(
id SERIAL PRIMARY KEY,
city TEXT UNIQUE NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name_id INTEGER REFERENCES passengers,
  last_name_id INTEGER REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines,
  from_city_id INTEGER REFERENCES cities,
  from_country_id INTEGER REFERENCES countries,
  to_city_id INTEGER REFERENCES cities,
  to_country_id INTEGER REFERENCES countries
);



INSERT INTO passengers (first_name, last_name)
VALUES ('Alvin', 'Leathes'),
('Berkie', 'Wycliff'),
('Cory', 'Squibbes'),
('Jennifer', 'Finch'),
('Sonja', 'Pauley'),
('Thadeus', 'Gathercoal'),
('Waneta', 'Skeleton');

INSERT INTO airlines (airline)
VALUES ('Air China'),
('American Airlines'),
('Avianca Brasil'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('United');

INSERT INTO countries (country)
VALUES ('Brazil'),
('Chile'),
('China'),
('Mexico'),
('Morocco'),
('UAE'),
('France'),
('Japan'),
('United Kingdom'),
('United States');

INSERT INTO cities (city)
VALUES ('Cedar Rapids'),
('Charlotte'),
('Dubai'),
('Los Angeles'),
('New York'),
('Paris'),
('Sao Paolo'),
('Seattle'),
('Tokyo'),
('Washington DC'),
('Chicago'),
('New Orleans'),
('Beijing'),
('Las Vegas'),
('Casablanca'),
('Santigo'),
('Mexico City'),
('London');



INSERT INTO tickets
  (first_name_id, last_name_id, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (4, 4, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 7, 10, 10, 8, 10),
  (6,6, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 4, 9, 8, 18, 9),
  (5,5, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 4, 10, 14, 10),
  (4,4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 5, 8, 10, 17, 4),
  (7,7, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 6, 6, 7, 15, 5),
  (6,6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 1, 3, 6, 13, 3),
  (2,2, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 5, 10, 2, 10),
  (1,1, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 2, 1, 10, 11, 10),
  (2,2, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 2, 2, 10, 12, 10),
  (3,3, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 3, 7, 1, 16, 2);