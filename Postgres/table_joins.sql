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

-- joining more than 2 tables
SELECT d.first_name, d.last_name, mo.movie_name, mr.domestic_takings, mr.international_takings FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id;

-- joining thru with a junction table (movies_actors ma)
SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON ma.movie_id = mo.movie_id;

SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON ma.movie_id = mo.movie_id
WHERE mo.movie_lang = 'English';

-- join 5 tables together
SELECT d.first_name, d.last_name, mo.movie_name, ac.first_name, ac.last_name, mr.domestic_takings, mr.international_takings FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movies_actors ma ON mo.movie_id = ma.movie_id
JOIN actors ac ON ma.actor_id = ac.actor_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id;

-- challenge
-- select first and last names of all actors who have starred in movies directed by Wes Anderson
SELECT ac.first_name, ac.last_name FROM actors ac
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON ma.movie_id = mo.movie_id
JOIN directors d ON mo.director_id = d.director_id
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';

-- which director has the highest total domestic takings
SELECT d.first_name, d.last_name, SUM(mr.domestic_takings) FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
GROUP BY d.first_name, d.last_name
ORDER BY SUM(mr.domestic_takings) DESC;

-- remove null and return only 1
SELECT d.first_name, d.last_name, SUM(mr.domestic_takings) AS total_domestic_takings FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IS NOT NULL
GROUP BY d.first_name, d.last_name
ORDER BY SUM(mr.domestic_takings) DESC
LIMIT 1;

-- union
SELECT first_name, last_name FROM directors
UNION
SELECT first_name, last_name FROM actors;

-- union with where and order by
SELECT first_name, last_name, date_of_birth FROM directors
WHERE nationality = 'American'
UNION
SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY first_name;

-- union all
-- union all returns duplicated values whereas union will remove duplicated values
SELECT first_name FROM directors
UNION
SELECT first_name FROM actors
ORDER BY first_name;

SELECT first_name FROM directors
UNION ALL
SELECT first_name FROM actors
ORDER BY first_name;

-- challenge
-- select first name last name and dob from directors and actors. order results by dob
SELECT first_name, last_name, date_of_birth FROM directors
UNION ALL
SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY date_of_birth;

-- select first and last names of all directors and actors born in 1960s. order results by last name
SELECT first_name, last_name FROM directors
WHERE date_of_birth >= '1960-01-01' AND date_of_birth <= '1969-12-31'
UNION
SELECT first_name, last_name FROM actors
WHERE date_of_birth >= '1960-01-01' AND date_of_birth <= '1969-12-31'
ORDER BY last_name;

-- alternative
SELECT first_name, last_name FROM directors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
UNION ALL
SELECT first_name, last_name FROM actors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
ORDER BY last_name;

-- intersect (only return values that are in both tables)
SELECT first_name FROM directors
INTERSECT
SELECT first_name FROM actors
ORDER BY first_name;

SELECT first_name FROM directors
WHERE nationality = 'American'
INTERSECT
SELECT first_name FROM actors
ORDER BY first_name;

-- except (return values that are in first table but not in second table)
SELECT first_name FROM directors
EXCEPT
SELECT first_name FROM actors
ORDER BY first_name;

SELECT first_name FROM directors
WHERE nationality = 'American'
EXCEPT
SELECT first_name FROM actors
ORDER BY first_name;

-- challenge
-- intersect the first name, last name and dob in the directors and actors table
SELECT first_name, last_name, date_of_birth FROM directors
INTERSECT
SELECT first_name, last_name, date_of_birth FROM actors;

-- retrieve first name of male actors unless they have same first name of any british directors
SELECT first_name FROM actors
WHERE gender = 'M'
EXCEPT
SELECT first_name FROM directors
WHERE nationality = 'British'
ORDER BY first_name;