-- aggregate functions
-- COUNT
SELECT COUNT(*) FROM movie_revenues;

-- does not include null values, thus result is less than 53
SELECT COUNT(international_takings) FROM movie_revenues;

SELECT COUNT(*) FROM movies 
WHERE movie_lang = 'English';

-- sum (only for int or numeric)
SELECT SUM(domestic_takings) FROM movie_revenues;

SELECT SUM(domestic_takings) FROM movie_revenues
WHERE domestic_takings > 100.0;

SELECT SUM(movie_length) FROM movies
WHERE movie_lang = 'Chinese';

-- this does not work
SELECT SUM(*) FROM movies;

-- min and max
SELECT MAX(movie_length) FROM movies;

SELECT MIN(movie_length) FROM movies;

SELECT MIN(movie_length) FROM movies
WHERE movie_lang = 'Japanese';

SELECT MAX(release_date) FROM movies;

SELECT MIN(release_date) FROM movies;

-- compares alphabetically, not length of movie name
SELECT MAX(movie_name) FROM movies;

SELECT MIN(movie_name) FROM movies;

-- average
SELECT AVG(movie_length) FROM movies;

SELECT AVG(movie_length) FROM movies
WHERE age_certificate = '18';

-- challenge
-- count number of actors born after 1 Jan 1970
SELECT COUNT(*) FROM actors
WHERE date_of_birth > '1970-01-01';

-- what's the highest and lowest domestic takings for a movie
SELECT MAX(domestic_takings) FROM movie_revenues;
SELECT MIN(domestic_takings) FROM movie_revenues;

-- sum total of movie length for movies rated 15
SELECT SUM(movie_length) FROM movies
WHERE age_certificate = '15';

-- how many Japanese directors in directors table
SELECT COUNT(*) FROM directors
WHERE nationality = 'Japanese';

-- average movie length for chinese movies
SELECT AVG(movie_length) FROM movies
WHERE movie_lang = 'Chinese';

-- grouping data
SELECT COUNT(movie_lang) FROM movies;

SELECT movie_lang, COUNT(movie_lang) FROM movies
GROUP BY movie_lang;

SELECT movie_lang, AVG(movie_length) FROM movies
GROUP BY movie_lang;

SELECT movie_lang, age_certificate, AVG(movie_length) FROM movies
GROUP BY movie_lang, age_certificate;

SELECT movie_lang, age_certificate, AVG(movie_length) FROM movies
WHERE movie_length > 120
GROUP BY movie_lang, age_certificate;

SELECT movie_lang, MIN(movie_length), MAX(movie_length) FROM movies
WHERE age_certificate = '15'
GROUP BY movie_lang;

-- having clause (needs to be after group by)
SELECT movie_lang, COUNT(movie_lang) FROM movies
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;

SELECT movie_lang, COUNT(movie_lang) FROM movies
WHERE movie_length > 120
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;

-- challenge
-- how many directors are there per nationality
SELECT COUNT(*) FROM directors
GROUP BY nationality;

SELECT nationality, COUNT(nationality) FROM directors
GROUP BY nationality;

-- what is the sum total movie length for each age certificate and movie lang combination
SELECT movie_lang, age_certificate, SUM(movie_length) FROM movies
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang, age_certificate;

-- return movie lang which have a sum total movie length of over 500mins
SELECT movie_lang, SUM(movie_length) FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;

-- math operators
SELECT 1 + 2 AS addition;
SELECT 5 - 2 AS subtraction;
SELECT 6 * 2 AS multiplication;
SELECT 15 / 2 AS division;
SELECT 15 % 3 AS modulo;

SELECT movie_id, (domestic_takings + international_takings) AS total_takings FROM movie_revenues;
