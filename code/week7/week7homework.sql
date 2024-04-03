USE v_art;


-- Q1 The manager wants to add George Washington as an artist in the database.
--    He was born in 1732, died in 1798, and is from the United States. 
--    He is a local artist. 
--    Write an insert statement to add a new artist to the system. 
--    (HINT: assign this artist a primary key that is next in sequence for the Artist table)
INSERT INTO artist
( artist_id
, fname
, mname
, lname
, dob
, dod
, country
, local)
VALUES
( 9
, 'George'
, NULL
, 'Washington'
, 1732
, 1798
, 'United States'
, 'y');


-- 2. The manager wants to list all the artists sorted by the last name of the artist. 
--    Write the query that would allow the 7 columns of values (all but the primary key) 
--    to show up alphabetically by the last name.
SELECT fname, mname, lname, dob, dod, country, local
FROM artist
ORDER BY lname;


-- 3. The manager wants to edit Washington's information. 
--    She finds out that he died in 1799 not 1798. 
--    The manager changes the 'Date of Death' (dod) value to be 1799 and clicks 'Apply'. 
--    Write the SQL statement that will run in the background to accomplish this edit. 
UPDATE artist
SET dod = 1799
WHERE artist_id = 9;


-- 4. The manager decides that she wants to delete Washington as an artist 
--    from her database because she realized that he wasn't an artist at all. 
--    Write the SQL statement that will run in the code that would delete 
--    George Washington from the database. (HINT: Don't forget a WHERE clause!)
DELETE FROM artist
WHERE artist_id = 9;


USE bike;


-- 5. There is a product demonstration and bike race planned in Anaheim, California
--    and you'd like to text each of your customers from that city to see if they will participate. 
--    You need a list of their first and last names and phone numbers.
SELECT first_name, last_name, phone
FROM customer
WHERE city = 'Anaheim';


-- 6. You need to sell more of your high-end bikes. 
--    You want to take $100 off all bikes that have a list price of $7,000.00 or more. 
--    You need to have a list showing the bike name, list price and discount price
--    with an alias of 'Discount Price'. 
--    Order the list, showing the most expensive bike first.
SELECT product_name, list_price, list_price - 100 AS 'Discount Price'
FROM product
WHERE list_price > 7000.00
ORDER BY list_price DESC;


-- 7. An important announcement was given to all the staff but those at your store (store_id 3). 
--    The same announcement needs to get to all the your staff. 
--    You need a list of all the staff and their phone who are from your store.
SELECT first_name, last_name, phone
FROM staff
WHERE store_id = 3;


-- 8. A customer needs more information about a specific bike, 
--    but all they know is that is has the word 'Crockett' in the name. 
--    You need to list the name, model year, and list price 
--    of all the bikes with the word 'Crockett' somewhere in the name. 
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE '%Crockett%';


-- 9. You need to list all bikes names 
--    that have a range of prices from $100 to $250 sorted with the lowest price first.
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 100 AND 250
ORDER BY list_price ASC;


-- 10. Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
--     have a phone number listed
--     AND whose city has the letters 'ton' or 'field' somewhere in their name of the city
--     OR whose last name is Mccall (HINT: because of the OR, someone with last name Mccall 
--     does not have to have a phone number or live in an 'ton'/'field' city). 
--     Limit the result set to the first 5 results.
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL
AND city LIKE '%ton%' OR city LIKE '%field%'
OR last_name LIKE 'Mccall'
LIMIT 5;

