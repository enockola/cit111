USE university;

SELECT     p.first_name
,          r.role_type
,          CONCAT(c.course_code, ' ', c.course_num) AS 'Course'
,          CONCAT(t.term_name, ' ', t.term_year) AS 'Term'
,          CONCAT('Section ', s.section_num) AS 'Section'
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
WHERE      first_name = 'Allen';