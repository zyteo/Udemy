-- upper and lower string functions
SELECT UPPER('stop shouting');
SELECT LOWER('StOp sHouTing');
SELECT first_name, UPPER(last_name) FROM actors;
SELECT first_name, UPPER(last_name) AS last_name FROM actors;
SELECT * FROM actors;
SELECT LOWER(movie_name) FROM movies;
SELECT movie_name FROM movies;