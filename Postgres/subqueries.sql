-- uncorrelated subquery
-- inner subquery can be run independently of outer query
SELECT movie_name, movie_length FROM movies
WHERE movie_length > 
(SELECT AVG(movie_length) FROM movies);

SELECT movie_name, movie_length FROM movies
WHERE movie_length > 126.13;

SELECT AVG(movie_length) FROM movies;

-- select all directors younger than James Cameron
SELECT first_name, last_name, date_of_birth FROM directors
WHERE date_of_birth > 
(SELECT date_of_birth FROM directors 
WHERE first_name = 'James' AND last_name = 'Cameron');

-- directors younger than Tom Cruise
SELECT first_name, last_name, date_of_birth FROM directors
WHERE date_of_birth > 
(SELECT date_of_birth FROM actors 
WHERE first_name = 'Tom' AND last_name = 'Cruise');

-- get the movie names where the international takings is greater than domestic takings
SELECT movie_name FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE international_takings > domestic_takings);

SELECT mo.movie_id, mo.movie_name, d.first_name, d.last_name FROM movies mo
INNER JOIN directors d ON mo.director_id = d.director_id
WHERE mo.movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE international_takings > domestic_takings);

-- challenge
-- select first and last names of all actors older than Marlon Brando
SELECT first_name, last_name FROM actors
WHERE date_of_birth <
(SELECT date_of_birth FROM actors 
WHERE first_name = 'Marlon' AND last_name = 'Brando');

-- select movie names of all movies that have domestic takings more than 300 million
SELECT movie_name FROM movies
WHERE movie_id IN 
(SELECT movie_id FROM movie_revenues
WHERE domestic_takings > 300);

-- return shortest and longest movie length for movies with an above average domestic takings
SELECT MIN(movie_length), MAX(movie_length) FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE domestic_takings > (SELECT AVG(domestic_takings) FROM movie_revenues));

-- correlated subquery
-- take the oldest director for each nationality
SELECT d1.first_name, d1.last_name, d1.date_of_birth FROM directors d1
WHERE d1.date_of_birth =
(SELECT MIN(date_of_birth) FROM directors d2
WHERE d2.nationality = d1.nationality);

-- select all the longest movie for each movie lang
SELECT mo1.movie_name, mo1.movie_lang, mo1.movie_length FROM movies mo1
WHERE mo1.movie_length =
(SELECT MAX(movie_length) FROM movies mo2
WHERE mo2.movie_lang = mo1.movie_lang);

-- challenge
-- select first name, last name, dob for the oldest actors of each gender
SELECT ac1.first_name, ac1.last_name, ac1.date_of_birth FROM actors ac1
WHERE ac1.date_of_birth = 
(SELECT MIN(date_of_birth) FROM actors ac2 
WHERE ac1.gender = ac2.gender);

-- select movie name, movie length and age certificate for movies with an above average length for their age certificate
SELECT mo1.movie_name, mo1.movie_length, mo1.age_certificate FROM movies mo1 
WHERE mo1.movie_length >
(SELECT AVG(movie_length) FROM movies mo2
WHERE mo2.age_certificate = mo1.age_certificate);