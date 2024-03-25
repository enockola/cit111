USE v_art;

-- 1. When you visit art.ceiwebdev.com, and you search by artist first name 
--    and you choose Rembrandt, you get two resulting images 
--    ("Night watch" and "Storm Galilee"). 
--    Write the query that will display these images.

-- 2. When you visit art.ceiwebdev.com, and you search by Subject and type in the word bat, 
--    you get one image. Write the query to display that image.
--   (remember the keyword might have been 'battle' but they typed 'bat')

-- 3. List ALL the artists from the artist table from Italy, 
--    but only the related artwork from the artwork table.
--    We need the first and last name and artwork title. 

USE magazine;

-- 4. List all subscribers who don't subscribe to any magazine. 
--    List magazine name, and the subscriber's first and last name.

-- 5.  List all the magazines that Lucy Lamont subscribes to. 

USE employees;

-- 6. List the managers from the Finance Department. 
--    Put them in alphabetical order by last name.

-- 7. Find out the current salary and department of Hisao Lipner. 
--    You can use the ORDER BY and LIMIT to get just the most recent salary. 
--    Format the salary to be readable (Use FORMAT())