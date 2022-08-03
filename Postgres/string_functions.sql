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
