SELECT first_name, last_name, nationality FROM directors;

-- select with where clause
SELECT * FROM movies
WHERE age_certificate = '15';

SELECT * FROM movies
WHERE age_certificate = '15'
AND movie_lang = 'Chinese';

SELECT * FROM movies
WHERE age_certificate = '15'
OR movie_lang = 'Chinese';

SELECT * FROM movies
WHERE movie_lang = 'English'
AND age_certificate = '15'
AND director_id = '27';

-- logical operators
SELECT movie_name, movie_length FROM movies
WHERE movie_length > 120;

SELECT movie_name, movie_length FROM movies
WHERE movie_length >= 120;

SELECT movie_name, movie_length FROM movies
WHERE movie_length < 120;

SELECT movie_name, movie_length FROM movies
WHERE movie_length <= 120;

-- logical operators on dates
SELECT * FROM movies
WHERE release_date > '1999-12-31';

SELECT * FROM movies
WHERE release_date < '1999-12-31';

-- logical operators on varchar
SELECT * FROM movies
WHERE movie_lang > 'English';

SELECT * FROM movies
WHERE movie_lang < 'English';

SELECT * FROM movies
WHERE movie_lang <= 'English';

-- challenge
-- select movie_name and release date from movies
SELECT movie_name, release_date FROM movies;
-- select first and last name of all american directors
SELECT first_name, last_name FROM directors
WHERE nationality = 'American';

-- select all male actors born after 1 Jan 1970
SELECT * FROM actors
WHERE gender = 'M' 
AND date_of_birth > '1970-01-01';

-- select names of all movies over 90mins long and movie lang is english
SELECT movie_name FROM movies
WHERE movie_length > 90
AND movie_lang = 'English';

-- in and not in
SELECT first_name, last_name FROM actors
WHERE first_name IN ('John', 'Bruce');

SELECT first_name, last_name FROM actors
WHERE first_name IN ('John', 'Bruce','Peter');

SELECT first_name, last_name FROM actors
WHERE first_name NOT IN ('John', 'Bruce','Peter');

SELECT actor_id, first_name, last_name FROM actors
WHERE actor_id IN (2,3,4,5,6,8);

SELECT actor_id, first_name, last_name FROM actors
WHERE actor_id NOT IN (2,3,4,5,6,8);

-- like with % and _
-- this means any number of characters after P
SELECT * FROM actors
WHERE first_name LIKE 'P%';

-- this means 1 character after Pe
SELECT * FROM actors
WHERE first_name LIKE 'Pe_';

-- this means any number of characters after and before r
SELECT * FROM actors
WHERE first_name LIKE '%r%';

SELECT * FROM actors
WHERE first_name LIKE '%rl%';

SELECT * FROM actors
WHERE first_name LIKE '__rl_';

SELECT * FROM actors
WHERE first_name LIKE '__rl__';

-- between
SELECT movie_name, release_date FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '1999-12-31';

SELECT movie_name, movie_length FROM movies
WHERE movie_length BETWEEN 90 AND 120;

-- not recommended, better to stick to int/dates for BETWEEN
SELECT movie_name, movie_lang FROM movies
WHERE movie_lang BETWEEN 'E' AND 'P';

-- challenge
-- select movie name and movie lang of all movie with english,spanish,korean
SELECT movie_name, movie_lang FROM movies
WHERE movie_lang IN ('English','Spanish','Korean');
-- select first and last name of actors whose last name begins with M and born between 1/1/1940 and 31/12/1969
SELECT first_name, last_name FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';
-- select first and last names of directors with nationality of british, french or german, born between 1/1/1950 and 31/12/1980
SELECT first_name, last_name FROM directors
WHERE nationality IN ('British', 'French', 'German') 
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';

-- order by
SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY first_name;

SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY first_name DESC;

SELECT actor_id, first_name, last_name, date_of_birth FROM actors
ORDER BY actor_id DESC;

SELECT actor_id, first_name, last_name, date_of_birth FROM actors
ORDER BY date_of_birth DESC;

SELECT actor_id, first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC;

-- limit result returned
SELECT * FROM movie_revenues
ORDER BY domestic_takings
LIMIT 5;

SELECT * FROM movie_revenues
ORDER BY revenue_id
LIMIT 5 OFFSET 3;

-- fetch (similar to limit, but offset command comes first)
SELECT movie_id, movie_name FROM movies
FETCH FIRST 1 ROW ONLY;

SELECT movie_id, movie_name FROM movies
FETCH FIRST 10 ROWS ONLY;

SELECT movie_id, movie_name FROM movies
OFFSET 8 ROWS
FETCH FIRST 10 ROWS ONLY;

-- select distinct values
SELECT DISTINCT movie_lang FROM movies
ORDER BY movie_lang;

SELECT * FROM movies

-- challenge
-- select american directors ordered from oldest to youngest
SELECT * FROM directors 
WHERE nationality = 'American'
ORDER BY date_of_birth ASC;

-- return distinct nationality from directors table
SELECT DISTINCT nationality FROM directors;

-- return first names, last names and date of birth of 10 youngest female actors
SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC
LIMIT 10;

-- null values
SELECT * FROM actors
WHERE date_of_birth IS NOT NULL;

SELECT * FROM movie_revenues
WHERE domestic_takings IS NOT NULL
ORDER BY domestic_takings DESC;

SELECT * FROM movie_revenues
WHERE international_takings IS NULL;

-- setting column name alias
SELECT last_name AS surname FROM directors;

SELECT last_name AS surname FROM directors
WHERE last_name LIKE 'A%'
ORDER BY surname;

-- concat
SELECT CONCAT(first_name, last_name) AS full_name FROM actors;

SELECT CONCAT(first_name,' ', last_name) AS full_name FROM actors;

-- ws is with sep, specify the sep first
SELECT CONCAT_WS(' ',first_name, last_name, date_of_birth) AS full_name FROM actors;

-- challenge
-- return top 3 movies with highest international takings
SELECT * FROM movie_revenues
WHERE international_takings IS NOT NULL
ORDER BY international_takings DESC
LIMIT 3;

-- concat the first and last name of directors, sep by a space, and call this col full_name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM directors;

-- return actors with missing first_names or missing date_of_birth
SELECT * FROM actors
WHERE first_name IS NULL
OR date_of_birth IS NULL;