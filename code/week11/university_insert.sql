-- -----------------------------------------------------
-- INSERTING DATA INTO DATABASE
-- -----------------------------------------------------
USE university;


-- DEPARTMENT --
INSERT INTO department
(department_name)
VALUES
('Computer Science and Engineering'),
('Mathematics'),
('Music');


-- TERM --
INSERT INTO term
(      term_name
,      term_year)
VALUES
(      'Fall'
,      2024),
(      'Winter'
,      2025);


-- ROLE --
INSERT INTO role
(role_type)
VALUES
('Teacher'),
('Student'),
('TA');


-- PERSON --
INSERT INTO person
(      first_name
,      last_name
,      gender
,      city
,      state
,      birthdate)
VALUES
(      'Brady'
,      'Meyer'
,      NULL
,      NULL
,      NULL
,      NULL),
(      'Andy'
,      'Kipner'
,      NULL
,      NULL
,      NULL
,      NULL),
(      'Lucy'
,      'Fuller'
,      NULL
,      NULL
,      NULL
,      NULL),
(      'Adam'
,      'Woods'
,      NULL
,      NULL
,      NULL
,      NULL),
(      'Bryan'
,      'Drew'
,      NULL
,      NULL
,      NULL
,      NULL),
(      'Marshall'
,      'Spence'
,      'M'
,      'Garland'
,      'TX'
,      '2000-06-23'),
(      'Maria'
,      'Clark'
,      'F'
,      'Akron'
,      'OH'
,      '2002-01-25'),
(      'Tracy'
,      'Woodward'
,      'F'
,      'Newark'
,      'NJ'
,      '2002-10-04'),
(      'Erick'
,      'Woodward'
,      'M'
,      'Newark'
,      'NJ'
,      '1998-08-05'),
(      'Lillie'
,      'Summers'
,      'F'
,      'Reno'
,      'NV'
,      '1999-11-05'),
(      'Nellie'
,      'Marquez'
,      'F'
,      'Atlanta'
,      'GA'
,      '2001-06-25'),
(      'Allen'
,      'Stokes'
,      'M'
,      'Bozeman'
,      'MT'
,      '2004-09-16'),
(      'Josh'
,      'Rollins'
,      'M'
,      'Decatur'
,      'TN'
,      '1998-11-28'),
(      'Isabel'
,      'Meyers'
,      'F'
,      'Rexburg'
,      'ID'
,      '2003-05-15'),
(      'Kerri'
,      'Shah'
,      'F'
,      'Mesa'
,      'AZ'
,      '2003-04-05');


-- DEGREE --
INSERT INTO degree
(      degree_name
,      department_id)
VALUES
(      'Computer Science'
,      (SELECT department_id FROM department WHERE department_name = 'Computer Science and Engineering')),
(      'Web Design and Development'
,      (SELECT department_id FROM department WHERE department_name = 'Computer Science and Engineering')),
(      'Data Science'
,      (SELECT department_id FROM department WHERE department_name = 'Mathematics')),
(      'Organ Performance'
,      (SELECT department_id FROM department WHERE department_name = 'Music'));


-- COURSE --
INSERT INTO course
(      course_title
,      course_code
,      course_num
,      course_credit
,      degree_id)
VALUES
(      'Parallelism and Concurrency'
,      'CSE'
,      251
,      3
,      (SELECT degree_id FROM degree WHERE degree_name = 'Computer Science')),
(      'Web Frontend Development I'
,      'WDD'
,      231
,      2
,      (SELECT degree_id FROM degree WHERE degree_name = 'Web Design and Development')),
(      'Calculus II'
,      'MATH'
,      113
,      3
,      (SELECT degree_id FROM degree WHERE degree_name = 'Data Science')),
(      'Musicianship 4'
,      'MUSIC'
,      213
,      3
,      (SELECT degree_id FROM degree WHERE degree_name = 'Organ Performance'));


-- SECTION --
INSERT INTO section
(      section_num
,      section_capacity
,      course_id
,      term_id)
VALUES
(      1
,      35
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 251')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024')),
(      1
,      30
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'WDD 231')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024')),
(      2
,      30
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'WDD 231')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024')),
(      1
,      45
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MATH 113')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024')),
(      1
,      25
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 213')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Fall 2024')),
(      2
,      35
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 251')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025')),
(      3
,      35
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'CSE 251')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025')),
(      1
,      30
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'WDD 231')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025')),
(      2
,      40
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'WDD 231')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025')),
(      1
,      25
,      (SELECT course_id FROM course WHERE CONCAT(course_code, ' ', course_num) = 'MUSIC 213')
,      (SELECT term_id FROM term WHERE CONCAT(term_name, ' ', term_year) = 'Winter 2025'));


-- ENROLLMENT --
INSERT INTO enrollment
(      person_id
,      role_id
,      section_id)
VALUES
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Brady Meyer')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Brady Meyer')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Andy Kipner')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Andy Kipner')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Andy Kipner')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Andy Kipner')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Lucy Fuller')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MATH 113'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Adam Woods')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MUSIC 213'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Adam Woods')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'MUSIC 213'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Bryan Drew')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Teacher')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 3)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Marshall Spence')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Marshall Spence')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Maria Clark')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MATH 113'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Tracy Woodward')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MATH 113'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Erick Woodward')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MUSIC 213'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Lillie Summers')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MATH 113'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Lillie Summers')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'TA')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Fall 2024'
       AND     CONCAT(course_code, ' ', course_num) = 'MUSIC 213'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Nellie Marquez')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 3)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Allen Stokes')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Allen Stokes')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'TA')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Allen Stokes')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'MUSIC 213'
       AND     section_num = 1)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Josh Rollins')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Isabel Meyers')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'WDD 231'
       AND     section_num = 2)),
       
(      (SELECT person_id
       FROM    person
       WHERE   CONCAT(first_name, ' ', last_name) = 'Kerri Shah')
,      (SELECT role_id
       FROM    role
       WHERE   role_type = 'Student')
,      (SELECT section_id
       FROM    section s
	   INNER JOIN course c ON s.course_id = c.course_id
       INNER JOIN term t ON s.term_id = t.term_id
       WHERE   CONCAT(term_name, ' ', term_year) = 'Winter 2025'
       AND     CONCAT(course_code, ' ', course_num) = 'CSE 251'
       AND     section_num = 2));

