-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "leagues" (
    "id" SERIAL PRIMARY KEY,
    "league_name" text   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL
);

CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "team_name" text   NOT NULL,
    "ranking" int   NOT NULL,
    "league_id" int REFERENCES "leagues"("id")
);

CREATE TABLE "players" (
    "id" SERIAL PRIMARY KEY,
    "player_name" text   NOT NULL,
    "team_id" int REFERENCES "teams"("id")
);

CREATE TABLE "referees" (
    "id" SERIAL PRIMARY KEY,
    "ref_name" text   NOT NULL
);

CREATE TABLE "matches" (
    "id" SERIAL PRIMARY KEY,
    "league_id" int REFERENCES "leagues"("id"),
    "team1" int   REFERENCES "teams"("id"),
    "team2" int   REFERENCES "teams"("id"),
    "date" date   NOT NULL
);

CREATE TABLE "match_referees" (
    "match_id" int REFERENCES "matches"("id"),
    "ref_id" int   REFERENCES "referees"("id")
);