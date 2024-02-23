--Counting number of brands by country
SELECT COUNT(Brand), Country 
FROM ramen_ratngs_table 
GROUP BY Country 
ORDER BY `COUNT(Brand)` DESC

--A query using AND and comparison operators
SELECT Brand, Variety, Country, Stars
FROM ramen_ratngs_table
WHERE Stars >= 4.00 AND Country='Thailand'

-- Averaging country star ratings and showing countries with average rating over 4 stars
SELECT Country, AVG(Stars) AS star_rating
FROM ramen_ratngs_table
GROUP BY Country
HAVING AVG(Stars) > 4.00

-- Experiments with LIKE, BETWEEN and IN queries

SELECT Review_Num, Brand, Variety, Style
FROM ramen_ratngs_table
WHERE Style IN ('Cup', 'Pack','Bowl')

SELECT Review_Num, Brand, Variety, Style, Country
FROM ramen_ratngs_table
WHERE Country IN ('Japan','South Korea','China')
ORDER BY Country ASC

SELECT Stars, Brand, Variety, Style, Country 
FROM ramen_ratngs_table 
WHERE Stars BETWEEN 2.0 AND 4.0 
ORDER BY Stars ASC

SELECT Stars, Brand, Variety, Style, Country
FROM ramen_ratngs_table
WHERE Country IN ('Japan','South Korea','China') AND Stars BETWEEN 3.0 AND 5.0;

SELECT Stars, Brand, Variety, Style, Country
FROM ramen_ratngs_table
WHERE Variety LIKE '%Chicken%' AND Stars BETWEEN 3.5 AND 5.0

-- Using NOT operator to only show results that are not less or equal to 3.00 stars
SELECT * FROM ramen_ratngs_table
WHERE NOT Stars <= 3.00

-- Experimenting with AND / OR boolean
SELECT * FROM `ramen_ratngs_table`
WHERE Stars > 4.00
AND Country='Japan'
AND Style='Cup' OR Style='Packet'

--Experimenting with LIKE query

SELECT Brand, Variety, Stars
FROM ramen_ratngs_table
WHERE Variety LIKE '%Chicken%'

SELECT Brand, Variety, Stars
FROM ramen_ratngs_table
WHERE Brand LIKE 'N%'

SELECT Brand, Variety, Stars
FROM ramen_ratngs_table
WHERE Brand LIKE '__i%'

SELECT Brand, Country, Variety, Stars
FROM ramen_ratngs_table
WHERE Country LIKE '%japan%'

SELECT Brand, Country, Variety, Stars
FROM ramen_ratngs_table
WHERE Variety LIKE 'S%e'

-- A query that finds counts the largest single brand of ramen and the average star rating using functions
SELECT Brand, COUNT(Brand) AS brand_count, AVG(Stars) AS average_stars
FROM ramen_ratngs_table
GROUP BY Brand 
ORDER BY brand_count DESC

-- Experimenting with WHERE and comparison operators
SELECT * FROM ramen_ratngs_table
WHERE Stars > 4.00
ORDER BY Brand

-- A query to find the top 5 highest-rated ramen from Japan.
SELECT Brand, Variety, Country, Stars
FROM ramen_ratngs_table
WHERE Country='Japan'
ORDER BY Stars DESC
LIMIT 5
