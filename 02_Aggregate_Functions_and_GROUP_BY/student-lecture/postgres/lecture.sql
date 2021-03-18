-- ORDERING RESULTS

SELECT first_name -- (Last) 6th determine which columns to use
        ,last_name
        ,state
FROM student -- (table) 1st db determines the source - 1,00,000
WHERE class = 'Java'-- 2nd filter the rows -- 500
GROUP BY state -- 3rd perform any grouping -- start with 500 - end with 35 gorupds(rows)
--HAVING clause -- 4th filter the groups-- filter down 30 rows
ORDER BY last_name
        , first_name; -- 5th sort - only operate on 30
        --LIMIT 5

-- Populations of all countries in descending order

SELECT name
        , population -- means I want it in the result
FROM country
ORDER BY population DESC -- I want to sort by population
LIMIT 5;

SELECT name
        , population -- means I want it in the result
FROM country
ORDER BY population ASC -- I want to sort by population
LIMIT 5;

--Names of countries and continents in ascending order

SELECT name
        , continent
FROM country
ORDER BY continent
        , name;

-- LIMITING RESULTS
-- The name and average life expectancy of the countries with the 10 highest life expectancies.

SELECT name
        , lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy DESC
LIMIT 10;


-- CONCATENATING OUTPUTS

-- The name & state of all cities in California, Oregon, or Washington.
-- "city, state", sorted by state then city

SELECT name
        , district AS state
FROM city
WHERE district = 'California'
        OR district = 'Oregon'
        OR district = 'Washington';

--Can also write as

SELECT name
        , district AS state
FROM city
WHERE district IN ('California'
                   , 'Oregon'
                   , 'Washington');

SELECT concat(name, ',' ,district) AS city_state
FROM city
WHERE district IN ('California'
                   , 'Oregon'
                   , 'Washington');

--concatenates 2 strings in Postgres

SELECT name
        ,district
        ,name || ',' || district AS city_state
FROM city
WHERE district IN ('California'
                   , 'Oregon'
                   , 'Washington');

-- AGGREGATE FUNCTIONS

/*
sum 
average
min
max 
count
*/

-- Average Life Expectancy in the World

SELECT COUNT (*)
FROM country;

SELECT COUNT (name) AS country_count
        , COUNT(lifeexpectancy) AS life_expectancy_count
        , AVG(lifeexpectancy) AS average_life
        ,MIN(lifeexpectancy) AS min_life
        , MAX(lifeexpectancy) AS max_life
FROM country;


-- Total population in Ohio

SELECT SUM(population) AS total_population
FROM city
WHERE district = 'Ohio';



-- The surface area of the smallest country in the world

SELECT MIN(surfacearea)
FROM country;


-- The 10 largest countries in the world

SELECT MAX name
        ,(surfacearea)
FROM country
ORDER BY surfacearea DESC
LIMIT 10;


-- The number of countries who declared independence in 1991

SELECT COUNT(indepyear)
FROM country
WHERE indepyear = 1991;

-- GROUP BY
--Total populationof each state in the USA

SELECT district AS state
        , SUM(population) AS total_population
FROM city
WHERE countrycode = 'USA'
GROUP BY district
ORDER BY district;


-- Count the number of countries where each language is spoken, ordered from most countries to least




-- Average life expectancy of each continent ordered from highest to lowest

-- Exclude Antarctica from consideration for average life expectancy

-- Sum of the population of cities in each state in the USA ordered by state name

-- The average population of cities in each state in the USA ordered by state name

-- SUBQUERIES
-- Find the names of cities under a given government leader

SELECT *
FROM city
WHERE countrycode IN (
        'AIA'
        , 'ATG'
        , 'AUS');

--subquery
SELECT *
FROM city
WHERE countrycode IN (
        SELECT code
        FROM country
        WHERE headofstate = 'Elisabeth II'
 );


SELECT code
        , headofstate 
FROM country
WHERE headofstate = 'Elisabeth II';

SELECT c.*
        ,(
        SELECT name
        FROM country 
        WHERE code = c.countrycode -- because there is a dependecny - correlated subquery
        )AS country
FROM city AS c
WHERE countrycode IN (
        SELECT code
        FROM country
        WHERE headofstate = 'Elisabeth II'
 );

-- Find the names of cities whose country they belong to has not declared independence yet

SELECT c.name AS city
        ,(
        SELECT name
        FROM country 
        WHERE code = c.countrycode -- because there is a dependecny - correlated subquery
        )AS country
FROM city AS c
WHERE countrycode IN (
        SELECT code
        FROM country
        WHERE indepyear IS NULL
 );


-- Additional samples
-- You may alias column and table names to be more descriptive

-- Alias can also be used to create shorthand references, such as "c" for city and "co" for country.

-- Ordering allows columns to be displayed in ascending order, or descending order (Look at Arlington)

-- Limiting results allows rows to be returned in 'limited' clusters,where LIMIT says how many, and OFFSET (optional) specifies the number of rows to skip

-- Most database platforms provide string functions that can be useful for working with string data. In addition to string functions, string concatenation is also usually supported, which allows us to build complete sentences if necessary.

-- Aggregate functions provide the ability to COUNT, SUM, and AVG, as well as determine MIN and MAX. Only returns a single row of value(s) unless used with GROUP BY.

-- Counts the number of rows in the city table

-- Also counts the number of rows in the city table

-- Gets the SUM of the population field in the city table, as well as
-- the AVG population, and a COUNT of the total number of rows.

-- Gets the MIN population and the MAX population from the city table.

-- Using a GROUP BY with aggregate functions allows us to summarize information for a specific column. For instance, we are able to determine the MIN and MAX population for each countrycode in the city table.
