USE v_art;

-- 1. When you visit art.ceiwebdev.com, and you search by artist last name 
--    and you choose Rembrandt, you get two resulting images 
--    ("Night watch" and "Storm Galilee"). 
--    Write the query that will display these images.
SELECT     aw.artfile
FROM       artwork aw
INNER JOIN artist a
ON         aw.artist_id = a.artist_id
WHERE      a.fname = 'Rembrandt';

-- 2. When you visit art.ceiwebdev.com, and you search by Subject and type in the word bat, 
--    you get three images. Write the query to display these images.
--   (remember the keyword might have been 'battle' but they typed 'bat')
SELECT     aw.artfile
FROM       artwork aw
INNER JOIN artwork_keyword ak
ON         aw.artwork_id = ak.artwork_id
INNER JOIN keyword kw
ON         ak.keyword_id = kw.keyword_id
WHERE      kw.keyword LIKE '%bat%';

-- 3. List ALL the artists from the artist table from Italy, 
--    but only the related artwork from the artwork table.
--    We need the first and last name and artwork title. 
SELECT     a.fname
,          a.lname
,          aw.title
FROM       artist a
LEFT JOIN artwork aw
ON         a.artist_id = aw.artist_id
WHERE      a.country = 'Italy';


USE magazine;

-- 4. List all subscribers who don't subscribe to any magazine. 
--    List magazine name, and the subscriber's first and last name.
SELECT    m.magazineName
,         sb.subscriberFirstName
,         sb.subscriberLastName
FROM      subscriber sb
LEFT JOIN subscription st
ON        sb.subscriberKey = st.subscriberKey
LEFT JOIN magazine m
ON        st.magazineKey = m.magazineKey
WHERE     st.subscriptionKey IS NULL;

-- 5.  List all the magazines that Lucy Lamont subscribes to.
SELECT    m.magazineName
FROM      subscriber sb
LEFT JOIN subscription st
ON        sb.subscriberKey = st.subscriberKey
LEFT JOIN magazine m
ON        st.magazineKey = m.magazineKey
WHERE     sb.subscriberFirstName = 'Lucy' AND sb.subscriberLastName = 'Lamont'; 

USE employees;

-- 6. List the managers from the Finance Department. 
--    Put them in alphabetical order by last name.
SELECT     e.first_name
,          e.last_name
FROM       employees e
INNER JOIN dept_manager dm
ON         e.emp_no = dm.emp_no
INNER JOIN departments d
ON         dm.dept_no = d.dept_no
WHERE      d.dept_name = 'Finance'
ORDER BY   e.last_name;

-- 7. Find out the current salary and department of Hisao Lipner. 
--    You can use the ORDER BY and LIMIT to get just the most recent salary. 
--    Format the salary to be readable (Use FORMAT())
SELECT     e.first_name
,          e.last_name
,          d.dept_name
,          CONCAT('$', FORMAT(salary, 2)) AS 'salary'
FROM       employees e
INNER JOIN dept_emp de
ON         e.emp_no = de.emp_no
INNER JOIN departments d
ON         de.dept_no = d.dept_no
INNER JOIN salaries s
ON         e.emp_no = s.emp_no
WHERE      e.first_name = 'Hisao' AND last_name = 'Lipner'
ORDER BY   s.to_date DESC
LIMIT      1;