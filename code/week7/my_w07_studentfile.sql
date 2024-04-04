-- *********************************
-- W07 STUDENT SQL WORKBOOK
-- *********************************

/*
     SELECT   column_name AS 'Alias1'
     ,        column_name_2 AS 'Alias2'
     FROM     table_name
     WHERE    column_name = condition
     ORDER BY column_name (DESC)
     LIMIT    # of rows;
*/

USE world;
-- For questions 2 through 5, limit the records returned to 5.
-- 1. SELECT all columns from the country table
SELECT *
FROM country
LIMIT 5;

-- 2. SELECT the name, population, and continent from the country table
SELECT name, population, continent
FROM country
LIMIT 5;

-- 3. Filter the previous query by populations bigger than 800,000 (>)
SELECT name, population, continent
FROM country
WHERE population > 800000
LIMIT 5;

-- 4. Switch the filter to only show countries from the Americas (OR/IN)
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
LIMIT 5;

-- 5. ORDER BY the population from greatest to least (DESC)
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
ORDER BY population DESC
LIMIT 5;

-- 6. Switch the ORDER BY to use continent, then name
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
ORDER BY name DESC;
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
ORDER BY continent DESC;

-- 7. What is DESC doing? What do we do to show the results in alphabetical order?
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
ORDER BY name ASC;

-- 8. Do the same queries as above without DESC. What do we find as the smallest
--    country in the Americas?
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
ORDER BY name ASC ;

-- 9. Filter the query by population between 400,000 and 500,000
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
AND population BETWEEN 400000 AND 500000
ORDER BY name ASC;

-- 10. ORDER BY population
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
AND population BETWEEN 400000 AND 500000
ORDER BY population ASC;
-- *******************************
-- LIKE Operator (WHERE clause)
-- *******************************

-- 11. Select all city names that begin with 'Las'
SELECT name, population, continent
FROM country
WHERE continent IN ('North America', 'South America')
AND name LIKE 'Las%';
-- 12. Add the CountryCode to tell which country those cities reside in
SELECT name, code, population, continent
FROM world.country
WHERE continent IN ('North America', 'South America')
AND name LIKE '%gre';
-- 13. SELECT all city names that end in 'gre'
-- 14. SELECT all city names with 'end' somewhere in them

-- *******************************
-- IS NULL/IS NOT NULL Operators
-- *******************************

-- 15. SELECT all country names, lifeExpectancy, and continent
--     WHERE LifeExpectancy IS NULL
-- 16. Modify the previous query to use: IS NOT NULL
-- 17. ORDER the previous query by LifeExpectancy
-- 18. Modify the previous query to find the country with the highest
--     LifeExpectancy
-- 19. What is the LifeExpectancy of the United States?
-- 20. Modify the previous query to find the LifeExpectancy of Germany and the US.
--     If we remove the ORDER BY statement, does it affect the query?

-- *******************************
-- Calculations in SELECT clause
-- *******************************

USE bike;

-- Show me the products, model years, and list price and add $100 to each without editing the database 
SELECT product_name, model_year, list_price, list_price + 100
FROM product;

-- Show me products, model years, and list price and list the column as "price_adjustment"
-- and show me only the prices over $1000
-- Round to 2 decimal places
SELECT product_name, ROUND(list_price + 100) AS price_adjustment
FROM product
WHERE list_price + 100 > 1000   -- can't use price_adjustment here because of Order of Executuion
ORDER BY price_adjustment;     -- can use it here however

-- *******************************
-- Nested OR/AND Operators
-- *******************************

-- Show me the products and model year of the products that start with Trek or Surly
-- (but not from 2016)
SELECT product_name, model_year
FROM product
WHERE (product_name LIKE 'Trek%' OR product_name LIKE 'Surly%') AND NOT model_year = 2016;
-- change AND to OR and now you get other brands that are not 2016
-- Without the ()s is only takes off 2016s for Surly
-- OR with REGEX and another NOT <>
SELECT product_name, model_year
FROM product
WHERE (product_name REGEXP '^Trek' OR product_name REGEXP '^Surly') AND model_year <> 2016;


-- *******************************
-- DISTINCT Operator
-- *******************************

USE v_art;

-- Show me all the different periods from the artwork 
-- (DISTINCT, only one of each - gets rid of repeats)
SELECT DISTINCT period
FROM   artwork;

-- *******************************
-- REGEXP Examples
-- *******************************

-- Selects any period with 'impr' anywhere in the name of the period
SELECT title, period
FROM artwork
WHERE period REGEXP 'impr';

-- Show me the title and period of the artwork that has 'the', 'in', or 'on' in the title
SELECT title
FROM artwork
WHERE title REGEXP 'the|in|on';