-- Medical Center schema

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
credentials TEXT NOT NULL
);

CREATE TABLE patients
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
id SERIAL PRIMARY KEY,
disease_name TEXT NOT NULL
);

CREATE TABLE doctors_patients
(
id SERIAL PRIMARY KEY,
doctor_id INTEGER NOT NULL REFERENCES doctors,
patient_id INTEGER NOT NULL REFERENCES patients
);

CREATE TABLE patients_diseases
(
id SERIAL PRIMARY KEY,
disease_id INTEGER NOT NULL REFERENCES diseases,
patient_id INTEGER NOT NULL REFERENCES patients
);