-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
DROP DATABASE regifter;

CREATE DATABASE regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code
DROP DATABASE regifter;
--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- CREATE TABLE gifts;
-- -- id serial primary KEY
-- CREATE TABLE gifts (id SERIAL PRIMARY KEY);
-- -- gift - string
-- CREATE TABLE gifts (gift VARCHAR(5));
-- -- giver - string
-- CREATE TABLE gifts (giver VARCHAR(5));
-- -- value - integer
-- CREATE TABLE gifts (value INTEGER);
-- -- previously_regifted boolean
-- CREATE TABLE gifts previously_regifted (BOOLEAN);
CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift VARCHAR(20), giver VARCHAR(20), value INTEGER, previously_regifted BOOLEAN);



-- 
\echo See details of the table you created
-- 
\d gifts;


-- 
\echo Alter the table so that the column value is changed to price 
-- 
ALTER TABLE gifts RENAME value TO price;

-- 
\echo Insert a peach candle, given by 'Santa' thats price is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
("peach candle", "Santa", 9, TRUE);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE);


-- 
\echo Insert 5 more gifts of your own choosing, include 1 more candle
--
INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('Tulum Musk Candle', 'Mrs. Claus', '21', TRUE),
('Coffee Mug', 'Richie', '4', FALSE),
('Soccer Ball', 'Messi', '10', TRUE),
('Air Jordans', 'Pippen', '23', FALSE),
('LV Bag', 'Pharrell', '51', TRUE);


--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM gifts WHERE price >= 20;


--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT gift FROM gifts WHERE gift ILIKE `%candle%`;


--
\echo Query for every gift whose giver is Santa OR price is greater than 30
--
SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gifts WHERE giver != 'Santa';


--
\echo Update the second gift to have a price of 2999
-- 
UPDATE gifts SET price = 2999 WHERE id = 2;


--
\echo Query for the updated item
--
UPDATE gifts SET price = 2999 WHERE id = 2 RETURNING *;



--
\echo Delete all the gifts from Santa and return the 'price' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'Santa' RETURNING price, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(*) FROM gifts WHERE gift ILIKE '%candle%';

--
\echo Get the AVEREAGE price from all the gifts
--
SELECT AVG(price) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--

--
-- finish
--
DROP TABLE IF EXISTS gifts;