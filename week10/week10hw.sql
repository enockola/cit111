-- ~
USE bike;
-- ~
-- 1. Get the unique quantity that we have in all our bike stocks.
-- ~
SELECT     COUNT(quantity) AS 'Unique Stock'
FROM       stock ;
-- ~
-- 2. Show the number of bikes by store that need to be reordered 
--    (those bikes that are out of stock). 
--    Filter the results to only the lowest quantity of zero.
-- ~
SELECT     store_name
,          COUNT(quantity) AS 'Number to be reordered'
FROM       store st
INNER JOIN stock sk
ON         st.store_id = sk.store_id
WHERE      quantity = 0
GROUP BY   store_name;
-- ~
-- 3. How many bikes for each category of bike do we have in stock at 
--    our "Santa Cruz Bikes" store. We need to see the name of the category 
--    as well as the number of bikes in the category. 
--    Sort it by lowest total first. 
-- ~
SELECT     c.category_name
,          SUM(s.quantity) AS 'In stock'
FROM       category c
INNER JOIN product p
ON         c.category_id = p.category_id
INNER JOIN stock s
ON         p.product_id = s.product_id
INNER JOIN store st
ON         s.store_id = st.store_id
WHERE      store_name = 'Santa Cruz Bikes'
GROUP BY   c.category_id
ORDER BY   SUM(s.quantity) ASC;
-- ~
-- ~
USE employees;
-- ~
-- 4. How many managers do we have in each department? 
--    Include the total amount of managers at the bottom of the list.
-- ~
SELECT     d.dept_name
,          COUNT(dm.dept_no) AS 'Number of Managers'
FROM       departments d
INNER JOIN dept_manager dm
ON         d.dept_no = dm.dept_no
GROUP BY   d.dept_name WITH ROLLUP;
-- ~
-- 5. Get the average manager salaries in each department. 
--    We only need those departments that have 
--    average salaries that are at or above 70,000. 
--    Format the salary to 2 decimal places and a comma 
--    in the thousands place and dollar sign in front. 
-- ~
SELECT     d.dept_name
,          CONCAT('$', FORMAT(AVG(s.salary), 2)) AS 'Average Salary'
FROM       departments d
INNER JOIN dept_manager dm
ON         d.dept_no = dm.dept_no
INNER JOIN employees e
ON         dm.emp_no = e.emp_no
INNER JOIN salaries s
ON         e.emp_no = s.emp_no
GROUP BY   d.dept_name
HAVING     AVG(s.salary) > 70000;
-- ~
-- 6. Find out who the managers of the Research department are. 
--    List the department name and the name of the managers.
-- ~
SELECT     d.dept_name
,          e.first_name
,          e.last_name
FROM       departments d
INNER JOIN dept_manager dm
ON         d.dept_no = dm.dept_no
INNER JOIN employees e
ON         dm.emp_no = e.emp_no
WHERE      d.dept_name = 'Research'
GROUP BY   e.first_name, e.last_name;
-- ~