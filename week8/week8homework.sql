USE magazine;

-- (REMINDER: With all of these problems, make sure you use aliases, such as "37% off,")

-- 1. List the magazine name and then take 37% off the magazine price 
--    and round to two decimal places.
SELECT magazineName, ROUND(magazinePrice - (0.37 * magazinePrice), 2) AS '37% Off'
FROM magazine;

-- 2. Show the primary key of id from the subscriber table 
--    and using the date of 2021-04-23 as if it were today's date, 
--    how long in years, ROUNDED to the nearest year, has it been since their subscription started?  
SELECT subscriberKey, ROUND(DATEDIFF('2021-04-23', subscriptionStartDate)/365) AS 'Years since subscription'
FROM subscription;

-- 3. Show the subscriptionStartDate and subscriptionLength 
--    and add the subscriptionLength to the subscriptionStartDate 
--    to see the date of how long their subscription will go. 
--    After you have that date, then include the format function 
--    to change all dates to the format of: 09 01, 23.
SELECT DATE_FORMAT(subscriptionStartDate, '%m %d,%y') AS 'Sub start', subscriptionLength
, DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), '%m %d,%y') AS 'Subcription End'
FROM subscription;

USE bike;

-- 4. We need a list of all the products without the product name 
--    at the beginning of the product_name string. 
--    Order your results by product_id 
--    and limit your results to the first 14
SELECT SUBSTRING(product_name, LOCATE('- 20', product_name)) AS 'Product Name W/O Product'
FROM product
ORDER BY product_id
LIMIT 14;

-- 5. List the 2019 model year bikes, their price, 
--    show the amount needed for a 20% down payment 
--    and divide the remaining balance into 7 equal payments. 
--    Display all monetary values with a dollar sign, 
--    comma at the thousands place and two decimal places. 
--    Adjust the column headings to appear as the screenshot shows.
SELECT product_name
, concat('$', FORMAT(list_price, 2)) AS 'price'
, concat('$', FORMAT(list_price * .20, 2)) AS '20% down'
, concat('$', FORMAT(list_price * .80 / 7, 2)) AS 'Seven Equal Payements'
FROM product
WHERE model_year = '2019';