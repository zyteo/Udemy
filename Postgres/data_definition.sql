-- create the directors table
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    nationality VARCHAR(30)
)

SELECT * FROM directors;

-- create the actors table
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    date_of_birth DATE
)

SELECT * FROM actors;

DROP TABLE tablename;

-- create movies table (with foreign key)
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(50) NOT NULL,
    movie_length INT,
    movie_lang VARCHAR(20),
    release_date DATE,
    age_certificate VARCHAR(5),
    director_id INT REFERENCES directors(director_id)
)

-- create the movie_revenues table (with foreign key)
CREATE TABLE movie_revenues (
    revenue_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    domestic_takings NUMERIC(10,2),
    international_takings NUMERIC(10,2)
)

-- junction table for actors and movies
CREATE TABLE movies_actors (
    movie_id INT REFERENCES movies(movie_id),
    actor_id INT REFERENCES actors(actor_id),
    PRIMARY KEY (movie_id, actor_id)
)

SELECT * FROM movies_actors;

-- modifying tables and adding columns
CREATE TABLE examples(
    example_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
)

ALTER TABLE examples 
ADD COLUMN age INT NOT NULL;

ALTER TABLE examples
ADD COLUMN date_of_birth DATE,
ADD COLUMN email VARCHAR(50) UNIQUE;

SELECT * FROM examples;

-- alter column
ALTER TABLE examples
ALTER COLUMN last_name TYPE VARCHAR(30),
ALTER COLUMN email TYPE VARCHAR(80);

-- deleting table from DB
CREATE TABLE practice(
    practice_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price NUMERIC(10,2)
)

SELECT * FROM practice;

DROP TABLE practice;

-- Challenge
CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    city VARCHAR(30),
    state CHAR(2)
)

CREATE TABLE pets(
    id SERIAL PRIMARY KEY,
    species VARCHAR(30),
    full_name VARCHAR(30),
    age INT,
    owner_id INT REFERENCES owners(id)
)

ALTER TABLE owners
ADD COLUMN email VARCHAR(50) UNIQUE;

ALTER TABLE owners
ALTER COLUMN last_name TYPE VARCHAR(50);