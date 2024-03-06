-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean
CREATE TABLE 
gifts
( id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value integer, previously_regifted BOOLEAN);

-- 
\echo See details of the table you created
-- 
 Table "public.gifts"
       Column        |  Type   | Collation | Nullable |              Default
---------------------+---------+-----------+----------+-----------------------------------
 id                  | integer |           | not null | nextval('gifts_id_seq'::regclass)
 gift                | text    |           |          |
 giver               | text    |           |          |
 price               | integer |           |          |
 previously_regifted | boolean |           |          |
Indexes:
    "gifts_pkey" PRIMARY KEY, btree (id)

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
regifter=# INSERT INTO
regifter-# gifts ( gift, giver, value, previously_regifted )
regifter-# VALUES
regifter-# ( 'peach candle', 'santa', 9, true );
INSERT 0 1

--
\echo Query for all the columns in your gifts table
-- 
regifter=# SELECT * FROM gifts;

 id |     gift     | giver | value | previously_regifted
----+--------------+-------+-------+---------------------
  1 | peach candle | santa |     9 | t
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('pumpkin spice candle', 'james', 56, FALSE ),
('snow globe', 'jack', 24, TRUE ),
('freight train', 'thomas', 11, FALSE),
('teddy bear', 'Mom', 23, FALSE ),
('kitty cat', 'teacher', 80, FALSE );

--
\echo Query for gifts with a price greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE price >= 20;

 id |         gift         |      giver       | price | previously_regifted
----+----------------------+------------------+-------+---------------------
  4 | soap on a rope       | Rudolf           |    29 | f
  5 | potpurri             | Elf on the Shelf |    39 | t
  6 | mango candle         | The Boss         |    49 | f
  7 | pumpkin spice candle | james            |    56 | f
  8 | snow globe           | jack             |    24 | t
 10 | teddy bear           | Mom              |    23 | f
 11 | kitty cat            | teacher          |    80 | f
(7 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column


regifter=# SELECT gift FROM gifts WHERE gift ILIKE '%candle%';

         gift
----------------------
 peach candle
 peach candle
 cinnamon candle
 mango candle
 pumpkin spice candle
(5 rows)
--

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
regifter=# SELECT gift FROM gifts WHERE giver = 'santa' OR price > 30;
         gift
----------------------
 peach candle
 potpurri
 mango candle
 pumpkin spice candle
 kitty cat
(5 rows)

--
\echo Query for every gift whose giver is NOT Santa
--

regifter=# SELECT * FROM gifts WHERE giver != 'santa' AND giver != 'Santa';

 id |         gift         |      giver       | price | previously_regifted
----+----------------------+------------------+-------+---------------------
  3 | cinnamon candle      | Nick             |    19 | t
  4 | soap on a rope       | Rudolf           |    29 | f
  5 | potpurri             | Elf on the Shelf |    39 | t
  6 | mango candle         | The Boss         |    49 | f
  7 | pumpkin spice candle | james            |    56 | f
  8 | snow globe           | jack             |    24 | t
  9 | freight train        | thomas           |    11 | f
 10 | teddy bear           | Mom              |    23 | f
 11 | kitty cat            | teacher          |    80 | f
(9 rows)
--
\echo Update the second gift to have a value of 2999
-- 
regifter=# UPDATE gifts SET price=2999 WHERE id=2 RETURNING *;

 id |     gift     | giver | price | previously_regifted
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t
(1 row)

--
\echo Query for the updated item
--

regifter=# UPDATE gifts SET price=2999 WHERE id=2 RETURNING *;

 id |     gift     | giver | price | previously_regifted
----+--------------+-------+-------+---------------------
  2 | peach candle | Santa |  2999 | t
(1 row)

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

UPDATE 1
regifter=# DELETE FROM gifts WHERE giver='santa' OR giver='Santa' RETURNING price, gift;

 price |     gift
-------+--------------
     9 | peach candle
  2999 | peach candle
(2 rows)

DELETE 2
--
\echo Query for all the columns in your gifts table one more time
--

regifter=# SELECT * FROM gifts;

 id |         gift         |      giver       | price | previously_regifted
----+----------------------+------------------+-------+---------------------
  3 | cinnamon candle      | Nick             |    19 | t
  4 | soap on a rope       | Rudolf           |    29 | f
  5 | potpurri             | Elf on the Shelf |    39 | t
  6 | mango candle         | The Boss         |    49 | f
  7 | pumpkin spice candle | james            |    56 | f
  8 | snow globe           | jack             |    24 | t
  9 | freight train        | thomas           |    11 | f
 10 | teddy bear           | Mom              |    23 | f
 11 | kitty cat            | teacher          |    80 | f
(9 rows)

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
regifter=# SELECT COUNT(gift) FROM gifts WHERE gift ILIKE '%CANDLE%';
 count
-------
     3
(1 row)

--
\echo Get the AVEREAGE value from all the gifts
--
regifter=# SELECT AVG(price) FROM gifts;
         avg
---------------------
 36.6666666666666667
(1 row)

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

SELECT gift FROM gifts ORDER BY price desc LIMIT 3 OFFSET 2;
      gift
----------------
 mango candle
 potpurri
 soap on a rope
(3 rows)

--
-- finish
--
DROP TABLE IF EXISTS gifts;


