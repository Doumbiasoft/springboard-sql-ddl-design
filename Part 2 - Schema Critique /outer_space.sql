DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE "galaxy" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "planets" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "galaxy_id" bigint NOT NULL,
  "name" varchar,
  "orbital_period_in_years" float NOT NULL
);

CREATE TABLE "planets_orbits_around" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "planets_id" bigint NOT NULL,
  "orbits_around_id" bigint NOT NULL
);

CREATE TABLE "orbits_around" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "planets_moons" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "planets_id" bigint NOT NULL,
  "moons_id" bigint NOT NULL
);

CREATE TABLE "moons" (
  "id" BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "planets" ADD FOREIGN KEY ("galaxy_id") REFERENCES "galaxy" ("id");

ALTER TABLE "planets_orbits_around" ADD FOREIGN KEY ("planets_id") REFERENCES "planets" ("id");

ALTER TABLE "planets_orbits_around" ADD FOREIGN KEY ("orbits_around_id") REFERENCES "orbits_around" ("id");

ALTER TABLE "planets_moons" ADD FOREIGN KEY ("moons_id") REFERENCES "moons" ("id");

ALTER TABLE "planets_moons" ADD FOREIGN KEY ("planets_id") REFERENCES "planets" ("id");
