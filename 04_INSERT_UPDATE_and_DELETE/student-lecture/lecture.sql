
SELECT *
FROM countrylanguage;


INSERT INTO <table>(<available columns>) --Basic Syntax for INSERT statements
VALUES (<values>)



-- INSERT

-- 1. Add Klingon as a spoken language in the USA
-- 2. Add Klingon as a spoken language in Great Britain

INSERT INTO countrylanguage
(
        countrycode
        , language
        , isofficial
        , percentage
)
VALUES
(
        'USA'
        , 'Klingon'
        , false
        , 0.001
);

SELECT *
FROM countrylanguage
WHERE countrycode = 'USA';


INSERT INTO countrylanguage
(
        countrycode
        , language
        , isofficial
        , percentage
)
VALUES
(
        'GBR'
        , 'Klingon'
        , false
        , 0.2
);

SELECT *
FROM countrylanguage
WHERE countrycode = 'GBR';


/*INSERT INTO countrylanguage
(
        countrycode
        , language
        , isofficial
        , percentage
)
VALUES
(
        'GBR'
        , 'Klingon'
        , false
        , 0.2
);

SELECT *
FROM countrylanguage
WHERE countrycode = 'GBR';*/

-- UPDATE

--Syntax
/*

UPDATE <table name>
SET <column> = value
        , <column> = value
WHERE <condition> -- ALWAYS HAVE A WHERE CLAUSE

*/

-- 1. Update the capital of the USA to Houston
-- 2. Update the capital of the USA to Washington DC and the head of state

SELECT * 
FROM country
WHERE code = 'USA'; -- 3813 --current capitol --Washington

SELECT * 
FROM city
WHERE name = 'Houston'; -- 3796

--Change capital to Houston
UPDATE country
SET capital = 3796
WHERE code = 'USA';

--Change capital to Wahsington and headofstate to Joe Biden
UPDATE country
SET capital = 3813
        , headofstate = 'Joe Biden'
WHERE code = 'USA';


-- DELETE

-- 1. Delete English as a spoken language in the USA
-- 2. Delete all occurrences of the Klingon language 

DELETE FROM countrylanguage
WHERE countrycode = 'USA'
        AND language = 'English';



DELETE FROM countrylanguage
WHERE countrycode = 'USA'
        AND language = 'Klingon';

-- REFERENTIAL INTEGRITY

-- 1. Try just adding Elvish to the country language table.

-- 2. Try inserting English as a spoken language in the country ZZZ. What happens?

-- 3. Try deleting the country USA. What happens?


-- CONSTRAINTS

-- 1. Try inserting English as a spoken language in the USA

-- 2. Try again. What happens?

-- 3. Let's relocate the USA to the continent - 'Outer Space'


-- How to view all of the constraints

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS


-- TRANSACTIONS

-- 1. Try deleting all of the rows from the country language table and roll it back.

-- 2. Try updating all of the cities to be in the USA and roll it back

-- 3. Demonstrate two different SQL connections trying to access the same table where one happens to be inside of a transaction but hasn't committed yet.