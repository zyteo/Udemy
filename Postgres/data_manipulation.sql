-- insert into examples table
-- first name, last name, age, dob, email
INSERT INTO examples (first_name, last_name, age, date_of_birth, email)
VALUES ('John', 'Doe', 25, '1980-01-01', 'jdoe@gmail.com');

-- insert 4 more values
INSERT INTO examples (first_name, last_name, age, date_of_birth, email)
VALUES ('Jane', 'Doe', 25, '1980-01-01', 'jane@gmail.com'),
('Joe', 'Doe', 25, '1980-01-01', 'joe@gmail.com'),
('Jill', 'Doe', 25, '1980-01-01', 'jill@gmail.com'),
('Jack', 'Doe', 25, '1980-01-01', 'jack@gmail.com');

-- update data
UPDATE examples
SET email = 'john@gmail.com'
WHERE example_id = 1;

UPDATE examples
SET last_name = 'Doer'
WHERE last_name = 'Doe';

UPDATE examples
SET first_name = 'Bill', age = 27
WHERE example_id = 5;

-- delete data
DELETE FROM examples
WHERE example_id = 1;

-- delete all data
DELETE FROM examples;

-- challenge
-- insert data into owners table
-- first name, last name, city, state, email
INSERT INTO owners (first_name, last_name, city, state, email)
VALUES ('Samuel', 'Smith', 'Boston', 'MA', 'samsmith@gmail.com'),
('Emma', 'Johnson', 'Seattle', 'WA', 'emjohnson@gmail.com'),
('John','Oliver' ,'New York', 'NY', 'johnoliver@gmail.com'),
('Oliva','Brown' ,'San Francisco', 'CA', 'oliviabrown@gmail.com'),
('Simon','Smith' ,'Dallas', 'TX', 'sismith@gmail.com'),
(null,'Maxwell' ,null, 'CA', 'lordmaxwell@gmail.com');

-- insert into pets
INSERT INTO pets (species, full_name, age, owner_id)
VALUES ('dog', 'rex', 6, 1),
('rabbit', 'fluffy', 2, 5),
('cat', 'tom', 8, 2),
('mouse', 'jerry', 2, 2),
('dog', 'biggles', 4, 1),
('tortoise', 'squirtle', 42, 3);

-- update fluffy age to 3
UPDATE pets 
SET age = 3 
WHERE full_name = 'fluffy';

-- delete mr maxwell from owners table
DELETE FROM owners 
WHERE last_name = 'Maxwell';