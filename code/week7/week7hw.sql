USE v_art;

-- Q1 The manager wants to add George Washington as an artist in the database.
--    He was born in 1732, died in 1798, and is from the United States. 
--    He is a local artist. 
--    Write an insert statement to add a new artist to the system. 
--    (HINT: assign this artist a primary key that is next in sequence for the Artist table)


-- 2. The manager wants to list all the artists sorted by the last name of the artist. 
--    Write the query that would allow the 7 columns of values (all but the primary key) 
--    to show up alphabetically by the last name.


-- 3. The manager wants to edit Washington's information. 
--    She finds out that he died in 1799 not 1798. 
--    The manager changes the 'Date of Death' (dod) value to be 1799 and clicks 'Apply'. 
--    Write the SQL statement that will run in the background to accomplish this edit. 


-- 4. The manager decides that she wants to delete Washington as an artist 
--    from her database because she realized that he wasn't an artist at all. 
--    Write the SQL statement that will run in the code that would delete 
--    George Washington from the database. (HINT: Don't forget a WHERE clause!)


USE bike;

-- 5. There is a product demonstration and bike race planned in Anaheim, California
--    and you'd like to text each of your customers from that city to see if they will participate. 
--    You need a list of their first and last names and phone numbers.


-- 6. You need to sell more of your high-end bikes. 
--    You want to take $100 off all bikes that have a list price of $7,000.00 or more. 
--    You need to have a list showing the bike name, list price and discount price
--    with an alias of 'Discount Price'. 
--    Order the list, showing the most expensive bike first.


-- 7. An important announcement was given to all the staff but those at your store (store_id 3). 
--    The same announcement needs to get to all your staff. 
--    You need a list of all the staff and their phone who are from your store.


-- 8. A customer needs more information about a specific bike, 
--    but all they know is that is has the word 'Crockett' in the name. 
--    You need to list the name, model year, and list price 
--    of all the bikes with the word 'Crockett' somewhere in the name. 


-- 9. You need to list all bikes names 
--    that have a range of prices from $100 to $250 sorted with the lowest price first.


-- 10. Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
--     have a phone number listed
--     AND whose city has the letters 'ton' or 'field' somewhere in their name of the city
--     OR whose last name is Mccall (HINT: because of the OR, someone with last name Mccall 
--     does not have to have a phone number or live in an 'ton'/'field' city). 
--     Limit the result set to the first 5 results.

