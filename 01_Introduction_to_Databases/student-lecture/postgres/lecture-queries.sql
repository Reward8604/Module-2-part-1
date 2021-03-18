-- SELECT ... FROM
-- Selecting the names for all countries

SELECT * -- * means all columns
FROM country;

SELECT name
FROM country;


-- Selecting the name and population of all countries

SELECT name
        ,population
FROM country;

-- Selecting all columns from the city table

SELECT *
FROM city;

/*
SELECT -- what columns to include
FROM -- what table is the source
WHERE -- filter (like an if statment in java) -- what rows to include
*/

-- SELECT ... FROM ... WHERE
-- Selecting the cities in Ohio

SELECT *
FROM city
WHERE district = 'Ohio';

-- Selecting countries that gained independence in the year 1776

SELECT * --columns
FROM country --table
WHERE indepyear = '1776';


-- Selecting countries not in Asia

SELECT *
FROM country
WHERE continent != 'Asia'

SELECT *
FROM country
WHERE NOT (continent = 'Asia');

-- Selecting countries that do not have an independence year

SELECT name
        ,indepyear
FROM country
WHERE indepyear = null; -- null can never = null


SELECT name
        ,indepyear
FROM country
WHERE indepyear IS NULL; -- IS NULL determines that there is no value

-- Selecting countries that do have an independence year

SELECT name
        ,indepyear
FROM country
WHERE indepyear IS NOT NULL;

-- Selecting countries that have a population greater than 5 million

SELECT name
        ,population
FROM country
WHERE population > 5000000;


-- SELECT ... FROM ... WHERE ... AND/OR
-- Selecting cities in Ohio and Population greater than 400,000

SELECT *
FROM city
WHERE district = 'Ohio'
AND population > 400000;


SELECT *
FROM city
WHERE (district = 'Ohio' or district = 'Utah') -- use parenthesis to group together
AND population > 400000;

-- Selecting country names on the continent North America or South America

SELECT name
        ,continent
FROM country
WHERE continent = 'North America'
OR continent = 'South America';

-- string can be compared using like

SELECT name
        ,continent
FROM country
WHERE continent LIKE 'North%'; -- Starts with

SELECT name
        ,continent
FROM country
WHERE continent LIKE '%America'; -- ends with

SELECT name
        ,continent
FROM country
WHERE continent ILIKE '%america'; -- ends with and is case insensitive



-- SELECTING DATA w/arithmetic
-- Selecting the population, life expectancy, and population per area
--	note the use of the 'as' keyword

SELECT name
        ,population
        ,lifeexpectancy AS life_expectancy
        , population / surfacearea AS population_density -- do math inline
FROM country;

