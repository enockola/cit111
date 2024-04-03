
USE `university`;

-- ----------------------------------------------------------------------
-- Query 1: Students, and their birthdays, of students born in November. 
--          Format the date to look like it is shown in the result set. 
-- ----------------------------------------------------------------------
SELECT first_name
,      last_name
,      DATE_FORMAT(birthdate, '%M %d, %Y' ) AS 'November Birthdays'
FROM   person
WHERE  DATE_FORMAT(birthdate, '%M') = 'November';

-- ----------------------------------------------------------------------------
-- Query 2: Student's age in years and days as of Sept. 11, 2023.  
--          Sorted from oldest to youngest. No duplicates  
--          (You can assume a 365 day year and ignore leap day.) 
--          Hint: Use the mod function to calculate the days left over 
--                after dividing by full years. 
--          The 5th column is just the 3rd and 4th column combined with labels.
-- ----------------------------------------------------------------------------
SELECT last_name
,      first_name
,      birthdate
,      FLOOR(DATEDIFF('2023-09-11', birthdate) / 365) AS 'years'
,      FLOOR(DATEDIFF('2023-09-11', birthdate) % 365) AS 'days'
,      CONCAT(FLOOR(DATEDIFF('2023-09-11', birthdate) / 365)
       , ' - Yrs, ', FLOOR(DATEDIFF('2023-09-11', birthdate) % 365)
       , ' - Days') AS 'Years and Days'
FROM   person
WHERE  birthdate is NOT NULL
ORDER BY birthdate;

-- ----------------------------------------------------------------------
-- Query 3: Who is enrolled in Parallelism and Concurrency?. 
--          Sort by person_type.
-- ----------------------------------------------------------------------
SELECT     DISTINCT(p.first_name)
,          p.last_name
,          r.role_type
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN course c
ON         s.course_id = c.course_id
WHERE      c.course_title = 'Parallelism and Concurrency'
ORDER BY   r.role_type;

-- ----------------------------------------------------------------------
-- Query 4: Find the TAs. What are their names? 
--          Confirm that they are in fact TAs, 
--          and find what course they TA for.
-- ----------------------------------------------------------------------
SELECT     DISTINCT(p.first_name)
,          p.last_name
,          r.role_type
,          c.course_title
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN course c
ON         s.course_id = c.course_id
WHERE      r.role_type = 'TA'
ORDER BY   r.role_type;


-- ----------------------------------------------------------------------
-- Query 5: Students that take Musicianship 4 in Fall and Winter. 
--          Sort by student last name.
-- ----------------------------------------------------------------------
SELECT     DISTINCT(p.first_name)
,          p.last_name
,          t.term_name
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN course c
ON         s.course_id = c.course_id
INNER JOIN term t
ON         s.term_id = t.term_id
WHERE      c.course_title = 'Musicianship 4' AND r.role_type = 'Student'
ORDER BY   p.last_name;

-- ----------------------------------------------------------------------
-- Query 6: What classes does Brady teach? 
--          Order by term_name, and section_number.
-- ----------------------------------------------------------------------
SELECT     course_code
,          course_num
,          course_title
,          section_num
,          term_name
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN course c
ON         s.course_id = c.course_id
INNER JOIN term t
ON         s.term_id = t.term_id
WHERE      p.first_name = 'Brady' AND r.role_type = 'Teacher'
ORDER BY   t.term_name AND s.section_num;

-- ----------------------------------------------------------------------
-- Query 7: The number of students enrolled for Fall.
-- ----------------------------------------------------------------------
SELECT     term_name
,          term_year
,          COUNT(DISTINCT person_id) AS 'Enrollment'
FROM       term t
INNER JOIN section s
ON         t.term_id = s.term_id
INNER JOIN enrollment e
ON         s.section_id = e.section_id
INNER JOIN role r
ON         e.role_id = r.role_id
WHERE      role_type = 'Student' and term_name = 'Fall'
GROUP BY   term_name, term_year;


-- ----------------------------------------------------------------------
-- Query 8: The number of courses in each department. 
--          Sort by department name.
-- ----------------------------------------------------------------------
SELECT     dp.department_name
,          COUNT(course_id) AS 'Courses'
FROM       department dp
INNER JOIN degree dg
ON         dp.department_id = dg.department_id
INNER JOIN course c
ON         dg.degree_id = c.degree_id
GROUP BY   department_name;

-- -----------------------------------------------------------------------
-- Query 9: The total number of students each professor can teach in Fall.
--          Sort by that total number of students (teaching capacity).
-- -----------------------------------------------------------------------
SELECT     p.first_name
,          p.last_name
,          SUM(s.section_capacity) AS 'Teaching Capacity'
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN term t
ON         s.term_id = t.term_id
WHERE      r.role_type = 'Teacher' AND t.term_name = 'Fall'
GROUP BY   p.first_name, p.last_name
ORDER BY   SUM(s.section_capacity);

-- ---------------------------------------------------------------------------
-- Query 10: Each student's total credit load for Winter, 
--           but only students with a credit load less than or equal to three.
--           Sort by credit load in descending order. 
-- ---------------------------------------------------------------------------
SELECT     p.last_name
,          p.first_name
,          SUM(c.course_credit) AS 'Credits'
FROM       person p
INNER JOIN enrollment e
ON         p.person_id = e.person_id
INNER JOIN role r
ON         e.role_id = r.role_id
INNER JOIN section s
ON         e.section_id = s.section_id
INNER JOIN term t
ON         s.term_id = t.term_id
INNER JOIN course c
ON         s.course_id = c.course_id
WHERE      r.role_type = 'Student' AND t.term_name = 'Winter'
GROUP BY   p.first_name, p.last_name
HAVING     SUM(c.course_credit) <= 3
ORDER BY   SUM(c.course_credit) DESC;