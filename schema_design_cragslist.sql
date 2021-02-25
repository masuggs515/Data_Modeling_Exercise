DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
id SERIAL PRIMARY KEY,
city TEXT NOT NULL
);

CREATE TABLE users
(
id SERIAL PRIMARY KEY,
username TEXT NOT NULL,
preferred_region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
id SERIAL PRIMARY KEY,
title TEXT,
post_text TEXT,
post_user INTEGER REFERENCES users,
post_location TEXT,
post_region INTEGER REFERENCES regions
);

CREATE TABLE categories
(
id SERIAL PRIMARY KEY,
category TEXT NOT NULL,
post_category INTEGER REFERENCES posts
);