-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `film` ;

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `film` ;
USE `film` ;

-- -----------------------------------------------------
-- Table `film`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`rating` ;

CREATE TABLE IF NOT EXISTS `film`.`rating` (
  `rating_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating_level` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`rating_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie` ;

CREATE TABLE IF NOT EXISTS `film`.`movie` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `movie_year` INT UNSIGNED NOT NULL,
  `rating_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `movie_fk1_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `movie_fk1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `film`.`rating` (`rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`actor` ;

CREATE TABLE IF NOT EXISTS `film`.`actor` (
  `actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_fname` VARCHAR(45) NOT NULL,
  `actor_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`genre` ;

CREATE TABLE IF NOT EXISTS `film`.`genre` (
  `genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`studio` ;

CREATE TABLE IF NOT EXISTS `film`.`studio` (
  `studio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studio_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`feature` ;

CREATE TABLE IF NOT EXISTS `film`.`feature` (
  `feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `feature_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`feature_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`media` ;

CREATE TABLE IF NOT EXISTS `film`.`media` (
  `media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`media_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`price` ;

CREATE TABLE IF NOT EXISTS `film`.`price` (
  `price_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `price_value` FLOAT UNSIGNED NOT NULL,
  PRIMARY KEY (`price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_genre` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_genre` (
  `movie_genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `genre_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_genre_id`),
  INDEX `movie_genre_fk2_idx` (`genre_id` ASC) INVISIBLE,
  INDEX `movie_genre_fk1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `movie_genre_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_genre_fk2`
    FOREIGN KEY (`genre_id`)
    REFERENCES `film`.`genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`cast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`cast` ;

CREATE TABLE IF NOT EXISTS `film`.`cast` (
  `cast_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `actor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cast_id`),
  INDEX `cast_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `cast_fk2_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `cast_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cast_fk2`
    FOREIGN KEY (`actor_id`)
    REFERENCES `film`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_feature` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_feature` (
  `movie_feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `feature_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_feature_id`),
  INDEX `movie_feature_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_feature_fk2_idx` (`feature_id` ASC) VISIBLE,
  CONSTRAINT `movie_feature_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_feature_fk2`
    FOREIGN KEY (`feature_id`)
    REFERENCES `film`.`feature` (`feature_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_media` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_media` (
  `movie_media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `media_id` INT UNSIGNED NOT NULL,
  `price_id` INT UNSIGNED NULL,
  PRIMARY KEY (`movie_media_id`),
  INDEX `movie_media_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_media_fk2_idx` (`media_id` ASC) VISIBLE,
  INDEX `movie_media_fk3_idx` (`price_id` ASC) VISIBLE,
  CONSTRAINT `movie_media_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_media_fk2`
    FOREIGN KEY (`media_id`)
    REFERENCES `film`.`media` (`media_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_media_fk3`
    FOREIGN KEY (`price_id`)
    REFERENCES `film`.`price` (`price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_studio` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_studio` (
  `movie_studio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `studio_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_studio_id`),
  INDEX `movie_studio_fk1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `movie_studio_fk2_idx` (`studio_id` ASC) VISIBLE,
  CONSTRAINT `movie_studio_fk1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_studio_fk2`
    FOREIGN KEY (`studio_id`)
    REFERENCES `film`.`studio` (`studio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERTING DATA INTO DATABASE
-- -----------------------------------------------------
USE film;

-- rating --
INSERT INTO rating
(rating_level)
VALUES
('G'),
('PG'),
('PG-13');

-- movie --
INSERT INTO movie
( movie_title
, movie_year
, rating_id)
VALUES
('Toy Story'
, 1995
, 1),
('Toy Story 2'
, 1999
, 1),
('Brigadoone'
, 1954
, 1),
('The Empire Strikes Back'
, 1977
, 2),
('Coda'
, 2021
, 3),
('Guardians of the Galaxy'
, 2014
, 3);

-- actor -- 
INSERT INTO actor
( actor_fname
, actor_lname)
VALUES
( 'Tom'
, 'HanKs'),        -- 1
( 'Tim'
, 'Allen'),        -- 2
( 'Annie'
, 'Potts'),        -- 3
( 'John'
, 'Ratzenberger'), -- 4
( 'Gene'
, 'Kelly'),        -- 5
( 'Cyd'
, 'Charisse'),     -- 6
( 'Van'
, 'Johnson'),      -- 7
( 'Harrison'
, 'Ford'),         -- 8
( 'Carrie'
, 'Fisher'),       -- 9
( 'Mark'
, 'Hamill'),       -- 10
( 'Emilia'
, 'Jones'),        -- 11
( 'Marlee'
, 'Matlin'),       -- 12
( 'Troy'
, 'Kotsur'),       -- 13
( 'Chris'
, 'Pratt'),        -- 14
( 'Zoe'
, 'Saldana'),      -- 15
( 'Dave'
, 'Bautista'),     -- 16
( 'Vin'
, 'Diesel'),       -- 17
( 'Bradley'
, 'Cooper'),       -- 18
( 'Lee'
, 'Pace');         -- 19

-- studio --
INSERT INTO studio
(studio_name)
VALUES
('Pixar'),            -- 1
('MGM'),              -- 2
('20th Century Fox'), -- 3
('Apple TV+'),        -- 4
('Marvel'),           -- 5
('Disney');           -- 6

-- genre --
INSERT INTO genre
(genre_name)
VALUES
('Family'),    -- 1
('Animated'),  -- 2
('Musical'),   -- 3
('Romance'),   -- 4
('Sci Fi'),    -- 5
('Comedy'),    -- 6
('Drama'),     -- 7
('Music'),     -- 8
('Action'),    -- 9
('Adventure'); -- 10


-- feature --
INSERT INTO feature
(feature_name)
VALUES
('Bloopers'),         -- 1
('Actor Interviews'), -- 2
('Cutscenes'),        -- 3
('Trailers'),	      -- 4	
('Extended Scenes'),  -- 5
('Deleted Scenes');   -- 6


-- price --
INSERT INTO price
(price_value)
VALUES
(19.95), -- 1
(24.95), -- 2
(35.00), -- 3
(21.95); -- 4


-- media --
INSERT INTO media
(media_type)
VALUES
('DVD'),       -- 1
('blu-ray'),   -- 2
('Streaming'), -- 3
('4K');        -- 4


-- cast --
INSERT INTO cast
(movie_id, actor_id)
VALUES
-- Toy Story
(1,1),
(1,2),
(1,3),
(1,4),
-- Toy Story 2
(2,2),
(2,1),
(2,4),
(2,3),
-- Brigadoone
(3,5),
(3,6),
(3,7),
-- The Empire Strikes Back
(4,8),
(4,9),
(4,10),
-- Coda
(5,11),
(5,12),
(5,13),
-- Guardians of the Galaxy
(6,14),
(6,15),
(6,16),
(6,17),
(6,18),
(6,19);


-- movie_studio --
INSERT INTO movie_studio
(movie_id, studio_id)
VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(6,6);


-- movie_feature --
INSERT INTO movie_feature
(movie_id, feature_id)
VALUES
(1,1),
(2,2),
(3,5),
(4,3),
(4,1),
(5,4),
(6,5),
(6,6),
(6,4);
 
 
-- movie_genre --
INSERT INTO movie_genre
(movie_id, genre_id) 
VALUES
(1,1),
(1,2),
(2,1),
(2,2),
(3,3),
(3,4),
(4,5),
(5,6),
(5,7),
(5,8),
(6,5),
(6,6),
(6,9),
(6,10);


-- movie_media --
INSERT INTO movie_media
( movie_id, media_id, price_id)
VALUES
( 1, 1, 1),
( 2, 1, 2),
( 3, 1, 1),
( 4, 2, 3),
( 5, 3, NULL),
( 6, 4, 4),
( 6, 2, 1);
