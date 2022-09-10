-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).


CREATE TABLE "hospitals" (
    "id" SERIAL PRIMARY KEY,
    "hospital_name" TEXT UNIQUE NOT NULL,
);


CREATE TABLE "doctors" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT   UNIQUE NOT NULL,
    "hospitalid" REFERENCES hospitals(id)
);



CREATE TABLE "patients" (
    "id" SERIAL PRIMARY KEY,
    "name" string  UNIQUE NOT NULL,
);

CREATE TABLE "diagnoses" (
    "id" SERIAL PRIMARY KEY ,
);


CREATE TABLE "visits" (
    "id" SERIAL PRIMARY KEY,
    "doctorID" REFERENCES doctors(id),
    "diagnosisID" REFERENCES diagnoses(id),
    "patientID" REFERENCES patients(id)
);
