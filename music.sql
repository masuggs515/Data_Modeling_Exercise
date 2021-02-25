-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
id SERIAL PRIMARY KEY,
artist TEXT NOT NULL
);

CREATE TABLE producers
(
id SERIAL PRIMARY KEY,
producer TEXT NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists_id INTEGER REFERENCES artists,
  artists2_id INTEGER REFERENCES artists DEFAULT NULL,
  album TEXT NOT NULL,
  producers_id INTEGER REFERENCES producers,
  producers2_id INTEGER REFERENCES producers DEFAULT NULL
);

INSERT INTO artists (artist)
VALUES('Hanson'), 
('Queen'), 
('Mariah Carey'), 
('Boyz II Men'), 
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers (producer)
VALUES ('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');



INSERT INTO songs
  (title, duration_in_seconds, release_date, artists_id, album, producers_id, artists2_id, producers2_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 1, NULL, 2),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 'A Night at the Opera', 3, NULL, NULL),
  ('One Sweet Day', 282, '11-14-1995', 3, 'Daydream', 4, 4, NULL),
  ('Shallow', 216, '09-27-2018', 5, 'A Star Is Born', 5, 6, NULL),
  ('How You Remind Me', 223, '08-21-2001', 7, 'Silver Side Up', 6, NULL, NULL),
  ('New York State of Mind', 276, '10-20-2009', 8, 'The Blueprint 3', 7, 9, NULL),
  ('Dark Horse', 215, '12-17-2013', 10, 'Prism', 8, 11, 9),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 'Hands All Over', 10, 13, 11),
  ('Complicated', 244, '05-14-2002', 14, 'Let Go', 12, NULL, NULL),
  ('Say My Name', 240, '11-07-1999', 15, 'The Writing''s on the Wall', 13, NULL, NULL);
