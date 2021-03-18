-- Write queries to return the following:
-- The following changes are applied to the "dvdstore" database.**

-- 1. Add actors, Hampton Avenue, and Lisa Byway to the actor table.

SELECT *
FROM actor;

INSERT INTO actor
(
        
        first_name
        , last_name
)
VALUES  ('HAMPTON', 'AVENUE')
        ,('LISA', 'BYWAY');



-- 2. Add "Euclidean PI", "The epic story of Euclid as a pizza delivery boy in
-- ancient Greece", to the film table. The movie was released in 2008 in English.
-- Since its an epic, the run length is 3hrs and 18mins. There are no special
-- features, the film speaks for itself, and doesn't need any gimmicks.

SELECT *
FROM film
ORDER BY title;


BEGIN TRANSACTION;

INSERT INTO film
(
        title
         , description
         , release_year
         , language_id
         , length
)
VALUES ('EUCLIDEAN PI'
        , 'The epic story of Euclid as a pizza delivery boy in ancient Greece' 
        , 2008
        , 1
        , 198);
        
UPDATE film
SET title = 'EUCLIDEAN PI'
WHERE film_id = 1001;

DELETE FROM film
WHERE film_id = 1002;

ROLLBACK TRANSACTION;

-- 3. Hampton Avenue plays Euclid, while Lisa Byway plays his slightly
-- overprotective mother, in the film, "Euclidean PI". Add them to the film.
-- actor_id 201, 202

BEGIN TRANSACTION;

SELECT * 
FROM film_actor
WHERE film_id = 1001;

INSERT INTO film_actor
(
        film_id
        , actor_id
)

VALUES (1001, 201)
        , (1001, 202);


ROLLBACK TRANSACTION;






-- 4. Add Mathmagical to the category table.

BEGIN TRANSACTION

SELECT *
FROM category;

INSERT INTO category
(
        name
)
VALUES
(
        'Mathmagical' --category_id 17

);



ROLLBACK TRANSACTION




-- 5. Assign the Mathmagical category to the following films, "Euclidean PI",
-- "EGG IGBY", "KARATE MOON", "RANDOM GO", and "YOUNG LANGUAGE"
BEGIN TRANSACTION

SELECT *
FROM film
WHERE  -- 1001, 274, 494, 714, 996

INSERT INTO film_category
(
        film_id
        , category_id
)
VALUES (1001, 17)
        , (274, 17)
        , (494, 17)
        , (714, 17)
        , (996, 17);

SELECT * 
FROM film_category
WHERE category_id =17;


ROLLBACK TRANSACTION


-- 6. Mathmagical films always have a "G" rating, adjust all Mathmagical films
-- accordingly.
-- (5 rows affected)
BEGIN TRANSACTION

UPDATE film
SET rating = 'G'
WHERE film_id IN
        (1001, 274, 494, 714, 996);


SELECT rating
FROM film
WHERE film_id =  494 ;




ROLLBACK TRANSACTION







-- 7. Add a copy of "Euclidean PI" to all the stores.
BEGIN TRANSACTION;

SELECT store_id
        , film_id
FROM inventory
WHERE film_id = 1001;


INSERT INTO inventory 
(       
        film_id
        , store_id
)
VALUES
        (1001 , 1)
        ,(1001 , 2);

ROLLBACK TRANSACTION;



-- 8. The Feds have stepped in and have impounded all copies of the pirated film,
-- "Euclidean PI". The film has been seized from all stores, and needs to be
-- deleted from the film table. Delete "Euclidean PI" from the film table.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE> (DID NOT SUCCEED) Foreign key constraint and referential constraint
BEGIN TRANSACTION;


DELETE FROM film
WHERE film_id = 1001;



ROLLBACK TRANSACTION;



-- 9. Delete Mathmagical from the category table.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE> (DID NOT SUCCEED)Foreign key constraint along with referential due to being referenced in another table (film_category table).

DELETE FROM category
WHERE category_id = 17;



-- 10. Delete all links to Mathmagical in the film_category tale.
-- (Did it succeed? Why?)
-- <YOUR ANSWER HERE> (DID SUCCEED) Using PK, FK2 from film_category allowed deletion of links to Mathmagical.
BEGIN TRANSACTION; 
 
SELECT film_id
FROM film_category
WHERE category_id = 17;

DELETE FROM film_category --will work
WHERE film_id IN (1001, 274, 494, 714, 996);

DELETE FROM film_category--will not work
WHERE category_id = 17;


ROLLBACK TRANSACTION;
-- 11. Retry deleting Mathmagical from the category table, followed by retrying
-- to delete "Euclidean PI".
-- (Did either deletes succeed? Why?)
-- <YOUR ANSWER HERE> Transaction done in number 10 allowed deletion of Euclidean PI.



-- 12. Check database metadata to determine all constraints of the film id, and
-- describe any remaining adjustments needed before the film "Euclidean PI" can
-- be removed from the film table.

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS