DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
id SERIAL PRIMARY KEY,
team_name UNIQUE TEXT NOT NULL
);

CREATE TABLE players
(
id SERIAL PRIMARY KEY,
player_name TEXT NOT NULL,
team INTEGER REFERENCES teams
);

CREATE TABLE seasons
(
id SERIAL PRIMARY KEY,
date_start DATE NOT NULL,
date_end DATE NOT NULL 
);

CREATE TABLE matches
(
id SERIAL PRIMARY KEY,
team_one INTEGER REFERENCES teams,
team_two INTEGER REFERENCES teams,
season_id INTEGER REFERENCES seasons
);

CREATE TABLE goals
(
id SERIAL PRIMARY KEY,
match_scored INTEGER REFERENCES matches,
scoring_player INTEGER REFERENCES players
);

CREATE TABLE referees
(
id SERIAL PRIMARY KEY,
ref_name TEXT NOT NULL,
game_reffed INTEGER REFERENCES matches
);

CREATE TABLE results
(
team_id INTEGER REFERENCES teams,
match_id INTEGER REFERENCES matches,
result TEXT 
CHECK (result = 'W' OR result = 'L' OR result = 'D')
)

