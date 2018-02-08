DROP TABLE IF EXISTS castings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS stars;

CREATE table movies(
id SERIAL PRIMARY KEY,
title VARCHAR,
genre VARCHAR,
rating INT

);

CREATE table stars(
id SERIAL PRIMARY KEY,
first_name VARCHAR,
last_name VARCHAR
);

CREATE table castings(
  id SERIAL PRIMARY KEY,
  movieid INT REFERENCES movies(id) ON DELETE CASCADE,
  moviestarid INT REFERENCES stars(id) ON DELETE CASCADE,
  fee INT
);
