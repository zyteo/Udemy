-- joins
-- inner, left, right, full joins
-- inner join only returns rows of data with matching values in both tables
-- left join only returns all rows of data in left table and matching rows of data in right table
-- for right join, returns all data rows in right table, and matching rows of data in left table
-- full join returns all rows of data in both tables

-- inner join
SELECT * FROM directors;
SELECT * FROM movies;

-- insert a new director
INSERT INTO directors (first_name, last_name, date_of_birth, nationality)
VALUES ('Christopher','Nolan','1970-07-30','British');


SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name 
FROM directors
-- inner join DB on define primary key (directors.director_id) & foreign key (movies.director_id)
INNER JOIN movies ON directors.director_id = movies.director_id;

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name 
FROM directors
INNER JOIN movies ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name 
FROM directors
INNER JOIN movies ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'
ORDER BY movies.movie_length;

-- shorter version
-- can specify table name to a shorter name, use join instead of inner join
-- by default, join = inner join

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang = 'Japanese'
ORDER BY mo.movie_length;

-- with movie and movie revenue
SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
ORDER BY mr.domestic_takings;

-- with JOIN xx USING instead of JOIN xx ON
-- only for cases where pri and foreign key have the same name
SELECT mo.movie_name, mr.domestic_takings FROM movies mo
JOIN movie_revenues mr USING (movie_id)
WHERE mo.age_certificate IN ('12','15','18')
ORDER BY mr.domestic_takings DESC;

-- challenge
-- select directors first and last names, movie names and release dates for all chinese, korean and japanese movies
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name, mo.release_date FROM directors d
JOIN movies mo USING (director_id)
WHERE mo.movie_lang IN ('Japanese','Chinese','Korean')

-- select movie names, release dates and international takings of all english lang movies
SELECT mo.movie_name, mo.release_date, mr.international_takings FROM movies mo 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mo.movie_lang IN ('English')

-- select movie names, domestic takings, international takings for all movies with either missing domestic takings or missing international takings and order the results by movie names
SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IN (null) OR mr.international_takings IN (null)
ORDER BY mo.movie_name;

-- can't use IN (null) for IN ('')
SELECT mo.movie_name, mr.domestic_takings, mr.international_takings FROM movies mo 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IS null OR mr.international_takings IS null
ORDER BY mo.movie_name;

-- left joins
-- christopher nolan appears but with no movie
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id;

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM movies mo
LEFT JOIN directors d ON d.director_id = mo.director_id;

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE d.nationality = 'British';

-- right joins
-- just the opposite of left joins
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM movies mo
RIGHT JOIN directors d ON d.director_id = mo.director_id;

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM movies mo
RIGHT JOIN directors d ON d.director_id = mo.director_id
WHERE mo.age_certificate = '18';

-- full joins
-- table order doesnt matter, since all data is returned anyway
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id;

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang IN ('German','Korean')
ORDER BY d.last_name;

-- challenge
-- use left join to select first and last name of all british directors and name and age certificates of all the movies they directed
SELECT d.first_name, d.last_name, mo.movie_name, mo.age_certificate FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
WHERE d.nationality = 'British';

-- count the number of movies that each director has directed
SELECT d.first_name, d.last_name, COUNT(mo.movie_name) FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id;

-- count must use group by
SELECT d.first_name, d.last_name, COUNT(mo.movie_id) FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
GROUP BY d.first_name, d.last_name;
-- this works too, edited from original answer
SELECT d.first_name, d.last_name, COUNT(mo.movie_name) FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id
GROUP BY d.first_name, d.last_name;