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


-- DEGREE --
INSERT INTO degree
(degree_name)
VALUES
('Computer Science'),
('Web Design and Development'),
('Data Science'),
('Organ Performance');


-- COURSE --
INSERT INTO course
(      course_code
,      course_title
,      course_num
,      credit
,      capacity)
VALUES
(      'CSE'
,      'Parallelism and Concurrency'
,      251
,      3
,      35),
(      'WDD'
,      'Web Frontend Development I'
,      231
,      2
,      30),
(      'MATH'
,      'Calculus II'
,      113
,      3
,      45),
(      'MUSIC'
,      'Musicianship 4'
,      213
,      3
,      25);


-- SEMESTER --
INSERT INTO semester
(      semester_year
,      semester_season)
VALUES
(      2024
,      'Fall'),
(      2025
,      'Winter');


-- SECTION --
INSERT INTO section
(section)
VALUES
(1),
(2),
(3);


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
,      'M'
,      'Los Angeles'
,      'CA'
,      1985-09-20),
(      'Andy'
,      'Kipner'
,      'F'
,      'Miami'
,      'FL'
,      1979-04-15),
(      'Lucy'
,      'Fuller'
,      'F'
,      'Boston'
,      'MA'
,      1973-02-10),
(      'Adam'
,      'Woods'
,      'M'
,      'Denver'
,      'CO'
,      1988-07-28),
(      'Bryan'
,      'Drew'
,      'M'
,      'Seattle,'
,      'WA'
,      1992-11-03),
(      'Marshall'
,      'Spence'
,      'M'
,      'Garland'
,      'TX'
,      2000-06-23),
(      'Maria'
,      'Clark'
,      'F'
,      'Akron'
,      'OH'
,      2002-01-25),
(      'Tracy'
,      'Woodward'
,      'F'
,      'Newark'
,      'NJ'
,      2002-10-04),
(      'Erick'
,      'Woodward'
,      'M'
,      'Newark'
,      'NJ'
,      1998-08-05),
(      'Lillie'
,      'Summers'
,      'F'
,      'Reno'
,      'NV'
,      1999-11-05),
(      'Nellie'
,      'Marquez'
,      'F'
,      'Atlanta'
,      'GA'
,      2001-06-25),
(      'Allen'
,      'Stokes'
,      'M'
,      'Bozeman'
,      'MT'
,      2004-09-16),
(      'Josh'
,      'Rollins'
,      'M'
,      'Decatur'
,      'TN'
,      1998-11-28),
(      'Isabel'
,      'Meyers'
,      'F'
,      'Rexburg'
,      'ID'
,      2003-05-15),
(      'Kerri'
,      'Shah'
,      'F'
,      'Mesa'
,      'AZ'
,      2003-04-05);


-- ROLE --
INSERT INTO role
(role)
VALUES
('Teacher'),
('Student'),
('TA');


-- ENROLLMENT --
INSERT INTO enrollment
(      role_id
,      course_semester_id)
VALUES
(      
,      ),
(      
,      ),
(      
,      ),
(      
,      ),