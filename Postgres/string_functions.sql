-- upper and lower string functions
SELECT UPPER('stop shouting');
SELECT LOWER('StOp sHouTing');
SELECT first_name, UPPER(last_name) FROM actors;
SELECT first_name, UPPER(last_name) AS last_name FROM actors;
SELECT * FROM actors;
SELECT LOWER(movie_name) FROM movies;
SELECT movie_name FROM movies;

-- initcap function
SELECT initcap('eXamPLe sTring');
SELECT movie_name FROM movies;
SELECT initcap(movie_name) FROM movies;

-- select left and select right
SELECT left('string', 3);
SELECT left('string', -2);
SELECT left(movie_name, 5) FROM movies;
SELECT right('example', 3);
SELECT right('example', -2);
SELECT right(first_name, 2) FROM actors;

-- reverse function
SELECT reverse('reversed');
SELECT movie_name, reverse(movie_name) FROM movies;

-- challenge
-- select the directors first and last names and movie names they directed in uppercase
-- need to join director and movies table
SELECT UPPER(d.first_name), UPPER(d.last_name), UPPER(m.movie_name) FROM directors d
INNER JOIN movies m ON d.director_id = m.director_id;

-- select first and last names, in init cap, of all actors who starred in a chinese or korean movie
-- need to join actors and movies table through the movies_actors table
SELECT DISTINCT initcap(first_name), initcap(last_name) FROM actors
INNER JOIN movies_actors ON actors.actor_id = movies_actors.actor_id
INNER JOIN movies ON movies_actors.movie_id = movies.movie_id
WHERE movie_lang = 'Chinese' OR movie_lang = 'Korean';

-- retrieve the reversed first and last names of each directors and the first 3 char of their nationality
SELECT reverse(first_name), reverse(last_name), left(nationality, 3) FROM directors;

-- retrieve the initials of each director and display it in one column named 'initials'
SELECT left(last_name, 1) AS initials FROM directors;

SELECT CONCAT_WS('.', LEFT(first_name, 1), LEFT(last_name, 1)) AS initials FROM directors;

-- substring function
SELECT substring('long string', 5, 3);
SELECT first_name, substring(first_name, 3, 4) FROM actors;

-- replace function
SELECT replace('a cat plays with another cat', 'cat', 'dog');

SELECT first_name, last_name, REPLACE(gender, 'M', 'Male') FROM actors;

SELECT * FROM actors;

UPDATE directors
SET nationality = REPLACE(nationality, 'American', 'USA')
WHERE nationality = 'American'

SELECT * FROM directors;

-- split part function
SELECT SPLIT_PART('first_name.last_name@gmail.com', '@', 1);

SELECT movie_name, SPLIT_PART(movie_name, ' ', 1) AS first_word
FROM movies;

SELECT movie_name, SPLIT_PART(movie_name, ' ', 1) AS first_word
SPLIT_PART(movie_name, ' ', 2) AS second_word,
FROM movies;

-- cast operator :: to apply string functions to non-string data types
SELECT * FROM directors;

SELECT date_of_birth::TEXT FROM directors;

SELECT SPLIT_PART(date_of_birth::TEXT, '-', 1) FROM directors;
SELECT SPLIT_PART(date_of_birth::TEXT, '-', 2) FROM directors;
SELECT SPLIT_PART(date_of_birth::TEXT, '-', 3) FROM directors;

-- challenge
-- use the substring function to retrieve the first 6 characters of each movie name and the year they were released
SELECT substring(movie_name, 1, 6), substring(release_date::TEXT, 1, 4) FROM movies;

SELECT substring(movie_name, 1, 6) AS movie_name, substring(release_date::TEXT, 1, 4) AS year FROM movies;

-- retrieve the first name initial and last name of every actor born in may
-- need to first select the actors that are born in may, so nested select statement expected
SELECT SPLIT_PART(first_name, ' ', 1), last_name FROM actors
WHERE (SPLIT_PART(date_of_birth::TEXT, '-', 2) ) LIKE '05';

SELECT SPLIT_PART(first_name, ' ', 1), last_name FROM actors
WHERE date_of_birth::TEXT LIKE '%-05-%';

SELECT substring(first_name, 1, 1) AS fn_initial, last_name, date_of_birth FROM actors
WHERE (SPLIT_PART(date_of_birth::TEXT, '-', 2) ) = '05';

-- replace the movie language for all english lang movies, with age cert 18, to 'Eng'
-- need to first select the english lang movies with age cert of 18
UPDATE movies
SET movie_lang = REPLACE(movie_lang, 'English', 'Eng')
WHERE movie_lang = 'English' AND age_certificate = '18';

UPDATE movies
SET movie_lang = REPLACE(movie_lang, 'English', 'Eng')
WHERE age_certificate = '18';