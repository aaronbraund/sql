CREATE TABLE characters (
        character_id INTEGER PRIMARY KEY,
        name TEXT,
        origin TEXT,
        creator TEXT);

CREATE TABLE shows (
        show_id INTEGER PRIMARY KEY,
        title TEXT,
        release_year INTEGER,
        genre TEXT);
        
CREATE TABLE character_appearances (
        appearance_id INTEGER PRIMARY KEY,
        character_id INTEGER,
        show_id INTEGER,
        role TEXT);

INSERT INTO characters (character_id, name, origin, creator) VALUES
(1, 'Mickey Mouse', 'Steamboat Willie', 'Walt Disney'),
(2, 'SpongeBob SquarePants', 'SpongeBob SquarePants', 'Stephen Hillenburg'),
(3, 'Bugs Bunny', 'A Wild Hare', 'Tex Avery'),
(4, 'Homer Simpson', 'The Simpsons', 'Matt Groening'),
(5, 'Charlie Brown', 'Peanuts', 'Charles M. Schulz'),
(6, 'Batman', 'Detective Comics #27', 'Bob Kane & Bill Finger');

INSERT INTO shows (show_id, title, release_year, genre) VALUES
(1, 'Steamboat Willie', 1928, 'Animated Short'),
(2, 'SpongeBob SquarePants', 1999, 'Animated Series'),
(3, 'Looney Tunes', 1930, 'Animated Series'),
(4, 'The Simpsons', 1989, 'Animated Sitcom'),
(5, 'Peanuts', 1965, 'Animated Specials'),
(6, 'Batman: The Animated Series', 1992, 'Animated Series');

INSERT INTO character_appearances (appearance_id, character_id, show_id, role) VALUES
(1, 1, 1, 'Main'),
(2, 2, 2, 'Main'),
(3, 3, 3, 'Main'),
(4, 4, 4, 'Main'),
(5, 5, 5, 'Main'),
(6, 6, 6, 'Main');

SELECT 
chars.name, 
show.title
FROM character_appearances as char_app
JOIN characters AS chars
ON char_app.character_id = chars.character_id
JOIN shows AS show
ON char_app.show_id = show.show_id;

SELECT 
characters.name, 
characters.origin, 
characters.creator
FROM characters
JOIN character_appearances AS a
ON characters.character_id = a.character_id
JOIN shows AS b
ON b.show_id = a.show_id
ORDER BY b.release_year ASC
