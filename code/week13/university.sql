-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`degree` ;

CREATE TABLE IF NOT EXISTS `university`.`degree` (
  `degree_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `degree_name` VARCHAR(45) NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`degree_id`),
  INDEX `fk_degree_department_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_degree_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_title` VARCHAR(45) NOT NULL,
  `course_code` VARCHAR(10) NOT NULL,
  `course_num` INT NOT NULL,
  `course_credit` INT NOT NULL,
  `degree_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_degree1_idx` (`degree_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_degree1`
    FOREIGN KEY (`degree_id`)
    REFERENCES `university`.`degree` (`degree_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`person` ;

CREATE TABLE IF NOT EXISTS `university`.`person` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F') NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(2) NULL,
  `birthdate` DATE NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_name` VARCHAR(6) NOT NULL,
  `term_year` INT NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_num` INT NOT NULL,
  `section_capacity` INT NOT NULL,
  `course_id` INT UNSIGNED NOT NULL,
  `term_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`role` ;

CREATE TABLE IF NOT EXISTS `university`.`role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `section_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_enrollment_role1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_enrollment_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `university`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `university`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


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
       
       
-- -----------------------------------------------------
-- SELECTING DATA FROM DATABASE
-- -----------------------------------------------------

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
