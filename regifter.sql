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
CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift TEXT, giver TEXT, value DECIMAL(10,2), regifted BOOLEAN);
CREATE TABLE
-- 
\echo See details of the table you created
-- 
\d gifts

regifter=# \d gifts
                                Table "public.gifts"
  Column  |     Type      | Collation | Nullable |              Default
----------+---------------+-----------+----------+-----------------------------------
 id       | integer       |           | not null | nextval('gifts_id_seq'::regclass)
 gift     | text          |           |          |
 giver    | text          |           |          |
 value    | numeric(10,2) |           |          |
 regifted | boolean       |           |          |
Indexes:
    "gifts_pkey" PRIMARY KEY, btree (id)

-- 
\echo Alter the table so that the column price is changed to value 
-- 
-- The column is already called value, but I'll change it to price then back to value
regifter=# ALTER TABLE gifts RENAME COLUMN value TO price
regifter-# ;
ALTER TABLE
regifter=# \d gifts
                                Table "public.gifts"
  Column  |     Type      | Collation | Nullable |              Default
----------+---------------+-----------+----------+-----------------------------------
 id       | integer       |           | not null | nextval('gifts_id_seq'::regclass)
 gift     | text          |           |          |
 giver    | text          |           |          |
 price    | numeric(10,2) |           |          |
 regifted | boolean       |           |          |
Indexes:
    "gifts_pkey" PRIMARY KEY, btree (id)
-- Altering back to value:
regifter=# ALTER TABLE gifts RENAME COLUMN price TO value;
ALTER TABLE
-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
regifter=# INSERT INTO gifts (gift, giver, value, regifted) VALUES ('peach candle', 'Santa', 9, true);
INSERT 0 1

--
\echo Query for all the columns in your gifts table
-- 
regifter=# SELECT * FROM gifts;
 id |     gift     | giver | value | regifted
----+--------------+-------+-------+----------
  1 | peach candle | Santa |  9.00 | t
(1 row)

--
\echo Uncomment below to insert 5 more gifts
-- 

-- INSERT INTO gifts (gift, giver, value, previously_regifted)
-- VALUES
-- ('peach candle', 'Santa', '9', TRUE),
-- ('cinnamon candle', 'Nick', '19', TRUE),
-- ('soap on a rope', 'Rudolf', '29', FALSE),
-- ('potpurri', 'Elf on the Shelf', '39', TRUE),
-- ('mango candle', 'The Boss', '49', FALSE)
-- ;

regifter=# ALTER TABLE gifts RENAME COLUMN regifted TO previously_regifted
regifter-# ;
ALTER TABLE
regifter=# INSERT INTO gifts (gift, giver, value, previously_regifted)
regifter-# VALUES
regifter-# ('peach candle', 'Santa', '9', TRUE),
regifter-# ('cinnamon candle', 'Nick', '19', TRUE),
regifter-# ('soap on a rope', 'Rudolf', '29', FALSE),
regifter-# ('potpurri', 'Elf on the Shelf', '39', TRUE),
regifter-# ('mango candle', 'The Boss', '49', FALSE)
regifter-# ;
INSERT 0 5

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
regifter=# INSERT INTO gifts (gift, giver, value, previously_regifted)
regifter-# VALUES ('chocolate box', 'Alice', 15, false),
regifter-# ('socks', 'Bob', 10, true),
regifter-# ('coffee mug', 'Carol', 8, false),
regifter-# ('book', 'David', 25, true),
regifter-# ('lavender candle', 'Eve', 12, false);
INSERT 0 5


--
\echo Query for gifts with a price greater than or equal to 20
--
regifter=# SELECT * FROM gifts WHERE value >= 20;
 id |      gift      |      giver       | value | previously_regifted
----+----------------+------------------+-------+---------------------
  4 | soap on a rope | Rudolf           | 29.00 | f
  5 | potpurri       | Elf on the Shelf | 39.00 | t
  6 | mango candle   | The Boss         | 49.00 | f
 10 | book           | David            | 25.00 | t
(4 rows)

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
regifter=# SELECT gift FROM gifts WHERE gift LIKE '%candle%';
      gift
-----------------
 peach candle
 peach candle
 cinnamon candle
 mango candle
 lavender candle
(5 rows)

regifter=# SELECT gift FROM gifts WHERE gift ILIKE '%candle%';
      gift
-----------------
 peach candle
 peach candle
 cinnamon candle
 mango candle
 lavender candle
(5 rows)

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--


--
\echo Query for every gift whose giver is NOT Santa
--


--
\echo Update the second gift to have a value of 2999
-- 


--
\echo Query for the updated item
--


--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--


--
\echo Query for all the columns in your gifts table one more time
--



-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 


--
\echo Get the AVEREAGE value from all the gifts
--


-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;

