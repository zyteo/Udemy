-- one to one
-- primary key only appears once in foreign key column
-- relationship between movie table and movie revenues table

-- one to many
-- primary key value appear multiple times in foreign key table
-- relationship between movie table and director table, each director can direct multiple movies
-- but each movie can only have one director

-- many to many
-- relationship between books and authors
-- each book can have multiple authors and each author can have multiple books
-- can't just use pri and foreign key, need to use a third junction table to link the 2 tables

-- challenge
-- 1. one to many relationship, because the owner_id key is repeated multiple times as the foreign key in the pets table

-- 2. There can be multiple owners living in the same address, so it is a one-to-many relationship.

-- 3. songs, playlists, users
-- playlists and users is one to many, because each user can have multiple playlists
-- songs and playlists is one to many? each playlist can only have one song, but there can be another playlist with the same song.
-- songs and users is many to many relationship, because each user can have multiple playlist, and each playlist can have the same song.

-- playlists and songs is many to many, each playlist can have multiple songs and each song can be in multiple playlists.
